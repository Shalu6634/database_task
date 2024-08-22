
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

## Search for employees with names containing "An" (case-insensitive):

```dart
SELECT  name FROM employee WHERE name LIKE 'S%';
```
## Find employees older than 20 and earning more than 25,000:

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

## Remove an employee with ID 101:
```dart
DELETE FROM employee WHERE id = 3;
```

## Delete all employees under 20 (assuming it's not a valid age).

```dart
DELETE FROM employee WHERE age <24;
```
<img src  = "https://github.com/user-attachments/assets/08bbbf64-6a8d-4607-ac53-7d589fd9370f" height=40%  width=30%>




