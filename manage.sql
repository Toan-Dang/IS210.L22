CREATE DATABASE Manage;
GO
USE Manage;
GO
--Question 1
CREATE TABLE SKILL (SkillNo INT PRIMARY KEY IDENTITY, SkillName NVARCHAR(255) NOT NULL, Note TEXT);
CREATE TABLE DEPARTMENT (DeptNo INT PRIMARY KEY IDENTITY, DeptName NVARCHAR(255) NOT NULL, Note TEXT);
CREATE TABLE EMPLOYEE
	 (
	 EmpNo INT PRIMARY KEY IDENTITY,
	 EmpName NVARCHAR(255) NOT NULL,
	 BirthDay DATETIME NOT NULL,
	 DeptNo INT NOT NULL,
	 MgrNo INT NOT NULL,
	 StartDate DATE NOT NULL,
	 Salary MONEY,
	 Level INT NOT NULL CHECK(Level < 8 AND Level > 0),
	 Status INT NOT NULL CHECK(Status < 3 AND Status >= 0),
	 Note TEXT
	 -- Level: level of the employee (accepts value range from 1 to 7 only).
	 -- Status: status of the employee (0: working, 1: unpaid leave, 2: out)
	 );
CREATE TABLE EMP_SKILL
	 (
	 SkillNo INT REFERENCES dbo.SKILL(SkillNo),
	 EmpNo INT REFERENCES dbo.EMPLOYEE(EmpNo),
	 SkillLevel INT NOT NULL CHECK(SkillLevel < 4 AND SkillLevel > 0),
	 RegDate DATETIME NOT NULL,
	 Description TEXT NOT NULL PRIMARY KEY(SkillNo, EmpNo)
	 -- SkillLevel: skill level of the employee (accepts value range from 1 to 3 only).
	 );

--Question 2:
ALTER TABLE dbo.EMPLOYEE ADD Email NVARCHAR(50) UNIQUE;
ALTER TABLE dbo.EMPLOYEE ADD CONSTRAINT DF_MGRNO DEFAULT 0 FOR MgrNo;
ALTER TABLE dbo.EMPLOYEE ADD CONSTRAINT DF_Status DEFAULT 0 FOR Status;
 
--Question 3: 
ALTER TABLE dbo.EMPLOYEE
ADD FOREIGN KEY(DeptNo)REFERENCES dbo.DEPARTMENT(DeptNo);
ALTER TABLE dbo.EMP_SKILL DROP COLUMN Description;
--Question 4: 
----insert Skill
INSERT dbo.SKILL(SkillName, Note)
VALUES(N'skill1', -- SkillName - nvarchar(255)
N''				  -- Note - nvarchar(max)
	);
INSERT dbo.SKILL(SkillName, Note)
VALUES(N'skill2', -- SkillName - nvarchar(255)
N''				  -- Note - nvarchar(max)
	);

INSERT dbo.SKILL(SkillName, Note)
VALUES(N'skill3', -- SkillName - nvarchar(255)
N''				  -- Note - nvarchar(max)
	);

INSERT dbo.SKILL(SkillName, Note)
VALUES(N'skill4', -- SkillName - nvarchar(255)
N''				  -- Note - nvarchar(max)
	);

INSERT dbo.SKILL(SkillName, Note)
VALUES(N'skill5', -- SkillName - nvarchar(255)
N''				  -- Note - nvarchar(max)
	);
----insert department
INSERT dbo.DEPARTMENT(DeptName, Note)
VALUES(N'dep1', -- DeptName - nvarchar(255)
N''				-- Note - nvarchar(max)
	);
INSERT dbo.DEPARTMENT(DeptName, Note)
VALUES(N'dep2', -- DeptName - nvarchar(255)
N''				-- Note - nvarchar(max)
	);
INSERT dbo.DEPARTMENT(DeptName, Note)
VALUES(N'dep3', -- DeptName - nvarchar(255)
N''				-- Note - nvarchar(max)
	);
INSERT dbo.DEPARTMENT(DeptName, Note)
VALUES(N'dep4', -- DeptName - nvarchar(255)
N''				-- Note - nvarchar(max)
	);
INSERT dbo.DEPARTMENT(DeptName, Note)
VALUES(N'dep5', -- DeptName - nvarchar(255)
N''				-- Note - nvarchar(max)
	);
----insert emp
INSERT dbo.EMPLOYEE(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Level, Status, Note, Email)
VALUES(N'em1', -- EmpName - nvarchar(255)
GETDATE(),	   -- BirthDay - datetime
1	,		   -- DeptNo - int
0	,		   -- MgrNo - int
GETDATE(),	   -- StartDate - date
NULL,		   -- Salary - money
0	,		   -- Level - int
0	,		   -- Status - int
N'',		   -- Note - nvarchar(max)
N''			   -- Email - nvarchar(50)
	);
INSERT dbo.EMPLOYEE(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Level, Status, Note, Email)
VALUES(N'em2', -- EmpName - nvarchar(255)
GETDATE(),	   -- BirthDay - datetime
2	,		   -- DeptNo - int
0	,		   -- MgrNo - int
GETDATE(),	   -- StartDate - date
NULL,		   -- Salary - money
0	,		   -- Level - int
0	,		   -- Status - int
N'',		   -- Note - nvarchar(max)
N'2'		   -- Email - nvarchar(50)
	);
INSERT dbo.EMPLOYEE(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Level, Status, Note, Email)
VALUES(N'em3', -- EmpName - nvarchar(255)
GETDATE(),	   -- BirthDay - datetime
3	,		   -- DeptNo - int
0	,		   -- MgrNo - int
GETDATE(),	   -- StartDate - date
NULL,		   -- Salary - money
0	,		   -- Level - int
0	,		   -- Status - int
N'',		   -- Note - nvarchar(max)
N'3'		   -- Email - nvarchar(50)
	);
INSERT dbo.EMPLOYEE(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Level, Status, Note, Email)
VALUES(N'em4', -- EmpName - nvarchar(255)
GETDATE(),	   -- BirthDay - datetime
4	,		   -- DeptNo - int
0	,		   -- MgrNo - int
GETDATE(),	   -- StartDate - date
NULL,		   -- Salary - money
0	,		   -- Level - int
0	,		   -- Status - int
N'',		   -- Note - nvarchar(max)
N'4'		   -- Email - nvarchar(50)
	);
INSERT dbo.EMPLOYEE(EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, Level, Status, Note, Email)
VALUES(N'em5', -- EmpName - nvarchar(255)
GETDATE(),	   -- BirthDay - datetime
5	,		   -- DeptNo - int
0	,		   -- MgrNo - int
GETDATE(),	   -- StartDate - date
NULL,		   -- Salary - money
0	,		   -- Level - int
0	,		   -- Status - int
N'',		   -- Note - nvarchar(max)
N'5'		   -- Email - nvarchar(50)
	);

--create view
CREATE VIEW EMPLOYEE_TRACKING AS 
SELECT EmpNo, EmpName, Level
FROM dbo.EMPLOYEE
WHERE Level >= 3 AND Level <= 5;

GO
