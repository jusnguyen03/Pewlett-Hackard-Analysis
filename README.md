# Pewlett-Hackard-Analysis

## Project Overview
I will be learning about data modeling, engineering, and analysis. With my knowledge of DataFrames and tabular data, I will be:
  - Designing an entity relationship diagrams (ERDs) that will apply to the data.
  - Create and use a SQL database.
  - Importing and exporting large CSV datasets into pgAdmin.
  - Practice using different joins to create new tables in pgAdmin.
  - Writing basic to intermediate level SQL statements.

## Resources
- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Software: SQL, QuickDBD, pgAdmin 4, PostgresSQL

## Challenge Overview
In this challenge, I will use advanced queries and joins to create a list of candidates for the mentorship program. To create the new list of potential mentors, I will need to create a query that returns a list of current employees eligible for retirement, as well as their most recent titles. To get the final list with the recent titles, I’ll also need to partition the data so that each employee is only included on the list once. In addition, Iu’ll need to perform a query that shows how many current employees of each title are presently eligible for retirement. The final query should return the potential mentor’s employee number, first and last name, their title, birth date and employment dates.

The goals for this challenge are:
  1. Use an ERD to undestand relationships between SQL tables.
  2. Create new tables in pgAdmin by using different joins.
  3. Write basic to intermediate level SQL statements.
  4. Export new tables to a CSV file.

## Challenge Summary
Included in the repository are all of the following that was submitted for this challenge
  - challenge.sql
  - EmployeeDB.png
  - 
  

### ERD
![](https://github.com/jusnguyen03/Pewlett-Hackard-Analysis/blob/master/EmployeeDB.png)

### Number of [titles] Retiring

Based off of the ERD, I found that inner joining the employees, titles, and salaries tables would be the best. I was able to create a new table doing two inner join - on statements to combine all 3 tables which included the following columns:
  - Employee number
  - First and last name
  - Title
  - from_date
  - Salary
The employees table had the employee numbers, first and last names. To bring in the title and from_date, I saw that the titles table had that information, including the emp_no, which allowed me to join the tables. To bring in the salary, I saw that in the salaries table had the emp_no to join that as well.

### Only the Most Recent Titles

![]()

### Who's Ready for a Mentor?

There are 1549 employees that could potentially be ready for a mentor. I was able to determine this by creating a new table that included
  - Employee number
  - First and last name
  - Title
  - from_date and to_date

Based off of the ERD, I found that joining the employees and titles tables would be the best. Then I used a WHERE statement to filter for only employees born in 1965 and then used an AND statement within the WHERE statement for to_date to be 1/1/9999, since this would be all still current employees. After I used a SELECT COUNT statement to count the number of emp_no in the new table we created to find how many people are ready for mentors.


