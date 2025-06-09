
# 🏥 Hospital Management System - PostgreSQL Project

This project is a comprehensive **Hospital Management System** implemented using **PostgreSQL**. It is designed to demonstrate real-world database administration, modeling, and querying skills suitable for showcasing in your **GitHub portfolio** or **resume**.

---

## 📂 Project Structure

- **SQL Schema File:** `Hospital_Management_DB_Project.sql`
- Contains all `CREATE TABLE` statements, foreign key constraints, and realistic complex queries.

---

## 🧱 Database Tables

| Table Name     | Description                            |
|----------------|----------------------------------------|
| `patients`     | Stores patient personal information    |
| `doctors`      | Details about hospital doctors         |
| `appointments` | Appointment bookings with doctors      |
| `wards`        | Hospital wards and their capacity      |
| `admissions`   | Records of patient admissions          |
| `medications`  | Medication inventory                   |
| `prescriptions`| Medicine prescribed by doctors         |

---

## 🧠 Complex SQL Queries Included

### 1. 👨‍⚕️ Patients Admitted More Than Once
Finds patients with multiple admissions to identify chronic cases or readmissions.

### 2. 🛏️ Current Ward Occupancy
Calculates real-time occupancy of each ward and remaining capacity.

### 3. 💊 Doctor-wise Prescription Count
Measures how many prescriptions each doctor has issued.

### 4. 🔝 Top Prescribed Medications
Lists medications most frequently prescribed in the hospital.

### 5. 📅 Weekly Appointments by Specialization
Shows number of appointments for each doctor specialization in the last 7 days.

---

## 💡 Technologies Used

- **PostgreSQL** for database design and querying
- **pgAdmin** for database management and testing
- **SQL** for schema definition and data retrieval

---

## 🚀 How to Use

1. Install PostgreSQL and pgAdmin
2. Create a new database named `hospital_db`
3. Run the `Hospital_Management_DB_Project.sql` file using Query Tool
4. Explore and modify queries for practice or expansion

---

## ✅ Project Ideas for Expansion

- Add user roles and authentication (doctor, admin)
- Implement triggers for automatic status updates
- Integrate with a frontend using React or Next.js
- Connect with REST API (Node.js or Django)

---

## 📌 Author

Made for database practice and portfolio building.  
Inspired by real-world hospital workflows.

