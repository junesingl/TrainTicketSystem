/* 03 存储过程及触发器-购票 */
/* Using Microsoft SQL Sever 2012 */

use TicketDB
go

create procedure Get_a_Ticket @passenger_name varchar(8),@id char(18),@train_no varchar(5),@launch_date date,@get_on_stop varchar(8),@get_off_stop varchar(8),@seat_type varchar(8),@orderdate datetime  --创建存储过程并定义参数
as
begin
	if(@@FETCH_STATUS=0)
	begin
		declare @seat_left int				--计算某席别剩余座位
		select @seat_left=a.SeatAmount
		from TrainTicketLog a
		where a.TrainNo=@train_no and a.LaunchDate=@launch_date and a.StationName=@get_on_stop and a.SeatTypeName=@seat_type
	
		if( @seat_left>0 )					--当剩余席别大于0时，可以售票，并且将旅客上下乘两站之间的相应席位余票减1
		begin
			declare @temp_train_no varchar(5),@temp_launch_date date,@temp_station_name varchar(8),@temp_seat_type varchar(8),@temp_seat_amount int,@temp_sc int
			declare temp_cur cursor for		--定义游标并使用游标，用于“减1”操作
			select a.TrainNo,a.Launchdate,a.StationName,a.SeatTypeName,a.SeatAmount,b.StationCounter 
			from TrainTicketLog a,Timelog b 
			where a.TrainNo=@train_no 
				and a.TrainNo=b.TrainNo 
				and a.StationName=b.StationName
				and a.Launchdate=@launch_date
				and b.StationCounter>=(	select StationCounter 
										from TimeLog 
										where StationName=@get_on_stop and TrainNo=@train_no)
				and b.StationCounter<(	select StationCounter 
										from TimeLog 
										where StationName=@get_off_stop and TrainNo=@train_no)
			order by b.StationCounter

			open temp_cur
			fetch temp_cur into @temp_train_no,@temp_launch_date,@temp_station_name,@temp_seat_type,@temp_seat_amount,@temp_sc
			while(@@FETCH_STATUS=0)
			begin
				select @temp_seat_amount=@temp_seat_amount-1
				update TrainTicketLog set SeatAmount=@temp_seat_amount where TrainNo=@temp_train_no and Launchdate=@temp_launch_date and StationName=@temp_station_name and SeatTypeName=@temp_seat_type

				fetch temp_cur into @temp_train_no,@temp_launch_date,@temp_station_name,@temp_seat_type,@temp_seat_amount,@temp_sc
			end
			close temp_cur
			deallocate temp_cur
		end
		
		--接下来获取产生车票的其他信息
		declare @launch_time time
		select @launch_time=LaunchTime
		from TimeLog
		where StationName=@get_on_stop and TrainNo=@train_no

		declare @seat_no int,@seat_amount int
		select @seat_amount=a.CoachAmount*b.SeatAmount
		from (select * from TrainLine where CoachAmount !=0 ) a, Coach b, Train c
		where c.TrainNo=@train_no and c.TrainTypeNo=a.TrainTypeNo and a.CoachNo=b.CoachNo and b.CoachType=@seat_type
		print @seat_amount

		select @seat_no=@seat_amount-@seat_left
		from TrainTicketlog
		where TrainNo=@train_no and StationName=@get_on_stop and Launchdate=@launch_date

		--在车票表中插入产生的车票记录
		insert Ticket values( @launch_date,@launch_time,@train_no,@get_on_stop,@get_off_stop,@seat_no,@seat_type,@passenger_name,@id)

		--验证执行结果
		select *
		from PassengerOrder

		select *
		from TrainTicketLog

		select *
		from Ticket
	end
end
go

create trigger insert_an_order on PassengerOrder for insert			--创建触发器
as
begin
	declare @passenger_name varchar(8),@id char(18),@train_no varchar(5),@launch_date date,@get_on_stop varchar(8),@get_off_stop varchar(8),@seat_type varchar(8),@orderdate datetime
	--定义参数，用来保存从旅客订单中读取的数据项，并作为购票存储过程的参数

	declare passenger_order_cur cursor for		--为插入表建立游标，获取最新插入的信息 
	select * 
	from inserted
	open passenger_order_cur
	fetch passenger_order_cur into @passenger_name,@id,@train_no,@launch_date,@get_on_stop,@get_off_stop,@seat_type,@orderdate
	
	--执行存储过程，以刚刚读到的信息作为参数
	exec Get_a_Ticket @passenger_name,@id,@train_no,@launch_date,@get_on_stop,@get_off_stop,@seat_type,@orderdate
	
	close passenger_order_cur
	deallocate passenger_order_cur
end
go