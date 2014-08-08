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
	
	insert Coach values('CRHHR',	'豪华软卧',	16	)
	insert Coach values('CRHDWS',	'动卧上铺',	20	)
	insert Coach values('CRHDWX',	'动卧下铺',	20	)
	insert Coach values('CRHSZ',	'商务座',	20	)
	insert Coach values('CRHYZ',	'一等座',	64	)
	insert Coach values('CRHEZ',	'二等座',	92	)

	insert Coach values('25GR',		'高级软卧',	16	)
	insert Coach values('25RWS',	'软卧上铺',	18	)
	insert Coach values('25RWX',	'软卧下铺',	18	)
	insert Coach values('25YWS',	'硬卧上铺',	22	)
	insert Coach values('25YWZ',	'硬卧中铺',	22	)
	insert Coach values('25YWX',	'硬卧下铺',	22	)
	insert Coach values('25RZ',		'软座',		72	)
	insert Coach values('25YZ',		'硬座',		118	)

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
	
	insert TrainType values('CRH1A',	'CRH1和谐号250km/h动车组'		)
	insert TrainType values('CRH1E',	'CRH1和谐号250km/h动车组'		)
	insert TrainType values('CRH2A',	'CRH2和谐号250km/h动车组'		)
	insert TrainType values('CRH2AL',	'CRH2和谐号250km/h动车组'		)
	insert TrainType values('CRH3B',	'CRH3和谐号350km/h高速动车组'	)
	insert TrainType values('CRH3BL',	'CRH3和谐号350km/h高速动车组'	)
	insert TrainType values('CRH5A',	'CRH5和谐号250km/h动车组'		)
	insert TrainType values('CRH380A',	'CRH380和谐号350km/h高速动车组'	)
	insert TrainType values('25T',		'25T型160km/h直达空调列车'		)
	insert TrainType values('25K',		'25K型140km/h特快空调列车'		)
	insert TrainType values('25G',		'25G型140km/h快速空调列车'		)
	insert TrainType values('25B',		'25B型120km/h普速列车'			)

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

	--城际动车
	insert Train values('C2009','CRH2A',	'城际动车')--	'北京南',	'天津'		)
	insert Train values('C2010','CRH3B',	'城际动车')--	'天津',		'北京南'	)

	insert Train values('C2219','CRH3B',	'城际动车')--	'北京南',	'天津'		)
	insert Train values('C2220','CRH2A',	'城际动车')--	'天津',		'北京南'	)

	--高速动车
	insert Train values('G1',	'CRH3B',	'高速动车')--	'北京南',	'上海虹桥'	)
	insert Train values('G2',	'CRH3B',	'高速动车')--	'上海虹桥',	'北京南'	)
	
	insert Train values('G11',	'CRH3BL',	'高速动车')--	'北京南',	'上海虹桥'	)
	insert Train values('G12',	'CRH3BL',	'高速动车')--	'上海虹桥',	'北京南'	)
	
	insert Train values('G71',	'CRH380A',	'高速动车')--	'北京西',	'广州南'	)
	insert Train values('G72',	'CRH380A',	'高速动车')--	'广州南',	'北京西'	)

	insert Train values('G91',	'CRH380A',	'高速动车')--	'北京西',	'太原'		)
	insert Train values('G92',	'CRH380A',	'高速动车')--	'太原',		'北京西'	)
	
	insert Train values('G95',	'CRH380A',	'高速动车')--	'西安',		'广州南'	)
	insert Train values('G96',	'CRH380A',	'高速动车')--	'广州南',	'西安'		)
	
	insert Train values('G621',	'CRH380A',	'高速动车')--	'太原',		'广州南'	)
	insert Train values('G622',	'CRH380A',	'高速动车')--	'广州南',	'太原'		)

	insert Train values('G651',	'CRH380A',	'高速动车')--	'北京西',	'西安'		)
	insert Train values('G652',	'CRH380A',	'高速动车')--	'西安',		'北京西'	)
		
	--动车组
	insert Train values('D307',	'CRH2AL',	'动车组')--		'上海虹桥'	'西安'		)
	insert Train values('D308',	'CRH2AL',	'动车组')--		'西安'		'上海虹桥'	)

	insert Train values('D361',	'CRH2A',	'动车组')--		'上海虹桥'	'南京南'	)
	insert Train values('D362',	'CRH2A',	'动车组')--		'南京南'	'上海虹桥'	)

	insert Train values('D671',	'CRH5A',	'动车组')--		'北京'		'太原'		)
	insert Train values('D672',	'CRH5A',	'动车组')--		'太原'		'北京		)

	insert Train values('D2005','CRH5A',	'动车组')--		'北京西'	'太原'		)
	insert Train values('D2006','CRH5A',	'动车组')--		'太原'		'北京西'	)

	insert Train values('D5107','CRH1A',	'动车组')--		'重庆北'	'成都东'	)
	insert Train values('D5108','CRH1A',	'动车组')--		'成都东'	'重庆北'	)

	insert Train values('D5109','CRH1E',	'动车组')--		'重庆北'	'成都东'	)
	insert Train values('D5110','CRH1E',	'动车组')--		'成都东'	'重庆北'	)
	
	--直达特快
	insert Train values('Z19',	'25T',		'直达特快')--	'北京'		'西安'		)
	insert Train values('Z20',	'25T',		'直达特快')--	'西安'		'北京'		)
		
	insert Train values('Z93',	'25T',		'直达特快')--	'上海虹桥'	'西安'		)
	insert Train values('Z94',	'25T',		'直达特快')--	'西安'		'上海虹桥'	)

	insert Train values('Z97',	'25T',		'直达特快')--	'上海虹桥'	'太原'		)
	insert Train values('Z98',	'25T',		'直达特快')--	'太原'		'上海虹桥'	)

	insert Train values('Z123',	'25T',		'直达特快')--	'上海虹桥'	'成都东'	)
	insert Train values('Z124',	'25T',		'直达特快')--	'成都东'	'上海虹桥'	)
	
	--空调特快
	insert Train values('T7',	'25K',		'空调特快')--	'北京西'	'成都东'	)
	insert Train values('T8',	'25K',		'空调特快')--	'成都东'	'北京西'	)

	insert Train values('T9',	'25K',		'空调特快')--	'北京西'	'重庆北'	)
	insert Train values('T10',	'25K',		'空调特快')--	'重庆北'	'北京西'	)

	insert Train values('T15',	'25K',		'空调特快')--	'北京西'	'广州南'	)
	insert Train values('T16',	'25K',		'空调特快')--	'广州南'	'北京西'	)

	insert Train values('T99B',	'25K',		'空调特快')--	'上海虹桥'	'广州南'	)
	insert Train values('T100A','25K',		'空调特快')--	'广州南'	'上海虹桥'	)

	--空调快速
	insert Train values('K73',	'25G',		'空调快速')--	'重庆北'	'上海虹桥'	)
	insert Train values('K74',	'25G',		'空调快速')--	'上海虹桥'	'重庆北'	)

	insert Train values('K201',	'25G',		'空调快速')--	'重庆北'	'广州南'	)
	insert Train values('K202',	'25G',		'空调快速')--	'广州南'	'重庆北'	)

	insert Train values('K237',	'25G',		'空调快速')--	'太原'		'广州南'	)
	insert Train values('K238',	'25G',		'空调快速')--	'广州南'	'太原'		)

	insert Train values('K589',	'25G',		'空调快速')--	'北京西'	'重庆北'	)
	insert Train values('K590',	'25G',		'空调快速')--	'重庆北'	'北京西'	)

	insert Train values('K689',	'25G',		'空调快速')--	'太原'		'重庆北'	)
	insert Train values('K690',	'25G',		'空调快速')--	'重庆北'	'太原'		)

	--普速列车
	insert Train values('1461',	'25B',		'普速列车')--	'北京'		'上海虹桥'	)
	insert Train values('1462',	'25B',		'普速列车')--	'上海虹桥'	'北京'		)

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

	insert Station values(	'北京'		)
	insert Station values(	'北京南'	)
	insert Station values(	'北京西'	)
	insert Station values(	'重庆北'	)
	insert Station values(	'成都东'	)
	insert Station values(	'广州南'	)
	insert Station values(	'济南'		)
	insert Station values(	'南京南'	)
	insert Station values(	'上海虹桥'	)
	insert Station values(	'石家庄'	)
	insert Station values(	'太原'		)
	insert Station values(	'天津'		)
	insert Station values(	'武汉'		)
	insert Station values(	'西安'		)
	insert Station values(	'郑州'		)

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
	
	--城际动车
	insert TimeLog values(	'C2009',	'北京南',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'C2009',	'天津',		'2',	'1990-01-01 08:56:00',	null					)
	
	insert TimeLog values(	'C2010',	'天津',		'1',	null,					'1990-01-01 08:12:00'	)
	insert TimeLog values(	'C2010',	'北京南',	'2',	'1990-01-01 09:08:00',	null					)
	
	insert TimeLog values(	'C2219',	'北京南',	'1',	null,					'1990-01-01 13:45:00'	)
	insert TimeLog values(	'C2219',	'天津',		'2',	'1990-01-01 14:23:00',	null					)

	insert TimeLog values(	'C2220',	'天津',		'1',	null,					'1990-01-01 14:25:00'	)
	insert TimeLog values(	'C2220',	'北京南',	'2',	'1990-01-01 15:03:00',	null					)

	--高速动车
	insert TimeLog values(	'G1',		'北京南',	'1',	null,					'1990-01-01 12:40:00'	)
	insert TimeLog values(	'G1',		'上海虹桥',	'2',	'1990-01-01 07:52:00',	null					)
	
	insert TimeLog values(	'G2',		'上海虹桥',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G2',		'北京南',	'2',	'1990-01-01 12:48:00',	null					)
	
	insert TimeLog values(	'G11',		'北京南',	'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G11',		'济南',		'2',	'1990-01-01 11:00:00',	'1990-01-01 11:02:00'	)
	insert TimeLog values(	'G11',		'南京南',	'3',	'1990-01-01 12:56:00',	'1990-01-01 12:58:00'	)
	insert TimeLog values(	'G11',		'上海虹桥',	'4',	'1990-01-01 13:50:00',	null					)
	
	insert TimeLog values(	'G12',		'上海虹桥',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G12',		'南京南',	'2',	'1990-01-01 08:50:00',	'1990-01-01 08:52:00'	)
	insert TimeLog values(	'G12',		'济南',		'3',	'1990-01-01 10:44:00',	'1990-01-01 10:46:00'	)
	insert TimeLog values(	'G12',		'北京南',	'4',	'1990-01-01 12:48:00',	null					)
	
	insert TimeLog values(	'G71',		'北京西',	'1',	null,					'1990-01-01 08:00:00'	)
	insert TimeLog values(	'G71',		'武汉',		'2',	'1990-01-01 12:58:00',	'1990-01-01 13:00:00'	)
	insert TimeLog values(	'G71',		'广州南',	'3',	'1990-01-01 17:38:00',	null					)

	insert TimeLog values(	'G72',		'广州南',	'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G72',		'武汉',		'2',	'1990-01-01 13:58:00',	'1990-01-01 14:00:00'	)
	insert TimeLog values(	'G72',		'北京西',	'3',	'1990-01-01 18:38:00',	null	)
	
	insert TimeLog values(	'G91',		'北京西',	'1',	null,					'1990-01-01 08:30:00'	)
	insert TimeLog values(	'G91',		'石家庄',	'2',	'1990-01-01 09:38:00',	'1990-01-01 09:40:00'	)
	insert TimeLog values(	'G91',		'太原',		'3',	'1990-01-01 11:00:00',	null					)

	insert TimeLog values(	'G92',		'太原',		'1',	null,					'1990-01-01 08:30:00'	)
	insert TimeLog values(	'G92',		'石家庄',	'2',	'1990-01-01 09:48:00',	'1990-01-01 09:50:00'	)
	insert TimeLog values(	'G92',		'北京西',	'3',	'1990-01-01 11:00:00',	null					)
	
	insert TimeLog values(	'G95',		'北京西',	'1',	null,					'1990-01-01 09:50:00'	)
	insert TimeLog values(	'G95',		'石家庄',	'2',	'1990-01-01 11:51:00',	'1990-01-01 11:53:00'	)
	insert TimeLog values(	'G95',		'郑州',		'3',	'1990-01-01 13:49:00',	'1990-01-01 13:51:00'	)
	insert TimeLog values(	'G95',		'西安',		'4',	'1990-01-01 17:30:00',	null					)

	insert TimeLog values(	'G96',		'西安',		'1',	null,					'1990-01-01 09:00:00'	)
	insert TimeLog values(	'G96',		'郑州',		'2',	'1990-01-01 12:38:00',	'1990-01-01 12:40:00'	)
	insert TimeLog values(	'G96',		'石家庄',	'3',	'1990-01-01 16:38:00',	'1990-01-01 16:40:00'	)
	insert TimeLog values(	'G96',		'北京西',	'4',	'1990-01-01 14:38:00',	null					)
	
	insert TimeLog values(	'G621',		'太原',		'1',	null,					'1990-01-01 10:46:00'	)
	insert TimeLog values(	'G621',		'石家庄',	'2',	'1990-01-01 12:31:00',	'1990-01-01 12:33:00'	)
	insert TimeLog values(	'G621',		'武汉',		'3',	'1990-01-01 14:24:00',	'1990-01-01 14:26:00'	)
	insert TimeLog values(	'G621',		'广州南',	'4',	'1990-01-01 20:48:00',	null					)

	select *
	from TimeLog
	order by TrainNo,ArriveTime
	
/*	insert TimeLog values(	'G622',		)
	
	insert TimeLog values(	'G651',		)
	insert TimeLog values(	'G652',		)
	
	--动车组
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
	
	--直达特快	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
	
	insert TimeLog values(	'Z',		)
	insert TimeLog values(	'Z',		)
		
	--空调特快
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
	
	insert TimeLog values(	'T',		)
	insert TimeLog values(	'T',		)
		
	--空调快速
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

	--普速列车
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

	insert TrainTicketLog values('C2009','2013-07-01','北京南','二等座','232')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','天津',  '二等座','212')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','北京南','一等座','98')				--Eample input
	insert TrainTicketLog values('C2009','2013-07-01','天津',  '一等座','29')				--Eample input

	print 'Table TrainTicketLog Initialized'
end
go