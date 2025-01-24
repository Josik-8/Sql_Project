-- 1. Create Database 
CREATE DATABASE StudentManagement; 
USE StudentManagement; -- 2. Create Tables -- Students Table 
CREATE TABLE Students ( 
StudentID INT PRIMARY KEY AUTO_INCREMENT, 
Name VARCHAR(100), 
Age INT, 
Gender VARCHAR(10), 
ContactNumber VARCHAR(15), 
Email VARCHAR(100), 
Address TEXT 
); 

-- Courses Table 
CREATE TABLE Courses ( 
CourseID INT PRIMARY KEY AUTO_INCREMENT, 
CourseName VARCHAR(100), 
Credits INT, 
Department VARCHAR(50) 
); 

-- Enrollments Table 
CREATE TABLE Enrollments ( 
EnrollmentID INT PRIMARY KEY AUTO_INCREMENT, 
StudentID INT, 
CourseID INT, 
EnrollmentDate DATE, 
Grade VARCHAR(2), 
FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
-- Teachers Table 
CREATE TABLE Teachers ( 
TeacherID INT PRIMARY KEY AUTO_INCREMENT, 
Name VARCHAR(100), 
Department VARCHAR(50), 
ContactNumber VARCHAR(15), 
Email VARCHAR(100) 
); 
-- Assignments Table 
CREATE TABLE Assignments ( 
AssignmentID INT PRIMARY KEY AUTO_INCREMENT, 
CourseID INT, 
Title VARCHAR(200), 
DueDate DATE, 
MaxMarks INT, 
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
-- 3. Insert Sample Data 
-- Insert Students 
INSERT INTO Students (Name, Age, Gender, ContactNumber, Email, Address) VALUES 
('Alice Johnson', 20, 'Female', '1234567890', 'alice.johnson@example.com', '123 Elm Street'), 
('Bob Smith', 22, 'Male', '9876543210', 'bob.smith@example.com', '456 Oak Avenue'), 
('Catherine Brown', 19, 'Female', '5556667777', 'catherine.brown@example.com', '789 Pine Road'), 
('David Lee', 21, 'Male', '4443332222', 'david.lee@example.com', '101 Maple Drive'), 
('Eva Clark', 23, 'Female', '3332221111', 'eva.clark@example.com', '202 Cedar Lane'), 
('Frank Miller', 20, 'Male', '2221113333', 'frank.miller@example.com', '303 Spruce Boulevard'), 
('Grace Adams', 24, 'Female', '1113332222', 'grace.adams@example.com', '404 Birch Street'), 
('Hannah Wilson', 21, 'Female', '7778889999', 'hannah.wilson@example.com', '505 Aspen Court'), 
('Ian Thomas', 22, 'Male', '8887776666', 'ian.thomas@example.com', '606 Willow Circle'), 
('Julia Roberts', 23, 'Female', '9996665555', 'julia.roberts@example.com', '707 Poplar Lane'), 
('Kevin Turner', 20, 'Male', '1231231234', 'kevin.turner@example.com', '808 Elm Street'), 
('Laura Scott', 21, 'Female', '2342342345', 'laura.scott@example.com', '909 Oak Avenue'), 
('Mike Brown', 19, 'Male', '3453453456', 'mike.brown@example.com', '101 Pine Road'), 
('Nancy White', 22, 'Female', '4564564567', 'nancy.white@example.com', '202 Maple Drive'), 
('Oscar Green', 21, 'Male', '5675675678', 'oscar.green@example.com', '303 Cedar Lane'), 
('Patricia Hall', 23, 'Female', '6786786789', 'patricia.hall@example.com', '404 Birch Street'), 
('Quinn Lewis', 20, 'Male', '7897897890', 'quinn.lewis@example.com', '505 Aspen Court'), 
('Rachel Harris', 22, 'Female', '8908908901', 'rachel.harris@example.com', '606 Willow Circle'), 
('Steven Young', 23, 'Male', '9019019012', 'steven.young@example.com', '707 Poplar Lane'), 
('Tina Walker', 24, 'Female', '0120120123', 'tina.walker@example.com', '808 Elm Street');

 -- Insert Courses 
INSERT INTO Courses (CourseName, Credits, Department) VALUES 
('Mathematics', 4, 'Science'), 
('Physics', 3, 'Science'), 
('Chemistry', 4, 'Science'), 
('English Literature', 3, 'Arts'), 
('History', 3, 'Arts'), 
('Computer Science', 5, 'Engineering'), 
('Electrical Engineering', 4, 'Engineering'), 
('Civil Engineering', 4, 'Engineering'), 
('Psychology', 3, 'Arts'), 
('Economics', 3, 'Commerce'), 
('Data Science', 4, 'Engineering'), 
('Biology', 4, 'Science'), 
('Statistics', 3, 'Commerce'), 
('Philosophy', 3, 'Arts'), 
('Robotics', 5, 'Engineering'); 

-- Insert Teachers 
INSERT INTO Teachers (Name, Department, ContactNumber, Email) VALUES 
('Dr. Alice Cooper', 'Science', '1239874560', 'alice.cooper@example.com'), 
('Dr. Bob Dylan', 'Arts', '7896541230', 'bob.dylan@example.com'), 
('Dr. Catherine Fisher', 'Engineering', '4561237890', 'catherine.fisher@example.com'), 
('Dr. David Harris', 'Commerce', '7893216540', 'david.harris@example.com'), 
('Dr. Eva Martinez', 'Psychology', '6549873210', 'eva.martinez@example.com'); 

-- Insert Enrollments 
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES 
(1, 1, '2024-01-10', 'A'), 
(2, 2, '2024-01-11', 'B'), 
(3, 3, '2024-01-12', 'A'), 
(4, 4, '2024-01-13', 'C'), 
(5, 5, '2024-01-14', 'B'), 
(6, 6, '2024-01-15', 'A'), 
(7, 7, '2024-01-16', 'B'), 
(8, 8, '2024-01-17', 'A'), 
(9, 9, '2024-01-18', 'C'), 
(10, 10, '2024-01-19', 'B'); 

-- Insert Assignments 
INSERT INTO Assignments (CourseID, Title, DueDate, MaxMarks) VALUES 
(1, 'Algebra Assignment', '2024-02-10', 100), 
(2, 'Physics Lab Report', '2024-02-15', 50), 
(3, 'Organic Chemistry Essay', '2024-02-20', 70), 
(4, 'Shakespeare Analysis', '2024-02-25', 30), 
(5, 'History Timeline Project', '2024-03-01', 40);

 -- 4. Example Queries
 
 -- Query 1: List all students. 
SELECT * FROM Students;

 -- Query 2: List all courses in the 'Science' department. 
SELECT * FROM Courses WHERE Department = 'Science';

 -- Query 3: Find the students enrolled in 'Mathematics'. 
SELECT s.Name AS StudentName, e.EnrollmentDate 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
WHERE c.CourseName = 'Mathematics'; 

-- Query 4: Count the total number of students. 
SELECT COUNT(*) AS TotalStudents FROM Students; 

-- Query 5: Find the average age of students. 
SELECT AVG(Age) AS AverageAge FROM Students;

-- Query 6: List all students with grades 'A' in any course. 
SELECT s.Name, c.CourseName, e.Grade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
WHERE e.Grade = 'A';

 
-- Query 7: Find the courses with more than 3 credits. 
SELECT * FROM Courses WHERE Credits > 3;

 -- Query 8: Retrieve the details of all assignments for the course 'Computer Science'. 
SELECT a.Title, a.DueDate, a.MaxMarks 
FROM Assignments a 
JOIN Courses c ON a.CourseID = c.CourseID 
WHERE c.CourseName = 'Computer Science';

 -- Query 9: Find the names of students and their enrolled courses. 
SELECT s.Name AS StudentName, c.CourseName 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID; 

-- Query 10: List all teachers and their departments. 
SELECT * FROM Teachers;

 -- Query 11: Find the students who live in 'Elm Street'. 
SELECT Name FROM Students WHERE Address LIKE '%Elm Street%';

 -- Query 12: Count the number of students enrolled in each course. 
SELECT c.CourseName, COUNT(e.StudentID) AS TotalEnrolled 
FROM Courses c 
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID 
GROUP BY c.CourseID;

 -- Query 13: Find courses with no students enrolled. 
SELECT c.CourseName 
FROM Courses c 
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID 
WHERE e.EnrollmentID IS NULL;
 
-- Query 14: Find the teacher responsible for the most assignments (assuming each course has one  teacher). 
SELECT t.Name AS TeacherName, COUNT(a.AssignmentID) AS TotalAssignments 
FROM Teachers t 
JOIN Courses c ON t.Department = c.Department 
JOIN Assignments a ON c.CourseID = a.CourseID 
GROUP BY t.TeacherID 
ORDER BY TotalAssignments DESC 
LIMIT 1;

 -- Query 15: List the names and grades of students enrolled in 'Data Science'. 
SELECT s.Name, e.Grade 
FROM Students s 
JOIN Enrollments e ON s.StudentID = e.StudentID 
JOIN Courses c ON e.CourseID = c.CourseID 
WHERE c.CourseName = 'Data Science'; 