USE BookCatalog;

CREATE TABLE COURSE(
courseID VARCHAR(20) NOT NULL PRIMARY KEY,
courseTitle VARCHAR(100), 
credit varchar(3)
);

CREATE TABLE AUTHOR(
authorID INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstName varchar(20),
lastName varchar(20)
);

CREATE TABLE PUBLISHER(
publisherID INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
publisher VARCHAR(100)
);

CREATE TABLE BOOK(
isbn13 VARCHAR(13) NOT NULL PRIMARY KEY,
bookTitle VARCHAR(100),
price DECIMAL(6,2),
publisher INT(3),
edition VARCHAR(10),
publishDate DATE,
length INT(5),
description VARCHAR(2000),
FOREIGN KEY (publisher) REFERENCES PUBLISHER(publisherID) ON DELETE CASCADE
);

CREATE TABLE COURSEBOOK(
course VARCHAR(20),
book VARCHAR(13),
PRIMARY KEY (course, book),
FOREIGN KEY (course) REFERENCES COURSE(courseID) ON DELETE CASCADE,
FOREIGN KEY (book) REFERENCES BOOK(isbn13) ON DELETE CASCADE
);

CREATE TABLE AUTHORBOOK(
author INT(6),
book VARCHAR(13),
PRIMARY KEY (author, book),
FOREIGN KEY (author) REFERENCES AUTHOR(authorID) ON DELETE CASCADE,
FOREIGN KEY (book) REFERENCES BOOK(isbn13) ON DELETE CASCADE
);

INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 100','Personal Cyber Wellness','2');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 101','Introduction to Personal Computing','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 121','Web Media 1','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 122','Web Media 2','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 200','Special Study for Lower Division Students','1-2');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 231','Fundamentals of Computer Information Systems','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 234','Object-oriented Programming with Java','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 284','Programming with C++','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 299/299A/299L','Special Topics for Lower Division Students','1-4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 304','Intermediate Java Programming for Business','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 305','Database Design and Development','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 307','Business Telecommunications','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 310','Management Information Systems','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 311','Interactive Web Development','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 315','Introduction to Systems Analysis and Design','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 338','Client/Server Applications Development','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 345','Data Modeling','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 347','Telecommunications Networks','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 400','Special Study for Upper Division Students','1-2');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 406','Rapid Systems Development','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 415','Advanced Object-oriented Systems Analysis and Design','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 417','Broadband and Multimedia Networks','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 421','Multimedia Applications on the Web','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 424','Advanced Java Programming for Business','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 427','Mobile Communications and Wireless Networks','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 433','Information Systems Auditing','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 437','Fundamentals of Network Management and Design','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 441, 442','Internship in Information Systems','1-8');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 447','Internetworking with Linux','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 451','E-commerce Application Development','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 466','Systems Development Project','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 467','Network Security','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 471','Internet Security','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 481','Computer Forensics','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 491','Secure Web Applications','4');
INSERT INTO COURSE (courseID, courseTitle, credit) values ('CIS 499/499A/499L','Special Topics for Upper Division Students','1-4');


INSERT INTO AUTHOR (firstName, lastName) values ('Marjie','Britz');
INSERT INTO AUTHOR (firstName, lastName) values ('Gary','Shelly');
INSERT INTO AUTHOR (firstName, lastName) values ('Jennifer','Robbins');
INSERT INTO AUTHOR (firstName, lastName) values ('Aaron','Gustafson');
INSERT INTO AUTHOR (firstName, lastName) values ('Mark','Bell');
INSERT INTO AUTHOR (firstName, lastName) values ('Joel','Murach');
INSERT INTO AUTHOR (firstName, lastName) values ('Andrea','Steelman');
INSERT INTO AUTHOR (firstName, lastName) values ('Doug','Lowe');
INSERT INTO AUTHOR (firstName, lastName) values ('Jeffery','Hoffer');
INSERT INTO AUTHOR (firstName, lastName) values ('Ramesh','Venkataraman');
INSERT INTO AUTHOR (firstName, lastName) values ('Heikki','Topi');
INSERT INTO AUTHOR (firstName, lastName) values ('William','Stallings');
INSERT INTO AUTHOR (firstName, lastName) values ('Paige','Baltzan');
INSERT INTO AUTHOR (firstName, lastName) values ('Tony','Northrup');
INSERT INTO AUTHOR (firstName, lastName) values ('Mike','Snell');
INSERT INTO AUTHOR (firstName, lastName) values ('Alan','Dennis');
INSERT INTO AUTHOR (firstName, lastName) values ('Barbara','Wixom');
INSERT INTO AUTHOR (firstName, lastName) values ('David','Tegarden');
INSERT INTO AUTHOR (firstName, lastName) values ('Jeff','Levinson');
INSERT INTO AUTHOR (firstName, lastName) values ('Len','Silverston');
INSERT INTO AUTHOR (firstName, lastName) values ('Paul','Agnew');
INSERT INTO AUTHOR (firstName, lastName) values ('Luis','Correia');
INSERT INTO AUTHOR (firstName, lastName) values ('Ray','Harris');
INSERT INTO AUTHOR (firstName, lastName) values ('Frederick','Gallegos');
INSERT INTO AUTHOR (firstName, lastName) values ('Sandra','Senft');
INSERT INTO AUTHOR (firstName, lastName) values ('Douglas','Comer');
INSERT INTO AUTHOR (firstName, lastName) values ('Kenn','Scribner');
INSERT INTO AUTHOR (firstName, lastName) values ('Mark','Stiver');


INSERT INTO PUBLISHER (publisher) value ('Academic Press');
INSERT INTO PUBLISHER (publisher) value ('Apress');
INSERT INTO PUBLISHER (publisher) value ('Auerbach Publications');
INSERT INTO PUBLISHER (publisher) value ('Course Technology');
INSERT INTO PUBLISHER (publisher) value ('McGraw-Hill Osborne Media');
INSERT INTO PUBLISHER (publisher) value ('McGraw-Hill/Irwin');
INSERT INTO PUBLISHER (publisher) value ('Microsoft Press');
INSERT INTO PUBLISHER (publisher) value ('Mike Murach & Associates Inc');
INSERT INTO PUBLISHER (publisher) value ('O\'Reilly Media');
INSERT INTO PUBLISHER (publisher) value ('Prentice Hall');
INSERT INTO PUBLISHER (publisher) value ('Que');
INSERT INTO PUBLISHER (publisher) value ('Sams');
INSERT INTO PUBLISHER (publisher) value ('South-Western College/West');
INSERT INTO PUBLISHER (publisher) value ('Syngress');
INSERT INTO PUBLISHER (publisher) value ('Wiley');



INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780132447492','Computer Forensics and Cyber Crime: An Introduction',41.09,10,'2nd.','2008-10-17',408,'Completely updated in a new edition,  this book fully defines computer-related crime and the legal issues involved in its investigation. Reorganized with different chapter headings for better understanding of the subject, it provides a framework for the development of a computer crime unit. Updated with new information on technology, this book is the only comprehensive examination of computer-related crime and its investigation on the market.  <br>It includes an exhaustive discussion of legal and social issues, fully defines computer crime, and provides specific examples of criminal activities involving computers, while discussing the phenomenon in the context of the criminal justice system. Computer Forensics and Cyber Crime 2e provides a comprehensive analysis of current case law, constitutional challenges, and government legislation. New to this edition is a chapter on Organized Crime & Terrorism and how it relates to computer related crime as well as more comprehensive information on Processing Evidence and Report Preparation.'
);

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781439079010','Microsoft Excel 2010: Comprehensive',104.88,4,'1st.','2011-02-22',920,'Microsoft Office Excel 2010: Comprehensive provides a project-based, step-by-step approach to successfully teach students Microsoft Excel 2010 skills.'
);

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780596527525','Learning Web Design',26.9,9,'3rd.','2007-06-15',480,'Everything you need to know to create professional web sites is right here. Learning Web Design starts from the beginning -- defining how the Web and web pages work -- and builds from there. By the end of the book, you\'ll have the skills to create multi-column CSS layouts with optimized graphic files, and you\'ll know how to get your pages up on the Web.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780789747181','Build a Website for Free',16.23,11,'1st.','2010-11-19',360,'You need a website. But you don\�t need the hassles that usually go with building one or the expense of hiring someone else to do it. Here�s your solution: Build a Website for Free! You\�ll learn how you can use new Web 2.0 technologies to create a site that�s impressive and effective. And here\�s the best part: You\�ll do it all with software and tools that won�t cost you a dime!');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781890774424','Murach\'s Java SE 6: Training & Reference',33.08,8,'1st.','2007-04-20',832,'This book teaches how to develop Java applications at the professional level. It starts by showing how to code, test, and debug everyday business applications that won t crash. It presents object-oriented features like classes, inheritance, interfaces, and polymorphism in a way that s both understandable and useful in the real world...perspective that s often missing in Java training. It presents essential Java skills such as working with data types, control statements, arrays, collections, generics, enumerations, exceptions, threads, Swing components, applets, and text and binary files. It covers new Java SE 6 features such as new JDBC features, the StAX XML API, and the built-in Derby database. And it s all done in the distinctive Murach style that has been training professional programmers for more than 30 years.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780136088394','Modern Database Management',146.68,10,'10th.','2010-07-29',624,'Provide the latest information in database development. <br>Focusing on what leading database practitioners say are the most important aspects to database development, Modern Database Management presents sound pedagogy and includes topics that are critical for the practical success of database professionals. This text also continues to guide readers into the future by presenting research that could reveal the �next big thing?in database management.<br>The tenth edition reflects the major trends in information systems and helps readers acquire the skills the need to be successful in today�s database management field.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780131392052','Data and Computer Communications ',108.68,10,'9th.','2010-08-13',888,'Data and Computer Communications, 9e, is a two-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association. It is ideal for one/two-semester courses in Computer Networks, Data Communications, and Communications Networks in CS, CIS, and Electrical Engineering departments.<br>With a focus on the most current technology and a convenient modular format, this best-selling text offers a clear and comprehensive survey of the entire data and computer communications field. Emphasizing both the fundamental principles as well as the critical role of performance in driving protocol and network design, it explores in detail all the critical technical areas in data communications, wide-area networking, local area networking, and protocol design.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780073376820','Business Driven Information Systems ',136.84,6,'3rd.','2011-01-31',496,'Business Driven Information Systems story: Business Driven Information Systems discusses various business initiatives first and how technology supports those initiatives second. The premise for this unique approach is that business initiatives should drive technology choices. Every discussion first addresses the business needs and then addresses the technology that supports those needs. This text provides the foundation that will enable students to achieve excellence in business, whether they major in operations management, manufacturing, sales, marketing, finance, human resources, accounting, or virtually any other business discipline. Business Driven Information Systems is designed to give students the ability to understand how information technology can be a point of strength for an organization.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780735627406','Web Applications Development with Microsoft .NET Framework 4',38.17,7,'1st.','2010-12-13',1008,'Ace your preparation for the skills measured by MCTS Exam 70-515�and on the job. Work at your own pace through a series of lessons and reviews that fully cover each exam objective. Then, reinforce and apply what you�ve learned through real-world case scenarios and practice exercises. This official Microsoft study guide is designed to help you make the most of your study time.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780470074787','Systems Analysis and Design with UML',119.83,15,'3rd.','2007-03-16',600,'You can�t truly understand Systems Analysis and Design (SAD) by only reading about it; you have to do it. In Systems Analysis and Design, Third Edition, Dennis, Wixom, and Roth offer a hands-on approach to actually doing SAD. Building on their experience as professional systems analysts and award-winning teachers, these three authors capture the experience of actually developing and analyzing systems. They focus on the core set of skills that all analysts must possess��from gathering requirements and modeling business needs, to creating blueprints for how the system should be built.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781590590706','Building Client/Server Applications Under VB .NET',35.47,2,'1st.','2003-03-01',624,'Building Client/Server Applications Under .NET is based on Release 1.0 of the .NET Framework / Release 1.0 of Visual Studio .NET + .NET Framework Service Pack 1. Author Jeff Levinson walks readers through how to write a complete application - no "snippets" of code -  and will show readers examples of how, when, and why to perform a task. Building Client/Server Applications Under .NET is the step-by-step manual on software development for Enterprise application development.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780470178454','The Data Model Resource Book, Vol. 3',47.61,15,'1st.','2009-01-09',648,'This third volume of the best-selling "Data Model Resource Book" series revolutionizes the data modeling discipline by answering the question "How can you save significant time while improving the quality of any type of data modeling effort?" In contrast to the first two volumes, this new volume focuses on the fundamental, underlying patterns that affect over 50 percent of most data modeling efforts. These patterns can be used to considerably reduce modeling time and cost, to jump-start data modeling efforts, as standards and guidelines to increase data model consistency and quality, and as an objective source against which an enterprise can evaluate data models.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780123694225','Mobile Broadband Multimedia Networks: Techniques, Models and Tools for 4G',105,1,'1st.','2006-07-12',600,'Mobile Broadband Multimedia Networks: Techniques, Models and Tools for 4th Generation Communication Networks provides the main results of the prestigious and well known European COST 273 research project on the development of next generation mobile and wireless communication systems.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781890774561','Murach\'s PHP and MySQL',34.34,8,'1st.','2010-11-23',840,'This book was developed by the same team that authored Murach\'s JavaScript and DOM Scripting, and it has the same strong content organization that lets you focus on what you need to know, when you need to know it.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781890774448','Murach\'s Java Servlets and JSP',33.51,8,'2nd.','2008-01-21',758,'This new edition of Murach\'s Java Servlets and JSP makes it easier than ever for Java developers to master web programming. It starts by showing how to install and use Tomcat as a web server and NetBeans as an IDE. Then, it teaches how and when to use JavaServer Pages and Java servlets to build well-structured web applications that implement the MVC pattern. Next, it shows how to use sessions, cookies, JavaBeans, Expression Language (EL), the JSP Standard Tag Library (JSTL), and custom tags. Then, it shows how to use JDBC and connection pooling to work with a MySQL database. Finally, it shows how to use JavaMail, SSL/TLS, authentication, listeners, and filters. These are the skills that you need to build professional Java web applications. A great read for any Java developer.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9781420065503','Information Technology Control and Audit',80.74,3,'3rd.','2008-11-18',808,'The headline-grabbing financial scandals of recent years have led to a great urgency regarding organizational governance and security. Information technology is the engine that runs modern organizations, and as such, it must be well-managed and controlled. Organizations and individuals are dependent on network environment technologies, increasing the importance of security and privacy. The field has answered this sense of urgency with advances that have improved the ability to both control the technology and audit the information that is the lifeblood of modern business.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780131876712','Internetworking with TCP/IP, Vol 1',86.16,10,'5th.','2005-07-10',688,'This best-selling, conceptual introduction to TCP/IP internetworking protocols interweaves a clear discussion of fundamentals with the latest technologies. Leading author Doug Comer covers layering and shows how all protocols in the TCP/IP suite fit into the five-layer model. With a new focus on CIDR addressing, this revision addresses MPLS and IP switching technology, traffic scheduling, VOIP, Explicit Congestion Notification (ECN), and Selective ACKnowledgement (SACK). Includes coverage of Voice and Video Over IP (RTP), IP coverage, a discussion of routing architectures, examination of Internet application services such as domain name system (DNS), electronic mail (SMTP, MIME), file transfer and access (FTP, TFTP, NFS), remote login (TELNET, rlogin), and network management (SNMP, MIB, ANS.I), a description of mobile IP, and private network interconnections such as NAT and VPN. The new edition includes updates to every chapter, updated examples, a new chapter on MPLS and IP switching technology and an expanded TCP description that featuers Explicit Congestion Notification (ECN) and Selective ACKnowledgement (SACK). For network and web designers, implementers, and administrators, and for anyone interested in how the Internet works.');

INSERT INTO BOOK 
(isbn13, bookTitle, price, publisher, edition, publishDate, length, description) 
values 
('9780672321115','Applied SOAP: Implementing .NET XML Web Services',54.99,12,'1st.','2001-11-04',432,'This book takes the reader from the architecture of .NET to real-world techniques they can use in their own Internet applications. The reader is introduced to .NET and Web Services and explores (in detail) issues surrounding the fielding of successful Web Services. Practical guidelines as well as solutions are provided that the rader may use in their own projects. Some of the issues involve lack of specific guidance in the SOAP specification, while others transcend SOAP and involve issues Internet developers have grappled with since the inception of the World Wide Web. At this time, this book has no competition.');


INSERT INTO COURSEBOOK (course, book) values ('CIS 100', '9780132447492');
INSERT INTO COURSEBOOK (course, book) values ('CIS 101', '9781439079010');
INSERT INTO COURSEBOOK (course, book) values ('CIS 121', '9780596527525');
INSERT INTO COURSEBOOK (course, book) values ('CIS 122', '9780596527525');
INSERT INTO COURSEBOOK (course, book) values ('CIS 231', '9780789747181');
INSERT INTO COURSEBOOK (course, book) values ('CIS 234', '9781890774424');
INSERT INTO COURSEBOOK (course, book) values ('CIS 304', '9781890774424');
INSERT INTO COURSEBOOK (course, book) values ('CIS 305', '9780136088394');
INSERT INTO COURSEBOOK (course, book) values ('CIS 307', '9780131392052');
INSERT INTO COURSEBOOK (course, book) values ('CIS 310', '9780073376820');
INSERT INTO COURSEBOOK (course, book) values ('CIS 311', '9780735627406');
INSERT INTO COURSEBOOK (course, book) values ('CIS 315', '9780470074787');
INSERT INTO COURSEBOOK (course, book) values ('CIS 338', '9781590590706');
INSERT INTO COURSEBOOK (course, book) values ('CIS 345', '9780470178454');
INSERT INTO COURSEBOOK (course, book) values ('CIS 417', '9780123694225');
INSERT INTO COURSEBOOK (course, book) values ('CIS 424', '9781890774561');
INSERT INTO COURSEBOOK (course, book) values ('CIS 424', '9781890774448');
INSERT INTO COURSEBOOK (course, book) values ('CIS 433', '9781420065503');
INSERT INTO COURSEBOOK (course, book) values ('CIS 447', '9780131876712');
INSERT INTO COURSEBOOK (course, book) values ('CIS 451', '9780672321115');


INSERT INTO AUTHORBOOK (author, book) VALUES('1', '9780132447492');
INSERT INTO AUTHORBOOK (author, book) VALUES('2', '9781439079010');
INSERT INTO AUTHORBOOK (author, book) VALUES('3', '9780596527525');
INSERT INTO AUTHORBOOK (author, book) VALUES('4', '9780596527525');
INSERT INTO AUTHORBOOK (author, book) VALUES('5', '9780789747181');
INSERT INTO AUTHORBOOK (author, book) VALUES('6', '9781890774424');
INSERT INTO AUTHORBOOK (author, book) VALUES('7', '9781890774424');
INSERT INTO AUTHORBOOK (author, book) VALUES('8', '9781890774424');
INSERT INTO AUTHORBOOK (author, book) VALUES('9', '9780136088394');
INSERT INTO AUTHORBOOK (author, book) VALUES('10', '9780136088394');
INSERT INTO AUTHORBOOK (author, book) VALUES('11', '9780136088394');
INSERT INTO AUTHORBOOK (author, book) VALUES('12', '9780131392052');
INSERT INTO AUTHORBOOK (author, book) VALUES('13', '9780073376820');
INSERT INTO AUTHORBOOK (author, book) VALUES('14', '9780735627406');
INSERT INTO AUTHORBOOK (author, book) VALUES('15', '9780735627406');
INSERT INTO AUTHORBOOK (author, book) VALUES('16', '9780470074787');
INSERT INTO AUTHORBOOK (author, book) VALUES('17', '9780470074787');
INSERT INTO AUTHORBOOK (author, book) VALUES('18', '9780470074787');
INSERT INTO AUTHORBOOK (author, book) VALUES('19', '9781590590706');
INSERT INTO AUTHORBOOK (author, book) VALUES('20', '9780470178454');
INSERT INTO AUTHORBOOK (author, book) VALUES('21', '9780470178454');
INSERT INTO AUTHORBOOK (author, book) VALUES('22', '9780123694225');
INSERT INTO AUTHORBOOK (author, book) VALUES('6', '9781890774448');
INSERT INTO AUTHORBOOK (author, book) VALUES('7', '9781890774448');
INSERT INTO AUTHORBOOK (author, book) VALUES('6', '9781890774561');
INSERT INTO AUTHORBOOK (author, book) VALUES('23', '9781890774561');
INSERT INTO AUTHORBOOK (author, book) VALUES('24', '9781420065503');
INSERT INTO AUTHORBOOK (author, book) VALUES('25', '9781420065503');
INSERT INTO AUTHORBOOK (author, book) VALUES('26', '9780131876712');
INSERT INTO AUTHORBOOK (author, book) VALUES('27', '9780672321115');
INSERT INTO AUTHORBOOK (author, book) VALUES('28', '9780672321115');