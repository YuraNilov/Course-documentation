-- CREATE TABLE (№1):

CREATE TABLE Student
(
StudentID INTEGER PRIMARY KEY,
FirstName VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL,
Country VARCHAR(255) NOT NULL,
DateOfBirth DATETIME NULL
);

-- INSERT INTO (№1):

INSERT INTO Student
(FirstName, LastName, Country, DateOfBirth)
VALUES
('Ivan', 'Ivanov', 'RU', '1990-11-06'),
('Aleksandr', 'Aleksandrov', 'RU', '1985-05-06'),
('Olga', 'Gusko', 'UA', '1992-10-18'),
('Roma', 'Zaycev', 'UA', '1990-11-08'),
('Ivan', 'Lomov', 'RU', '1992-03-08');

-- CREATE TABLE (№2):

CREATE TABLE Classrooms
(
ClassroomID INTEGER PRIMARY KEY,
ClassName VARCHAR(255) NOT NULL,
StudentEnrolled INTEGER NOT NULL
);

-- INSERT INTO (№2):

INSERT INTO Classrooms
(ClassName, StudentEnrolled)
VALUES
('Java', '5'),
('SQL', '5'),
('Postman', '5'),
('Mobile', '5'),
('Theory', '5');

-- CREATE TABLE (№3)=(№1+№2):

CREATE TABLE EnrollmentDate
(
EnrollmentDateID INTEGER PRIMARY KEY,
StudentID INTEGER NOT NULL,
ClassroomID INTEGER NOT NULL,
Grade DECIMAL INTEGER NOT NULL,
FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
FOREIGN KEY (ClassroomID) REFERENCES Classrooms (ClassroomID)
);

-- INSERT INTO (№3):

INSERT INTO EnrollmentDate
(StudentID,	ClassroomID, Grade)
VALUES
('1', '1', '10'),
('1', '2', '8'),
('1', '3', '9'),
('1', '4', '10'),
('1', '5', '7'),
('2', '1', '8'),
('2', '2', '9'),
('2', '3', '7'),
('2', '4', '9'),
('2', '5', '10'),
('3', '1', '9'),
('3', '2', '8'),
('3', '3', '10'),
('3', '4', '8'),
('3', '5', '9'),
('4', '1', '9'),
('4', '2', '10'),
('4', '3', '8'),
('4', '4', '8'),
('4', '5', '9'),
('5', '1', '8'),
('5', '2', '10'),
('5', '3', '7'),
('5', '4', '9'),
('5', '5', '10');

-- SELECT:

SELECT * FROM Student;

SELECT *
FROM Student;

SELECT FirstName, LastName
FROM Student;

-- WHERE:

SELECT *
FROM Student
WHERE FirstName='Ivan';

-- WHERE+IN:

SELECT *
FROM Student
WHERE LastName IN ('Ivanov', 'Zaycev');

-- WHERE+AND:

SELECT *
FROM Student
WHERE FirstName='Ivan'
AND LastName='Ivanov';

-- WHERE+OR:

SELECT *
FROM Student
WHERE FirstName='Ivan'
OR LastName='Zaycev';

-- WHERE+NOT:

SELECT *
FROM Student
WHERE NOT FirstName='Ivan';

SELECT *
FROM Student
WHERE FirstName NOT IN ('Ivan', 'Roma');

-- WHERE+LIKE%:

SELECT *
FROM Student
WHERE LastName LIKE 'I%';

-- WHERE+COUNT:

SELECT COUNT (*)
AS TotalStudents
FROM Student;

-- Математические действия:

SELECT SUM(Grade) / COUNT (Grade)
AS AverageGrade
FROM EnrollmentDate
WHERE StudentID=1;

-- LIMIT:

SELECT *
FROM Student
ORDER BY StudentID
LIMIT 3;

SELECT *
FROM Student
ORDER BY StudentID DESC
LIMIT 3;

-- GROUP:

SELECT Country, COUNT(Country)
FROM Student
GROUP BY Country;

SELECT FirstName, COUNT(FirstName)
FROM Student
GROUP BY FirstName;

-- JOIN (INNER JOIN):

SELECT *
FROM Student
JOIN EnrollmentDate
ON Student.StudentID = EnrollmentDate.StudentID;

SELECT *
FROM Student s
JOIN EnrollmentDate e
ON s.StudentID = e.StudentID;

-- JOIN (3 таблицы):

SELECT
Student.FirstName, Student.LastName,
Classrooms.ClassName,
EnrollmentDate.Grade
FROM Student
JOIN EnrollmentDate
ON Student.StudentID = EnrollmentDate.StudentID
JOIN Classrooms
ON EnrollmentDate.ClassroomID = Classrooms.ClassroomID;

SELECT
s.FirstName, s.LastName,
c.ClassName,
e.Grade
FROM Student s
JOIN EnrollmentDate e
ON s.StudentID = e.StudentID
JOIN Classrooms c
ON e.ClassroomID = c.ClassroomID;

-- UPDATE:

UPDATE Student
SET LastName = 'Petrova'
WHERE FirstName = 'Olga';

-- DELETE:

DELETE
FROM Student
WHERE FirstName = 'Anastasya'
AND LastName = 'Burceva';
