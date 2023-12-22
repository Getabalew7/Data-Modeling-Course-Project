// Create Room nodes
CREATE (:Room { RoomID: 1, Building: 'Building A', Capacity: 50 });

CREATE (:Room { RoomID: 2, Building: 'Building B', Capacity: 40 });

CREATE (:Room { RoomID: 3, Building: 'Building C', Capacity: 60 });

CREATE (:Room { RoomID: 4, Building: 'Building D', Capacity: 30 });

CREATE (:Room { RoomID: 5, Building: 'Building E', Capacity: 45 });

// Create StudyProgram nodes
CREATE (:StudyProgram { StudyProgramID: 1, Name: 'Computer Science' });

CREATE (:StudyProgram { StudyProgramID: 2, Name: 'Electrical Engineering' });

CREATE (:StudyProgram { StudyProgramID: 3, Name: 'Business Administration' });

CREATE (:StudyProgram { StudyProgramID: 4, Name: 'Biology' });

CREATE (:StudyProgram { StudyProgramID: 5, Name: 'Psychology' });

// Create Department nodes
CREATE (:Department { DepartmentID: 1, Name: 'Computer Science Department' });

CREATE (:Department { DepartmentID: 2, Name: 'Electrical Engineering Department' });

CREATE (:Department { DepartmentID: 3, Name: 'Business Administration Department' });

CREATE (:Department { DepartmentID: 4, Name: 'Biology Department' });

CREATE (:Department { DepartmentID: 5, Name: 'Psychology Department' });

// Match existing Student
MERGE (stud1:Student { StudentID: 1 })
MERGE (stud2:Student { StudentID: 2 })
MERGE (stud3:Student { StudentID: 3 })
MERGE (stud4:Student { StudentID: 4 })
MERGE (stud5:Student { StudentID: 5 })
MERGE (stud6:Student { StudentID: 6 })
MERGE (stud7:Student { StudentID: 7 })
MERGE (stud8:Student { StudentID: 8 })

// Create Student nodes and relationships with StudyProgram nodes
MERGE (stp1:StudyProgram { StudyProgramID: 1 })
CREATE (:Student { StudentID: 1, FirstName: 'John', LastName: 'Doe', DateOfBirth: date('1995-03-15'), Gender: 'M', Email: 'john.doe@example.com' })
-[:ENROLLED_IN]->(stp1);

MERGE (stp2:StudyProgram { StudyProgramID: 2 })
CREATE (:Student { StudentID: 2, FirstName: 'Jane', LastName: 'Smith', DateOfBirth: date('1997-08-22'), Gender: 'F', Email: 'jane.smith@example.com' })
-[:ENROLLED_IN]->(stp2);

MERGE (stp1:StudyProgram { StudyProgramID: 1 })
CREATE (:Student { StudentID: 3, FirstName: 'Michael', LastName: 'Johnson', DateOfBirth: date('1998-05-10'), Gender: 'M', Email: 'michael.johnson@example.com' })
-[:ENROLLED_IN]->(stp1);

MERGE (stp3:StudyProgram { StudyProgramID: 3 })
CREATE (:Student { StudentID: 4, FirstName: 'Emily', LastName: 'Williams', DateOfBirth: date('1996-12-03'), Gender: 'F', Email: 'emily.williams@example.com' })
-[:ENROLLED_IN]->(stp3) ;

MERGE (stp2:StudyProgram { StudyProgramID: 2 })
CREATE (:Student { StudentID: 5, FirstName: 'David', LastName: 'Brown', DateOfBirth: date('1999-02-28'), Gender: 'M', Email: 'david.brown@example.com' })
-[:ENROLLED_IN]->(stp2);

MERGE (stp4:StudyProgram { StudyProgramID: 4 })
CREATE (:Student { StudentID: 6, FirstName: 'Martin', LastName: 'Brown', DateOfBirth: date('1995-02-28'), Gender: 'M', Email: 'martin.brown@example.com' })
-[:ENROLLED_IN]->(stp4);

MERGE (stp3:StudyProgram { StudyProgramID: 3 })
CREATE (:Student { StudentID: 7, FirstName: 'Selam', LastName: 'Tola', DateOfBirth: date('2000-02-17'), Gender: 'M', Email: 'selam.tola@example.com' })
-[:ENROLLED_IN]->(stp3);

MERGE (stp5:StudyProgram { StudyProgramID: 5 })
CREATE (:Student { StudentID: 8, FirstName: 'Robel', LastName: 'Smith', DateOfBirth: date('1997-02-09'), Gender: 'M', Email: 'robel.smith@example.com' })
-[:ENROLLED_IN]->(stp5);

// Create Course nodes and relationships with StudyProgram nodes
MERGE (stp1:StudyProgram { StudyProgramID: 1 })
CREATE (:Course { CourseCode: 'CS101', Name: 'Introduction to Computer Science', CreditHour: 3, Description: 'Fundamentals of computer science' })
-[:BELONGS_TO]->(stp1);

MERGE (stp2:StudyProgram { StudyProgramID: 2 })
CREATE (:Course { CourseCode: 'EE201', Name: 'Circuit Analysis', CreditHour: 4, Description: 'Basic principles of electrical circuits' })
-[:BELONGS_TO]->(stp2);

MERGE (stp3:StudyProgram { StudyProgramID: 3 })
CREATE (:Course { CourseCode: 'BA301', Name: 'Marketing Strategies', CreditHour: 3, Description: 'Strategic marketing concepts' })
-[:BELONGS_TO]->(stp3);

MERGE (stp4:StudyProgram { StudyProgramID: 4 })
CREATE (:Course { CourseCode: 'BIO202', Name: 'Genetics', CreditHour: 4, Description: 'Study of genetic principles' })
-[:BELONGS_TO]->(stp4);

MERGE (stp5:StudyProgram { StudyProgramID: 5 })
CREATE (:Course { CourseCode: 'PSY101', Name: 'Introduction to Psychology', CreditHour: 3, Description: 'Overview of psychological concepts' })
-[:BELONGS_TO]->(stp5);

// Match existing departments
MATCH (d1:Department { DepartmentID: 1 })
MATCH (d2:Department { DepartmentID: 2 })
MATCH (d3:Department { DepartmentID: 3 })
MATCH (d4:Department { DepartmentID: 4 })
MATCH (d5:Department { DepartmentID: 5 })

// Create Instructor nodes and relationships with Department nodes
MERGE (d1:Department { DepartmentID: 1 })
CREATE (:Instructor { InstructorID: 1, FirstName: 'Robert', LastName: 'Johnson', DateOfBirth: date('1970-05-20'), Email: 'robert.johnson@example.com', EducationalLevel: 'Ph.D.' })
-[:WORKS_IN]->(d1);

MERGE (d2:Department { DepartmentID: 2 })
CREATE (:Instructor { InstructorID: 2, FirstName: 'Alice', LastName: 'Smith', DateOfBirth: date('1982-08-15'), Email: 'alice.smith@example.com', EducationalLevel: 'M.Sc.' })
-[:WORKS_IN]->(d2);

MERGE (d3:Department { DepartmentID: 3 })
CREATE (:Instructor { InstructorID: 3, FirstName: 'David', LastName: 'Williams', DateOfBirth: date('1975-03-10'), Email: 'david.williams@example.com', EducationalLevel: 'Ph.D.' })
-[:WORKS_IN]->(d3);

MERGE (d4:Department { DepartmentID: 4 })
CREATE (:Instructor { InstructorID: 4, FirstName: 'Emily', LastName: 'Davis', DateOfBirth: date('1980-11-28'), Email: 'emily.davis@example.com', EducationalLevel: 'M.Sc.' })
-[:WORKS_IN]->(d4);

MERGE (d5:Department { DepartmentID: 5 })
CREATE (:Instructor { InstructorID: 5, FirstName: 'John', LastName: 'Miller', DateOfBirth: date('1978-02-15'), Email: 'john.miller@example.com', EducationalLevel: 'Ph.D.' })
-[:WORKS_IN]->(d5);

MERGE (d3:Department { DepartmentID: 3 })
CREATE (:Instructor { InstructorID: 6, FirstName: 'Tedi', LastName: 'Betselot', DateOfBirth: date('1980-11-28'), Email: 'tedi.betselot@example.com', EducationalLevel: 'M.Sc.' })
-[:WORKS_IN]->(d3);

MERGE (d2:Department { DepartmentID: 2 })
CREATE (:Instructor { InstructorID: 7, FirstName: 'Merunka', LastName: 'Miller', DateOfBirth: date('1978-02-15'), Email: 'merunka.miller@example.com', EducationalLevel: 'Ph.D.' })
-[:WORKS_IN]->(d2);

MERGE (d4:Department { DepartmentID: 4 })
CREATE (:Instructor { InstructorID: 8, FirstName: 'Senator', LastName: 'Tari', DateOfBirth: date('1978-02-15'), Email: 'senator.tari@example.com', EducationalLevel: 'Ph.D.' })
-[:WORKS_IN]->(d4);

// Match existing Course

MERGE (c4:Course { CourseCode: 'BIO202' })

// Match existing Student

MERGE (stud5:Student { StudentID: 5 })
MERGE (stud6:Student { StudentID: 6 })
MERGE (stud7:Student { StudentID: 7 })
MERGE (stud8:Student { StudentID: 8 })

// Create relationships between Student and Course
MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (stud1:Student { StudentID: 1 })
MERGE (stud1)-[:Takes { Grade : 1 }]->(c1);

MERGE (stud2:Student { StudentID: 2 })
MERGE (c2:Course { CourseCode: 'EE201' })
MERGE (stud2)-[:Takes { Grade : 2 }]->(c2);

MERGE (stud3:Student { StudentID: 3 })
MERGE (c3:Course { CourseCode: 'BA301' })
MERGE (stud3)-[:Takes { Grade : 3 }]->(c3);

MERGE (stud4:Student { StudentID: 4 })
MERGE (c4:Course { CourseCode: 'BIO202' })
MERGE (stud4)-[:Takes { Grade : 1 }]->(c4);

MERGE (stud5:Student { StudentID: 5 })
MERGE (c5:Course { CourseCode: 'PSY101' })
MERGE (stud5)-[:Takes { Grade : 1 }]->(c5);

MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (stud6:Student { StudentID: 6 })
MERGE (stud6)-[:Takes { Grade : 3 }]->(c1);

MERGE (c2:Course { CourseCode: 'EE201' })
MERGE (stud7:Student { StudentID:7 })
MERGE (stud7)-[:Takes { Grade : 2 }]->(c2);

MERGE (c3:Course{ CourseCode: 'BA301' })
MERGE (stud1:Student { StudentID:3 })
MERGE (stud1)-[:Takes { Grade : 3 }]->(c3);

MERGE (c4:Course{ CourseCode:'BIO202' })
MERGE (stud2:Student{ StudentID:2 })
MERGE (stud2)-[:Takes { Grade : 1 }]->(c4);

MERGE (stud3:Student { StudentID: 3 })
MERGE (c5:Course { CourseCode: 'PSY101' })
Create (stud3)-[:Takes { Grade : 3 }]->(c5);

MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (stud4:Student { StudentID: 4 })
Create (stud4)-[:Takes { Grade : 2 }]->(c1);

// Match existing Instructor

MERGE (ints6:Instructor { InstructorID: 6 })
MERGE (ints7:Instructor { InstructorID: 7 })
MERGE (ints8:Instructor { InstructorID: 8 })

// Create relationships between Instructor and Course
MERGE (ints1:Instructor { InstructorID: 1 })
MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (ints1)-[:Teaches]->(c1);

MERGE (ints2:Instructor { InstructorID: 2 })
MERGE (c2:Course { CourseCode: 'EE201' })
MERGE (ints2)-[:Teaches]->(c2);

MERGE (ints3:Instructor { InstructorID: 3 })
MERGE (c3:Course{ CourseCode: 'BA301' })
MERGE (ints3)-[:Teaches]->(c3);

MERGE (ints4:Instructor { InstructorID: 4 })
MERGE (c4:Course{ CourseCode:'BIO202' })
MERGE (ints4)-[:Teaches]->(c4);

MERGE (ints5:Instructor { InstructorID: 5 })
MERGE (c5:Course { CourseCode: 'PSY101' })
MERGE (ints5)-[:Teaches]->(c5);

MERGE (ints1:Instructor { InstructorID: 1 })
MERGE (c2:Course { CourseCode: 'EE201' })
MERGE (ints1)-[:Teaches]->(c2);

MERGE (ints2:Instructor { InstructorID: 2 })
MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (ints2)-[:Teaches]->(c1);

MERGE (ints3:Instructor { InstructorID: 3 })
MERGE (c4:Course{ CourseCode:'BIO202' })
MERGE (ints3)-[:Teaches]->(c4);

MERGE (ints4:Instructor { InstructorID: 4 })
MERGE (c3:Course{ CourseCode: 'BA301' })
MERGE (ints4)-[:Teaches]->(c3);

MERGE (ints5:Instructor { InstructorID: 5 })
MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (ints5)-[:Teaches]->(c1);

// Create relationships between Course and Room nodes with attributes
MERGE (r1:Room { RoomID: 1 })
MERGE (c1:Course { CourseCode: 'CS101' })
MERGE (c1)-[:ASSIGNED_TO { Day: date('2023-01-15'), StartTime: localdatetime('2023-01-15T08:00'), EndTime: localdatetime('2023-01-15T10:00') }]->(r1);

MERGE (r2:Room { RoomID: 2 })
MERGE (c2:Course { CourseCode: 'EE201' })
MERGE (c2)-[:ASSIGNED_TO { Day: date('2023-01-16'), StartTime: localdatetime('2023-01-16T10:30'), EndTime: localdatetime('2023-01-16T12:30') }]->(r2);

MERGE (r3:Room { RoomID: 3 })
MERGE (c3:Course{ CourseCode: 'BA301' })
MERGE (c3)-[:ASSIGNED_TO { Day: date('2023-01-17'), StartTime: localdatetime('2023-01-17T13:00'), EndTime: localdatetime('2023-01-17T15:00') }]->(r3);

MERGE (r4:Room { RoomID: 4 })
MERGE (c4:Course{ CourseCode:'BIO202' })
MERGE (c4)-[:ASSIGNED_TO { Day: date('2023-01-18'), StartTime: localdatetime('2023-01-18T09:00'), EndTime: localdatetime('2023-01-18T11:00') }]->(r4);

MERGE (r5:Room { RoomID: 5 })
MERGE (c5:Course { CourseCode: 'PSY101' })
MERGE (c5)-[:ASSIGNED_TO { Day: date('2023-01-19'), StartTime: localdatetime('2023-01-19T14:00'), EndTime: localdatetime('2023-01-19T16:00') }]->(r5);

MATCH (s:Student)-[:Takes]->(c:Course { Name: 'Introduction to Computer Science' })
RETURN s, c;

MATCH (i:Instructor)-[:WORKS_IN]->(:Department { Name:'Computer Science Department' })
WITH i
MATCH (i)-[:Teaches]->(c:Course)
RETURN i.FirstName AS FirstName, i.LastName AS LastName, i.EducationalLevel AS Edu_Level, c.Name AS CourseName

MATCH (c:Course)-[rel:ASSIGNED_TO]->(r:Room)
WHERE r.Capacity >=50
RETURN c.CourseCode, c.Name, r.Building, rel.StartTime, rel.EndTime

MATCH (st:Student)-[rel:Takes]->(c:Course{ Name:'Genetics' })
WHERE rel.Grade =1
RETURN st.FirstName +" " +st.LastName AS Full_Name, st.Gender AS Sex, st.Email AS Email, rel.Grade AS Grade
