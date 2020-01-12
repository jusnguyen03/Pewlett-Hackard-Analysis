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
  - challenge.sql (this includes all the coding for the challenge)
  - EmployeeDB.png
  - eligible_number_retiring.csv
  - most_recent_titles.csv
  - Employee Count Frequency.png
  - mentor_info.csv
  - queries.sql (in queries folder)

### ERD
![](https://github.com/jusnguyen03/Pewlett-Hackard-Analysis/blob/master/EmployeeDB.png)

### Number of [titles] Retiring

Based off of the ERD above, I found that using the INNER JOIN - ON with the tables created for employees, titles, and salaries would be the best. I created a new table doing two INNER JOIN - ON statements to combine all 3 tables which included the following columns:
  - Employee number
  - First and last name
  - Title
  - from_date
  - Salary
  
The employees table had the employee numbers, first and last names. To bring in the title and from_date, I saw that the titles table had that information, including the emp_no, which allowed me to join the tables. To bring in the salary, I saw that in the salaries table had the emp_no to join that as well.

I also had to filter out for only employees that were eligible for retirement. Going back from our module exercises, for retirement eligible employees, I used a WHERE BETWEEN AND statements to get only employees with birthday between 01/01/1952 to 01/01/1955 and hire dates between 01/01/1985 to 12/31/1988.

After creating the new table "eligible_number_retiring", I did a SELECT COUNT to find that there are 48,700 employees eligible for retirement. I then exported the table into a csv file "eligible_number_retiring.csv"

### Only the Most Recent Titles

Using the table "eligible_number_retiring.csv", I had to remove duplicate names from the list and then also do a count of how many of each type of employees there were by title. Below is a screenshot of the count tally and the exported table can be found as a csv file "most_recent_titles.csv"

![](https://github.com/jusnguyen03/Pewlett-Hackard-Analysis/blob/master/Employee%20Count%20Frequency.png)

### Who's Ready for a Mentor?

There are 1549 employees that could potentially be ready for a mentor. I was able to determine this by creating a new table that included
  - Employee number
  - First and last name
  - Title
  - from_date and to_date

Based off of the ERD, I found that joining the employees and titles tables would be the best. Then I used a WHERE statement to filter for only employees born in 1965 and then used an AND statement within the WHERE statement for to_date to be 1/1/9999, since this would be all still current employees. After I used a SELECT COUNT statement to count the number of emp_no in the new table we created to find how many people are ready for mentors. The csv file "mentor_info.csv" was exported and can found in the repository.


