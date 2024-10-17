# Problem 1: Get all the names of students in the database
SELECT Name FROM Students;

# Problem 2: Get all the data of students above 30 years old
SELECT * FROM Students WHERE Age > 30;

# Problem 3: Get the names of the females who are 30 years old
SELECT Name FROM Students WHERE Gender='F' AND Age=30;

# Problem 4: Get the number of Points of Alex
SELECT Points FROM Students WHERE Name='Alex';

# Problem 5: Add yourself as a new student
INSERT INTO Students (ID, Name, Age, Gender, Points) 
VALUES (10, 'Milka', 22, 'F', 100);

# Problem 6: Increase the points of Basma because she solved a new exercise
UPDATE Students SET Points = Points + 10 WHERE Name='Basma';

# Problem 7: Decrease the points of Alex because he's late today
UPDATE Students SET Points = Points - 5 WHERE Name='Alex';

# Problem 8: Create the graduates table and copy Layal's data into it
CREATE TABLE graduates (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    Age INTEGER,
    Gender TEXT,
    Points INTEGER,
    Graduation TEXT
);

# Copy Layal's data into the graduates table
INSERT INTO graduates (Name, Age, Gender, Points)
SELECT Name, Age, Gender, Points FROM students WHERE Name = 'Layal';

# Add Layal’s graduation date
UPDATE graduates
SET Graduation = '2018-09-08'
WHERE Name = 'Layal';

# Remove Layal's data from students
DELETE FROM Students WHERE Name = 'Layal';

# Problem 9.1: Produce a table with each employee’s name, company name, and company date
SELECT Employees.Name, Companies.Name AS CompanyName, Companies.Date
FROM Employees
JOIN Companies ON Employees.Company = Companies.Name;

# Problem 9.2: Find the employees who work in companies made before 2000
SELECT Employees.Name 
FROM Employees
JOIN Companies ON Employees.Company = Companies.Name
WHERE Companies.Date < '2000-01-01';

# Problem 9.3: Find the company that has a graphic designer
SELECT Companies.Name 
FROM Employees 
JOIN Companies ON Employees.Company = Companies.Name
WHERE Employees.Role = 'Graphic Designer';

# Problem 9.4: Find the student with the highest number of points
SELECT Name FROM students WHERE Points = (SELECT MAX(Points) FROM students);

# Problem 9.5: Find the average points in the students table
SELECT AVG(Points) FROM students;

# Problem 9.6: Count the number of students with 500 points
SELECT COUNT(Name) FROM students WHERE Points = 500;

# Problem 9.7: Find names of students that contain the letter 's'
SELECT Name FROM students WHERE Name GLOB '*s*';

# Problem 9.8: List all students ordered by points (descending)
SELECT Name FROM students ORDER BY Points DESC;
SELECT Name FROM Students;
1	Alex	21	M	185
2	Basma	25	F	320
3	Hasan	30	M	150
4	Layal	18	F	350
5	Robert	34	M	500
6	Jana	33	F	500
8	Milka	22	Female	100
SELECT * FROM Students WHERE Age > 30;
SELECT Name FROM Students WHERE Gender='F' AND Age=30;
SELECT Points FROM Students WHERE Name='Alex';
200
INSERT INTO Students VALUES(10, 'Milka', '22', 'F', 100);
8	Milka	22	Female	100

UPDATE Students SET Points = 500 WHERE Name='Basma';
300
UPDATE Students SET Points = 100 WHERE Name='Alex';
180
CREATE TABLE graduates(
    ID INTEGER  PRIMARY KEY AUTOINCREMENT,
    Name  TEXT NOT NULL UNIQUE,
    Age INTEGER,
	Gender TEXT,
	Points INTEGER,
	Graduation TEXT
);

INSERT INTO graduates(Name, Age, Gender, Points) SELECT Name, Age, Gender, Points FROM Students WHERE Students.Name='Layal';
UPDATE graduates SET Graduation='08-09-2018' WHERE Name='Layal';
DELETE FROM graduates WHERE Name='Layal';

SELECT employees.name, employees.Company, companies.date FROM employees Inner join companies ON employees.Company=companies.name;
SELECT employees.name FROM employees Inner join companies ON employees.Company=companies.name and companies.Date < 2000;
SELECT companies.name FROM companies Inner join employees ON employees.Company=companies.name and employees.Role='Graphic Designer';

select name from students where points=(SELECT MAX(points) from students);
select AVG(points) from students;
select COUNT(Name) from students where points=500;
select Name from students WHERE Name GLOB '*s*';
select name from students ORDER BY points DESC;
