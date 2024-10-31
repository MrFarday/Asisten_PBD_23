CREATE TABLE Departments (
    DepartmentsID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Projects (
    ProjectsID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentsID INT,
    FOREIGN KEY (DepartmentsID) REFERENCES Departments(DepartmentsID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,
    DepartmentsID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DepartmentsID) REFERENCES Departments(DepartmentsID)
);

CREATE TABLE Salaries (
    EmployeeID INT,
    Salaries DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Departments (DepartmentsID, DepartmentName) VALUES 
(1, 'Finance'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing');


INSERT INTO Projects (ProjectsID, ProjectName, DepartmentsID) VALUES 
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 3),
(4, 'Project Delta', 4);

INSERT INTO Employee (EmployeeID, Name, ManagerID, DepartmentsID) VALUES 
(1, 'John Doe', NULL, 1),
(2, 'Jane Smith', 1, 2),
(3, 'Emily Davis', 1, 3),
(4, 'Michael Brown', 2, 4),
(5, 'Sarah Wilson', 3, 1),
(6, 'David Johnson', 3, 2);

INSERT INTO Salaries (EmployeeID, Salaries) VALUES 
(1, 7000.00),
(2, 6000.00),
(3, 6500.00),
(4, 5500.00),
(5, 5000.00),
(6, 4800.00);

--1 Tampilkan Name dari karyawan beserta DepartmentName mereka hanya untuk karyawan yang terdaftar dalam departemen.
SELECT Employee.Name, Departments.DepartmentName
FROM Employee
INNER JOIN Departments ON Employee.DepartmentsID = Departments.DepartmentsID;

--2 Tampilkan semua ‘Name’ dari karyawan dan proyek yang mereka kerjakan. Sertakan semua karyawan, meskipun mereka tidak bekerja di proyek mana pun.
SELECT Employee.Name, Projects.ProjectName
FROM Employee
LEFT JOIN Projects ON Employee.DepartmentsID = Projects.DepartmentsID;

--3 Tampilkan semua ProjectName beserta DepartmentName departemen yang bertanggung jawab atas proyek tersebut. Sertakan semua proyek, meskipun tidak ada departemen yang terhubung.
SELECT Projects.ProjectName, Departments.DepartmentName
FROM Departments
RIGHT JOIN Projects ON Departments.DepartmentsID = Projects.DepartmentsID;

--4 Tampilkan Name karyawan dan Salary mereka. Sertakan semua karyawan, baik yang memiliki data gaji maupun yang tidak, dan sertakan juga data gaji tanpa karyawan.
SELECT Employee.Name, Salaries.Salaries
FROM Employee
FULL JOIN Salaries ON Employee.EmployeeID = Salaries.EmployeeID;

--5 Tampilkan semua kombinasi antara Name karyawan dan ProjectName proyek.
SELECT Employee.Name, Projects.ProjectName
FROM Employee
CROSS JOIN Projects;

--6 Tampilkan Name dari setiap karyawan beserta Name manajer mereka.
SELECT E1.Name AS EmployeeName, E2.Name AS ManagerName
FROM Employee E1
LEFT JOIN Employee E2 ON E1.ManagerID = E2.EmployeeID;


--7 Tampilkan Name dari setiap karyawan beserta DepartmentName dari departemen mereka, tanpa harus menentukan kolom join secara eksplisit.
SELECT Employee.Name, Departments.DepartmentName
FROM Employee
INNER JOIN Departments ON Employee.DepartmentsID = Departments.DepartmentsID;
