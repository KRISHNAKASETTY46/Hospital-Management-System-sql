create database hospital;
use hospital;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),  -- Scheduled / Completed / Cancelled
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Diseases (
    DiseaseID INT PRIMARY KEY,
    DiseaseName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Records (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    DiseaseID INT,
    VisitDate DATE,
    Treatment VARCHAR(200),
    Cost DECIMAL(10,2),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DiseaseID) REFERENCES Diseases(DiseaseID)
);



INSERT INTO Patients (PatientID, Name, Age, Gender, City, Phone) VALUES
(1, 'Ravi Kumar', 35, 'Male', 'Hyderabad', '9876543210'),
(2, 'Priya Sharma', 29, 'Female', 'Bangalore', '9123456780'),
(3, 'Amit Verma', 42, 'Male', 'Delhi', '9988776655'),
(4, 'Sneha Reddy', 31, 'Female', 'Chennai', '9345678123'),
(5, 'Arjun Mehta', 27, 'Male', 'Mumbai', '9765432109'),
(6, 'Divya Patel', 38, 'Female', 'Ahmedabad', '9654321987'),
(7, 'Karan Singh', 45, 'Male', 'Pune', '9543218760'),
(8, 'Neha Gupta', 33, 'Female', 'Kolkata', '9432167890'),
(9, 'Rahul Das', 40, 'Male', 'Hyderabad', '9321654789'),
(10, 'Ananya Roy', 25, 'Female', 'Delhi', '9876501234');


INSERT INTO Doctors (DoctorID, Name, Specialty, Phone) VALUES
(1, 'Dr. Ramesh Rao', 'Cardiologist', '9001112233'),
(2, 'Dr. Kavita Jain', 'Dermatologist', '9002223344'),
(3, 'Dr. Ajay Kumar', 'Orthopedic', '9003334455'),
(4, 'Dr. Meena Iyer', 'Pediatrician', '9004445566'),
(5, 'Dr. Vivek Sharma', 'Neurologist', '9005556677'),
(6, 'Dr. Sanjay Gupta', 'General Physician', '9006667788'),
(7, 'Dr. Pooja Nair', 'Gynecologist', '9007778899'),
(8, 'Dr. Mohan Rao', 'ENT Specialist', '9008889900'),
(9, 'Dr. Rekha Singh', 'Psychiatrist', '9009990011'),
(10, 'Dr. Suresh Babu', 'Oncologist', '9011112233');


INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, 1, '2025-08-01', 'Completed'),
(2, 2, 2, '2025-08-02', 'Scheduled'),
(3, 3, 3, '2025-08-03', 'Cancelled'),
(4, 4, 4, '2025-08-04', 'Completed'),
(5, 5, 5, '2025-08-05', 'Scheduled'),
(6, 6, 6, '2025-08-06', 'Completed'),
(7, 7, 7, '2025-08-07', 'Scheduled'),
(8, 8, 8, '2025-08-08', 'Completed'),
(9, 9, 9, '2025-08-09', 'Scheduled'),
(10, 10, 10, '2025-08-10', 'Scheduled');


INSERT INTO Diseases (DiseaseID, DiseaseName, Category) VALUES
(1, 'Hypertension', 'Cardiology'),
(2, 'Diabetes', 'Endocrinology'),
(3, 'Asthma', 'Pulmonology'),
(4, 'Migraine', 'Neurology'),
(5, 'Arthritis', 'Orthopedics'),
(6, 'Depression', 'Psychiatry'),
(7, 'Eczema', 'Dermatology'),
(8, 'Cancer', 'Oncology'),
(9, 'Tuberculosis', 'Infectious'),
(10, 'Flu', 'General');


INSERT INTO Records (RecordID, PatientID, DiseaseID, VisitDate, Treatment, Cost) VALUES
(1, 1, 1, '2025-07-01', 'Prescribed BP medicines', 1500.00),
(2, 2, 2, '2025-07-02', 'Diet control + Insulin', 2000.00),
(3, 3, 5, '2025-07-03', 'Physiotherapy + Painkillers', 2500.00),
(4, 4, 4, '2025-07-04', 'Neurology consultation + Tablets', 1800.00),
(5, 5, 7, '2025-07-05', 'Skin ointment + Cream', 1200.00),
(6, 6, 3, '2025-07-06', 'Inhaler prescribed', 1600.00),
(7, 7, 6, '2025-07-07', 'Therapy + Antidepressants', 3000.00),
(8, 8, 9, '2025-07-08', 'Antibiotics + Tests', 2800.00),
(9, 9, 8, '2025-07-09', 'Chemotherapy session', 5000.00),
(10, 10, 10, '2025-07-10', 'Flu medicines + Rest', 800.00);

select * from patients;
select * from doctors;
select * from appointments;
select * from diseases;
select * from records;

/*by using alter*/
ALTER TABLE Patients ADD Email VARCHAR(100);
ALTER TABLE Doctors MODIFY Phone VARCHAR(20);
ALTER TABLE Patients CHANGE City Location VARCHAR(100);
ALTER TABLE Patients DROP COLUMN Email;

/*update*/
UPDATE Appointments SET Status = 'Rescheduled' WHERE Status = 'Cancelled';
set SQL_SAFE_UPDATES=0;

/*delete*/
DELETE FROM appointments WHERE appointmentID = 10;

/*where*/
SELECT * FROM Patients WHERE Gender = 'Female' AND Location = 'Delhi';

/*like*/
SELECT * FROM Doctors WHERE Name LIKE 'Dr. S%';
SELECT * FROM Patients WHERE Name LIKE 'A_i_ v_r_a';


/*aggregate functions*/
SELECT SUM(Cost) AS TotalTreatmentCost FROM Records;
SELECT AVG(Age) AS AverageAge FROM Patients;
select count(*) from appointments;
select max(cost) from records;
select min(cost) from records;

/*group by*/
SELECT DiseaseID, SUM(Cost) AS TotalCost FROM Records GROUP BY DiseaseID;

/*having*/
SELECT DiseaseID, SUM(Cost) AS TotalCost FROM Records GROUP BY DiseaseID HAVING SUM(Cost) > 3000;

/*sub queries*/
SELECT MAX(cost) from records where cost < (select MAX(cost) from records);

/*stored procedures*/
DELIMITER //

CREATE PROCEDURE GetPatientsByCity(IN cityName VARCHAR(100))
BEGIN
    SELECT * FROM Patients
    WHERE Location = cityName;
END //

DELIMITER ;
CALL GetPatientsByCity('Delhi');
--2

DELIMITER //

CREATE PROCEDURE GetTotalCostByPatientID(IN pid INT, OUT totalCost DECIMAL(10,2))
BEGIN
    SELECT SUM(Cost) INTO totalCost
    FROM Records
    WHERE PatientID = pid;
END //

DELIMITER ;

SET @cost = 0;

CALL GetTotalCostByPatientID(1, @cost);


--3
DELIMITER //

CREATE PROCEDURE IncreasePatientAge(INOUT pid INT)
BEGIN
    UPDATE Patients
    SET Age = Age + 1
    WHERE PatientID = pid;

    SELECT Age FROM Patients WHERE PatientID = pid;
END //

DELIMITER ;

SET @pid = 1;

CALL IncreasePatientAge(@pid);

SELECT * FROM Patients WHERE PatientID = @pid;


/*triggers*/
CREATE TABLE AppointmentLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT,
    PatientID INT,
    DoctorID INT,
    ActionTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER AfterAppointmentInsert
AFTER INSERT ON Appointments
FOR EACH ROW
BEGIN
    INSERT INTO AppointmentLog (AppointmentID, PatientID, DoctorID)
    VALUES (NEW.AppointmentID, NEW.PatientID, NEW.DoctorID);
END //

DELIMITER ;

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Status)
VALUES (11, 1, 2, '2025-08-20', 'Scheduled');

SELECT * FROM AppointmentLog;











