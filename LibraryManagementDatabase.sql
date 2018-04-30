
CREATE DATABASE [db_libmgmtsys1]
USE [db_libmgmtsys1]

	CREATE TABLE PUBLISHER (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	StreetAddress VARCHAR(50) NOT NULL,
	Phone VARCHAR(20)
	);

	CREATE TABLE BOOK (
		BookId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		Title VARCHAR(50) NOT NULL,
		PublisherName VARCHAR(50) NOT NULL
		CONSTRAINT fk_PublisherName FOREIGN KEY(PublisherName) REFERENCES PUBLISHER(Name) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE BOOK_AUTHORS (
		BookId INT NOT NULL 
		CONSTRAINT fk_BookId FOREIGN KEY REFERENCES Book(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL,
		);

	CREATE TABLE LIBRARY_BRANCH (
		BranchId INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
		BranchName VARCHAR(50) NOT NULL,
		StreetAddress VARCHAR(50) NOT NULL
	);

	CREATE TABLE BORROWER (
		CardNo INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
		Name VARCHAR(50) NOT NULL,
		StreetAddress VARCHAR(50) NOT NULL,
		Phone VARCHAR(20) NOT NULL
	);

	CREATE TABLE BOOK_LOANS (
		BookId INT NOT NULL CONSTRAINT fk_BookId1 FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchId INT NOT NULL CONSTRAINT fk_BranchId FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut Date NOT NULL,
		DueDate Date NOT NULL
	);
	--DROP Table BOOK_COPIES
	CREATE TABLE BOOK_COPIES (
		BookId INT NOT NULL CONSTRAINT fk_BookId2 FOREIGN KEY REFERENCES BOOK(BookId) ON UPDATE CASCADE ON DELETE CASCADE,
		Branch_id INT NOT NULL CONSTRAINT fk_Branch_id FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
		No_Of_Copies INT NOT NULL
	);


/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/
	 INSERT INTO PUBLISHER
		(Name, StreetAddress, Phone)
		VALUES 
		('Knopf', '310 Madison Ave.', '212-688-3747'),
		('Penguin Books', '666 5th Ave.', '212-466-2538'),
		('Random House', '555 W 151st St.', '646-388-3863'),
		('Little Brown Books', '280 Providence Blvd.', '309-517-6030'),
		('Duke University Press', '41 Flowers Dr.', '919-684-3730'),
		('Viking Press', '2660 Hennepin Way', '631-902-2340')
	;
	SELECT * FROM PUBLISHER;
	INSERT INTO BOOK
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Little Brown Books'),
	('The Green Mile', 'Viking Press'),
	('IT', 'Viking Press'),
	('Argo', 'Random House'),
	('The Deep Blue Sea', 'Penguin Books'),
	('All the Kings Men', 'Random House'),
	('The Bread of Time', 'Knopf'),
	('They Feed They Lion', 'Knopf'),
	('Not This Pig', 'Knopf'),
	('The Mercy', 'Knopf'),
	('News of The World', 'Knopf'),
	('A History of the Blue Devils', 'Duke University Press'),
	('Coach K and Me', 'Duke University Press'),
	('10 Weeks in Krzyzewskiville', 'Duke University Press'),
	('Happy Feet', 'Penguin Books'),
	('21 Jumpstreet', 'Little Brown Books'),
	('Times Square Hustle', 'Random House'),
	('Shortcake Suzie', 'Little Brown Books'),
	('African Agriculture: 21st C. Drought Resistance', 'Penguin Books'),
	('The Children of The Corn', 'Viking Press')
	;
	SELECT * FROM BOOK;

	INSERT INTO BOOK_AUTHORS
	(BookId, AuthorName)
	VALUES
	(1, 'Mark Lee'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Antonio Mendez'),
	(5, 'Audrey Wood'),
	(6, 'Robert Warren'),
	(7, 'Philip Levine'),
	(8, 'Philip Levine'),
	(9, 'Philip Levine'),
	(10, 'Philip Levine'),
	(11, 'Philip Levine'),
	(12, 'Aaron Levine'),
	(13, 'David Loaiza'),
	(14, 'Elissa Lerner'),
	(15, 'Danny Devito'),
	(16, 'Johnny Depp'),
	(17, 'James Franco'),
	(18, 'Sarah Lee'),
	(19, 'Kwadwo Achampong'),
	(20, 'Stephen King')
	;
	SELECT * FROM BOOK_AUTHORS;


	INSERT INTO LIBRARY_BRANCH
	(BranchName, StreetAddress)
	VALUES
	('Central', '710 SE Madison St.'),
	('Northeast', '7508 NE Halsey St.'),
	('Northwest', '2190 NW Alder St.'),
	('Southwest', '10103 SW Barber Blvd.'),
	('Southeast', '6501 SE Foster Road'),
	('Sharpstown', '71 Sharp St.')
	;
	SELECT * FROM LIBRARY_BRANCH;

	INSERT INTO BORROWER
	(Name, StreetAddress, Phone)
	VALUES
	('Alvin Gentry', '109 Baker St.', '606-403-3269'),
	('Barbara Bush', '1600 Pennsylvania Ave.', '303-392-7099'),
	('Conan OBrien', '100 Burbank Blvd.', '681-390-9201'),
	('Damian Lilard', '109 Moda Center Ct', '971-309-8630'),
	('Neil Everett', '6550 NE Everett St.', '503-609-3340'),
	('Bob Cousey', '932 SW Barbur Blvd.', '503-985-1938'),
	('Samantha Bee', '1023 5th Ave.', '212-990-1234'),
	('Linda McDaniels', '4009 N Van Ness', '559-302-8419')
	;
	SELECT * FROM BORROWER;
	
	INSERT INTO BOOK_LOANS
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	(1, 10004, 5004, '2018-04-23', '2018-05-23'),
	(2, 10002, 5001, '2018-04-11', '2018-05-11'),
	(3, 10005, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(5, 10001, 5002, '2018-04-10', '2018-05-10'),
	(1, 10000, 5004, '2018-04-23', '2018-05-23'),
	(2, 10000, 5001, '2018-04-11', '2018-05-11'),
	(3, 10000, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(5, 10001, 5002, '2018-04-10', '2018-05-10'),
	(1, 10004, 5004, '2018-04-23', '2018-05-23'),
	(2, 10002, 5001, '2018-04-11', '2018-05-11'),
	(3, 10005, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(5, 10001, 5002, '2018-04-10', '2018-05-10'),
	(6, 10004, 5004, '2018-03-30', '2018-04-30'),
	(7, 10002, 5001, '2018-03-29', '2018-04-29'),
	(8, 10005, 5007, '2018-03-28', '2018-04-28'),
	(2, 10000, 5007, '2018-03-27', '2018-04-27'),
	(20, 10000, 5007, '2018-03-26', '2018-04-26'),
	(3, 10000, 5007, '2018-03-25', '2018-04-25'),
	(11, 10000, 5007, '2018-03-31', '2018-04-30'),
	(14, 10000, 5007, '2018-04-01', '2018-05-01'),
	(15, 10001, 5006, '2018-04-24', '2018-05-24'),
	(16, 10001, 5006, '2018-04-24', '2018-05-24'),
	(17, 10001, 5006, '2018-04-24', '2018-05-24'),
	(18, 10001, 5006, '2018-04-24', '2018-05-24'),
	(19, 10001, 5006, '2018-04-29', '2018-05-29'),
	(1, 10005, 5004, '2018-04-25', '2018-05-25'),
	(1, 10004, 5004, '2018-04-23', '2018-05-23'),
	(2, 10002, 5001, '2018-04-11', '2018-05-11'),
	(3, 10005, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(5, 10001, 5002, '2018-04-10', '2018-05-10'),
	(1, 10000, 5004, '2018-04-23', '2018-05-23'),
	(2, 10000, 5001, '2018-04-11', '2018-05-11'),
	(3, 10000, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(5, 10001, 5002, '2018-04-10', '2018-05-10'),
	(1, 10004, 5004, '2018-04-23', '2018-05-23'),
	(2, 10002, 5001, '2018-04-11', '2018-05-11'),
	(3, 10005, 5000, '2018-04-17', '2018-05-17'),
	(4, 10003, 5003, '2018-04-16', '2018-05-16'),
	(2, 10004, 5002, '2018-04-10', '2018-05-10'),
	(6, 10000, 5004, '2018-03-30', '2018-04-30'),
	(3, 10000, 5001, '2018-03-29', '2018-04-29'),
	(8, 10005, 5007, '2018-03-28', '2018-04-28'),
	(2, 10000, 5007, '2018-03-27', '2018-04-27'),
	(19, 10000, 5007, '2018-03-26', '2018-04-26'),
	(3, 10000, 5007, '2018-03-25', '2018-04-25'),
	(6, 10000, 5007, '2018-03-31', '2018-04-30'),
	(4, 10000, 5007, '2018-04-01', '2018-05-01'),
	(12, 10001, 5000, '2018-04-24', '2018-05-24'),
	(5, 10001, 5005, '2018-04-24', '2018-05-24'),
	(17, 10001, 5001, '2018-04-24', '2018-05-24'),
	(11, 10002, 5003, '2018-04-24', '2018-05-24'),
	(4, 10003, 5004, '2018-04-29', '2018-05-29'),
	(1, 10005, 5004, '2018-04-25', '2018-05-25')
	;
	SELECT * FROM BOOK_LOANS;

	INSERT INTO BOOK_COPIES
	(BookId, Branch_id, No_Of_Copies)
	VALUES
	(1, 10005, 10),
	(2, 10005, 8),
	(3, 10005, 8),
	(4, 10005, 12),
	(5, 10005, 9),
	(6, 10005, 6),
	(7, 10005, 14),
	(8, 10005, 12),
	(9, 10005, 10),
	(10, 10005, 10),
	(11, 10005, 8),
	(12, 10005, 11),
	(13, 10005, 15),
	(14, 10005, 18),
	(15, 10005, 9),
	(16, 10005, 7),
	(17, 10005, 11),
	(18, 10005, 13),
	(19, 10005, 7),
	(20, 10005, 9),
	(1, 10004, 10),
	(2, 10004, 8),
	(3, 10004, 8),
	(4, 10004, 12),
	(5, 10004, 9),
	(6, 10004, 6),
	(7, 10004, 14),
	(8, 10004, 12),
	(9, 10004, 10),
	(10, 10004, 10),
	(11, 10004, 8),
	(12, 10004, 11),
	(13, 10004, 15),
	(14, 10004, 18),
	(15, 10004, 9),
	(16, 10004, 7),
	(17, 10004, 11),
	(18, 10004, 13),
	(19, 10004, 7),
	(20, 10004, 9),
	(1, 10003, 10),
	(2, 10003, 8),
	(3, 10003, 8),
	(4, 10003, 12),
	(5, 10003, 9),
	(6, 10003, 6),
	(7, 10003, 14),
	(8, 10003, 12),
	(9, 10003, 10),
	(10, 10003, 10),
	(11, 10003, 8),
	(12, 10003, 11),
	(13, 10003, 15),
	(14, 10003, 18),
	(15, 10003, 9),
	(16, 10003, 7),
	(17, 10003, 11),
	(18, 10003, 13),
	(19, 10003, 7),
	(20, 10003, 9),
	(1, 10002, 10),
	(2, 10002, 8),
	(3, 10002, 8),
	(4, 10002, 12),
	(5, 10002, 9),
	(6, 10002, 6),
	(7, 10002, 14),
	(8, 10002, 12),
	(9, 10002, 10),
	(10, 10002, 10),
	(11, 10002, 8),
	(12, 10002, 11),
	(13, 10002, 15),
	(14, 10002, 18),
	(15, 10002, 9),
	(16, 10002, 7),
	(17, 10002, 11),
	(18, 10002, 13),
	(19, 10002, 7),
	(20, 10002, 9),
	(1, 10001, 10),
	(2, 10001, 8),
	(3, 10001, 8),
	(4, 10001, 12),
	(5, 10001, 9),
	(6, 10001, 6),
	(7, 10001, 14),
	(8, 10001, 12),
	(9, 10001, 10),
	(10, 10001, 10),
	(11, 10001, 8),
	(12, 10001, 11),
	(13, 10001, 15),
	(14, 10001, 18),
	(15, 10001, 9),
	(16, 10001, 7),
	(17, 10001, 11),
	(18, 10001, 13),
	(19, 10001, 7),
	(20, 10001, 9),
	(1, 10000, 10),
	(2, 10000, 8),
	(3, 10000, 8),
	(4, 10000, 12),
	(5, 10000, 9),
	(6, 10000, 6),
	(7, 10000, 14),
	(8, 10000, 12),
	(9, 10000, 10),
	(10, 10000, 10),
	(11, 10000, 8),
	(12, 10000, 11),
	(13, 10000, 15),
	(14, 10000, 18),
	(15, 10000, 9),
	(16, 10000, 7),
	(17, 10000, 11),
	(18, 10000, 13),
	(19, 10000, 7),
	(20, 10000, 9)
	;
