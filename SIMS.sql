-- StudyProgram table
CREATE TABLE StudyProgram (
    StudyProgramID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Room table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    Building VARCHAR(50),
    Capacity INT
);
-- Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Email VARCHAR(100),
    StudyProgramID INT,
    FOREIGN KEY (StudyProgramID) REFERENCES StudyProgram(StudyProgramID)
);

-- Course table
CREATE TABLE Course (
    CourseCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    CreditHour INT,
    Description VARCHAR(250),
    StudyProgramID INT,
    FOREIGN KEY (StudyProgramID) REFERENCES StudyProgram(StudyProgramID)
);

-- Instructor table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    EducationalLevel VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Relationship table for student takes course
CREATE TABLE StudentTakesCourse (
    StudentID INT,
    CourseCode VARCHAR(10),
    Grade INT,
    PRIMARY KEY (StudentID, CourseCode),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Relationship table for instructor teaches course
CREATE TABLE InstructorTeachesCourse (
    InstructorID INT,
    CourseCode VARCHAR(10),
    PRIMARY KEY (InstructorID, CourseCode),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Relationship table for course assigned to a room
CREATE TABLE CourseAssignedToRoom (
    CourseCode VARCHAR(10),
    RoomID INT,
	Day Date,
	StartTime Date,
	EndTime Date,
    PRIMARY KEY (CourseCode),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);
select * from courseassignedtoroom;
--======================================
-- Insert data into Room table
INSERT INTO Room (RoomID, Building, Capacity)
VALUES
(1, 'Building A', 50),
(2, 'Building B', 40),
(3, 'Building C', 60),
(4, 'Building D', 30),
(5, 'Building E', 45);

select * from room;

-- Insert data into Room table
INSERT INTO Room (RoomID, Building, Capacity) VALUES (1, 'Building A', 50);
INSERT INTO Room (RoomID, Building, Capacity) VALUES (2, 'Building B', 40);
INSERT INTO Room (RoomID, Building, Capacity) VALUES (3, 'Building C', 60);
INSERT INTO Room (RoomID, Building, Capacity) VALUES (4, 'Building D', 30);
INSERT INTO Room (RoomID, Building, Capacity) VALUES (5, 'Building E', 45);

-- Insert data into StudyProgram table
INSERT INTO StudyProgram (StudyProgramID, Name) VALUES (1, 'Computer Science');
INSERT INTO StudyProgram (StudyProgramID, Name) VALUES (2, 'Electrical Engineering');
INSERT INTO StudyProgram (StudyProgramID, Name) VALUES (3, 'Business Administration');
INSERT INTO StudyProgram (StudyProgramID, Name) VALUES (4, 'Biology');
INSERT INTO StudyProgram (StudyProgramID, Name) VALUES (5, 'Psychology');
select * from studyprogram;

-- Insert data into Department table
INSERT INTO Department (DepartmentID, Name) VALUES (1, 'Computer Science Department');
INSERT INTO Department (DepartmentID, Name) VALUES (2, 'Electrical Engineering Department');
INSERT INTO Department (DepartmentID, Name) VALUES (3, 'Business Administration Department');
INSERT INTO Department (DepartmentID, Name) VALUES (4, 'Biology Department');
INSERT INTO Department (DepartmentID, Name) VALUES (5, 'Psychology Department');

select * from Department;

-- Insert data into Student table
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (1, 'John', 'Doe', TO_DATE('1995-03-15', 'YYYY-MM-DD'), 'M', 'john.doe@example.com', 1);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (2, 'Jane', 'Smith', TO_DATE('1997-08-22', 'YYYY-MM-DD'), 'F', 'jane.smith@example.com', 2);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (3, 'Michael', 'Johnson', TO_DATE('1998-05-10', 'YYYY-MM-DD'), 'M', 'michael.johnson@example.com', 1);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (4, 'Emily', 'Williams', TO_DATE('1996-12-03', 'YYYY-MM-DD'), 'F', 'emily.williams@example.com', 3);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (5, 'David', 'Brown', TO_DATE('1999-02-28', 'YYYY-MM-DD'), 'M', 'david.brown@example.com', 2);

INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (6, 'Martin', 'Brown', TO_DATE('1995-02-28', 'YYYY-MM-DD'), 'M', 'martin.brown@example.com', 4);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (7, 'Selam', 'Tola', TO_DATE('2000-02-17', 'YYYY-MM-DD'), 'M', 'selam.toal@example.com', 3);
INSERT INTO Student (StudentID, FirstName, LastName, DateOfBirth, Gender, Email, StudyProgramID) VALUES (8, 'Robel', 'Smith', TO_DATE('1997-02-09', 'YYYY-MM-DD'), 'M', 'robel.smith@example.com', 5);

select studentid, firstname, lastname,dateofbirth,gender,email from student;

-- Insert data into Course table
INSERT INTO Course (CourseCode, Name, CreditHour, Description, StudyProgramID) VALUES ('CS101', 'Introduction to Computer Science', 3, 'Fundamentals of computer science', 1);
INSERT INTO Course (CourseCode, Name, CreditHour, Description, StudyProgramID) VALUES ('EE201', 'Circuit Analysis', 4, 'Basic principles of electrical circuits', 2);
INSERT INTO Course (CourseCode, Name, CreditHour, Description, StudyProgramID) VALUES ('BA301', 'Marketing Strategies', 3, 'Strategic marketing concepts', 3);
INSERT INTO Course (CourseCode, Name, CreditHour, Description, StudyProgramID) VALUES ('BIO202', 'Genetics', 4, 'Study of genetic principles', 4);
INSERT INTO Course (CourseCode, Name, CreditHour, Description, StudyProgramID) VALUES ('PSY101', 'Introduction to Psychology', 3, 'Overview of psychological concepts', 5);

select coursecode, name, credithour, description from Course;

select * from course;
-- Insert data into Instructor table
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (1, 'Robert', 'Johnson', TO_DATE('1970-05-20', 'YYYY-MM-DD'), 'robert.johnson@example.com', 'Ph.D.', 1);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (2, 'Alice', 'Smith', TO_DATE('1982-08-15', 'YYYY-MM-DD'), 'alice.smith@example.com', 'M.Sc.', 2);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (3, 'David', 'Williams', TO_DATE('1975-03-10', 'YYYY-MM-DD'), 'david.williams@example.com', 'Ph.D.', 3);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (4, 'Emily', 'Davis', TO_DATE('1980-11-28', 'YYYY-MM-DD'), 'emily.davis@example.com', 'M.Sc.', 4);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (5, 'John', 'Miller', TO_DATE('1978-02-15', 'YYYY-MM-DD'), 'john.miller@example.com', 'Ph.D.', 5);

INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (6, 'Tedi', 'Betselot', TO_DATE('1980-11-28', 'YYYY-MM-DD'), 'emily.davis@example.com', 'M.Sc.', 3);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (7, 'Merunka', 'Miller', TO_DATE('1978-02-15', 'YYYY-MM-DD'), 'john.miller@example.com', 'Ph.D.', 2);
INSERT INTO Instructor (InstructorID, FirstName, LastName, DateOfBirth, Email, EducationalLevel, DepartmentID) VALUES (8, 'Senator', 'Tari', TO_DATE('1978-02-15', 'YYYY-MM-DD'), 'john.miller@example.com', 'Ph.D.', 4);


select * from Instructor;
select * from student;

-- Insert data into StudentTakesCourse table
INSERT INTO StudentTakesCourse (StudentID, CourseCode,Grade) VALUES (1, 'CS101',1);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (2, 'EE201',2);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (3, 'BA301',3);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (4, 'BIO202',1);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (5, 'PSY101',1);

INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (6, 'CS101',3);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (7, 'EE201',2);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (1, 'BA301',3);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (2, 'BIO202',1);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (3, 'PSY101',3);
INSERT INTO StudentTakesCourse (StudentID, CourseCode,GRADE) VALUES (4, 'CS101',2);

select * from StudentTakesCourse;

select * from Instructor;

-- Insert data into InstructorTeachesCourse table
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (1, 'CS101');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (2, 'EE201');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (3, 'BA301');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (4, 'BIO202');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (5, 'PSY101');

INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (1, 'EE201');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (2, 'CS101');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (3, 'BIO202');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (4, 'BA301');
INSERT INTO InstructorTeachesCourse (InstructorID, CourseCode) VALUES (5, 'CS101');

select * from InstructorTeachesCourse;

-- Insert data into CourseAssignedToRoom table
INSERT INTO CourseAssignedToRoom (CourseCode, RoomID, Day, StartTime, EndTime) VALUES ('CS101', 1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('08:00', 'HH24:MI'), TO_DATE('10:00', 'HH24:MI'));
INSERT INTO CourseAssignedToRoom (CourseCode, RoomID, Day, StartTime, EndTime) VALUES ('EE201', 2, TO_DATE('2023-01-16', 'YYYY-MM-DD'), TO_DATE('10:30', 'HH24:MI'), TO_DATE('12:30', 'HH24:MI'));
INSERT INTO CourseAssignedToRoom (CourseCode, RoomID, Day, StartTime, EndTime) VALUES ('BA301', 3, TO_DATE('2023-01-17', 'YYYY-MM-DD'), TO_DATE('13:00', 'HH24:MI'), TO_DATE('15:00', 'HH24:MI'));
INSERT INTO CourseAssignedToRoom (CourseCode, RoomID, Day, StartTime, EndTime) VALUES ('BIO202', 4, TO_DATE('2023-01-18', 'YYYY-MM-DD'), TO_DATE('09:00', 'HH24:MI'), TO_DATE('11:00', 'HH24:MI'));
INSERT INTO CourseAssignedToRoom (CourseCode, RoomID, Day, StartTime, EndTime) VALUES ('PSY101', 5, TO_DATE('2023-01-19', 'YYYY-MM-DD'), TO_DATE('14:00', 'HH24:MI'), TO_DATE('16:00', 'HH24:MI'));

select * from CourseAssignedToRoom;
select * from course;
select * from student;
select * from studentTakesCourse;

--=============================
SELECT s.* FROM Student s
JOIN StudentTakesCourse stc ON s.StudentID = stc.StudentID
JOIN Course c ON stc.CourseCode = c.CourseCode
WHERE
    c.Name = 'Introduction to Computer Science';

select s.* from student s, course c, StudentTakesCourse st
    where s.studentID = st.studentID and c.courseCode = st.courseCode and c.name='Introduction to Computer Science';
--==========================
select * from InstructorTeachesCourse;
select * from Instructor;
SELECT
    i.InstructorID,
    i.FirstName,
    i.LastName,
    i.DateOfBirth,
    i.Email,
    i.EducationalLevel,
    c.name
FROM
    Instructor i, Course c, InstructorTeachesCourse itc, Department d
where
    i.InstructorID = itc.InstructorID and
	i.DepartmentID = d.DepartmentID   and
    itc.CourseCode = c.CourseCode and
	d.Name = 'Computer Science Department';

--============================
SELECT
    c.CourseCode,
    c.Name,
    c.CreditHour,
    c.Description,
    cr.RoomID,
    cr.Day,
    cr.StartTime,
    cr.EndTime
FROM
    CourseAssignedToRoom cr
JOIN
    Room r ON cr.RoomID = r.RoomID
JOIN
    Course c ON cr.CourseCode = c.CourseCode
WHERE
    r.Capacity >= 50;

--==============================
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.DateOfBirth,
    s.Gender,
    s.Email
FROM
    Student s
JOIN
    StudentTakesCourse stc ON s.StudentID = stc.StudentID
JOIN
    Course c ON stc.CourseCode = c.CourseCode
WHERE
    c.Name = 'Genetics'
    AND stc.Grade = 1;

--Find all courses that are taught by an instructor who has a Ph.D. degree.
select * from Instructor;
select * from Course;
select * from InstructorTeachesCourse;
SELECT
    c.CourseCode,
    c.Name,
    c.CreditHour,
    c.Description
FROM
    Course c
JOIN
    InstructorTeachesCourse itc ON c.CourseCode = itc.CourseCode
JOIN
    Instructor i ON itc.InstructorID = i.InstructorID
WHERE
    i.EducationalLevel = 'Ph.D.';

--===============================
select * from department;
select * from room;
select * from studyProgram;
select * from student;

select *  from course;
select * from Instructor;
select * from StudentTakesCourse;
select * from InstructorTeachesCourse;
select * from CourseAssignedToRoom;
