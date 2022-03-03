create database LibDatabase;

use LibDatabase;
create schema Book;

create schema Person;

CREATE TABLE [Book].[Book](
	[Book_ID] [int] PRIMARY KEY NOT NULL,
	[Book_Name] [nvarchar](50) NOT NULL,
	Author_ID INT NOT NULL,
	Publisher_ID INT NOT NULL
	);

	--create Book.Author table--
	CREATE TABLE [Book].[Author](
	[Author_ID] [int],
	[Author_FirstName] [nvarchar](50) Not NULL,
	[Author_LastName] [nvarchar](50) Not NULL
	);

	--create Publisher Table--
	CREATE TABLE Book.Publisher (
	Publisher_ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Publisher_Name nvarchar(100) NULL
);


   CREATE TABLE [Person].[Person](
	[SSN] [bigint] PRIMARY KEY NOT NULL,
	[Person_FirstName] [nvarchar](50) NULL,
	[Person_LastName] [nvarchar](50) NULL
	);

	--create Person.Loan table--
CREATE TABLE [Person].[Loan](
	[SSN] BIGINT NOT NULL,
	[Book_ID] INT NOT NULL,
	PRIMARY KEY ([SSN], [Book_ID])
	);


	--create Person.Person_Phone table--
CREATE TABLE [Person].[Person_Phone](
	[Phone_Number] [bigint] PRIMARY KEY NOT NULL,
	[SSN] [bigint] NOT NULL	
	);

	--create Person.Person_Mail table--
CREATE TABLE [Person].[Person_Mail](
	[Mail_ID] INT PRIMARY KEY IDENTITY (1,1),
	[Mail] NVARCHAR(MAX) NOT NULL,
	[SSN] BIGINT UNIQUE NOT NULL	
	);

	--*ddl* veri tabaný create etme, tablo create etme,þema create etme, tablolarýn içindeki verilerle ilgilenmez--
	--yapýyý oluþturmakla ilgili sql komutlarý--
	--*dml* bir tablo içerisindeki verilerin deðiþtirilmesi,eklenmesi, slinmesi iþlemleridir.--


	--INSERT--

	INSERT INTO Person.Person (SSN, Person_FirstName, Person_LastName)
	VALUES (75056659595,'Zehra', 'Tekin');

	select *
	from Person.Person;

	INSERT INTO Person.Person (SSN, Person_FirstName) 
	VALUES (889623212466,'Kerem')


	INSERT Person.Person 
	VALUES (15078893526,'Mert','Yetiþ')--sýrasýyla veri tiplerine uygun olmasý lazým


	INSERT Person.Person VALUES (55556698752, 'Esra', Null)

	INSERT Person.Person VALUES (35532888963,'Ali','Tekin');-- Tüm tablolara deðer atanacaðý varsayýlmýþtýr.
    INSERT Person.Person VALUES (88232556264,'Metin','Sakin')


	select * 
	from Person.Person_Mail
	
	INSERT INTO Person.Person_Mail (Mail, SSN) 
    VALUES ('zehtek@gmail.com', 75056659595),
	   ('meyet@gmail.com', 15078893526),
	   ('metsak@gmail.com', 35532558963)

	   select @@IDENTITY-- local tek @ , çift global oluyor

	   select @@ROWCOUNT-- son etkilenen kaç satýrlýk iþlem yapýldýðýnýn sütun sayýsýný veriyor.

	   select * 
	   into Person.Person3
	   from Person.Person

select @@ROWCOUNT
 
 insert into Person.person2
 select * 
 from Person.Person
 where Person_FirstName like 'M%'


 select *
 from person.person2


 insert into Book.Publisher-- default verme 
 default values;

 select * 
 from Book.Publisher

 UPDATE Person.Person2 --person, person2 tablosunda person first nameleri default yapýyor--
 SET Person_FirstName = 'Default_Name'

 select * 
 from person.person2

 UPDATE Person.Person2
SET Person_FirstName = 'Can'
WHERE SSN = 75056659595

UPDATE Person.Person2
SET Person_FirstName = B.Person_FirstName
--select * update komutunda select yok
FROM Person.Person2 A -- as denebilir.
Inner Join Person.Person B
ON A.SSN=B.SSN
WHERE B.SSN = 75056659595

select * 
from person.person2

--Delete
select * 
from  Book.Publisher

delete from Book.Publisher

insert Book.Publisher values ('ÝLETÝÞÝM')
insert Book.Publisher values ('BÝLÝÞÝM')

delete from Book.Publisher
where Publisher_Name= 'BÝLÝÞÝM'

insert Book.Publisher values ('BÝLÝÞÝM')

truncate table book.Publisher-- index numaralarý delete den farklý olarak 1 den baþlar.delete kaldýðý yerden devam eder.

insert Book.Publisher values ('ÝLETÝÞÝM')
insert Book.Publisher values ('BÝLÝÞÝM')


DROP TABLE Person.Person2;
DROP TABLE Person.Person3;

TRUNCATE TABLE Person.Person_Mail;
TRUNCATE TABLE Person.Person;
TRUNCATE TABLE Book.Publisher;

--Erd--
ALTER TABLE Book.Author
ALTER COLUMN Author_ID
INT NOT NULL

ALTER TABLE Book.Author
ADD CONSTRAINT pk_author
PRIMARY KEY (Author_ID);


ALTER TABLE Book.Book
ADD CONSTRAINT FK_Author
FOREIGN KEY (Author_ID)
REFERENCES Book.Author (Author_ID)

select * 
from Book.Author

ALTER TABLE Person.Loan
ADD CONSTRAINT FK_PERSON
FOREIGN KEY (SSN)
REFERENCES Person.Person (SSN)

ALTER TABLE Person.Loan 
ADD CONSTRAINT FK_book 
FOREIGN KEY (Book_ID) 
REFERENCES Book.Book (Book_ID)

Alter table Person.Person_Mail 
add constraint FK_Person4 
Foreign key (SSN) 
References Person.Person(SSN)

Alter table Book.Book
add constraint Fk_book
foreign key (Publisher_ID)
References Book.Publisher(Publisher_ID)

Alter table Person.Person_Phone -- Önce deðiþtireceðin tablo+ fk ekleyeceðini belirttiðin tablo+ neyi foreign key  ekleyeceksin+referansta primary key olan tablodaki yazdýðýn
add constraint Fk_Person_Phone
foreign key (SSN)
References Person.Person(SSN)

