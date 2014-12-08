use hlalljie;
CREATE TABLE Vehicle_Manufacture (
	MName VARCHAR(40) PRIMARY KEY
);

CREATE TABLE Vehicle (
	Model VARCHAR(20),
	VYear VARCHAR(4),
	Manufacture_Name VARCHAR(40) REFERENCES Vehicle_Manufacture(MName),
	MSRP INT NOT NULL,
	VType VARCHAR(20),
	PRIMARY KEY (Model, VYear, Manufacture_Name)
);

CREATE TABLE Vehicle_Color (
	Vehicle_Model VARCHAR(20) REFERENCES Vehicle(Model),
	Vehicle_Year VARCHAR(4) REFERENCES Vehicle(VYear),
	Vehicle_Manufacture_Name VARCHAR(40) REFERENCES Vehicle(Manufacture_Name),
	Color VARCHAR(20),
	PRIMARY KEY (Vehicle_Model, Vehicle_Year, Vehicle_Manufacture_Name, Color)
);

CREATE TABLE Customer (
	SSN VARCHAR(9) PRIMARY KEY,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL
);

CREATE TABLE Contact (
	Customer_SSN VARCHAR(9) REFERENCES Customer(SSN),
	ContactNumber INT,
	StreetNumber INT,
	City VARCHAR(40),
	State VARCHAR(20),
	ZipCode VARCHAR(5),
	PhoneNumber VARCHAR(11),
	PRIMARY KEY (Customer_SSN, ContactNumber)
);

CREATE TABLE Customer_Vehicle (
	VIN INT PRIMARY KEY,
	Color_Model VARCHAR(20) REFERENCES Vehicle_Color(Vehicle_Model),
	Color_Year VARCHAR(4) REFERENCES Vehicle_Color(Vehicle_Year),
	Color_Manufacture_Name VARCHAR(40) REFERENCES Vehicle_Color(Vehicle_Manufacture_Name),
	Vehicle_Color VARCHAR(20) REFERENCES Vehicle_Color(Color),
	DateOfPurchase DATE NOT NULL
);
	VIN VARCHAR(25) PRIMARY KEY,
	Vehicle_Model VARCHAR(20) REFERENCES Vehicle(Model),
	Vehicle_Year VARCHAR(4) REFERENCES Vehicle(VYear),
	Vehicle_Manufacture_Name VARCHAR(40) REFERENCES Vehicle(Manufacture_Name),
	Customer_SSN VARCHAR(9) REFERENCES Customer(SSN), 
	DateOfPurchase DATE NOT NULL
);

SELECT DISTINCT FirstName, LastName FROM  Customer 
	JOIN Customer_Vehicle
	ON Customer_Vehicle.Customer_SSN = Customer.SSN
	WHERE Customer_Vehicle.Color_Manufacture_Name = 'Ford';

SELECT Vehicle_Manufacture.MName, Vehicle.Model FROM Vehicle_Manufacture
	LEFT JOIN Vehicle
	ON Vehicle.Manufacture_Name = Vehicle_Manufacture.MName;

SELECT Vehicle_Manufacture.MName, Vehicle.Model FROM Vehicle
	RIGHT JOIN Vehicle_Manufacture
	ON  Vehicle_Manufacture.MName = Vehicle.Manufacture_Name;

SELECT Manufacture_Name AS Maufacture, Model, VType AS Type FROM Vehicle
UNION 
SELECT Maufacture, Model, Type FROM RecreationalVehicles;




