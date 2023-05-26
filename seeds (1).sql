
INSERT INTO newspaper VALUES ('Daily News','1','John Papas','john@gmail.com'),
('Mega City Times','7','Nikos Kalogeropoulos','goerge@gmail.com');


INSERT INTO magazine VALUES ('Daily News',5,'2020-02-07',15,400,NULL),
('Daily News',14,'2020-01-07',25,1100,NULL),
('Mega City Times',3,'2020-03-07',10,1000,NULL),
('Mega City Times',5,'2020-02-07',20,1000,200);


INSERT INTO category VALUES (NULL,'Economy',NULL,NULL),
(NULL,'Education',NULL,NULL),
(NULL,'History',NULL,NULL),
(NULL,'Sports',NULL,NULL),
(NULL,'Basketball',NULL,1),
(NULL,'Football',NULL,4);


INSERT INTO article VALUES ('accepted','Ancient Culture in Greece','C:UsersBeleDocumentsAsk 1.4.cpp',5,1,5,'Mega City Times',NULL,NULL,'ancient,greece',2),
('applied','Panathinaikos Team','C:UsersBeleDocumentsAsk 1.4.exe',6,NULL,5,'Mega City Times',NULL,NULL,'basketball,euroleague,sports',6),
('accepted','Education in Third Countries','C:UsersBeleDocumentsAsk 1.5.cpp',3,2,5,'Mega City Times',NULL,NULL,'education,third countries',2),
('applied','Historical Places in Greece','C:UsersBeleDocumentsC programsset2ask1',9,NULL,5,'Mega City Times',NULL,NULL,NULL,2),
('applied','Educational Issues','C:UsersBeleDocumentsMicroEmulator.exe',4,NULL,5,'Mega City Times',NULL,NULL,NULL,2),
('accepted','Vintage books','C:UsersBeleDocumentsmycopy.c',3,4,5,'Mega City Times',NULL,NULL,'books,historical',2),
('accepted','Vintage Book the comeback','C:UsersBeleDocumentsuntitled-1.synctex.gz',3,3,5,'Mega City Times',NULL,NULL,NULL,2),
('accepted','Teams in Euroleague with te highest budget','C:UsersΗλιάναDocumentsudget',3,2,3,'Mega City Times',NULL,NULL,'',6),
('accepted','Chichipas Won','C:UsersΗλιάναDocumentschichipas',3,1,5,'Daily News',NULL,NULL,'',4),
('accepted','Big 4 meeting in Hilton','C:UsersΗλιάναDocumentsmathch',2,1,3,'Mega City Times',NULL,NULL,'',4),
('applied','Edutional Issues in Spain','C:UsersΗλιάναDocumentsspainEducation',3,NULL,3,'Mega City Times',NULL,NULL,'',2),
('accepted','My experience as a volunteer','C:UsersΗλιάναDocumentsvolunteer',5,1,14,'Daily News',NULL,NULL,'',2);

INSERT INTO worker VALUES ('Chris','Anastatiou','anastasiou@yahoo.com',32,'2019-08-01',650,'anastasiou','anastasiou'),
('Chris','Belefantis','chrisbelefadis@gmail.com',10,'2019-08-01',5850,'chris','chris'),
('Goerge','Gourniezakis','goerge@gmail.com',20,'2019-10-08',8450,'giorgos','giorgos'),
('Jim','Panopoulos','jim@yahkoo.gr',5,'2019-02-02',650,'jim','jim'),
('John','Panopoulos','john@gmail.com',5,'2019-09-02',650,'john','john'),
('Micheal ','Jonshon','jonshon@yahoo.com',5,'2019-10-08',3575,'sumi','sumi'),
('Mairy','Pavlopoulou','mairi@yhoo.gr',4,'2019-08-01',650,'mairi','mairi'),
('Maria','Pantopoulou','maria@yahoo.com',12,'2019-08-01',6500,'maria','maria'),
('Marios','Xristou','marios@gmail.com',3,'2019-10-08',650,'marios','marios'),
('Pavlos','Pavlou','pavlos@gmail.com',4,'2019-10-08',650,'pavlos','pavlos');

INSERT INTO journalist VALUES ('anastasiou@yahoo.com','BA in Journalism-Served as Assistant Editor and Staff Reporter for The ABC University Daily throughout college-Can work under pressure',1),
('chrisbelefadis@gmail.com','Bachelor Degree from American College of Greece-Five years of experience-Fast Leaner-Can work under pressure-Several volunteering activities.',1),
('jonshon@yahoo.com','Master of Arts in Specialized Journalism-Fast Learner-Have worked in several newspapers',0),
('mairi@yhoo.gr','Master of Arts in Specialized Journalism-BA in Journalism-Creative writing style and excellent reporting skills-Member of Society of Professional Journalists since 2015',0),
('maria@yahoo.com','Bachelor Degree in Informatics-Very talented-Have worked in several newspapers-Member of Society of Professional Journalists since 2015',0);



INSERT INTO submits VALUES ('anastasiou@yahoo.com','C:UsersΗλιάναDocumentschichipas','2020-02-11'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsAsk 1.4.cpp','2020-01-07'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsAsk 1.4.exe','2020-01-07'),
('chrisbelefadis@gmail.com','C:UsersΗλιάναDocumentsudget','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersΗλιάναDocumentsmathch','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersΗλιάναDocumentsspainEducation','2020-02-09'),
('jonshon@yahoo.com','C:UsersBeleDocumentsAsk 1.4.cpp','2020-01-07'),
('jonshon@yahoo.com','C:UsersBeleDocumentsuntitled-1.synctex.gz','2020-01-08'),
('jonshon@yahoo.com','C:UsersΗλιάναDocumentsspainEducation','2020-02-09'),
('mairi@yhoo.gr','C:UsersΗλιάναDocumentschichipas','2020-02-11'),
('mairi@yhoo.gr','C:UsersΗλιάναDocumentsvolunteer','2020-02-11'),
('maria@yahoo.com','C:UsersBeleDocumentsAsk 1.4.exe','2020-01-07'),
('maria@yahoo.com','C:UsersBeleDocumentsAsk 1.5.cpp','2020-01-07'),
('maria@yahoo.com','C:UsersBeleDocumentsC programsset2ask1','2020-01-12'),
('maria@yahoo.com','C:UsersBeleDocumentsMicroEmulator.exe','2020-01-08'),
('maria@yahoo.com','C:UsersBeleDocumentsmycopy.c','2020-01-08'),
('maria@yahoo.com','C:UsersBeleDocumentsuntitled-1.synctex.gz','2020-01-08');

INSERT INTO publisher VALUES ('goerge@gmail.com'),('john@gmail.com');

INSERT INTO approves VALUES ('anastasiou@yahoo.com','C:UsersΗλιάναDocumentschichipas','2020-02-11'),
('anastasiou@yahoo.com','C:UsersΗλιάναDocumentsvolunteer','2020-02-11'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsAsk 1.4.cpp','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsAsk 1.5.cpp','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsmycopy.c','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersBeleDocumentsuntitled-1.synctex.gz','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersΗλιάναDocumentsudget','2020-02-09'),
('chrisbelefadis@gmail.com','C:UsersΗλιάναDocumentsmathch','2020-02-09');


INSERT INTO pictures VALUES ('C:UsersΗλιάναchichipas1','C:UsersΗλιάναDocumentschichipas'),
('C:UsersΗλιάναDocumentschichipas2','C:UsersΗλιάναDocumentschichipas');

INSERT INTO administration VALUES ('Logistics','Polibiou',35,'Athens','marios@gmail.com'),
('Logistics','Papaflessa',128,'Patra','pavlos@gmail.com');

INSERT INTO phones VALUES (694341333,'marios@gmail.com'),
(694345333,'pavlos@gmail.com');

INSERT INTO working VALUES ('Daily News','anastasiou@yahoo.com'),
('Mega City Times','chrisbelefadis@gmail.com'),
('Mega City Times','goerge@gmail.com'),
('Mega City Times','jim@yahkoo.gr'),
('Daily News','john@gmail.com'),
('Mega City Times','jonshon@yahoo.com'),
('Daily News','mairi@yhoo.gr'),
('Mega City Times','maria@yahoo.com'),
('Mega City Times','marios@gmail.com'),
('Daily News','pavlos@gmail.com');
