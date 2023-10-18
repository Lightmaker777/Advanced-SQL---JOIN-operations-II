### Task 1
<pre>mentors_db=# SELECT
  student.name AS student,
  mentor.name AS mentor,
  local_mentor.name AS local_mentor
FROM student
LEFT JOIN mentor AS mentor ON student.mentor_id = mentor.id
LEFT JOIN mentor AS local_mentor ON student.local_mentor = local_mentor.id
ORDER BY student.name;
      student       |      mentor      |  local_mentor   
--------------------+------------------+-----------------
 Aimaar Abdul       | Peter Smith      | Laura Wild
 Alex Anjou         | Julius Maxim     | Fabienne Martin
 Christian Blanc    | Melinda O&apos;Connor | Fabienne Martin
 Dolores Perez      | Laura Wild       | Julia Vila
 Emilio Ramiro      |                  | Julia Vila
 Gerald Hutticher   | Julia Vila       | Julius Maxim
 Gudrun Schmidt     | Patricia Boulard | Julius Maxim
 Irmgard Seekircher | Fabienne Martin  | Julius Maxim
 Itzi Elizabal      | Melinda O&apos;Connor | Julia Vila
 John Goldwin       | Julia Vila       | Laura Wild
 Maria Highsmith    | Julius Maxim     | Peter Smith
 Wayne Green        |                  | Peter Smith
(12 rows)
</pre>
### Task 2
<pre>mentors_db=# SELECT
  student.name AS student,
  module.name AS topic,
  mentor.name AS mentor
FROM student
LEFT JOIN mentor ON student.mentor_id = mentor.id
LEFT JOIN module ON mentor.id = module.teacher
ORDER BY student.name, module.name;
      student       |         topic          |      mentor      
--------------------+------------------------+------------------
 Aimaar Abdul       | Python Algorithms      | Peter Smith
 Alex Anjou         | Advanced SQL           | Julius Maxim
 Christian Blanc    | Computer Basics        | Melinda O&apos;Connor
 Dolores Perez      | Django Basics          | Laura Wild
 Dolores Perez      | Frontend               | Laura Wild
 Dolores Perez      | Python Web Frameworks  | Laura Wild
 Emilio Ramiro      |                        | 
 Gerald Hutticher   | Python Data Structures | Julia Vila
 Gudrun Schmidt     | Python Basics          | Patricia Boulard
 Irmgard Seekircher | SQL                    | Fabienne Martin
 Itzi Elizabal      | Computer Basics        | Melinda O&apos;Connor
 John Goldwin       | Python Data Structures | Julia Vila
 Maria Highsmith    | Advanced SQL           | Julius Maxim
 Wayne Green        |                        | 
(14 rows)
</pre>
## Task 3
<pre>mentors_db=# SELECT
  module.name AS topic,
  mentor.name AS mentor,
  student.name AS student
FROM module
FULL JOIN mentor ON module.teacher = mentor.id
FULL JOIN student ON mentor.id = student.mentor_id
ORDER BY module.name, student.name;
         topic          |      mentor      |      student       
------------------------+------------------+--------------------
 Advanced SQL           | Julius Maxim     | Alex Anjou
 Advanced SQL           | Julius Maxim     | Maria Highsmith
 Computer Basics        | Melinda O&apos;Connor | Christian Blanc
 Computer Basics        | Melinda O&apos;Connor | Itzi Elizabal
 Database Basics        | Ahmed Ali        | 
 Django Admin           | Rose Dupond      | 
 Django Basics          | Laura Wild       | Dolores Perez
 Django ORM             |                  | 
 Frontend               | Laura Wild       | Dolores Perez
 Python Algorithms      | Peter Smith      | Aimaar Abdul
 Python Basics          | Patricia Boulard | Gudrun Schmidt
 Python Data Structures | Julia Vila       | Gerald Hutticher
 Python Data Structures | Julia Vila       | John Goldwin
 Python Web Frameworks  | Laura Wild       | Dolores Perez
 SQL                    | Fabienne Martin  | Irmgard Seekircher
                        |                  | Emilio Ramiro
                        |                  | Wayne Green
(17 rows)
</pre>
## Task 4
<pre>mentors_db=# SELECT
  module.name AS topic,
  mentor.name AS mentor,
  student.name AS student
FROM module
FULL JOIN mentor ON module.teacher = mentor.id
FULL JOIN student ON mentor.id = student.mentor_id
WHERE mentor.city = &apos;Berlin&apos;
OR student.city = &apos;Berlin&apos;
ORDER BY module.name, student.name;
         topic          |      mentor      |      student       
------------------------+------------------+--------------------
 Advanced SQL           | Julius Maxim     | Alex Anjou
 Advanced SQL           | Julius Maxim     | Maria Highsmith
 Computer Basics        | Melinda O&apos;Connor | Christian Blanc
 Computer Basics        | Melinda O&apos;Connor | Itzi Elizabal
 Python Basics          | Patricia Boulard | Gudrun Schmidt
 Python Data Structures | Julia Vila       | Gerald Hutticher
 SQL                    | Fabienne Martin  | Irmgard Seekircher
(7 rows)
</pre>