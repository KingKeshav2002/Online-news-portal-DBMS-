

DROP DATABASE IF EXISTS newspaper;

CREATE DATABASE newspaper;

USE newspaper;

CREATE TABLE newspaper (
  Name varchar(30) NOT NULL DEFAULT 'Unknown',
  publishFrequency enum('1','7','15','30') NOT NULL,
  Owner varchar(30) NOT NULL DEFAULT 'Unknown',
  publisher varchar(30) NOT NULL,
  PRIMARY KEY (Name),
  KEY NESWPAPERPUBLISHER (publisher),
  CONSTRAINT PUBSHERCONSTRAINT FOREIGN KEY (publisher) REFERENCES publisher (publisherEmail)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB ;





CREATE TABLE worker (
  Name varchar(30) NOT NULL DEFAULT 'Unknown',
  Lastname varchar(30) NOT NULL DEFAULT 'Unknown',
  Email varchar(30) NOT NULL,
  priorExperience int(4) NOT NULL,
  recruitmentDate date NOT NULL,
  Salary int(9) DEFAULT NULL,
  Username varchar(30) NOT NULL,
  Password varchar(30) NOT NULL,
  PRIMARY KEY (Email),
   UNIQUE KEY Username_UNIQUE (Username)
)ENGINE=InnoDB;


CREATE TABLE journalist (
  journalistEmail varchar(30) NOT NULL,
  resume text,
  isColumnist tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (journalistEmail)
)ENGINE=InnoDB;

CREATE TABLE publisher (
  publisherEmail varchar(30) NOT NULL,
  PRIMARY KEY (publisherEmail)
)ENGINE=InnoDB;




CREATE TABLE working (
  newspaperName varchar(30) NOT NULL DEFAULT 'Unknown',
  workerEmail varchar(35) NOT NULL,
  PRIMARY KEY (newspaperName,workerEmail),
  CONSTRAINT NAMECONSTRAINT FOREIGN KEY (newspaperName) REFERENCES newspaper (Name) 
  ON DELETE CASCADE ON UPDATE CASCADE, 
  CONSTRAINT EMAILCONSTRAINT FOREIGN KEY (workerEmail) REFERENCES worker (email) 
  ON DELETE CASCADE ON UPDATE CASCADE	
) ENGINE=InnoDB ;


CREATE TABLE magazine (
  newspaperName varchar(30) NOT NULL DEFAULT 'Unknown',
  magazineNum int(9) NOT NULL,
  publishDate date NOT NULL,
  pages int(9) NOT NULL DEFAULT '30',
  magazinesPrinted int(9) NOT NULL,
  magazinesReturned int(9) DEFAULT NULL,
  PRIMARY KEY (newspaperName,magazineNum),
  CONSTRAINT NEWSPAPERCONSTAINT FOREIGN KEY (newspaperName) REFERENCES newspaper (Name)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB ;


CREATE TABLE category (
  id int(3) NOT NULL AUTO_INCREMENT,
  categoryTitle varchar(45) NOT NULL,
  description tinytext,
  isSubcategoryOf int(3) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY categoryTitle_UNIQUE (categoryTitle),
  KEY isSupercategoryOf_idx (isSubcategoryOf),
  CONSTRAINT SUPERCLASSCONSTRAINT FOREIGN KEY (isSubcategoryOf) REFERENCES category (id)
) ENGINE=InnoDB ;




 CREATE TABLE article (
  state enum('accepted','rejected','applied') NOT NULL,
  title varchar(200) NOT NULL,
  path varchar(200) NOT NULL DEFAULT 'Unknown',
  length int(9) NOT NULL,
  position int(2) DEFAULT NULL,
  magazine int(4) NOT NULL,
  newspaper varchar(30) NOT NULL,
  comments text,
  summary text,
  keyWords varchar(200) DEFAULT NULL,
  category int(3) NOT NULL,
  PRIMARY KEY (path),
  KEY ARTICLEMAGAZINE (newspaper,magazine),
  KEY CATEGORYCONSTRAINT_idx (category),
  CONSTRAINT ARTICLECATEGORY FOREIGN KEY (category) REFERENCES category (id)
   ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ARTICLEMAGAZINE FOREIGN KEY (newspaper, magazine) 
  REFERENCES magazine (newspaperName, magazineNum)
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB ;




CREATE TABLE submits (
  journalistSubEmail varchar(30) NOT NULL,
  submittedArticle varchar(200) NOT NULL DEFAULT 'Unknown',
  Date date DEFAULT NULL,
  PRIMARY KEY (journalistSubEmail,submittedArticle),
  KEY SUBMITARTICLE (submittedArticle),
  CONSTRAINT ARTICLECONSTRAINT FOREIGN KEY (submittedArticle) REFERENCES article (path)  
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT SUBEMAILCONSTRAINT FOREIGN KEY (journalistSubEmail) REFERENCES journalist (journalistEmail)
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

  CREATE TABLE approves (
  journalistEmail varchar(30) NOT NULL,
  articlePath varchar(200) NOT NULL,
  date date DEFAULT NULL,
  PRIMARY KEY (journalistEmail,articlePath),
  KEY APPROVESARTICLEPATH (articlePath),
  CONSTRAINT APPROVESARTICLEPATH FOREIGN KEY (articlePath) REFERENCES article (path)
   ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT APPROVESJOURNALIST FOREIGN KEY (journalistEmail) REFERENCES journalist (journalistEmail) 
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;



 CREATE TABLE pictures (
  picture varchar(200) NOT NULL,
  pathOfArticle varchar(200) NOT NULL,
  PRIMARY KEY (pathOfArticle,picture),
  CONSTRAINT PICTUREARTICLE FOREIGN KEY (pathOfArticle) REFERENCES article (path) 
  ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;


CREATE TABLE administration (
  Duties enum('Secretary','Logistics') NOT NULL,
  Street varchar(30) NOT NULL,
  Number int(9) NOT NULL,
  City varchar(30) NOT NULL,
  adminEmail varchar(30) NOT NULL,
  PRIMARY KEY (adminEmail),
  CONSTRAINT ADMINISTRATIONWORKER FOREIGN KEY (adminEmail) REFERENCES worker (Email)
   ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;



CREATE TABLE phones (
  Phone int(10) NOT NULL,
  Email varchar(30) NOT NULL,
  PRIMARY KEY (Phone,Email),
  KEY PHONESADMIN (Email),
  CONSTRAINT PHONESADMIN FOREIGN KEY (Email) REFERENCES administration (adminEmail)
   ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

















