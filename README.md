
## CREATE TABLE
## Field names: id, name, role, salary, age, address, phone.
```dart
CREATE TABLE "employee" (

	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"role"	TEXT NOT NULL,
	"salary"	INTEGER,
	"age"	INTEGER NOT NULL,
	"address"	TEXT,
	"phone"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)

);
 
``` 

## Add a new employee with all the details
```dart
INSERT INTO employee(name,role,salary,age,address,phone) VALUES('Shalu Sharma','Sales',35000,18,'ParvatGam,Surat,',63524178394);
```
## Insert emloyees data
- Add multiple employees with selective data:
```dart
INSERT INTO employee(name,role,salary,age,address,phone) VALUES ('Shalu Sharma','Flutter Developer',45000,20,'50,kamala ba garden society,surat',9852993459);
INSERT INTO employee(name,role,salary,age,address,phone) VALUES ('Chandani Shukla','Grahpics Designer',500000,24,'148,Santi-nagar society,surat',6352193428);
INSERT INTO employee(name,role,salary,age,address,phone) VALUES ('Bhakti Kadam','FullStack Develoer',400000,28,'167,Shree ji society,surat',9152112410);
INSERT INTO employee(name,role,salary,age,address,phone) VALUES ('Kashish Gupta','Ui-Ux Designer',30000,30,'100,Parvat Gam,surat',7852193459);
INSERT INTO employee(name,role,salary,age,address,phone) VALUES ('Kajal Sharma','Website Developer',35000,25,'150,ShivDarshan society,surat',9252193416);
 
``` 

## Read data
- Retrieve all employee information:
```dart
  SELECT * FROM   employee;
```
## Get specific columns for all employees (e.g., name, salary)
```dart
SELECT  name,salary FROM employee WHERE name =name;
```
## Find employees with a particular role (e.g., Flutter Developer):
```dart
SELECT  name,role FROM employee WHERE role ='Flutter Developer';
```

## Search for employees with names containing "Sh" (case-insensitive):

```dart
SELECT  name FROM employee WHERE name LIKE 'Sh%';
```
## Find employees older than 20 and earning more than RS 25,000:

```dart
SELECT * FROM employee WHERE  (salary>25000)AND age>20;
```
## Change the salary of an employee with ID 1:

```dart
UPDATE employee
SET salary = 50000
WHERE id =1
```
## Update the address for employees in the 'Graphics Designer' role:

```dart
UPDATE employee SET address = '111,Santi-nagar society,surat' WHERE role  = 'Graphics Designer';
```

## Remove an employee with ID 3:
```dart
DELETE FROM employee WHERE id = 3;
```

## Delete all employees under 20 (assuming it's not a valid age).

```dart
DELETE FROM employee WHERE age <24;
```
<img src  = "https://github.com/user-attachments/assets/08bbbf64-6a8d-4607-ac53-7d589fd9370f" height=40%  width=30%>
<img src  = "https://github.com/user-attachments/assets/fb54552d-22b8-4f75-a83f-88c581276b67" height=40%  width=30%>


<h1 align="center">Budget Tracker App </h1>

Budget Tracker App  is a feature-rich mobile application developed with Flutter, designed to help you manage and track your finances efficiently. The app supports full CRUD (Create, Read, Update, Delete) operations for managing expenses and budgets, all backed by a robust local database.

### Features
- Expense Management: Add, view, edit, and delete expense records.
- Budget Tracking: Create and modify budget goals and monitor your progress.
- Local Database: Utilizes SQLite for reliable and secure data storage.
- 
### Usage

1. *Create* : Add new Record like category and amount using addRecord method which is stored in Controller. This Details Add to a dataList and it is managed by a GetX controller..

2. *Read*   : Display the list of expense or income by observing the dataList list with `Obx` or `GetBuilder` in the UI. The list is stored in the Controller class.

3. *Update* : Modify an Budget's details by tap on budget item.it will be open dialog box where you can updaterecord

4. *Delete* : Remove an budget record from dataList through a deleteRecord method which is store in Controller.




<p>
	<img src = "https://github.com/user-attachments/assets/8e1f8e38-1ca4-45b6-a262-0180741fd276"  height = 25%  width = 25%>
	<img src = "https://github.com/user-attachments/assets/1aef2500-b419-4e8e-822e-64f0505f8fe0"  height = 25%  width = 25%>
	<img src = "https://github.com/user-attachments/assets/77f8c0fa-c6e6-496f-b8ee-8422435b75c3"  height = 25%  width = 25%>
	<img src = "https://github.com/user-attachments/assets/c9319c31-8e37-48e9-a9c7-dec3078312f3"  height = 25%  width = 25%>
</p>

https://github.com/user-attachments/assets/1e55ec92-4307-469d-829a-8dc4f75aecac

https://github.com/user-attachments/assets/633b4013-7f4e-417c-b2d0-53e80c4647e7


