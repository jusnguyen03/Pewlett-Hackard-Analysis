SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        titles.title,
		titles.from_date,
		s.salary
		
INTO number_retiring
FROM employees AS e
    INNER JOIN titles
        ON (e.emp_no = titles.emp_no)
    INNER JOIN salaries AS s
        ON (e.emp_no = s.emp_no)