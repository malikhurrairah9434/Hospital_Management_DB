
-- DATABASE: Hospital Management System (HMS)

-- ========================
-- TABLE: Patients
-- ========================
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address TEXT
);

-- ========================
-- TABLE: Doctors
-- ========================
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(50),
    phone VARCHAR(15)
);

-- ========================
-- TABLE: Appointments
-- ========================
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    appointment_date TIMESTAMP,
    reason TEXT
);

-- ========================
-- TABLE: Wards
-- ========================
CREATE TABLE wards (
    ward_id SERIAL PRIMARY KEY,
    ward_name VARCHAR(50),
    ward_type VARCHAR(30), -- ICU, General, Emergency
    capacity INT
);

-- ========================
-- TABLE: Admissions
-- ========================
CREATE TABLE admissions (
    admission_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    ward_id INT REFERENCES wards(ward_id),
    admission_date DATE,
    discharge_date DATE
);

-- ========================
-- TABLE: Medications
-- ========================
CREATE TABLE medications (
    medication_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- ========================
-- TABLE: Prescriptions
-- ========================
CREATE TABLE prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    medication_id INT REFERENCES medications(medication_id),
    dosage VARCHAR(50),
    prescribed_date DATE
);

-- ========================
-- COMPLEX QUERY 1: Patients admitted more than once
-- ========================
-- This query identifies patients with more than one admission record.
-- Useful for finding chronic patients or re-admissions.
SELECT p.name, COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN patients p ON p.patient_id = a.patient_id
GROUP BY p.name
HAVING COUNT(a.admission_id) > 1;

-- ========================
-- COMPLEX QUERY 2: Current patients in each ward
-- ========================
-- Shows real-time ward occupancy and remaining capacity.
SELECT w.ward_name, COUNT(a.admission_id) AS current_occupants, w.capacity - COUNT(a.admission_id) AS available_beds
FROM wards w
LEFT JOIN admissions a ON w.ward_id = a.ward_id AND a.discharge_date IS NULL
GROUP BY w.ward_name, w.capacity;

-- ========================
-- COMPLEX QUERY 3: Doctor-wise medication prescription count
-- ========================
-- Shows how many prescriptions each doctor has issued.
SELECT d.name, COUNT(prescription_id) AS total_prescriptions
FROM prescriptions p
JOIN doctors d ON p.doctor_id = d.doctor_id
GROUP BY d.name;

-- ========================
-- COMPLEX QUERY 4: Most prescribed medications
-- ========================
-- Finds medications frequently used in the hospital.
SELECT m.name, COUNT(p.prescription_id) AS times_prescribed
FROM prescriptions p
JOIN medications m ON p.medication_id = m.medication_id
GROUP BY m.name
ORDER BY times_prescribed DESC
LIMIT 5;

-- ========================
-- COMPLEX QUERY 5: Appointments this week by specialization
-- ========================
-- Helps forecast departmental load.
SELECT d.specialization, COUNT(a.appointment_id) AS appointments_this_week
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date >= CURRENT_DATE - INTERVAL '7 days'
GROUP BY d.specialization;
