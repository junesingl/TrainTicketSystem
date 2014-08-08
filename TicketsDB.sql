/*	This is the SQL statements to initialize the Train Ticket Database,
 *	including following procedures:
 *
 *		Initialize	-Create DataBase
 *						-Initialize_Coach
 *						-Initialize_TrainType
 *						-Initialize_Train
 *						-Initialize_TimeLog
 *							-Initialize_TrainLog
 *								-Initialize_PassengerOrder
 *								-Initialize_Ticket
 *
 *					Time Line
 *					----------->
 */
go

/* Create & use Ticket Database */
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

create procedure Initialize_Coach					--Initialize procedure for Coach
as
begin
	print 'Initializing table Coach....'

	create table Coach									--Create Coach table [static]
	(
		CoachNo			varchar(6)		not null		primary key,
		CoachType		varchar(8)		not null		unique,
		SeatAmount		int				not null
	)
	
	insert Coach values('CRHHR',	'��������',	16	)
	insert Coach values('CRHDWS',	'��������',	20	)
	insert Coach values('CRHDWX',	'��������',	20	)
	insert Coach values('CRHSZ',	'������',	20	)
	insert Coach values('CRHYZ',	'һ����',	64	)
	insert Coach values('CRHEZ',	'������',	92	)

	insert Coach values('25GR',		'�߼�����',	16	)
	insert Coach values('25RWS',	'��������',	18	)
	insert Coach values('25RWX',	'��������',	18	)
	insert Coach values('25YWS',	'Ӳ������',	22	)
	insert Coach values('25YWZ',	'Ӳ������',	22	)
	insert Coach values('25YWX',	'Ӳ������',	22	)
	insert Coach values('25RZ',		'����',		72	)
	insert Coach values('25YZ',		'Ӳ��',		118	)

	select *
	from Coach 

	print 'Table Coach initialized'
	--select * from Coach
end
go

create procedure Initialize_TrainType					--Initialize procedure for TrainType
as
begin
	print 'Initializing table TrainType....'

	create table TrainType								--Create TrainType table [static]
	(
		TrainTypeNo			varchar(7)		not null		primary key,
		TrainTypeName		varchar(30)		not null
	)
	
	insert TrainType values('CRH1A',	'CRH1��г��250km/h������'		)
	insert TrainType values('CRH1E',	'CRH1��г��250km/h������'		)
	insert TrainType values('CRH2A',	'CRH2��г��250km/h������'		)
	insert TrainType values('CRH2AL',	'CRH2��г��250km/h������'		)
	insert TrainType values('CRH3B',	'CRH3��г��350km/h���ٶ�����'	)
	insert TrainType values('CRH3BL',	'CRH3��г��350km/h���ٶ�����'	)
	insert TrainType values('CRH5A',	'CRH5��г��250km/h������'		)
	insert TrainType values('CRH380A',	'CRH380��г��350km/h���ٶ�����'	)
	insert TrainType values('25T',		'25T��160km/hֱ��յ��г�'		)
	insert TrainType values('25K',		'25K��140km/h�ؿ�յ��г�'		)
	insert TrainType values('25G',		'25G��140km/h���ٿյ��г�'		)
	insert TrainType values('25B',		'25B��120km/h�����г�'			)

	select *
	from TrainType

	print 'Table TrainType initialized'
end
go

create procedure Initialize_TrainLine				--Initialize procedure for TrainLine
as
begin
	print 'Initializing table TrainLine....'

	create table TrainLine								--Create table TrainLine [static]
	(
		TrainTypeNo		varchar(7)		not null		foreign key references TrainType(TrainTypeNo),
		CoachNo			varchar(6)		not null		foreign key references Coach(CoachNo),
		CoachAmount		int				null,

		primary key (TrainTypeNo,	CoachNo)
	)

	insert TrainLine values('CRH1A',	'CRHHR',null)
	insert TrainLine values('CRH1A',	'CRHDWS',null)
	insert TrainLine values('CRH1A',	'CRHDWX',null)
	insert TrainLine values('CRH1A',	'CRHSZ',null)
	insert TrainLine values('CRH1A',	'CRHYZ',2)
	insert TrainLine values('CRH1A',	'CRHEZ',6)
	insert TrainLine values('CRH1A',	'25GR',null)
	insert TrainLine values('CRH1A',	'25RWS',null)
	insert TrainLine values('CRH1A',	'25RWX',null)
	insert TrainLine values('CRH1A',	'25YWS',null)
	insert TrainLine values('CRH1A',	'25YWZ',null)
	insert TrainLine values('CRH1A',	'25YWX',null)
	insert TrainLine values('CRH1A',	'25RZ',null)
	insert TrainLine values('CRH1A',	'25YZ',null)

	insert TrainLine values('CRH1E',	'CRHHR',1)
	insert TrainLine values('CRH1E',	'CRHDWS',13)
	insert TrainLine values('CRH1E',	'CRHDWX',13)
	insert TrainLine values('CRH1E',	'CRHYZ',null)
	insert TrainLine values('CRH1E',	'CRHEZ',2)
	insert TrainLine values('CRH1E',	'25GR',null)
	insert TrainLine values('CRH1E',	'25RWS',null)
	insert TrainLine values('CRH1E',	'25RWX',null)
	insert TrainLine values('CRH1E',	'25YWS',null)
	insert TrainLine values('CRH1E',	'25YWZ',null)
	insert TrainLine values('CRH1E',	'25YWX',null)
	insert TrainLine values('CRH1E',	'25RZ',null)
	insert TrainLine values('CRH1E',	'25YZ',null)

	insert TrainLine values('CRH2A',	'CRHHR',null)
	insert TrainLine values('CRH2A',	'CRHDWS',null)
	insert TrainLine values('CRH2A',	'CRHDWX',null)
	insert TrainLine values('CRH2A',	'CRHYZ',2)
	insert TrainLine values('CRH2A',	'CRHEZ',6)
	insert TrainLine values('CRH2A',	'25GR',null)
	insert TrainLine values('CRH2A',	'25RWS',null)
	insert TrainLine values('CRH2A',	'25RWX',null)
	insert TrainLine values('CRH2A',	'25YWS',null)
	insert TrainLine values('CRH2A',	'25YWZ',null)
	insert TrainLine values('CRH2A',	'25YWX',null)
	insert TrainLine values('CRH2A',	'25RZ',null)
	insert TrainLine values('CRH2A',	'25YZ',null)

	insert TrainLine values('CRH2AL',	'CRHHR',null)
	insert TrainLine values('CRH2AL',	'CRHDWS',null)
	insert TrainLine values('CRH2AL',	'CRHDWX',null)
	insert TrainLine values('CRH2AL',	'CRHSZ',2)
	insert TrainLine values('CRH2AL',	'CRHYZ',2)
	insert TrainLine values('CRH2AL',	'CRHEZ',12)
	insert TrainLine values('CRH2AL',	'25GR',null)
	insert TrainLine values('CRH2AL',	'25RWS',null)
	insert TrainLine values('CRH2AL',	'25RWX',null)
	insert TrainLine values('CRH2AL',	'25YWS',null)
	insert TrainLine values('CRH2AL',	'25YWZ',null)
	insert TrainLine values('CRH2AL',	'25YWX',null)
	insert TrainLine values('CRH2AL',	'25RZ',null)
	insert TrainLine values('CRH2AL',	'25YZ',null)

	insert TrainLine values('CRH3B',	'CRHHR',null)
	insert TrainLine values('CRH3B',	'CRHDWS',null)
	insert TrainLine values('CRH3B',	'CRHDWX',null)
	insert TrainLine values('CRH3B',	'CRHSZ',null)
	insert TrainLine values('CRH3B',	'CRHYZ',2)
	insert TrainLine values('CRH3B',	'CRHEZ',6)
	insert TrainLine values('CRH3B',	'25GR',null)
	insert TrainLine values('CRH3B',	'25RWS',null)
	insert TrainLine values('CRH3B',	'25RWX',null)
	insert TrainLine values('CRH3B',	'25YWS',null)
	insert TrainLine values('CRH3B',	'25YWZ',null)
	insert TrainLine values('CRH3B',	'25YWX',null)
	insert TrainLine values('CRH3B',	'25RZ',null)
	insert TrainLine values('CRH3B',	'25YZ',null)

	insert TrainLine values('CRH3BL',	'CRHHR',null)
	insert TrainLine values('CRH3BL',	'CRHDWS',null)
	insert TrainLine values('CRH3BL',	'CRHDWX',null)
	insert TrainLine values('CRH3BL',	'CRHSZ',2)
	insert TrainLine values('CRH3BL',	'CRHYZ',2)
	insert TrainLine values('CRH3BL',	'CRHEZ',12)
	insert TrainLine values('CRH3BL',	'25GR',null)
	insert TrainLine values('CRH3BL',	'25RWS',null)
	insert TrainLine values('CRH3BL',	'25RWX',null)
	insert TrainLine values('CRH3BL',	'25YWS',null)
	insert TrainLine values('CRH3BL',	'25YWZ',null)
	insert TrainLine values('CRH3BL',	'25YWX',null)
	insert TrainLine values('CRH3BL',	'25RZ',null)
	insert TrainLine values('CRH3BL',	'25YZ',null)

	insert TrainLine values('CRH5A',	'CRHHR',null)
	insert TrainLine values('CRH5A',	'CRHDWS',null)
	insert TrainLine values('CRH5A',	'CRHDWX',null)
	insert TrainLine values('CRH5A',	'CRHSZ',null)
	insert TrainLine values('CRH5A',	'CRHYZ',2)
	insert TrainLine values('CRH5A',	'CRHEZ',14)
	insert TrainLine values('CRH5A',	'25GR',null)
	insert TrainLine values('CRH5A',	'25RWS',null)
	insert TrainLine values('CRH5A',	'25RWX',null)
	insert TrainLine values('CRH5A',	'25YWS',null)
	insert TrainLine values('CRH5A',	'25YWZ',null)
	insert TrainLine values('CRH5A',	'25YWX',null)
	insert TrainLine values('CRH5A',	'25RZ',null)
	insert TrainLine values('CRH5A',	'25YZ',null)

	insert TrainLine values('CRH380A',	'CRHHR',null)
	insert TrainLine values('CRH380A',	'CRHDWS',null)
	insert TrainLine values('CRH380A',	'CRHDWX',null)
	insert TrainLine values('CRH380A',	'CRHSZ',2)
	insert TrainLine values('CRH380A',	'CRHYZ',2)
	insert TrainLine values('CRH380A',	'CRHEZ',12)
	insert TrainLine values('CRH380A',	'25GR',null)
	insert TrainLine values('CRH380A',	'25RWS',null)
	insert TrainLine values('CRH380A',	'25RWX',null)
	insert TrainLine values('CRH380A',	'25YWS',null)
	insert TrainLine values('CRH380A',	'25YWZ',null)
	insert TrainLine values('CRH380A',	'25YWX',null)
	insert TrainLine values('CRH380A',	'25RZ',null)
	insert TrainLine values('CRH380A',	'25YZ',null)

	insert TrainLine values('25T',		'CRHHR',null)
	insert TrainLine values('25T',		'CRHDWS',null)
	insert TrainLine values('25T',		'CRHDWX',null)
	insert TrainLine values('25T',		'CRHSZ',null)
	insert TrainLine values('25T',		'CRHYZ',null)
	insert TrainLine values('25T',		'CRHEZ',null)
	insert TrainLine values('25T',		'25GR',1)
	insert TrainLine values('25T',		'25RWS',1)
	insert TrainLine values('25T',		'25RWX',1)
	insert TrainLine values('25T',		'25YWS',6)
	insert TrainLine values('25T',		'25YWZ',6)
	insert TrainLine values('25T',		'25YWX',6)
	insert TrainLine values('25T',		'25RZ',4)
	insert TrainLine values('25T',		'25YZ',6)

	insert TrainLine values('25K',		'CRHHR',null)
	insert TrainLine values('25K',		'CRHDWS',null)
	insert TrainLine values('25K',		'CRHDWX',null)
	insert TrainLine values('25K',		'CRHSZ',null)
	insert TrainLine values('25K',		'CRHYZ',null)
	insert TrainLine values('25K',		'CRHEZ',null)
	insert TrainLine values('25K',		'25GR',null)
	insert TrainLine values('25K',		'25RWS',1)
	insert TrainLine values('25K',		'25RWX',1)
	insert TrainLine values('25K',		'25YWS',7)
	insert TrainLine values('25K',		'25YWZ',7)
	insert TrainLine values('25K',		'25YWX',7)
	insert TrainLine values('25K',		'25RZ',4)
	insert TrainLine values('25K',		'25YZ',6)

	insert TrainLine values('25G',		'CRHHR',null)
	insert TrainLine values('25G',		'CRHDWS',null)
	insert TrainLine values('25G',		'CRHDWX',null)
	insert TrainLine values('25G',		'CRHSZ',null)
	insert TrainLine values('25G',		'CRHYZ',null)
	insert TrainLine values('25G',		'CRHEZ',null)
	insert TrainLine values('25G',		'25GR',null)
	insert TrainLine values('25G',		'25RWS',1)
	insert TrainLine values('25G',		'25RWX',1)
	insert TrainLine values('25G',		'25YWS',7)
	insert TrainLine values('25G',		'25YWZ',7)
	insert TrainLine values('25G',		'25YWX',7)
	insert TrainLine values('25G',		'25RZ',2)
	insert TrainLine values('25G',		'25YZ',8)

	insert TrainLine values('25B',		'CRHHR',null)
	insert TrainLine values('25B',		'CRHDWS',null)
	insert TrainLine values('25B',		'CRHDWX',null)
	insert TrainLine values('25B',		'CRHSZ',null)
	insert TrainLine values('25B',		'CRHYZ',null)
	insert TrainLine values('25B',		'CRHEZ',null)
	insert TrainLine values('25B',		'25GR',null)
	insert TrainLine values('25B',		'25RWS',1)
	insert TrainLine values('25B',		'25RWX',1)
	insert TrainLine values('25B',		'25YWS',7)
	insert TrainLine values('25B',		'25YWZ',7)
	insert TrainLine values('25B',		'25YWX',7)
	insert TrainLine values('25B',		'25YZ',8)

	select *
	from TrainLine 

	print 'Table TrainLine initialized'
end
go

create procedure Initialize_Train					--Initialize procedure for Train
as
begin
	print 'Initializing table Train....'

	create table Train									--Create table Train [static]
	(
		TrainNo			varchar(5)		not null		primary key,
		TrainTypeNo		varchar(7)		not null		foreign key references TrainType(TrainTypeNo),
		TrainDis		varchar(8)		not null
	)

	--�Ǽʶ���
	insert Train values('C2009','CRH2A',	'�Ǽʶ���')--	'������',	'���'		)
	insert Train values('C2010','CRH3B',	'�Ǽʶ���')--	'���',		'������'	)

	insert Train values('C2219','CRH3B',	'�Ǽʶ���')--	'������',	'���'		)
	insert Train values('C2220','CRH2A',	'�Ǽʶ���')--	'���',		'������'	)

	--���ٶ���
	insert Train values('G1',	'CRH3B',	'���ٶ���')--	'������',	'�Ϻ�����'	)
	insert Train values('G2',	'CRH3B',	'���ٶ���')--	'�Ϻ�����',	'������'	)
	
	insert Train values('G11',	'CRH3BL',	'���ٶ���')--	'������',	'�Ϻ�����'	)
	insert Train values('G12',	'CRH3BL',	'���ٶ���')--	'�Ϻ�����',	'������'	)
	
	insert Train values('G71',	'CRH380A',	'���ٶ���')--	'������',	'������'	)
	insert Train values('G72',	'CRH380A',	'���ٶ���')--	'������',	'������'	)

	insert Train values('G91',	'CRH380A',	'���ٶ���')--	'������',	'̫ԭ'		)
	insert Train values('G92',	'CRH380A',	'���ٶ���')--	'̫ԭ',		'������'	)
	
	insert Train values('G95',	'CRH380A',	'���ٶ���')--	'����',		'������'	)
	insert Train values('G96',	'CRH380A',	'���ٶ���')--	'������',	'����'		)
	
	insert Train values('G621',	'CRH380A',	'���ٶ���')--	'̫ԭ',		'������'	)
	insert Train values('G622',	'CRH380A',	'���ٶ���')--	'������',	'̫ԭ'		)

	insert Train values('G651',	'CRH380A',	'���ٶ���')--	'������',	'����'		)
	insert Train values('G652',	'CRH380A',	'���ٶ���')--	'����',		'������'	)
		
	--������
	insert Train values('D307',	'CRH2AL',	'������')--		'�Ϻ�����'	'����'		)
	insert Train values('D308',	'CRH2AL',	'������')--		'����'		'�Ϻ�����'	)

	insert Train values('D361',	'CRH2A',	'������')--		'�Ϻ�����'	'�Ͼ���'	)
	insert Train values('D362',	'CRH2A',	'������')--		'�Ͼ���'	'�Ϻ�����'	)

	insert Train values('D671',	'CRH5A',	'������')--		'����'		'̫ԭ'		)
	insert Train values('D672',	'CRH5A',	'������')--		'̫ԭ'		'����		)

	insert Train values('D2005','CRH5A',	'������')--		'������'	'̫ԭ'		)
	insert Train values('D2006','CRH5A',	'������')--		'̫ԭ'		'������'	)

	insert Train values('D5107','CRH1A',	'������')--		'���챱'	'�ɶ���'	)
	insert Train values('D5108','CRH1A',	'������')--		'�ɶ���'	'���챱'	)

	insert Train values('D5109','CRH1E',	'������')--		'���챱'	'�ɶ���'	)
	insert Train values('D5110','CRH1E',	'������')--		'�ɶ���'	'���챱'	)
	
	--ֱ���ؿ�
	insert Train values('Z19',	'25T',		'ֱ���ؿ�')--	'����'		'����'		)
	insert Train values('Z20',	'25T',		'ֱ���ؿ�')--	'����'		'����'		)
		
	insert Train values('Z93',	'25T',		'ֱ���ؿ�')--	'�Ϻ�����'	'����'		)
	insert Train values('Z94',	'25T',		'ֱ���ؿ�')--	'����'		'�Ϻ�����'	)

	insert Train values('Z97',	'25T',		'ֱ���ؿ�')--	'�Ϻ�����'	'̫ԭ'		)
	insert Train values('Z98',	'25T',		'ֱ���ؿ�')--	'̫ԭ'		'�Ϻ�����'	)

	insert Train values('Z123',	'25T',		'ֱ���ؿ�')--	'�Ϻ�����'	'�ɶ���'	)
	insert Train values('Z124',	'25T',		'ֱ���ؿ�')--	'�ɶ���'	'�Ϻ�����'	)
	
	--�յ��ؿ�
	insert Train values('T7',	'25K',		'�յ��ؿ�')--	'������'	'�ɶ���'	)
	insert Train values('T8',	'25K',		'�յ��ؿ�')--	'�ɶ���'	'������'	)

	insert Train values('T9',	'25K',		'�յ��ؿ�')--	'������'	'���챱'	)
	insert Train values('T10',	'25K',		'�յ��ؿ�')--	'���챱'	'������'	)

	insert Train values('T15',	'25K',		'�յ��ؿ�')--	'������'	'������'	)
	insert Train values('T16',	'25K',		'�յ��ؿ�')--	'������'	'������'	)

	insert Train values('T99B',	'25K',		'�յ��ؿ�')--	'�Ϻ�����'	'������'	)
	insert Train values('T100A','25K',		'�յ��ؿ�')--	'������'	'�Ϻ�����'	)

	--�յ�����
	insert Train values('K73',	'25G',		'�յ�����')--	'���챱'	'�Ϻ�����'	)
	insert Train values('K74',	'25G',		'�յ�����')--	'�Ϻ�����'	'���챱'	)

	insert Train values('K201',	'25G',		'�յ�����')--	'���챱'	'������'	)
	insert Train values('K202',	'25G',		'�յ�����')--	'������'	'���챱'	)

	insert Train values('K237',	'25G',		'�յ�����')--	'̫ԭ'		'������'	)
	insert Train values('K238',	'25G',		'�յ�����')--	'������'	'̫ԭ'		)

	insert Train values('K589',	'25G',		'�յ�����')--	'������'	'���챱'	)
	insert Train values('K590',	'25G',		'�յ�����')--	'���챱'	'������'	)

	insert Train values('K689',	'25G',		'�յ�����')--	'̫ԭ'		'���챱'	)
	insert Train values('K690',	'25G',		'�յ�����')--	'���챱'	'̫ԭ'		)

	--�����г�
	insert Train values('1461',	'25B',		'�����г�')--	'����'		'�Ϻ�����'	)
	insert Train values('1462',	'25B',		'�����г�')--	'�Ϻ�����'	'����'		)

	print 'Table Train Initialized'
end
go

create procedure Initialize_Station					--Initialize procedure for Station
as
begin
	print 'Initializing table Station....'

	create table Station
	(
		StationName	varchar(8)	primary key
	)

	insert Station values(	'����'		)
	insert Station values(	'������'	)
	insert Station values(	'������'	)
	insert Station values(	'���챱'	)
	insert Station values(	'�ɶ���'	)
	insert Station values(	'������'	)
	insert Station values(	'����'		)
	insert Station values(	'�Ͼ���'	)
	insert Station values(	'�Ϻ�����'	)
	insert Station values(	'ʯ��ׯ'	)
	insert Station values(	'̫ԭ'		)
	insert Station values(	'���'		)
	insert Station values(	'�人'		)
	insert Station values(	'����'		)
	insert Station values(	'֣��'		)

	print 'Table Station Initialized'
end
go

create procedure Initialize_TimeLog					--Initialize procedure for TimeLog
as
begin
	print 'Initializing table TimeLog....'

	create table TimeLog
	(
		TrainNo			varchar(5)		not null	foreign key	references Train(TrainNo),
		StationName		varchar(8)		not null	foreign key	references Station(StationName),
		StationCounter	int,
		ArriveTime		datetime,
		LaunchTime		datetime,

		primary key (TrainNo,StationName)
	)
	
	--�Ǽʶ���
	insert TimeLog values(	'C2009',	'������',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'C2009',	'���',		'2',	'1990-01-01 08:56:00',	null					)
	
	insert TimeLog values(	'C2010',	'���',		'1',	null,					'1990-01-01 08:12:00'	)
	insert TimeLog values(	'C2010',	'������',	'2',	'1990-01-01 09:08:00',	null					)
	
	insert TimeLog values(	'C2219',	'������',	'1',	null,					'1990-01-01 13:45:00'	)
	insert TimeLog values(	'C2219',	'���',		'2',	'1990-01-01 14:23:00',	null					)

	insert TimeLog values(	'C2220',	'���',		'1',	null,					'1990-01-01 14:25:00'	)
	insert TimeLog values(	'C2220',	'������',	'2',	'1990-01-01 15:03:00',	null					)

	--���ٶ���
	insert TimeLog values(	'G1',		'������',	'1',	null,					'1990-01-01 12:40:00'	)
	insert TimeLog values(	'G1',		'�Ϻ�����',	'2',	'1990-01-01 07:52:00',	null					)
	
	insert TimeLog values(	'G2',		'�Ϻ�����',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G2',		'������',	'2',	'1990-01-01 12:48:00',	null					)
	
	insert TimeLog values(	'G11',		'������',	'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G11',		'����',		'2',	'1990-01-01 11:00:00',	'1990-01-01 11:02:00'	)
	insert TimeLog values(	'G11',		'�Ͼ���',	'3',	'1990-01-01 12:56:00',	'1990-01-01 12:58:00'	)
	insert TimeLog values(	'G11',		'�Ϻ�����',	'4',	'1990-01-01 13:50:00',	null					)
	
	insert TimeLog values(	'G12',		'�Ϻ�����',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G12',		'�Ͼ���',	'2',	'1990-01-01 08:50:00',	'1990-01-01 08:52:00'	)
	insert TimeLog values(	'G12',		'����',		'3',	'1990-01-01 10:44:00',	'1990-01-01 10:46:00'	)
	insert TimeLog values(	'G12',		'������',	'4',	'1990-01-01 12:48:00',	null					)
	
	insert TimeLog values(	'G71',		'������',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G71',		'�人',		'2',	'1990-01-01 12:58:00',	'1990-01-01 13:00:00'	)
	insert TimeLog values(	'G71',		'������',	'3',	'1990-01-01 17:38:00',	null					)

	insert TimeLog values(	'G72',		'������',	'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G72',		'�人',		'2',	'1990-01-01 13:58:00',	'1990-01-01 14:00:00'	)
	insert TimeLog values(	'G72',		'������',	'3',	'1990-01-01 18:38:00',	null	)
	
	insert TimeLog values(	'G91',		'������',	'1',	null,					'1990-01-01 08:30:00'	)
	insert TimeLog values(	'G91',		'ʯ��ׯ',	'2',	'1990-01-01 09:38:00',	'1990-01-01 09:40:00'	)
	insert TimeLog values(	'G91',		'̫ԭ',		'3',	'1990-01-01 11:00:00',	null					)

	insert TimeLog values(	'G92',		'̫ԭ',		'1',	null,					'1990-01-01 08:30:00'	)
	insert TimeLog values(	'G92',		'ʯ��ׯ',	'2',	'1990-01-01 09:48:00',	'1990-01-01 09:50:00'	)
	insert TimeLog values(	'G92',		'������',	'3',	'1990-01-01 11:00:00',	null					)
	
	insert TimeLog values(	'G95',		'������',	'1',	null,					'1990-01-01 09:50:00'	)
	insert TimeLog values(	'G95',		'ʯ��ׯ',	'2',	'1990-01-01 11:51:00',	'1990-01-01 11:53:00'	)
	insert TimeLog values(	'G95',		'֣��',		'3',	'1990-01-01 13:49:00',	'1990-01-01 13:51:00'	)
	insert TimeLog values(	'G95',		'����',		'4',	'1990-01-01 17:30:00',	null					)

	insert TimeLog values(	'G96',		'����',		'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G96',		'֣��',		'2',	'1990-01-01 12:38:00',	'1990-01-01 12:40:00'	)
	insert TimeLog values(	'G96',		'ʯ��ׯ',	'3',	'1990-01-01 16:38:00',	'1990-01-01 16:40:00'	)
	insert TimeLog values(	'G96',		'������',	'4',	'1990-01-01 14:38:00',	null					)
	
	insert TimeLog values(	'G621',		'̫ԭ',		'1',	null,					'1990-01-01 10:46:00'	)
	insert TimeLog values(	'G621',		'ʯ��ׯ',	'2',	'1990-01-01 12:31:00',	'1990-01-01 12:33:00'	)
	insert TimeLog values(	'G621',		'�人',		'3',	'1990-01-01 14:24:00',	'1990-01-01 14:26:00'	)
	insert TimeLog values(	'G621',		'������',	'4',	'1990-01-01 20:48:00',	null					)

	select *
	from TimeLog
	order by TrainNo,ArriveTime
	
/*	insert TimeLog values(	'G622',		)
	
	insert TimeLog values(	'G651',		)
	insert TimeLog values(	'G652',		)
	
	--������
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
	
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
		
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
		
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
	
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
	
	insert TimeLog values(	'D',		)
	insert TimeLog values(	'D',		)
	
	--ֱ���ؿ�	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
		
	--�յ��ؿ�
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
		
	--�յ�����
	insert TimeLog values(	'K',		)
	insert TimeLog values(	'K',		)
	
	insert TimeLog values(	'K',		)
	insert TimeLog values(	'K',		)
	
	insert TimeLog values(	'K',		)
	insert TimeLog values(	'K',		)
	
	insert TimeLog values(	'K',		)
	insert TimeLog values(	'K',		)
	
	insert TimeLog values(	'K',		)
	insert TimeLog values(	'K',		)

	--�����г�
	insert TimeLog values(	'1',		)
	insert TimeLog values(	'1',		)
*/	
	print 'Table TimeLog Initialized'
end				
go

create procedure Initialize_PassengerOrder			--Initialize procedure for PassengerOrder
as
begin
	print 'Initializing table PassengerOrder....'

	create table PassengerOrder
	(
		PassengerName		varchar(8)		not null,
		ID					char(18)		not null,
		TrainNo				varchar(5)		not null		foreign key references Train(TrainNo),
		LaunchDate			date			not null,
		GetonStop			varchar(8)		not null		foreign key references Station(StationName),
		GetoffStop			varchar(8)		not null		foreign key references Station(StationName),
		SeatType			varchar(8)		not null		foreign key references Coach(CoachType),
		Orderdate			datetime,

		primary key (ID, LaunchDate, TrainNo)
	)

	print 'Table PassengerOrder Initialized'
end
go

create procedure Initialize_Ticket					--Initialize procedure for Ticket
as
begin
	print 'Initializing table Ticket....'

	create table Ticket
	(
		TicketNo		int identity(000000000000000,1)		not null		primary key,
		TakeoffDate		date								not null,
		TakeoffTime		time								not null,
		TrainNo			varchar(5)							not null		foreign key references Train(TrainNo),
		GetonStop		varchar(8)							not null		foreign key references Station(StationName),
		GetoffStop		varchar(8)							not null		foreign key references Station(StationName),
--		CoachNo			int									not null,
		SeatNo			int									not null,
		SeatType		varchar(8)							not null		foreign key references Coach(CoachType),
--		Price			numeric(8,2)						not null,
		PassengerName	varchar(8)							not null,
		ID				char(18)							not null,
	)

	print 'Table Ticket Initialized'
end				
go

create procedure Initialize_TrainTicketLog				--Initialize procedure for TrainLog
as 
begin
	print 'Initializing table TrainTicketLog....'

	create table TrainTicketLog
	(
		TrainNo			varchar(5)		not null		foreign key references Train(TrainNo),
		LaunchDate		date			not null,
		StationName		varchar(8)		not null		foreign key references Station(StationName),
		SeatTypeName	varchar(8)		not null		foreign key references Coach(CoachType),
		SeatAmount		int				null,

		primary key (TrainNo, LaunchDate, StationName, SeatTypeName)
	)

	insert TrainTicketLog values('C2009','2013-07-01','������','������','232')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','���',  '������','212')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','������','һ����','98')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','���',  'һ����','29')				--Eample input

	print 'Table TrainTicketLog Initialized'
end
go