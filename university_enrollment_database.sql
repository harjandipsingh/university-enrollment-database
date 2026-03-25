

use master

create database [university_enrollment_database]

use [university_enrollment_database]



/* STUDENT TABLE */
CREATE TABLE Students(
	StudentID CHAR(8) PRIMARY KEY,
	FirstName VARCHAR(25),
	LastName VARCHAR(25),
	StreetName VARCHAR(50),
	City VARCHAR(25),
	State CHAR(2),
	ZipCode CHAR(5),
	EmailAddress VARCHAR(40),
	PhoneNum CHAR(12),
	Level VARCHAR(13)
);


/* PROFESSOR TABLE */
CREATE TABLE Professor (
    ProfID CHAR(4) PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    StreetName VARCHAR(50),
    City VARCHAR(25),
    State CHAR(2),
    ZipCode CHAR(5),
    EmailAddress VARCHAR(40),
    PhoneNum CHAR(12),
    DeptCode CHAR(5),
    CONSTRAINT FK_Professor FOREIGN KEY (DeptCode) REFERENCES Department(DeptCode)
);


/* ENROLLMENT TABLE */
CREATE TABLE Enrollment(
	EnrollID CHAR(6) PRIMARY KEY,
	StudentID CHAR(8), 
	DeptCode CHAR(5),
	CourseNum CHAR(4),
	Section CHAR(3),
	CourseGrade DECIMAL(3,2),
	CRN CHAR(5),
	CONSTRAINT FK1_Enrollment FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK2_Enrollment FOREIGN KEY(DeptCode, CourseNum, Section) REFERENCES CourseSection(DeptCode, CourseNum, Section)
);


/* DEPARTMENT TABLE */
CREATE TABLE Department (
    DeptCode CHAR(5) PRIMARY KEY,
    DeptName VARCHAR(25),
    Chair VARCHAR(30)
);

/* MAJOR TABLE */
CREATE TABLE Major (
    MajorID CHAR(5) PRIMARY KEY,
    MajorName VARCHAR(30),
    STEM VARCHAR(3)
);

/* STUDENT MAJOR TABLE */
CREATE TABLE StudentMajor (
    StudentID CHAR(8),
    MajorID CHAR(5),
    PRIMARY KEY (StudentID, MajorID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (MajorID) REFERENCES Major(MajorID)
);

/* COURSE TABLE */
CREATE TABLE Course (
    DeptCode CHAR(5),
    CourseNum CHAR(4),
    Course VARCHAR(50),
    Credits INT,
    PRIMARY KEY (DeptCode, CourseNum)
);


/* COURSE SECTION TABLE */
CREATE TABLE CourseSection (
    CRN CHAR(5),
    DeptCode CHAR(5),
    CourseNum CHAR(4),
    Section CHAR(3),
    Capacity INT,
    Enrolled INT,
    Room CHAR(4),
    ProfID CHAR(4),
    Semester VARCHAR(15),
	PRIMARY KEY (DeptCode, CourseNum, Section),
	FOREIGN KEY (DeptCode, CourseNum) REFERENCES Course(DeptCode, CourseNum),
	FOREIGN KEY (ProfID) REFERENCES Professor(ProfID)
);


/* PREREQUISITE TABLE */
CREATE TABLE Prerequisite (
    DeptCode CHAR(5),
    CourseNum CHAR(4),
    PrerequisiteDeptCode CHAR(5),
    PrerequisiteCourseNum CHAR(4),
    PRIMARY KEY (DeptCode, CourseNum, PrerequisiteDeptCode, PrerequisiteCourseNum),
    FOREIGN KEY (DeptCode, CourseNum) 
        REFERENCES Course(DeptCode, CourseNum),
    FOREIGN KEY (PrerequisiteDeptCode, PrerequisiteCourseNum) 
        REFERENCES Course(DeptCode, CourseNum)
);





----------part 2----------


INSERT INTO Students(StudentID, FirstName, LastName, StreetName, City, State, ZipCode, EmailAddress, PhoneNum, Level)
VALUES
('G0148253', 'Gabriel', 'Fulwood', '3435 Space Dr.', 'Stafford', 'VA', '22554', 'gfulwood@gmu.edu', '540-344-6783', 'Undergraduate'),
('G0745891', 'Zinnia', 'Virk', '1234 Cookie Dr.', 'Woodbridge', 'VA', '22193', 'zvirk2@gmu.edu', '703-577-9865', 'Undergraduate'),
('G0348924', 'Esther', 'Chon', '7865 School Ct.', 'Fairfax', 'VA', '20131', 'echon4@gmu.edu', '571-895-7340', 'Undergraduate'),
('G0674967', 'Harjan', 'Singh', '8751 White Star Dr.', 'Springfield', 'VA', '20156', 'hsingh44@gmu.edu', '303-577-8875', 'Undergraduate'),
('G0224599', 'Jasmine', 'Nguyen', '6550 Green Valley Rd.', 'Annandale', 'VA', '22003', 'jnguyen@gmu.edu', '703-998-2311', 'Undergraduate'),
('G0765432', 'Daniel', 'Kim', '4095 Ivy St.', 'Seattle', 'WA', '98101', 'dkim9@gmu.edu', '206-334-5519', 'Graduate'),
('G0177177', 'Bobby', 'Hill', '1067 W Miracle Mile St.', 'Tucson', 'AZ', '24532', 'bhill@gmu.edu', '546-239-5692', 'Undergraduate'),
('G1234567', 'Billy', 'Brown', '9876 Caf  St.', 'Sacramento', 'CA', '20912', 'bbrown90@gmu.edu', '555-555-5555', 'Graduate')
;


INSERT INTO Major(MajorID, MajorName, STEM)
VALUES
('BUSNS', 'Business', 'No'),
('COSCI', 'Computer Science', 'Yes'),
('ARCHI', 'Architecture', 'Yes'),
('HISTY', 'History', 'No'),
('PSYCH', 'Psychology', 'Yes'),
('CYBSE', 'Cybersecurity', 'Yes'),
('ENGNR', 'Engineering', 'Yes'),
('BUSAN', 'Business Analytics', 'Yes')
;


INSERT INTO StudentMajor(StudentID, MajorID)
VALUES
('G0148253', 'BUSNS'),
('G0745891', 'BUSAN'),
('G0348924', 'PSYCH'),
('G0674967', 'ARCHI'),
('G0224599', 'COSCI'),
('G0765432', 'PSYCH'),
('G0177177', 'CYBSE'),
('G1234567', 'BUSAN')
;

select * from StudentMajor


INSERT INTO Department(DeptCode, DeptName, Chair)
VALUES
('D0112', 'Business', 'P123'),
('D4932', 'Biology', 'P543'),
('D3579', 'Chemistry', 'P006'),
('D0134', 'Physics', 'P023'),
('D0116', 'Engineering', 'P022'),
('D5504', 'Psychology', 'P867'),
('D9912', 'Musical Arts', 'P571'),
('D0975', 'Mathematics', 'P908')
;




INSERT INTO Professor(ProfID, FirstName, LastName, DeptCode, StreetName, City, State, ZipCode, EmailAddress, PhoneNum)
VALUES
('P123', 'Jill', 'Park', 'D0112', 'Southeast St.', 'Centreville', 'VA', '20015', 'jpark98@college.edu', '201-234-5555'),
('P543', 'Sam', 'Smith', 'D4932', 'West Park Dr.', 'Centreville', 'VA', '20015', 'ssmith20@college.edu', '202-111-2222'),
('P006', 'Angelina', 'Andrews', 'D3579', 'Lavendar Way', 'Manassas', 'VA', '21212', 'aandrews59@college.edu', '202-442-9872'),
('P023', 'Grisha', 'Yeager', 'D0134', 'South St.', 'Fairfax', 'VA', '27707', 'gyeager@college.edu', '577-444-6867'),
('P022', 'Chris', 'Snoopy', 'D0116', 'North St.', 'Fairfax', 'VA', '27707', 'csnoopy@college.edu', '577-572-5682'),
('P867', 'Andrew', 'Smith', 'D5504', 'East St.', 'Fairfax', 'VA', '27707', 'asmith78@college.edu', '803-788-9652'),
('P571', 'Amir', 'Khan', 'D9912', 'East St.', 'Fairfax', 'VA', '27707', 'akhan43@college.edu', '571-896-4302'),
('P908', 'Justin', 'Barber', 'D0975', 'Bubbles Dr.', 'Ashburn', 'VA', '28123', 'jbarber42@college.edu', '703-909-7678')
;






INSERT INTO Course(DeptCode, CourseNum, Course, Credits)
VALUES
('D0112', 'C303', 'Introduction to Marketing', 3),
('D4932', 'C415', 'Marine Biology', 4),
('D3579', 'C368', 'Organic Chemistry', 3),
('D0134', 'C002', 'Nuclear Physics', 4),
('D0116', 'C034', 'Electrical Engineering', 3),
('D5504', 'C631', 'Introduction to Psychology', 3),
('D9912', 'C986', 'Music Composition', 3),
('D0975', 'C764', 'Abstract Algebra', 4)
;


INSERT INTO CourseSection(CRN, DeptCode, CourseNum, Section, Capacity, Enrolled, Room, ProfID, Semester)
VALUES
('59985', 'D0112', 'C303', 'DL2', 45, 45, '1007', 'P123', 'Spring 25'),
('56401', 'D4932', 'C415', 'DL4', 90, 87, '1075', 'P543', 'Spring 25'),
('55679', 'D3579', 'C368', 'DL1', 50, 37, '1004', 'P006', 'Spring 25'),
('54017', 'D0134', 'C002', 'DL3', 100, 88, '3005', 'P023', 'Spring 25'),
('54001', 'D0116', 'C034', 'DL1', 90, 89, '2017', 'P022', 'Spring 25'),
('53004', 'D5504', 'C631', 'DL2', 35, 32, '2003', 'P867', 'Spring 25'),
('57985', 'D9912', 'C986', 'DL2', 60, 60, '2013', 'P571', 'Spring 25'),
('56536', 'D0975', 'C764', 'DL3', 150, 104, '1011', 'P908', 'Spring 25')
;



INSERT INTO Prerequisite(DeptCode, CourseNum, PrerequisiteDeptCode, PrerequisiteCourseNum)
VALUES
('D0112', 'C303', 'D9912', 'C986'),
('D4932', 'C415', 'D3579', 'C368'),
('D3579', 'C368', 'D5504', 'C631'),
('D0134', 'C002', 'D0975', 'C764'),
('D0116', 'C034', 'D0134', 'C002'),
('D5504', 'C631', 'D0112', 'C303'),
('D9912', 'C986', 'D5504', 'C631'),
('D0975', 'C764', 'D3579', 'C368')
;


INSERT INTO Enrollment(EnrollID, StudentID, DeptCode, CourseNum, Section, CourseGrade, CRN)
VALUES
('771659', 'G0148253', 'D0112', 'C303', 'DL2', '4.00', '59985'),
('781752', 'G0745891', 'D4932', 'C415', 'DL4', '2.50', '56401'),
('553497', 'G0348924', 'D3579', 'C368', 'DL1', '3.50', '55679'),
('604921', 'G0674967', 'D0134', 'C002', 'DL3', '3.20', '54017'),
('443647', 'G0224599', 'D0116', 'C034', 'DL1', '3.00', '54001'),
('689299', 'G0765432', 'D5504', 'C631', 'DL2', '3.50', '53004'),
('564795', 'G0177177', 'D9912', 'C986', 'DL2', '4.00', '57985'),
('673261', 'G1234567', 'D0975', 'C764', 'DL3', '2.75', '56536')
;





------ questions ------


-- SQL QUERY EXERCISES --
/* QUESTION 1: List the first and last name of all students. */

SELECT FirstName, LastName
FROM Students;


/* QUESTION 2: Retrieve all the majors a specific student is pursuing (for example, StudentID = 1). */

SELECT M.MajorName
FROM StudentMajor SM
JOIN Major M ON SM.MajorID = M.MajorID
WHERE StudentID = 'G1234567'
;

/* QUESTION 3: Find the number of students in each major. */

SELECT M.MajorName, count(StudentID) as [Number of Students]
FROM StudentMajor SM
LEFT JOIN Major M ON SM.MajorID = M.MajorID
GROUP BY M.MajorName;

/* QUESTION 4: Display all students living in a specific state (for example, 'PA'). */

SELECT FirstName, LastName, State
FROM Students
WHERE State = 'VA';

/* QUESTION 5: Find students who have not declared any major yet. */

SELECT S.StudentID
FROM Students S
LEFT JOIN StudentMajor SM ON S.StudentID = SM.StudentID
WHERE SM.MajorID IS NULL;

/* QUESTION 6: Calculate each student's GPA. */

SELECT S.FirstName, S.LastName, ROUND(CAST(AVG(CourseGrade) AS DECIMAL(3,2)), 2) as [Student GPA]
FROM Enrollment E
LEFT JOIN Students S ON E.StudentID = S.StudentID
GROUP BY S.FirstName, S.LastName;
