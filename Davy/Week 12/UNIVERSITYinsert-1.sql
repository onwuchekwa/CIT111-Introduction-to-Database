 USE mydb
 SET GLOBAL log_bin_trust_function_creators = 1;
 
 INSERT INTO college
 VALUES(DEFAULT,'college of business and communication'),
       (DEFAULT,'college of language and letters')
       ;
       # create user defined function
   DROP FUNCTION IF EXISTS get_college_id
   #delimiter changers what the computer looks for at the end of the function
   DELIMITER//
   CREATE FUNCTION get_college_id
   (
        college_name_param VARCHAR(45)
        )
        RETURNS INT
        
	BEGIN
       DECLARE college_id_var INT; 
     
     
     SELECT college_id
     INTO college_id_var
     FROM college
     WHERE college_name= college_name_param;
     
     RETURN (college_id_var);
END//

DELIMITER ;
#insert statement for department
INSERT INTO department
VALUES(DEFAULT,'Computer Information Technology', 'CIT',get_college_id('college of busisness and communication')),
      (DEFAULT, 'Economics','ECON', get_college_id('college of business and communication')),
      (DEFAULT, 'Humanities and philosophy','HUM', get_college_id('college of language and letters'))
      ;
      #create user defined function for department_id
      DROP FUNCTION IF EXISTS get_dept_id;
      DELIMITER//
      CREATE FUNCTION get_dept_id(dept_code_param VARCHAR(5))
        RETURN INT
        
        BEGIN
            DECLARE dept_id_var INT;
            
            SELECT dept_id
            INTO dept_id_var
            FROM department
            WHERE dept_code = dept_code_param;
            
            RETURN (dept_id_var);
            END//
            DELIMITER ;
            
            WHERE*
            FROM college;
            
            SELECT*
            FROM department
            ;
            
            
            #insert statement function for course
            INSERT INTO course
            VALUES(DEFAULT,'Intro to databases',111,3,get_dept_id('CIT')),
                  (DEFAULT,'Micro Economics ',154,3,get_dept_id(ECON),
                  (DEFAULT,' Econometrics ',388,4,get_dept_id(ECON),
                  (DEFAULT,'The Classical Heritage ',376,2,get_dept_id(HUM)
                  ;
                  
            #create user defined function for course_i
            DROP FUNCTION IF EXISTS get_course_id
            DELIMITER//
            CREATE FUNCTION get_course_id
            (
                course_name_param VARCHAR(45)
                )
                RETURNS INT
                
                BEGIN
                    DECLARE course_id_var INT;
                    
			SELECT course_id
                    INTO course_id_var
                    FROM course
                    WHERE course_name = course_name_param
                    
                    RETURN(course_id_var);
             END//
             
             DELIMITER ;
             
             SELECT* 
             FROM course
            
		#insert statement for term
        INSERT INTO term
        VALUES (DEFAULT,'fall',2016),
               (DEFAULT,'winter',2017)
        ;
        
        #create user defined function for term_id
        DROP FUNCTION IF EXISTS get_term_id;
        DELIMITER //
        CREATE FUNCTION get_term_id
        (
           term_year_param YEAR(4),
            term_season_param VARCHAR(45)
            ) 
            RETURNS INT
            
            BEGIN
                DECLARE term_id_var INT;
                
                SELECT term_id
                INTO term_id_var
                FROM term
                WHERE term_season = term_season_param AND term_year = term_year_param
                ;
                   RETURN (tem_id_var);
		END//
        
        DELIMITER ;
        
        SELECT*
        FROM term;
        
        #insert statement for student
        INSERT INTO student
        VALUES(DEFAULT,'Alece','F','Rigby','ID','1997/05/22'),
              (DEFAULT,'Bryce','M','Bozeman','MT','1997/11/22'),
              (DEFAULT,'Devon','M','Mesa','AZ','2000/07/22'),
              (DEFAULT,'Julia','F','Rexburg','ID','1998/09/22'),
              (DEFAULT,'Katie','F','Provo','UT','1995/07/22'),
              (DEFAULT,'Kelly','F','Provo','UT','1998/06/22'),
              (DEFAULT,'Mandy','F','Topeka','KS','1996/11/22'),
              (DEFAULT,'Paul','M','Dallas','TX','1996/02/22'),
              (DEFAULT,'Preston','M','Decatur','TN','1996/09/22'),
              (DEFAULT,'Susan','F','Mesa','AZ','1998/09/08')
              ;
              #create user defined function for student_id
              DROP FUNCTION IF EXISTS get_student_id;
              DELIMITER //
              CREATE FUNCTION get_student_id 
              (
                  student_name_param VARCHAR(45)
                  )
                  RETURNS INT 
                  
                  BEGIN 
                      DECLARE student_id_var INT;
                      
                      
                      SELECT student_id
                      INTO student_id_var
                      FROM student
                      WHERE student_name = student_name_param;
                      
                      RETURN (student_id_var);
				END//
                
                DELIMITER ;
                
                SELECT*
                FROM student
                
                #insert statement for professor
                INSERT INTO professor
                 VALUES(DEFAULT,'Barney'),
                       (DEFAULT,'Morring'),
                       (DEFAULT,'Nate'),
                       (DEFAULT,'Jensen'),
                       (DEFAULT,'Barrus'),
               ;
               
               #create user defined function for professor_id
               DROP FUNCTION IF EXISTS get_professor_id;
               DELIMITER //
               CREATE FUNCTION get_professor_id 
               (
                    professor_name_param VARCHAR(45)
                    )
               RETURNS INT 
               
               BEGIN
                   DECLARE professor_id_var INT;
                   
                   SELECT professor_id
                   INTO professor_id_var
                   FROM professor
                   WHERE professor_name = professor_name_param;
                   
                   RETURN(professor_id_var);
            END//
            
            DELIMITER ;
            
            SELECT*
            FROM professor;
            
            #insert statement for section
            INSERT INTO section
            VALUES(DEFAULT,get_course_id('Intro to Databases'),get_term_id(2016,'fall'),30,get_professor_id('Morring'), 3),
                  (DEFAULT,get_course_id('Intro to Databases',get_term_id(2017,'winter'),30,get_professor_id('Morring'), 2),
                  (DEFAULT,get_course_id('Micro Economics',get_term_id(2016,'fall'),50,get_professor_id('Nate'), 3),
                  (DEFAULT,get_course_id('Micro Economics',),get_term_id(2016,'fall'),50,get_professor_id('Nate'), 2),
                  (DEFAULT,get_course_id('Micro Economics',get_term_id(2017,'winter'),50,get_professor_id('Nate'), 3),
                  (DEFAULT,get_course_id('Micro Economics',get_term_id(2017,'winter'),50,get_professor_id('Nate'), 2),
                  (DEFAULT,get_course_id('Econometrics',Baget_term_id(2016,'fall'),35,get_professor_id('Barrus'), 1),
                  (DEFAULT,get_course_id('The classical Heritage'),get_term_id(2016,'fall'),30,get_professor_id('Jensen'), 1),
                  (DEFAULT,get_course_id('The classical Heritage'),get_term_id(2017,'winter'),30,get_professor_id('Jensen'), 1),
                  (DEFAULT,get_course_id('Intro to Databases'),get_term_id(2017,'winter'),35,get_professor_id('Barney'), 3),
                  ;
                  #create user defined for section_id
                  DROP FUNCTION IF EXISTS get_section_id;
                  DELIMITER //
                  CREATE FUNCTION get_section_id
                  (
                       section_number_param INT,
                       course_id_param INT,
                       term_id_param INT
                       )
                       RETURNS INT 
                       
                       BEGIN
                           DECLARE section_id_var INT;
                           
                           SELECT section_id
                           INTO section_id_var
                           FROM section
                           WHERE section_number = secton_number_param
                           AND course_id = course_id_param
                           AND term_id = term_id_param
                           ;
                           
                           RETURN(section_id_var);
					END//
                    
                    DELIMITER ;
                    
                    SELECT*
                    FROM section;
                    
                    #insert statement for enrollment
                    INSERT INTO enrollment
                    VALUES(DEFAULT,get_student_id('Alece'),get_section_id(3, get_course_id('Intro to Databases'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Bryce'),get_section_id(2, get_course_id('Intro to Databases'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Bryce'),get_section_id(1, get_course_id('Micro Economics'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Bryce'),get_section_id(1, get_course_id('Micro Economics'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Devon'),get_section_id(1, get_course_id('The Classical Heritage'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Julie'),get_section_id(2, get_course_id('Micro Economics'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Katie'),get_section_id(1, get_course_id('Econometrics'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Kellie'),get_section_id(1, get_course_id('Econometrics'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Mandy'),get_section_id(1, get_course_id('Econometrics'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Mandy'),get_section_id(1, get_course_id('The classical Heritage'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Paul'),get_section_id(1, get_course_id('Intro to Databases'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Paul'),get_section_id(2, get_course_id('Micro Economics'), get_term_id(2016,'fall'))),
                    (DEFAULT,get_student_id('Preston'),get_section_id(2, get_course_id('Micro Economics'), get_term_id(2017,'winter'))),
                    (DEFAULT,get_student_id('Susan'),get_section_id(,2 get_course_id('Intro to Databases'), get_term_id(2017,'winter')))
                    ;
                    
                    SELECT* 
                    FROM enrollment;
                  
                   
            
                
                      
              
        
        
        
                
            