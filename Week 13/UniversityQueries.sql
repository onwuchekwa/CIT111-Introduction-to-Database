-- ========================================================================
USE wk13university;
-- ========================================================================
-- ========================================================================
-- Query 1: Report showing the number of courses in each college.
-- ========================================================================
SELECT 
	c.Name AS College,
    COUNT(DISTINCT CourseId) AS Course
FROM college c
	JOIN department d
		ON c.CollegeId = d.CollegeId
	JOIN course cs
		ON d.DepartmentId = cs.DepartmentId
GROUP BY c.Name;

-- =============================================================================================================
-- Query 2: Report showing the total number of students each professor can teach (capacity) broken out by term.
-- =============================================================================================================
SELECT
	p.Name,
    Year,
    Term,
    SUM(Capacity) AS TeachingCapacity
FROM professor p
	JOIN section s
		ON p.ProfessorId = s.ProfessorId
	JOIN term t 
		ON s.TermId = t.TermId
GROUP BY p.Name, Year, Term
ORDER BY p.Name, Year, Term;

-- ===================================================================================================
-- Query 3: Report showing the actual number of students taught by each professor broken out by term.
-- ===================================================================================================
SELECT
	p.Name,
    Year,
    Term,
    COUNT(ss.StudentId) AS StudentCount
FROM professor p
	JOIN section sc
		ON p.ProfessorId = sc.ProfessorId
	JOIN Term t
		ON sc.TermId = t.TermId
	JOIN studentsection ss 
		ON sc.SectionId = ss.SectionId
GROUP BY p.Name, Year, Term
ORDER BY p.Name, Year, Term;

-- =====================================================================================
-- Query 4: Report showing a list of the professors Bryce will have in Winter 2017.
-- =====================================================================================
SELECT p.Name
FROM studentsection ss
	JOIN student st
		ON ss.StudentId = st.StudentId
	JOIN section sc
		ON ss.SectionId = sc.SectionId
	JOIN professor p
		ON sc.ProfessorId = p.ProfessorId
	JOIN Term t
		ON sc.TermId = t.TermId
WHERE st.Name = "Bryce"
	AND Year = '2017'
    AND Term = "Winter";

-- ==================================================================================
-- Query 5: Report showing a list of students that take Econometrics in Fall 2016.
-- ==================================================================================
SELECT st.Name
FROM student st
	JOIN studentsection ss
		ON st.StudentId = ss.StudentId
	JOIN section sc
		ON ss.SectionId = sc.SectionId
	JOIN course c
		ON sc.CourseId = c.CourseId
	JOIN Term t
		ON sc.TermId = t.TermId
WHERE c.Name = "Econometrics"
	AND Year = '2016'
    AND Term = "Fall";

-- ========================================================================
-- Query 6: Report showing students total credit load by term. Sort by Year 
-- and Term in ascending order and then Credits in descending order.
-- ========================================================================
SELECT
	st.Name,
    Term,
    Year,
    SUM(Credit) AS Credits
FROM student st
	JOIN studentsection ss
		ON st.StudentId = ss.StudentId
	JOIN section sc
		ON ss.SectionId = sc.SectionId
	JOIN course c
		ON sc.CourseId = c.CourseId
	JOIN Term t
		ON sc.TermId = t.TermId
GROUP BY st.Name, Term, Year
ORDER BY Year, Term ASC, Credits DESC;

-- ====================================================================================================================
-- Query 7: Report showing students total credit load by term but only students with a credit load greater than three. 
-- Sort by Year and Term in ascending order and then Credits in descending order.
-- ====================================================================================================================
SELECT
	st.Name,
    Term,
    Year,
    SUM(Credit) AS Credits
FROM student st
	JOIN studentsection ss
		ON st.StudentId = ss.StudentId
	JOIN section sc
		ON ss.SectionId = sc.SectionId
	JOIN course c
		ON sc.CourseId = c.CourseId
	JOIN Term t
		ON sc.TermId = t.TermId
GROUP BY st.Name, Term, Year
HAVING Credits > 3
ORDER BY Year, Term ASC, Credits DESC;

-- ====================================================================================
-- Query 8: Report showing students and their birthdays of students born in September.
-- ====================================================================================
SELECT
	Name,
    DOB
FROM student
WHERE MONTH(DOB) = '9';

-- =====================================================================================
-- Query 9: Report showing students age in years and days as of Jan. 5, 2017. 
-- Sorted from oldest to youngest. (You can assume a 365 day year and ignore leap day.)
-- =====================================================================================
SELECT 
	Name,
    FLOOR(DATEDIFF("2017/01/05", DOB) / 365) AS Year,
    DATEDIFF("2017/01/05", DOB) % 365 AS Days,
    CONCAT(FLOOR(DATEDIFF("2017/01/05", DOB) / 365), "-Yrs ", DATEDIFF("2017/01/05", DOB) % 365, "-Days") AS YearDays
FROM student
ORDER BY (DATEDIFF('2017/01/05', DOB)) DESC;