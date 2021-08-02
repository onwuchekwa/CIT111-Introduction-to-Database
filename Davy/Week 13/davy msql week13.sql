USE mydb;

# Query 1: Report shohwing the number of courses in each college.
# College, Courses
SELECT college_name AS college, COUNT(DISTINCT c.course_id) AS course
FROM college col
  JOIN department d
      USING (college_id)
	JOIN course c
       USING (dept_id)
       GROUP BY college_name
       ;
    
     
     # Query 2: Report showing the total number of students each professor can teach (capacity) broken out by term.
     # Name (teacher), Year, Term, Teachingcapacity
       SELECT professor_name AS Name, 
         term_year AS Year, 
         term_season AS term, 
        SUM (capacity) AS Teachingcapacity  
	FROM professor
         JOIN section s 
         USING (professor_id)
          JOIN term t
        USING (term_id)
        GROUP BY professor_name, term_id
          ;
          
         # Query 3: Report showing the actual number of students taught by each professor broken out by term.
		SELECT professor_name AS Name, 
          term_year AS Year, 
          term_season AS term, 
          COUNT(e.student_id) AS Studentcount 
	FROM professor p
         JOIN section s
         USING (professor_id)
         JOIN enrollment e
            USING (section_id)
		JOIN term t
        ON s.term_id = t.term_id 
        GROUP BY professor_name, t.term_id
        ;
        # Query 4: Report showing a list of the professor Bryce will have in winter 2017.
        # Name (teacher)
        SELECT professor_name AS NAME
          FROM professor p
             JOIN section s
                USING (professor_id)
		JOIN enrollment e
			   USING (section_id)
		JOIN student st
              USING (student_id)
              WHERE student_name = 'Bryce'
              ;
        
        # Query 5: Report showing a list of students that take Econometrics in fall 2016.
        SELECT student_name AS NAME
        FROM student s,
        JOIN enrollment e
            USING (student_id)
		JOIN section
             USING (section_id)
		JOIN course
               USING (course_id)
		JOIN term
        USING (term_id)
        WHERE course name = 'econometrics'
          AND term_year = '2016'
          AND term_season = 'fall'
        ;
        
        # Query 6: Repport showing students total credit load by term.
        # Sort by year and Term in ascending order and them credits in detscending order.
        DROP VIEW IF EXISTS student_credits_v;
        
        CREATE VIEW student_credits_v AS
        SELECT student_name AS NAME, #from student table
               term_season AS Term, #from term table
               term_year AS Year, #from term table
               SUM(credits) AS credits #from course table
        FROM student s
             JOIN enrollment 
                USING (student_id)
			JOIN section
                USING (section_id)
		   JOIN term
                USING (term_id)
			JOIN course
                 USING (course_id)
        GROUP BY student_id, term_id
        ORDER BY term_year ASC, term_season ASC, SUM(credits) DESC
        ;
        
        SELECT *
        FROM student_credits_v
        ;
        
        #Query 7: Report showing students total credit load by term but only students with a credit load greater than three.
        # Sort by Year and Term in ascending order and them credits in descending order.
        SELECT *
		FROM student_credits_v
        WHERE credits > 3 
        ;
        
        
        # Query 8: Report showing students and their birthdays of students born in september.
        SELECT student_name AS Name, birthdate AS DOB
        FROM student
        WHERE NORTH(birthdate) = 9
    ;
    
    # Query 9: Report showing students age in years and days as of Jan. 9, 2017
    #Sorted from oldest to youngest. (you can assume a 365 day year and ignore leap day.)
    #Name (student), Years, Days, yearDays
        SELECT student_name AS Name,
             FLOOR(DATEDIFF('2017/01/05', birthdate)/365) AS years,
              DATEDIFF ('2017/01/05', birthdate)%365 AS Days,
              CONCAT(FLOOR(DATEDIFF('2017/01/05', birthdate)/365), '-yrs ',DATEDIFF ('2017/01/05', birthdate)%365, '-Days') AS YearDays
              FROM student
              ORDER BY (DATEDIFF('2017/01/05', birthdate)) DESC
              ;
              ;