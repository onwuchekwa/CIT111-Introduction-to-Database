-- ========================================================================
-- CATALOG VIEW
-- ========================================================================
DROP VIEW if exists CatalogView;
CREATE VIEW CatalogView AS
SELECT 
	collegeName AS College,
    departmentName AS Department,
    departmentCode AS DeptCode,
    courseName AS Course,
    courseNumber AS CourseNumber,
    creditHour AS Credits
FROM college c
	JOIN department d
		ON c.collegeId = d.collegeId
	JOIN course co
		ON d.departmentId = co.departmentId;

SELECT * FROM CatalogView;

-- ========================================================================
-- REGISTRATION VIEW
-- ========================================================================
DROP VIEW if exists RegistrationView;
CREATE VIEW RegistrationView AS
SELECT
	termYear AS Year,
    termSemester AS Term,
    departmentCode AS Dept,
    courseName AS Course,
    courseNumber AS CourseNumber,
    sectionNumber AS Section,
    professorName AS Professor,
    capacity AS Capacity,
    creditHour AS Credit
FROM term t
	JOIN section s
		ON t.termId = s.termId
	JOIN course c
		ON s.courseId = c.courseId
	JOIN department d
		ON c.departmentId = d.departmentId
	JOIN professor p
		ON s.professorId = p.professorId
ORDER BY termYear, termSemester, departmentCode, courseNumber, sectionNumber;

SELECT * FROM RegistrationView;

-- ========================================================================
-- STUDENT VIEW
-- ========================================================================
DROP VIEW if exists StudentView;
CREATE VIEW StudentView AS
SELECT
	studentName AS Name,
    gender AS Gender,
    city AS City,
    state AS State,
    dateOfBirth AS DOB
FROM student;

SELECT * FROM StudentView;

-- ========================================================================
-- ENROLLMENT VIEW
-- ========================================================================
DROP VIEW if exists EnrollmentView;
CREATE VIEW EnrollmentView AS
SELECT
	studentName AS Student,
    termYear AS Year,
    termSemester AS Term,
    courseName AS Course,
    courseNumber AS CourseName,
    sectionNumber AS Section,
    professorName AS Professor
FROM student st
	JOIN enrollment e
		ON st.studentId = e.studentId
	JOIN section se
		ON e.sectionId = se.sectionId
	JOIN term t
		ON se.termId = t.termId
	JOIN professor p 
		ON se.professorId = p.professorId
	JOIN course c
		ON se.courseId = c.courseId;

SELECT * FROM EnrollmentView;