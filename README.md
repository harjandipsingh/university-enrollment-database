# University Enrollment Database — SQL

A fully normalized relational database designed and implemented in SQL Server, modeling a university's student enrollment system across 8 interconnected tables.

## Project Overview
This project involved designing a relational database from scratch to manage university data — students, professors, departments, courses, sections, majors, prerequisites, and enrollment records. The goal was to build a system that accurately reflects how a real university manages academic data, with proper constraints enforcing data integrity throughout.

## Database Schema
| Table | Description |
|-------|-------------|
| `Students` | Student records including contact info and academic level |
| `Professor` | Faculty records linked to departments |
| `Department` | Academic departments and their chairs |
| `Major` | Available majors with STEM classification |
| `StudentMajor` | Junction table linking students to their declared majors |
| `Course` | Course catalog with credit hours |
| `CourseSection` | Specific sections with capacity, enrollment, and room assignments |
| `Prerequisite` | Course prerequisite relationships |
| `Enrollment` | Student course enrollment records with grades |

## SQL Concepts Demonstrated
- Database and table creation with appropriate data types
- Primary keys and foreign keys enforcing referential integrity across all 8 tables
- Composite primary keys on junction and section tables
- INSERT statements populating all tables with realistic data
- JOIN queries across multiple tables to retrieve related records
- LEFT JOIN to identify students with no declared major
- GROUP BY and COUNT for enrollment counts by major
- AVG and ROUND with CAST for GPA calculation
- Filtered WHERE queries for state, grade thresholds, and student IDs

## Query Highlights
```sql
-- Calculate each student's GPA
SELECT S.FirstName, S.LastName,
       ROUND(CAST(AVG(CourseGrade) AS DECIMAL(3,2)), 2) AS [Student GPA]
FROM Enrollment E
LEFT JOIN Students S ON E.StudentID = S.StudentID
GROUP BY S.FirstName, S.LastName;

-- Find students who have not declared any major
SELECT S.StudentID
FROM Students S
LEFT JOIN StudentMajor SM ON S.StudentID = SM.StudentID
WHERE SM.MajorID IS NULL;

-- Count enrollment by major
SELECT M.MajorName, COUNT(StudentID) AS [Number of Students]
FROM StudentMajor SM
LEFT JOIN Major M ON SM.MajorID = M.MajorID
GROUP BY M.MajorName;
```

## Tools Used
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL (Transact-SQL)

## How to Run
1. Open **SQL Server Management Studio** and connect to your instance
2. Download `university_enrollment_database.sql` from this repository
3. Open the file in SSMS and run in sections:
   - First block: creates the database and all 8 tables
   - Second block: inserts sample data into all tables
   - Third block: runs the analytical query exercises

## Context
Completed as part of **MIS 310** at George Mason University. Focus was on relational database design — normalization, referential integrity, and writing queries that answer real administrative questions.

## Author
**Harjandip Singh**
MIS Student — George Mason University
[LinkedIn](https://www.linkedin.com/in/harjandip-singh)
