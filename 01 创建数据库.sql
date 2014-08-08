/* 01 创建数据库 */
/* Using Microsoft SQL Sever 2012 */

create database TicketDB			--Create Database
on primary
(	
	name='TicketDB',
	filename='F:\DataBase\TicketDB\TicketDB.mdf',
	size=5,
	filegrowth=10%	
)
log on
(	
	name='TicketDBlog',
	filename='F:\DataBase\TicketDB\TicketDBLog.ldf',
	size=1,
	maxsize=5,
	filegrowth=1
)
go

use TicketDB
go