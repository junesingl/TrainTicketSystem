/* 04 测试 */
/* Using Microsoft SQL Sever 2012 */

use TicketDB
go

/* 表的创建和初始化*/
exec Initialize_Coach
exec Initialize_TrainType
exec Initialize_TrainLine
exec Initialize_Train
exec Initialize_Station
exec Initialize_TimeLog
exec Initialize_PassengerOrder
exec Initialize_Ticket
exec Initialize_TrainTicketLog


/* 向旅客订单表插入一条记录 */
insert PassengerOrder values('Tester1','140100199001010101','C2009','2013-07-01','北京南','天津','二等座',getdate())
insert PassengerOrder values('Tester2','140100199001010102','C2009','2013-07-01','北京南','天津','一等座',getdate())