/* 04 ���� */
/* Using Microsoft SQL Sever 2012 */

use TicketDB
go

/* ��Ĵ����ͳ�ʼ��*/
exec Initialize_Coach
exec Initialize_TrainType
exec Initialize_TrainLine
exec Initialize_Train
exec Initialize_Station
exec Initialize_TimeLog
exec Initialize_PassengerOrder
exec Initialize_Ticket
exec Initialize_TrainTicketLog


/* ���ÿͶ��������һ����¼ */
insert PassengerOrder values('Tester1','140100199001010101','C2009','2013-07-01','������','���','������',getdate())
insert PassengerOrder values('Tester2','140100199001010102','C2009','2013-07-01','������','���','һ����',getdate())