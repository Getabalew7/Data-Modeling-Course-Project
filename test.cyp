MATCH (n)
WHERE n.capacity IS NOT NULL
RETURN DISTINCT "node" as entity, n.capacity AS capacity LIMIT 25
UNION ALL
MATCH ()-[r]-()
WHERE r.capacity IS NOT NULL
RETURN DISTINCT "relationship" AS entity, r.capacity AS capacity LIMIT 25;

MATCH (n)
WHERE n.courseCode IS NOT NULL
RETURN DISTINCT "node" as entity, n.courseCode AS courseCode LIMIT 25
UNION ALL
MATCH ()-[r]-()
WHERE r.courseCode IS NOT NULL
RETURN DISTINCT "relationship" AS entity, r.courseCode AS courseCode LIMIT 25;

MATCH (i:Instructor)-[:TEACHES]->(c:Course)
WHERE i.educationalLevel = 'Ph.D.'
RETURN DISTINCT i,c;



MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Circuit Analysis'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'B'
RETURN s;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Circuit Analysis'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'A'
RETURN s;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Calculus'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'A+'
RETURN s;

MATCH p=()-[:HAS_GRADE]->() RETURN p LIMIT 25;

// Assuming you have a property named 'grade' in the relationship
MATCH (s:Student {studentID: 1})-[:TAKES]->(c:Course {courseCode: 'CS101'})
CREATE (s)-[:HAS_GRADE {grade: 'A+'}]->(c);

MATCH (s:Student {studentID: 2})-[:TAKES]->(c:Course {courseCode: 'EE201'})
CREATE (s)-[:HAS_GRADE {grade: 'B'}]->(c);

MATCH (s:Student {studentID: 3})-[:TAKES]->(c:Course {courseCode: 'BA301'})
CREATE (s)-[:HAS_GRADE {grade: 'A-'}]->(c);

MATCH (s:Student {studentID: 4})-[:TAKES]->(c:Course {courseCode: 'BIO202'})
CREATE (s)-[:HAS_GRADE {grade: 'B+'}]->(c);

MATCH (s:Student {studentID: 5})-[:TAKES]->(c:Course {courseCode: 'PSY101'})
CREATE (s)-[:HAS_GRADE {grade: 'A'}]->(c);

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Calculus'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'A+'
RETURN s;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Calculus'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'A+'
RETURN s;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Calculus'})
MATCH (s)-[grade:HAS_GRADE]->(c)
WHERE grade.grade = 'A+'
RETURN s;

MATCH p=()-[:TAKES]->() RETURN p LIMIT 25;

match (x:Takes) return x;

match(c:Course)- [:ASSIGNED_TO]->(r:Room)
where r.capacity >=50
return r.building,r.capacity;

match(c:Course)- [:ASSIGNED_TO]->(r:Room)
where r.capacity >=50
return c, r;

match(c:Course)- [:ASSIGNED_TO]->(r:Room)
where r.capacity >=50;

match(c:Course)- [:ASSIGNED_TO]-(r:Room)
where r.capacity >=50;

match(c:Course)- [:ASSIGNED_TO]-(r:Room);

match(c:Course)- [:ASSIGNED_TO]-(r:Room);

MATCH (d:Department{name: 'Computer Science Department'})-[:HAS_INSTRUCTORS]-(i:Instructor)
WITH i
MATCH (i)-[:TEACHES]-(c:Course)
RETURN i;

MATCH (d:Department{name: 'Computer Science Department'})->[:HAS_INSTRUCTORS]-(i:Instructor)
with i
match (i)-[:TEACHES]-[c:Course]
return i;

MATCH (d:Department{name: 'Computer Science Department'})->[:HAS_INSTRUCTORS]-(i:Instructor)
with i
match (i)-[:TEACHES]-[c:Course]
return i;

MATCH (d:Department{name: 'Computer Science Department'})->[:HAS_INSTRUCTORS]-(i:Instructor)
with i
match (i)-[:TEACHES]->[c:Course]
return i;

MATCH (d:Department{name: 'Computer Science Department'})-[:HAS_INSTRUCTORS]-(i:Instructor)
with i
match (i)-[:TEACHES]->[c:Course]
return i;

MATCH (d:Department{name: 'Computer Science Department'})-[:HAS_INSTRUCTORS]-(i:Instructor)
RETURN i;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]-(i:Instructor)
return i;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]->(i:Instructor)
return i;

match (c:Instructor) return c;

match (c:Department) return c;

match (c:department) return c;

match (c:Course) return c;

match (c:Course) return course;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]->(i:Instructor)
WITH i
MATCH (i)-[:TEACHES]->(c:Course)
RETURN DISTINCT i;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]-(i:Instructor)
return i;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]->(i:Instructor)
return i;

MATCH (d:Department{name: 'Compuer Science Department'})-[:HAS_INSTRUCTORS]->(i:Instructor)
WITH i
MATCH (i)-[:TEACHES]->(c:Course)
RETURN DISTINCT i;

match (s:Student)-[:TAKES]->(c:Course{name:'Introduction to Computer Science'}) return s,c;

MATCH (d:Department{name:'Computer Science Department'})-[:HAS_INSTRUCTORS]->(i:Instructor)
WITH i,d
MATCH (i)-[:TEACHES]->(c:Course)
RETURN i,d,c

MATCH (i:Instructor)-[:HAS_INSTRUCTORS]->(d:Department {name: 'Computer Science Department'})
WITH i
MATCH (i)-[:TEACHES]->(c:Course)
RETURN DISTINCT i;

MATCH (i:Instructor)-[:TEACHES]->(c:Course)
WHERE (:Department{name:"Computer Sceince Department"})-[:HAS_INSTRUCTORS]->(i)
RETURN DISTINCT i;

MATCH (i:Instructor)-[:TEACHES]->(c:Course)
WHERE (d:Department{name:"Computer Sceince Department"})-[:HAS_INSTRUCTORS]->(i)
RETURN DISTINCT i;

MATCH (i:Instructor)-[:TEACHES]->(c:Course)
WHERE (i)-[:HAS_INSTRUCTORS]->(:Department {name: 'Computer Science Department'})
RETURN DISTINCT i;

// Create relationships for instructors belonging to a department
MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 1 AND d.departmentID = 1
CREATE (d)-[:HAS_INSTRUCTORS]->(i);

MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 2 AND d.departmentID = 1
CREATE (d)-[:HAS_INSTRUCTORS]->(i);


MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 3 AND d.departmentID = 2
CREATE (d)-[:HAS_INSTRUCTORS]->(i);

MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 4 AND d.departmentID = 3
CREATE (d)-[:HAS_INSTRUCTORS]->(i);

MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 5 AND d.departmentID = 5
CREATE (d)-[:HAS_INSTRUCTORS]->(i);

MATCH (i:Instructor)-[:TEACHES]->(c:Course)-[:BELONGS_TO]->(d:Department {name: 'Computer Science Department'})
RETURN DISTINCT i;

MATCH (i:Instructor)-[:TEACHES]->(c:Course)-[:BELONGS_TO]->(d:Department {name: 'Computer Science Department'})
RETURN i;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Introduction to Computer Science'})
RETURN s,c;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Introduction to Computer Science'})
RETURN s;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Fundamentals of computer science'})
RETURN s;

// Create relationships for course assigned to a room
MATCH (c:Course), (r:Room)
WHERE c.courseCode = 'CS101' AND r.roomID = 1
CREATE (c)-[:ASSIGNED_TO]->(r);

MATCH (c:Course), (r:Room)
WHERE c.courseCode = 'EE201' AND r.roomID = 2
CREATE (c)-[:ASSIGNED_TO]->(r);

MATCH (c:Course), (r:Room)
WHERE c.courseCode = 'BA301' AND r.roomID = 3
CREATE (c)-[:ASSIGNED_TO]->(r);

MATCH (c:Course), (r:Room)
WHERE c.courseCode = 'BIO202' AND r.roomID = 4
CREATE (c)-[:ASSIGNED_TO]->(r);

MATCH (c:Course), (r:Room)
WHERE c.courseCode = 'PSY101' AND r.roomID = 5
CREATE (c)-[:ASSIGNED_TO]->(r);

// Create relationships for instructor teaches course
MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 1 AND c.courseCode = 'CS101'
CREATE (i)-[:TEACHES]->(c);


MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 1 AND c.courseCode = 'EE201'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 2 AND c.courseCode = 'EE201'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 2 AND c.courseCode = 'BIO202'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 3 AND c.courseCode = 'BA301'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 4 AND c.courseCode = 'BIO202'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 4 AND c.courseCode = 'EE201'
CREATE (i)-[:TEACHES]->(c);

MATCH (i:Instructor), (c:Course)
WHERE i.instructorID = 5 AND c.courseCode = 'PSY101'
CREATE (i)-[:TEACHES]->(c);

// Create relationships for course belongs to StudyProgram
MATCH (c:Course), (sp:StudyProgram)
WHERE c.courseCode = 'CS101' AND sp.studyProgramID = 1
CREATE (c)-[:BELONGS_TO]->(sp);

MATCH (c:Course), (sp:StudyProgram)
WHERE c.courseCode = 'EE201' AND sp.studyProgramID = 2
CREATE (c)-[:BELONGS_TO]->(sp);

MATCH (c:Course), (sp:StudyProgram)
WHERE c.courseCode = 'BA301' AND sp.studyProgramID = 3
CREATE (c)-[:BELONGS_TO]->(sp);

MATCH (c:Course), (sp:StudyProgram)
WHERE c.courseCode = 'BIO202' AND sp.studyProgramID = 4
CREATE (c)-[:BELONGS_TO]->(sp);

MATCH (c:Course), (sp:StudyProgram)
WHERE c.courseCode = 'PSY101' AND sp.studyProgramID = 5
CREATE (c)-[:BELONGS_TO]->(sp);

// Create relationships for student studies under StudyProgram
MATCH (s:Student), (sp:StudyProgram)
WHERE s.studentID = 1 AND sp.studyProgramID = 1
CREATE (s)-[:STUDIES_UNDER]->(sp);

MATCH (s:Student), (sp:StudyProgram)
WHERE s.studentID = 2 AND sp.studyProgramID = 2
CREATE (s)-[:STUDIES_UNDER]->(sp);

MATCH (s:Student), (sp:StudyProgram)
WHERE s.studentID = 3 AND sp.studyProgramID = 3
CREATE (s)-[:STUDIES_UNDER]->(sp);

MATCH (s:Student), (sp:StudyProgram)
WHERE s.studentID = 4 AND sp.studyProgramID = 4
CREATE (s)-[:STUDIES_UNDER]->(sp);

MATCH (s:Student), (sp:StudyProgram)
WHERE s.studentID = 5 AND sp.studyProgramID = 5
CREATE (s)-[:STUDIES_UNDER]->(sp);

// Create relationships for student takes course
MATCH (s:Student), (c:Course)
WHERE s.studentID = 1 AND c.courseCode = 'CS101'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 1 AND c.courseCode = 'EE201'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 2 AND c.courseCode = 'EE201'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 2 AND c.courseCode = 'CS101'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 2 AND c.courseCode = 'BIO202'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 3 AND c.courseCode = 'BIO202'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 3 AND c.courseCode = 'PSY101'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 4 AND c.courseCode = 'BIO202'
CREATE (s)-[:TAKES]->(c);

MATCH (s:Student), (c:Course)
WHERE s.studentID = 5 AND c.courseCode = 'PSY101'
CREATE (s)-[:TAKES]->(c);

// Create instructors
CREATE (:Instructor {instructorID: 1, firstName: 'Robert', lastName: 'Johnson', dateOfBirth: date('1970-05-20'), email: 'robert.johnson@example.com', educationalLevel: 'Ph.D.'}),
       (:Instructor {instructorID: 2, firstName: 'Alice', lastName: 'Smith', dateOfBirth: date('1982-08-15'), email: 'alice.smith@example.com', educationalLevel: 'M.Sc.'}),
       (:Instructor {instructorID: 3, firstName: 'David', lastName: 'Williams', dateOfBirth: date('1975-03-10'), email: 'david.williams@example.com', educationalLevel: 'Ph.D.'}),
       (:Instructor {instructorID: 4, firstName: 'Emily', lastName: 'Davis', dateOfBirth: date('1980-11-28'), email: 'emily.davis@example.com', educationalLevel: 'M.Sc.'}),
       (:Instructor {instructorID: 5, firstName: 'John', lastName: 'Miller', dateOfBirth: date('1978-02-15'), email: 'john.miller@example.com', educationalLevel: 'Ph.D.'});

// Create courses
CREATE (:Course {courseCode: 'CS101', name: 'Introduction to Computer Science', creditHour: 3, description: 'Fundamentals of computer science'}),
       (:Course {courseCode: 'EE201', name: 'Circuit Analysis', creditHour: 4, description: 'Basic principles of electrical circuits'}),
       (:Course {courseCode: 'BA301', name: 'Marketing Strategies', creditHour: 3, description: 'Strategic marketing concepts'}),
       (:Course {courseCode: 'BIO202', name: 'Genetics', creditHour: 4, description: 'Study of genetic principles'}),
       (:Course {courseCode: 'PSY101', name: 'Introduction to Psychology', creditHour: 3, description: 'Overview of psychological concepts'});

// Create students
CREATE (:Student {studentID: 1, firstName: 'John', lastName: 'Doe', dateOfBirth: date('1995-03-15'), gender: 'M', email: 'john.doe@example.com'}),
       (:Student {studentID: 2, firstName: 'Jane', lastName: 'Smith', dateOfBirth: date('1997-08-22'), gender: 'F', email: 'jane.smith@example.com'}),
       (:Student {studentID: 3, firstName: 'Michael', lastName: 'Johnson', dateOfBirth: date('1998-05-10'), gender: 'M', email: 'michael.johnson@example.com'}),
       (:Student {studentID: 4, firstName: 'Emily', lastName: 'Williams', dateOfBirth: date('1996-12-03'), gender: 'F', email: 'emily.williams@example.com'}),
       (:Student {studentID: 5, firstName: 'David', lastName: 'Brown', dateOfBirth: date('1999-02-28'), gender: 'M', email: 'david.brown@example.com'});

// Create departments
CREATE (:Department {departmentID: 1, name: 'Computer Science Department'}),
       (:Department {departmentID: 2, name: 'Electrical Engineering Department'}),
       (:Department {departmentID: 3, name: 'Business Administration Department'}),
       (:Department {departmentID: 4, name: 'Biology Department'}),
       (:Department {departmentID: 5, name: 'Psychology Department'});

// Create study programs
CREATE (:StudyProgram {studyProgramID: 1, name: 'Computer Science'}),
       (:StudyProgram {studyProgramID: 2, name: 'Electrical Engineering'}),
       (:StudyProgram {studyProgramID: 3, name: 'Business Administration'}),
       (:StudyProgram {studyProgramID: 4, name: 'Biology'}),
       (:StudyProgram {studyProgramID: 5, name: 'Psychology'});

// Create rooms
CREATE (:Room {roomID: 1, building: 'Building A', capacity: 50}),
       (:Room {roomID: 2, building: 'Building B', capacity: 40}),
       (:Room {roomID: 3, building: 'Building C', capacity: 60}),
       (:Room {roomID: 4, building: 'Building D', capacity: 30}),
       (:Room {roomID: 5, building: 'Building E', capacity: 45});

MATCH (n:Student) RETURN n LIMIT 25;

MATCH (n:Department) RETURN n LIMIT 25;

MATCH (s:Student)-[:TAKES]->(c:Course {name: 'Fundamentals of computer science'})
RETURN s;

MATCH (n:Room) RETURN n LIMIT 25;

MATCH (n:Student) RETURN n LIMIT 25;

MATCH (n:Room) RETURN n LIMIT 25;

MATCH (n:Inst) RETURN n LIMIT 25;

MATCH (n:Department) RETURN n LIMIT 25;

MATCH (n:Course) RETURN n LIMIT 25;

match (x) return x;

// Create departments
CREATE (:Department {departmentID: 1, name: 'Computer Science Department'}),
       (:Department {departmentID: 2, name: 'Electrical Engineering Department'}),
       (:Department {departmentID: 3, name: 'Business Administration Department'}),
       (:Department {departmentID: 4, name: 'Biology Department'}),
       (:Department {departmentID: 5, name: 'Psychology Department'});

MATCH (n:Course) RETURN n LIMIT 25;

match (n) return n;

MATCH (i:Instructor), (d:Department)
WHERE i.instructorID = 1 AND d.departmentID = 1
CREATE (i)-[:BELONGS_TO]->(d);

MATCH (n:Student) RETURN n LIMIT 25;

MATCH (n:Course) RETURN n LIMIT 25;

MATCH (n:Inst) RETURN n LIMIT 25;

MATCH (n:Inst) RETURN n LIMIT 25;
