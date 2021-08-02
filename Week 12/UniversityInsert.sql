-- ========================================================================
USE university;

SET GLOBAL log_bin_trust_function_creators = 1;
-- ========================================================================
-- ========================================================================
-- INSERT INTO COLLEGE TABLE
-- ========================================================================
INSERT INTO college
VALUES
	(DEFAULT, 'College of Business and Communication'),
    (DEFAULT, 'College of Language and Letters');
    
SELECT * 
FROM college;

-- ========================================================================
-- CREATE FUNCTION TO GET collegeId
-- ========================================================================
DROP FUNCTION IF EXISTS getCollegeId;
DELIMITER //

CREATE FUNCTION getCollegeId
(
	param_college_name VARCHAR(45)
)

RETURNS INT
BEGIN
	DECLARE var_college_id INT;
    SELECT collegeId
    INTO var_college_id
    FROM college
    WHERE collegeName = param_college_name;
    
    RETURN (var_college_id);
END //

-- ========================================================================
-- INSERT INTO DEPARTMENT TABLE
-- ========================================================================
INSERT INTO department
VALUES
	(DEFAULT, 'CIT', 'Computer Information Technology', getCollegeId('College of Business and Communication')),
    (DEFAULT, 'ECON', 'Economics', getCollegeId('College of Business and Communication')),
    (DEFAULT, 'HUM', 'Humanities and Philosophy', getCollegeId('College of Language and Letters'));

SELECT *
FROM department;

-- ========================================================================
-- CREATE FUNCTION TO GET departmentId
-- ========================================================================
DROP FUNCTION IF EXISTS getDepartmentId;
DELIMITER //

CREATE FUNCTION getDepartmentId
(
	param_dept_code VARCHAR(4)
)

RETURNS INT
BEGIN
	DECLARE var_dept_id INT;
	SELECT 
		departmentId
	INTO var_dept_id
	FROM department
    WHERE departmentCode = param_dept_code;
    
    RETURN (var_dept_id);
END //

-- ========================================================================
-- INSERT INTO COURSE TABLE
-- ========================================================================
INSERT INTO course
VALUES
	(DEFAULT, 111, 'Intro to Databases', 3, getDepartmentId('CIT')),
    (DEFAULT, 388, 'Econometrics', 4, getDepartmentId('ECON')),
    (DEFAULT, 150, 'Micro Economics', 3, getDepartmentId('ECON')),
    (DEFAULT, 376, 'The Classical Heritage', 2, getDepartmentId('HUM'));
    
SELECT * 
FROM course;

-- ========================================================================
-- CREATE FUNCTION TO GET courseId
-- ========================================================================
DROP FUNCTION IF EXISTS getCourseId;
DELIMITER //
CREATE FUNCTION getCourseId
(
	param_course_name VARCHAR(45)
)

RETURNS INT
BEGIN
	DECLARE var_course_id INT;
    SELECT courseId
    INTO var_course_id
    FROM course
    WHERE courseName = param_course_name;
    
    RETURN (var_course_id);
END //

-- ========================================================================
-- INSERT INTO TERM TABLE
-- ========================================================================
INSERT INTO term
VALUES
	(DEFAULT, 'Fall', '2016'),
    (DEFAULT, 'Winter', '2017');
    
SELECT * 
FROM term;

-- ========================================================================
-- CREATE FUNCTION TO GET termId
-- ========================================================================
DROP FUNCTION IF EXISTS getTermId;
DELIMITER //
CREATE FUNCTION getTermId
(
	param_term_semester VARCHAR(15),
    param_term_year YEAR(4)
)

RETURNS INT
BEGIN
	DECLARE var_term_id INT;
    SELECT termId
    INTO var_term_id
    FROM term
    WHERE termSemester = param_term_semester
		AND termYear = param_term_year;
    
    RETURN (var_term_id);
END //

-- ========================================================================
-- INSERT INTO PROFESSOR TABLE
-- ========================================================================
INSERT INTO professor
VALUES
	(DEFAULT, 'Morring'),
    (DEFAULT, 'Nate'),
    (DEFAULT, 'Barrus'),
    (DEFAULT, 'Jensen'),
    (DEFAULT, 'Barney');

SELECT * 
FROM professor;

-- ========================================================================
-- CREATE FUNCTION TO GET professorId
-- ========================================================================
DROP FUNCTION IF EXISTS getProfessorId;
DELIMITER //
CREATE FUNCTION getProfessorId
(
	param_professor_id VARCHAR(45)
)

RETURNS INT
BEGIN
	DECLARE var_professor_id INT;
    SELECT professorId
    INTO var_professor_id
    FROM professor
    WHERE professorName = param_professor_id;
    RETURN (var_professor_id);
END //

-- ========================================================================
-- INSERT INTO SECTION TABLE
-- ========================================================================
INSERT INTO section
VALUES
	(DEFAULT, 1, 30, getProfessorId('Morring'), getCourseId('Intro to Databases'), getTermId('Fall', '2016')),
    (DEFAULT, 1, 50, getProfessorId('Nate'), getCourseId('Micro Economics'), getTermId('Fall', '2016')),
    (DEFAULT, 2, 50, getProfessorId('Nate'), getCourseId('Micro Economics'), getTermId('Fall', '2016')),
    (DEFAULT, 1, 35, getProfessorId('Barrus'), getCourseId('Econometrics'), getTermId('Fall', '2016')),
    (DEFAULT, 1, 30, getProfessorId('Jensen'), getCourseId('The Classical Heritage'), getTermId('Fall', '2016')),
    (DEFAULT, 2, 30, getProfessorId('Morring'), getCourseId('Intro to Databases'), getTermId('Winter', '2017')),
    (DEFAULT, 3, 35, getProfessorId('Barney'), getCourseId('Intro to Databases'), getTermId('Winter', '2017')),
    (DEFAULT, 1, 50, getProfessorId('Nate'), getCourseId('Micro Economics'), getTermId('Winter', '2017')),
    (DEFAULT, 2, 50, getProfessorId('Nate'), getCourseId('Micro Economics'), getTermId('Winter', '2017')),
    (DEFAULT, 1, 30, getProfessorId('Jensen'), getCourseId('The Classical Heritage'), getTermId('Winter', '2017'));
    
    SELECT * 
    FROM section

-- ========================================================================
-- CREATE FUNCTION TO GET sectionId
-- ========================================================================
DROP FUNCTION IF EXISTS getSectionId;
DELIMITER //
CREATE FUNCTION getSectionId
(
	param_section_num INT,
    param_course_id INT,
    param_term_id INT
)
RETURNS INT
BEGIN
	DECLARE var_section_id INT;
    SELECT sectionId
    INTO var_section_id
    FROM section
    WHERE sectionNumber = param_section_num
		AND courseId = param_course_id
        AND termId = param_term_id;
        
	RETURN (var_section_id);
END //

-- ========================================================================
-- INSERT INTO STUDENT TABLE
-- ========================================================================
INSERT INTO student
VALUES
	(DEFAULT, 'Paul', 'M', '1996/02/22', 'Dallas', 'TX'),
    (DEFAULT, 'Katie', 'F', '1995/07/22', 'Provo', 'UT'),
    (DEFAULT, 'Kelly', 'F', '1998/06/22', 'Provo', 'UT'),
    (DEFAULT, 'Devon', 'M', '2000/07/22', 'Mesa', 'AZ'),
    (DEFAULT, 'Mandy', 'F', '1996/11/22', 'Tapeka', 'KS'),
    (DEFAULT, 'Alece', 'F', '1997/05/22', 'Rigby', 'ID'),
    (DEFAULT, 'Bryce', 'M', '1997/11/22', 'Bozeman', 'MT'),
    (DEFAULT, 'Preston', 'M', '1996/09/22', 'Decatur', 'TN'),
    (DEFAULT, 'Julia', 'F', '1998/09/22', 'Rexburg', 'ID'),
    (DEFAULT, 'Susan', 'F', '1998/09/08', 'Mesa', 'AZ');
    
SELECT *
From student

-- ========================================================================
-- CREATE FUNCTION TO GET studentId
-- ========================================================================
DROP FUNCTION IF EXISTS getStudentId;
DELIMITER //
CREATE FUNCTION getStudentId
(
	param_student_name VARCHAR(45)
)
RETURNS INT
BEGIN
	DECLARE var_student_id INT;
    SELECT studentId
    INTO var_student_id
    FROM student
    WHERE studentName = param_student_name;
    
    RETURN (var_student_id);
END //

-- ========================================================================
-- INSERT INTO ENROLLMENT TABLE
-- ========================================================================
INSERT INTO enrollment
VALUE
	(DEFAULT, getSectionId(3, getCourseId('Intro to Databases'), getTermId('Winter', '2017')), getStudentId('Alece')),
    (DEFAULT, getSectionId(2, getCourseId('Intro to Databases'), getTermId('Winter', '2017')), getStudentId('Bryce')),
    (DEFAULT, getSectionId(1, getCourseId('Micro Economics'), getTermId('Winter', '2017')), getStudentId('Bryce')),
    (DEFAULT, getSectionId(1, getCourseId('The Classical Heritage'), getTermId('Winter', '2017')), getStudentId('Bryce')),
    (DEFAULT, getSectionId(1, getCourseId('The Classical Heritage'), getTermId('Fall', '2016')), getStudentId('Devon')),
    (DEFAULT, getSectionId(2, getCourseId('Micro Economics'), getTermId('Winter', '2017')), getStudentId('Julia')),
    (DEFAULT, getSectionId(1, getCourseId('Econometrics'), getTermId('Fall', '2016')), getStudentId('Katie')),
    (DEFAULT, getSectionId(1, getCourseId('Econometrics'), getTermId('Fall', '2016')), getStudentId('Kelly')),
    (DEFAULT, getSectionId(1, getCourseId('Econometrics'), getTermId('Fall', '2016')), getStudentId('Mandy')),
    (DEFAULT, getSectionId(1, getCourseId('The Classical Heritage'), getTermId('Fall', '2016')), getStudentId('Mandy')),
    (DEFAULT, getSectionId(1, getCourseId('Intro to Databases'), getTermId('Fall', '2016')), getStudentId('Paul')),
    (DEFAULT, getSectionId(2, getCourseId('Micro Economics'), getTermId('Fall', '2016')), getStudentId('Paul')),
    (DEFAULT, getSectionId(2, getCourseId('Micro Economics'), getTermId('Winter', '2017')), getStudentId('Preston')),
    (DEFAULT, getSectionId(2, getCourseId('Intro to Databases'), getTermId('Winter', '2017')), getStudentId('Susan'));

SELECT *
FROM enrollment;