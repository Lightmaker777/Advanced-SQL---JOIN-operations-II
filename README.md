# Advanced SQL - JOIN operations

## Description

In this exercise, we will practice intermediate joining operations of more than two tables.

## Data

This exercise uses data from the previous unit (Advanced SQL - Join I). You can use your own data from that exercise or you can create a new database and load the [initial content](src/data/initial.sql).

The initial content for this exercise includes:

- Table **mentor**
  - Field **id**: `integer`, `PRIMARY KEY`
  - Field **name**: `varchar(25)`
  - Field **city**: `varchar(25)`

- Table **student**
  - Field **id**: `integer`, `PRIMARY KEY`
  - Field **name**: `varchar(25)`
  - Field **city**: `varchar(25)`
  - Field **mentor_id**: `integer`, `FOREIGN KEY(mentor.id)`
  - Field **local_mentor**: `integer`, `FOREIGN KEY(mentor.id)`

`mentor_id` refers to the mentor initially assigned to the student and `local_mentor` refers to the ideal mentor in terms of proximity (lives in the same city as the student).

##

## Tasks

###

### Task 1

Produce a list showing at the same time the name of the student, the name of the mentor and the name of the local mentor.

> Hint: Both `mentor_id` and `local_mentor` are foreign keys to the same table, so you will have to join the same table twice and use an alias for one of them.
>
> If the student has no `mentor_id` or no `local_mentor`, it should appear in the list with `null` values.

- Your result should look like this:

| Student            | Mentor           | Local mentor    |
|--------------------|------------------|-----------------|
| Aimaar Abdul       | Peter Smith      | Laura Wild      |
| Alex Anjou         | Julius Maxim     | Fabienne Martin |
| Christian Blanc    | Melinda O'Connor | Fabienne Martin |
| Dolores Perez      | Laura Wild       | Julia Vila      |
| Emilio Ramiro      |                  | Julia Vila      |
| Gerald Hutticher   | Julia Vila       | Julius Maxim    |
| Gudrun Schmidt     | Patricia Boulard | Julius Maxim    |
| Irmgard Seekircher | Fabienne Martin  | Julius Maxim    |
| Itzi Elizabal      | Melinda O'Connor | Julia Vila      |
| John Goldwin       | Julia Vila       | Laura Wild      |
| Maria Highsmith    | Julius Maxim     | Peter Smith     |
| Wayne Green        |                  | Peter Smith     |

###

### Task 2

Execute the file [src/data/task2.sql](src/data/task2.sql) to add new contents to our data set. This will create a new table called `module` with the following fields:

- **id**: `serial`, `PRIMARY KEY`.
- **name**: a `varchar` of length 100.
- **teacher**: `integer`, a foreign key to the `mentor` table indicating the person responsible for this module.

With this new table, now produce a list of students with all the topics available to them through their `mentor_id`. Use the following fields:

1. **Student**. The name of the student.
1. **Topic**. The name of the module the student's mentor is a teacher of.
1. **Mentor**. The name of the student's mentor.

> If the student does not have any mentor then s/he does not have any topic available and should appear in the list with no topic (with `null` in the `Topic` field).
>
> If a mentor has more than one module assigned to them, then the student has more than one topic available and will appear repeated in the list.
>
> Join the tables using the `mentor_id` foreign key.

- Your result should be **sorted by student's name** first, and then **by module's name** and should look like this:

| Student            | Topic                  | Mentor           |
|--------------------|------------------------|------------------|
| Aimaar Abdul       | Python Algorithms      | Peter Smith      |
| Alex Anjou         | Advanced SQL           | Julius Maxim     |
| Christian Blanc    | Computer Basics        | Melinda O'Connor |
| Dolores Perez      | Django Basics          | Laura Wild       |
| Dolores Perez      | Frontend               | Laura Wild       |
| Dolores Perez      | Python Web Frameworks  | Laura Wild       |
| Emilio Ramiro      |                        |                  |
| Gerald Hutticher   | Python Data Structures | Julia Vila       |
| Gudrun Schmidt     | Python Basics          | Patricia Boulard |
| Irmgard Seekircher | SQL                    | Fabienne Martin  |
| Itzi Elizabal      | Computer Basics        | Melinda O'Connor |
| John Goldwin       | Python Data Structures | Julia Vila       |
| Maria Highsmith    | Advanced SQL           | Julius Maxim     |
| Wayne Green        |                        |                  |


###

### Task 3

Now produce another version of this list, but this time sorted by topic where we can see, for each topic, which students are learning about them.

- The first column must be the topic, then the mentor and finally the student.
- There should be no `null` value on the column **Topic**.
- Instead, modules that have no teacher or have one but they are not mentors should appear on the list (with `null` values on the fields with missing data).
- It should be sorted by module's name first and then by student's name.

> Hint: try different types of JOINs.

- The result should look like this:

| Topic                  | Mentor           | Student            |
|------------------------|------------------|--------------------|
| Advanced SQL           | Julius Maxim     | Alex Anjou         |
| Advanced SQL           | Julius Maxim     | Maria Highsmith    |
| Computer Basics        | Melinda O'Connor | Christian Blanc    |
| Computer Basics        | Melinda O'Connor | Itzi Elizabal      |
| Database Basics        | Ahmed Ali        |                    |
| Django Admin           | Rose Dupond      |                    |
| Django Basics          | Laura Wild       | Dolores Perez      |
| Django ORM             |                  |                    |
| Frontend               | Laura Wild       | Dolores Perez      |
| Python Algorithms      | Peter Smith      | Aimaar Abdul       |
| Python Basics          | Patricia Boulard | Gudrun Schmidt     |
| Python Data Structures | Julia Vila       | Gerald Hutticher   |
| Python Data Structures | Julia Vila       | John Goldwin       |
| Python Web Frameworks  | Laura Wild       | Dolores Perez      |
| SQL                    | Fabienne Martin  | Irmgard Seekircher |

###

### Task 4

Produce a subset of the previous list with the topics being taught in Berlin (to students or by mentors living there).

- Your result should look like this:

| Topic                  | Mentor           | Student            |
|------------------------|------------------|--------------------|
| Advanced SQL           | Julius Maxim     | Alex Anjou         |
| Advanced SQL           | Julius Maxim     | Maria Highsmith    |
| Computer Basics        | Melinda O'Connor | Christian Blanc    |
| Computer Basics        | Melinda O'Connor | Itzi Elizabal      |
| Python Basics          | Patricia Boulard | Gudrun Schmidt     |
| Python Data Structures | Julia Vila       | Gerald Hutticher   |
| SQL                    | Fabienne Martin  | Irmgard Seekircher |
