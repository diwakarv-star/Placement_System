CREATE DATABASE IF NOT EXISTS campushire;
USE campushire;

-- Permissions Table
CREATE TABLE IF NOT EXISTS Permissions (
    role_id VARCHAR(10) PRIMARY KEY,
    password INT,
    description TEXT
);

INSERT INTO Permissions VALUES
('R01',123,'Admin: Full access to all features and settings.'),
('R02',223,'Placement Officer: Manage companies, jobs, applications and offers.'),
('R03',333,'Student Coordinator: View students, jobs, applications and leads.');

-- Student Table
CREATE TABLE IF NOT EXISTS Student (
    student_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    branch VARCHAR(50),
    cgpa FLOAT,
    status VARCHAR(30)
);

INSERT INTO Student VALUES
('S001','Aarav Sharma','9876543210','aarav@gmail.com','MBA',8.5,'Active'),
('S002','Priya Nair','9876543211','priya@gmail.com','MBA',7.8,'Active'),
('S003','Rohan Mehta','9876543212','rohan@gmail.com','MBA',6.9,'Active'),
('S004','Sneha Pillai','9876543213','sneha@gmail.com','MBA',8.1,'Active'),
('S005','Karan Verma','9876543214','karan@gmail.com','MBA',7.2,'Active'),
('S006','Ananya Reddy','9876543215','ananya@gmail.com','MBA',9.0,'Active'),
('S007','Vikram Singh','9876543216','vikram@gmail.com','MBA',6.5,'Active'),
('S008','Deepika Menon','9876543217','deepika@gmail.com','MBA',8.7,'Active'),
('S009','Arjun Patel','9876543218','arjun@gmail.com','MBA',7.5,'Active'),
('S010','Meera Iyer','9876543219','meera@gmail.com','MBA',8.3,'Active');

-- Company Table
CREATE TABLE IF NOT EXISTS Company (
    company_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(100),
    industry VARCHAR(50),
    location VARCHAR(100),
    contact_email VARCHAR(100)
);

INSERT INTO Company VALUES
('C001','Infosys','IT','Bangalore','hr@infosys.com'),
('C002','Deloitte','Consulting','Mumbai','hr@deloitte.com'),
('C003','Amazon','E-Commerce','Hyderabad','hr@amazon.com'),
('C004','HDFC Bank','Banking','Mumbai','hr@hdfc.com'),
('C005','Wipro','IT','Bangalore','hr@wipro.com');

-- Job Posting Table
CREATE TABLE IF NOT EXISTS Job_Posting (
    job_id VARCHAR(15) PRIMARY KEY,
    company_id VARCHAR(15),
    role VARCHAR(100),
    required_cgpa FLOAT,
    package FLOAT,
    seats INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

INSERT INTO Job_Posting VALUES
('J001','C001','Business Analyst',7.0,8.5,30),
('J002','C002','Management Consultant',7.5,12.0,20),
('J003','C003','Operations Manager',7.0,10.0,15),
('J004','C004','Relationship Manager',6.5,7.5,25),
('J005','C005','Project Manager',7.0,9.0,20);

-- Application Table
CREATE TABLE IF NOT EXISTS Application (
    application_id VARCHAR(15) PRIMARY KEY,
    student_id VARCHAR(15),
    job_id VARCHAR(15),
    applied_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (job_id) REFERENCES Job_Posting(job_id)
);

INSERT INTO Application VALUES
('APP1001','S001','J001','2025-01-10','Selected'),
('APP1002','S002','J002','2025-01-11','Shortlisted'),
('APP1003','S003','J004','2025-01-12','Applied'),
('APP1004','S004','J002','2025-01-13','Selected'),
('APP1005','S005','J003','2025-01-14','Rejected'),
('APP1006','S006','J001','2025-01-15','Selected'),
('APP1007','S007','J004','2025-01-16','Applied'),
('APP1008','S008','J005','2025-01-17','Shortlisted'),
('APP1009','S009','J003','2025-01-18','Applied'),
('APP1010','S010','J002','2025-01-19','Shortlisted');

-- Interview Rounds Table
CREATE TABLE IF NOT EXISTS Interview_Round (
    round_id VARCHAR(15) PRIMARY KEY,
    application_id VARCHAR(15),
    round_type VARCHAR(50),
    scheduled_date DATE,
    result VARCHAR(30),
    FOREIGN KEY (application_id) REFERENCES Application(application_id)
);

INSERT INTO Interview_Round VALUES
('RND101','APP1001','Aptitude','2025-01-20','Pass'),
('RND102','APP1002','Technical','2025-01-21','Pass'),
('RND103','APP1004','HR','2025-01-22','Pass'),
('RND104','APP1006','Aptitude','2025-01-23','Pass'),
('RND105','APP1008','Technical','2025-01-24','Pending'),
('RND106','APP1010','HR','2025-01-25','Pending');

-- Offer Letter Table
CREATE TABLE IF NOT EXISTS Offer_Letter (
    offer_id VARCHAR(15) PRIMARY KEY,
    student_id VARCHAR(15),
    company_id VARCHAR(15),
    package FLOAT,
    joining_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

INSERT INTO Offer_Letter VALUES
('OFR1001','S001','C001',8.5,'2025-06-01','Issued'),
('OFR1002','S004','C002',12.0,'2025-06-01','Issued'),
('OFR1003','S006','C001',8.5,'2025-06-15','Issued');

-- Update placed students
UPDATE Student SET status='Placed' WHERE student_id='S001';
UPDATE Student SET status='Placed' WHERE student_id='S004';
UPDATE Student SET status='Placed' WHERE student_id='S006';