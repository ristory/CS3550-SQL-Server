USE LeageofLegends;
/*
Hoang Cao CS3550
*/

--Delete Objects if they exit

IF EXISTS(SELECT * FROM sys.tables where name = N'Information') DROP TABLE Information; 
IF EXISTS(SELECT * FROM sys.tables where name = N'Athletes') DROP TABLE Athletes; 
IF EXISTS(SELECT * FROM sys.tables where name = N'Organization') DROP TABLE Organization; 
IF EXISTS(SELECT * FROM sys.tables where name = N'History') DROP TABLE History; 
IF EXISTS(SELECT * FROM sys.tables where name = N'Achievements') DROP TABLE Achievements;

IF OBJECT_ID('dbo.HCAONewInformationProcedure') IS NOT NULL
DROP PROCEDURE dbo.HCAONewInformationProcedure;

IF OBJECT_ID('dbo.HCAONewHistoryProcedure') IS NOT NULL
DROP PROCEDURE dbo.HCAONewHistoryProcedure;
GO

IF OBJECT_ID('dbo.HCAODeleteTrigger') IS NOT NULL
DROP PROCEDURE dbo.HCAODeleteTrigger;
GO

IF OBJECT_ID('dbo.HCAOInsertTrigger') IS NOT NULL
DROP PROCEDURE dbo.HCAOInsertTrigger;
GO

IF OBJECT_ID('dbo.HCAOVIEW') IS NOT NULL
DROP VIEW dbo.HCAOVIEW;
GO

IF OBJECT_ID('dbo.TEAMCHEAT') IS NOT NULL
DROP PROCEDURE dbo.TEAMCHEAT;
GO

--Create Table
CREATE TABLE Information (
  Team_id int IDENTITY(1,1) NOT NULL,
  Teamname nvarchar(100) NOT NULL,
  Game nvarchar(100) NOT NULL,
  Religion nvarchar(50) NOT NULL,
  Country nvarchar(50) NOT NULL,
  NumberofPlayer int NOT NULL,
);

CREATE TABLE Athletes (
  Athletes_id int IDENTITY(10,1) NOT NULL,
  Team_id int NOT NULL,
  Nickname nvarchar(100) NOT NULL,
  Realname nvarchar(100) NOT NULL,
  Role nvarchar(100) NOT NULL,
  Nationality nvarchar(100) NOT NULL,
  Status nvarchar(100) NOT NULL,
);

 CREATE TABLE Organization (
  Organization_id int IDENTITY(20,1) NOT NULL,
  Team_id int NOT NULL,
  Name nvarchar(100) NOT NULL,
  Position nvarchar(100) NOT NULL
  );

  CREATE TABLE History (
  History_id int IDENTITY(30,1) NOT NULL,
  Team_id int NOT NULL,
  Opponent nvarchar(100) NOT NULL,
  Win int NOT NULL,
  Lose int NOT NULL,
  Year int NOT NULL,
  );

  CREATE TABLE Achievements (
  Achievements_id  int IDENTITY(40,1) NOT NULL,
  Team_id int NOT NULL,
  Tourament nvarchar(100) NOT NULL,
  Award nvarchar(100) NULL,
  Year int NOT NULL,
  );

--Create Rules
ALTER TABLE Information
    ADD Constraint PK_Information
	PRIMARY KEY CLUSTERED (Team_id);

ALTER TABLE Athletes
    ADD Constraint PK_Athletes
	PRIMARY KEY CLUSTERED (Athletes_id);

ALTER TABLE Organization
    ADD Constraint PK_Organization
	PRIMARY KEY CLUSTERED (Organization_id);

ALTER TABLE History
    ADD Constraint PK_History
	PRIMARY KEY CLUSTERED (History_id);

ALTER TABLE Achievements
    ADD Constraint PK_Achievements
	PRIMARY KEY CLUSTERED (Achievements_id);

 ALTER TABLE Athletes
	ADD Constraint AK_Athletes
	UNIQUE(Realname)

ALTER TABLE Organization
	ADD Constraint AK_Organization
	UNIQUE(Name)

--Insert Data Into Tables
INSERT INTO Information(Teamname,Game,Religion,Country,NumberofPlayer)
VALUES
('Cloud9','LeageOfLegends','American', 'American','10'),
('Immortals','LeageOfLegends','American', 'North American','6'),
('Team SoloMid','LeageOfLegends','American', 'North American','5');

INSERT INTO Athletes(Team_id,Nickname,Realname,Role,Nationality,Status)
VALUES
('1','Impact','Jung Eon-yeong', 'Top','Korean','Main Team'),
('1','Contractz','Juan Garcia', 'Jungle','American','Main Team'),
('1','Jensen','Nicolaj Jensen', 'Mid','Denmark','Main Team'),
('1','Sneaky','Zachary Scuderi', 'Adc','American','Main Team'),
('1','Smoothie','Andy Ta', 'Support','Canada','Main Team'),
('1','Ray','Jeon Ji-won', 'Top','Korean','Sub Team'),
('1','Westrice','Jonathan Nguyen', 'Top','American','Sub Team'),
('1','Winter','Olivier Lapointe', 'Support','Canada','Sub Team'),
('1','Bunny FuFuu','Michael Kurylo', 'Support','American','Sub Team'),
('1','LiNk','Austin Shin', 'Mid','American','Sub Team'),
('1','Hai','Hai Lam', 'Support','American','Inactive'),
('1','Altec','Johnny Ru', 'Adc','Canada','Inactive'),


('2','Flame','JLee Ho-jong', 'Top','Korean','Main Team'),
('2','Dardoch','Joshua Hartnett', 'Jungle','American','Main Team'),
('2','Pobelter','Eugene Justice Park', 'Mid','American','Main Team'),
('2','Cody','Li Yu Sun', 'Top','China','Main Team'),
('2','Olleh','Kim Joo-sung', 'Support','Korean','Main Team'),
('2','Jummychu','Jose Borromeo', 'Adc','American','Sub Team'),
('2','Huni','Heo Seung-hoon', 'Top','Korean','Inactive'),

('3','Hauntzer','Kevin Yarnell', 'Top','Korean','Main Team'),
('3','Svenskeren','Dennis Johnsen', 'Jungle','Denmark','Main Team'),
('3','Bjergsen','Søren Bjerg', 'Mid','Denmark','Main Team'),
('3','WildTurtle','Jason Tran', 'Adc','Canada','Main Team'),
('3','Biofrost','Vincent Wang', 'Support','China','Main Team'),
('3','Valkrin','Richard Royer', 'Support','American','Sub Team');


INSERT INTO Organization(Team_id,Name,Position)
VALUES
('1','Jack Etienne','Owner'),
('1','Danan Flander','General Manager'),
('1','Bok Han-gyu','Head Coach'),
('1','Lee Seung-hwan','Manager/Translator'),
('1','Jonathon McDaniel','Remote Analyst'),

('2','Noah Whinston','CEO'),
('2','Jun Kang','Team Manager'),
('2','David Tu','Strategic Coach'),
('2','Joshua Carr-Hummerston','Assistant Coach'),
('2','Brendan Schilling','Head Analyst'),
('2','Nick Luft','Analyst'),

('3','Andy Dinh','Owner/Coach'),
('3','Parth Naidu','Strategic Coach'),
('3','Luis Lopez','Position Coach');

INSERT INTO History(Team_id,Opponent,Win,Lose,Year)
VALUES
('1','Team SoloMid','2','3','2017'),
('1','Phoenix1','3','0','2017'),
('1','Team EnVyUs LoL','2','0','2017'),
('1','Immortals','2','1','2017'),
('1','Team Liquid LoL','2','0','2017'),
('1','FlyQuest eSports','2','0','2017'),
('1','Team SoloMid','2','3','2017'),

('1','Team SoloMid','0','3','2016'),
('1','Phoenix1','2','0','2016'),
('1','Team EnVyUs LoL','3','2','2016'),
('1','Immortals','2','0','2016'),
('1','Team Liquid LoL','2','1','2016'),
('1','FlyQuest eSports','2','0','2016'),
('1','Team SoloMid','2','3','2016'),

('2','Team SoloMid','1','3','2017'),
('2','Phoenix1','0','2','2017'),
('2','Team EnVyUs LoL','0','2','2017'),
('2','Immortals','0','2','2017'),
('2','Team Liquid LoL','0','2','2017'),
('2','FlyQuest eSports','2','0','2017'),
('2','Team SoloMid','2','3','2017'),

('2','Team SoloMid','1','3','2016'),
('2','Phoenix1','2','0','2016'),
('2','Team EnVyUs LoL','0','2','2016'),
('2','Immortals','0','2','2016'),
('2','Team Liquid LoL','2','1','2016'),
('2','FlyQuest eSports','2','0','2016'),
('2','Team SoloMid','0','3','2016'),


('3','Team SoloMid','3','2','2017'),
('3','Phoenix1','3','0','2017'),
('3','Team EnVyUs LoL','2','0','2017'),
('3','Immortals','2','0','2017'),
('3','Team Liquid LoL','2','0','2017'),
('3','FlyQuest eSports','2','0','2017'),
('3','Team SoloMid','2','0','2017'),

('3','Team SoloMid','3','0','2016'),
('3','Phoenix1','2','0','2016'),
('3','Team EnVyUs LoL','3','0','2016'),
('3','Immortals','2','0','2016'),
('3','Team Liquid LoL','2','0','2016'),
('3','FlyQuest eSports','2','0','2016'),
('3','Team SoloMid','2','3','2016');


INSERT INTO Achievements(Team_id, Tourament, Award, Year)
VALUES
('1','NA LCS SPRING','2ND','2017'),
('1','WORLD CHAMPION SHIP','6TH','2016'),

('2','NA LCS SPRING','7TH','2017'),
('2','WIEM XI Gyeonggi','4TH','2016'),

('3','NA LCS Spring','1ST','2017'),
('4','WORLD CHAMPION SHIP','9TH','2016');
GO

--TEST DATA TABLES
SELECT * FROM Information
SELECT * FROM Athletes
SELECT * FROM Organization
SELECT * FROM History
SELECT * FROM Achievements
GO

--Create Procedure to make new record
CREATE PROCEDURE HCAONewInformationProcedure
@NewTeamName NVARCHAR(50),
@NewGame NVARCHAR(50),
@NewReligion NVARCHAR(50),
@NewCountry NVARCHAR(50),
@NewNumberOfPlayer NVARCHAR(50)
AS
BEGIN TRY
INSERT INTO Information(TeamName , Game, Religion,Country,NumberOfPlayer)
VALUES (@NewTeamName, @NewGame,@NewReligion,@NewCountry,@NewNumberOfPlayer);
END TRY
BEGIN CATCH
PRINT'INSERT Information FAILED';
END CATCH
GO
EXECUTE HCAONewInformationProcedure @NewTeamName ='Flywest', 
@NewGame = 'LeageOfLegends',@NewReligion = 'American',
@NewCountry ='North American',@NewNumberOfPlayer ='7';
GO

CREATE PROCEDURE HCAONewHistoryProcedure
@NewTeam_id NVARCHAR(50),
@NewOpponent NVARCHAR(50),
@NewWin NVARCHAR(50),
@NewLose NVARCHAR(50),
@NewYear NVARCHAR(50)
AS
BEGIN TRY
INSERT INTO History(Team_id , Opponent, Win,Lose,Year)
VALUES (@NewTeam_id, @NewOpponent,@NewWin,@NewLose,@NewYear);
END TRY
BEGIN CATCH
PRINT'INSERT History FAILED';
END CATCH
GO
EXECUTE HCAONewHistoryProcedure @NewTeam_id ='1', 
@NewOpponent = 'FlyWest',@NewWin = '0',
@NewLose ='2',@NewYear ='2017';

SELECT A.Teamname, A.Game, SUM(B.Win) AS TOTALWIN, SUM(B.Lose) AS TOTALLOSE, B.Year
FROM Information A
INNER JOIN History B ON A.Team_id = B.Team_id
GROUP BY B.Year,A.Game,A.Teamname
GO

--CREATE TRIGGER PREVENT DELETE
CREATE TRIGGER HCAODeleteTrigger ON Athletes
FOR DELETE AS
BEGIN
INSERT INTO Athletes(Team_id,Nickname,Realname,Role,Nationality,Status)
SELECT Team_id,Nickname,Realname,Role,Nationality,'Inactive'
from deleted;
END;
GO

--CREATE TRIGGER PREVENT INSERT IF NUMBEROFPLAYER >6
CREATE TRIGGER HCAOInsertTrigger ON Athletes
FOR INSERT AS
IF EXISTS(SELECT A.Nickname
FROM inserted A
INNER JOIN Information B ON A.Team_id = B.Team_id
WHERE B.NumberofPlayer > 6)
BEGIN
ROLLBACK;
END
GO

--CREATE VIEW
CREATE VIEW HCAOVIEW
AS SELECT B.Game, B.Teamname,A.Nickname, A.Realname, A.Role, A.Nationality
FROM Athletes A
INNER JOIN Information B ON A.Team_id = B.Team_id
WHERE A.Team_id = 1 AND A.Status = 'Main Team'
GO

SELECT * FROM HCAOVIEW

SELECT A.Nickname, A.Realname, A.Role, SUM(C.Win) AS WIN ,SUM(C.Lose) AS LOSE,SUM(C.Win)-SUM(C.Lose) as POINT
FROM Athletes A
INNER JOIN History C ON A.Team_id = C.Team_id
WHERE A.Status = 'Main Team'
GROUP BY A.Nickname,A.Realname,A.Role
GO

--I DON'T WANT TO UPDATE THE DATABASE SO I CREATE THE PROCEDURE
CREATE PROCEDURE TEAMCHEAT
AS UPDATE History 
SET WIN = '0', LOSE = '3'
WHERE Team_id ='1' AND Year = '2017';
GO
EXEC TEAMCHEAT
SELECT * FROM History


