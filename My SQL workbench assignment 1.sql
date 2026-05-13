CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName TEXT
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name TEXT,
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName TEXT,
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biology'),
(5, 'Chemistry');

INSERT INTO Students (StudentID, Name, Age, DepartmentID) VALUES
(1, 'Alice Johnson', 20, 1),
(2, 'Bob Smith', 22, 1),
(3, 'Charlie Brown', 21, 2),
(4, 'David Wilson', 19, 3),
(5, 'Eve Davis', 23, 4),
(6, 'Frank Miller', 20, 5);

INSERT INTO Courses (CourseID, CourseName, StudentID) VALUES
(1, 'Artificial Intelligence', 1),
(2, 'Data Structures', 1),
(3, 'Data Science', 1),
(4, 'Artificial Intelligence', 2),
(5, 'Data Mining', 2),
(6, 'Calculus', 3),
(7, 'Linear Algebra', 3),
(8, 'Quantum Physics', 4),
(9, 'Biology 101', 5),
(10, 'Chemistry Lab', 6);
SELECT s.StudentID, s.Name, s.Age, d.DepartmentName 
FROM Students s 
JOIN Departments d ON s.DepartmentID = d.DepartmentID;
SELECT s.Name 
FROM Students s 
JOIN Courses c ON s.StudentID = c.StudentID 
WHERE c.CourseName = 'Artificial Intelligence';
SELECT d.DepartmentName, COUNT(s.StudentID) as StudentCount 
FROM Departments d 
LEFT JOIN Students s ON d.DepartmentID = s.DepartmentID 
GROUP BY d.DepartmentID;
SELECT c.CourseName 
FROM Courses c 
JOIN Students s ON c.StudentID = s.StudentID 
WHERE s.Name = 'Alice Johnson';
SELECT s.Name 
FROM Students s 
JOIN Courses c ON s.StudentID = c.StudentID 
GROUP BY s.StudentID 
HAVING COUNT(c.CourseID) > 1;
SELECT d.DepartmentName, AVG(s.Age) as AverageAge 
FROM Departments d 
JOIN Students s ON d.DepartmentID = s.DepartmentID 
GROUP BY d.DepartmentID;
SELECT d.DepartmentName, COUNT(s.StudentID) as StudentCount 
FROM Departments d 
JOIN Students s ON d.DepartmentID = s.DepartmentID 
GROUP BY d.DepartmentID 
ORDER BY StudentCount DESC 
LIMIT 1;
SELECT s.Name 
FROM Students s 
LEFT JOIN Courses c ON s.StudentID = c.StudentID 
WHERE c.CourseID IS NULL;
SELECT s.Name, COUNT(c.CourseID) as CourseCount 
FROM Students s 
LEFT JOIN Courses c ON s.StudentID = c.StudentID 
GROUP BY s.StudentID;
SELECT s.Name 
FROM Students s 
JOIN Departments d ON s.DepartmentID = d.DepartmentID 
JOIN Courses c ON s.StudentID = c.StudentID 
WHERE d.DepartmentName = 'Computer Science' AND c.CourseName LIKE '%Data%';