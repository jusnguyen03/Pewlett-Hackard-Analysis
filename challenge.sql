-- Number of [titles] Retiring
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        titles.title,
		titles.from_date,
		s.salary
		
INTO eligible_number_retiring
FROM employees AS e
    INNER JOIN titles
        ON (e.emp_no = titles.emp_no)
    INNER JOIN salaries AS s
        ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-01-01')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT COUNT(emp_no)
FROM eligible_number_retiring

-- Only the Most Recent Titles
CREATE TABLE retire_recenttitles as (
	WITH eligible_number_retiring AS
(
	SELECT emp_no, first_name, last_name, title, from_date, salary,
		 ROW_NUMBER() OVER
	(PARTITION BY (emp_no, first_name, last_name) ORDER BY from_date DESC) AS rnum
		  FROM eligible_number_retiring
		  )
SELECT * FROM eligible_number_retiring WHERE rnum = 1);

SELECT COUNT(title), title 
INTO titles_counted
FROM retire_recenttitles
GROUP BY title


-- Who's Ready for a Mentor?
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        titles.title,
		titles.from_date,
		titles.to_date
		
INTO mentor_info
FROM employees AS e
    INNER JOIN titles
        ON (e.emp_no = titles.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
    AND (titles.to_date = '9999-01-01');

SELECT COUNT(emp_no)
FROM mentor_info