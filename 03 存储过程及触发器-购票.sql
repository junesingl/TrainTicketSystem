/* 03 �洢���̼�������-��Ʊ */
/* Using Microsoft SQL Sever 2012 */

use TicketDB
go

create procedure Get_a_Ticket @passenger_name varchar(8),@id char(18),@train_no varchar(5),@launch_date date,@get_on_stop varchar(8),@get_off_stop varchar(8),@seat_type varchar(8),@orderdate datetime  --�����洢���̲��������
as
begin
	if(@@FETCH_STATUS=0)
	begin
		declare @seat_left int				--����ĳϯ��ʣ����λ
		select @seat_left=a.SeatAmount
		from TrainTicketLog a
		where a.TrainNo=@train_no and a.LaunchDate=@launch_date and a.StationName=@get_on_stop and a.SeatTypeName=@seat_type
	
		if( @seat_left>0 )					--��ʣ��ϯ�����0ʱ��������Ʊ�����ҽ��ÿ����³���վ֮�����Ӧϯλ��Ʊ��1
		begin
			declare @temp_train_no varchar(5),@temp_launch_date date,@temp_station_name varchar(8),@temp_seat_type varchar(8),@temp_seat_amount int,@temp_sc int
			declare temp_cur cursor for		--�����α겢ʹ���α꣬���ڡ���1������
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
		
		--��������ȡ������Ʊ��������Ϣ
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

		--�ڳ�Ʊ���в�������ĳ�Ʊ��¼
		insert Ticket values( @launch_date,@launch_time,@train_no,@get_on_stop,@get_off_stop,@seat_no,@seat_type,@passenger_name,@id)

		--��ִ֤�н��
		select *
		from PassengerOrder

		select *
		from TrainTicketLog

		select *
		from Ticket
	end
end
go

create trigger insert_an_order on PassengerOrder for insert			--����������
as
begin
	declare @passenger_name varchar(8),@id char(18),@train_no varchar(5),@launch_date date,@get_on_stop varchar(8),@get_off_stop varchar(8),@seat_type varchar(8),@orderdate datetime
	--�������������������ÿͶ����ж�ȡ�����������Ϊ��Ʊ�洢���̵Ĳ���

	declare passenger_order_cur cursor for		--Ϊ��������α꣬��ȡ���²������Ϣ 
	select * 
	from inserted
	open passenger_order_cur
	fetch passenger_order_cur into @passenger_name,@id,@train_no,@launch_date,@get_on_stop,@get_off_stop,@seat_type,@orderdate
	
	--ִ�д洢���̣��Ըոն�������Ϣ��Ϊ����
	exec Get_a_Ticket @passenger_name,@id,@train_no,@launch_date,@get_on_stop,@get_off_stop,@seat_type,@orderdate
	
	close passenger_order_cur
	deallocate passenger_order_cur
end
go