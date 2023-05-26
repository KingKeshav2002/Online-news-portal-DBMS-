drop procedure if exists setColumnist;

DELIMITER $
CREATE PROCEDURE setColumnist(IN newColumnist varchar(30),IN papername varchar(30))
BEGIN
   DECLARE count INT(2);
    DECLARE finishedFlag INT;
    DECLARE email VARCHAR(30);
    DECLARE columnist INT(1);
    
    DECLARE journalistCursor CURSOR FOR select journalistEmail,isColumnist from journalist
    inner join working on journalist.journalistEmail = working.workerEmail
    where newspaperName=papername ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedFlag = 1;
    
    SELECT count(*) INTO count from journalist;
    

    
    
    OPEN journalistCursor;
    SET finishedFlag=0;
    	
	FETCH journalistCursor into email,columnist;
	WHILE (finishedFlag=0) DO
		

		
		if(columnist=1) then
			
			UPDATE journalist SET isColumnist=0 WHERE journalistEmail=email;
		
		END IF;
		
        	FETCH journalistCursor into email,columnist;
        
	END WHILE;
	UPDATE journalist SET isColumnist=1 where journalistEmail=newColumnist;
	
END$


DELIMITER ;

drop procedure if exists magazineInfo;
DELIMITER $

create procedure magazineInfo(IN magazinenumber int,IN namenewspaper varchar(30))
begin
 declare nf int;
 declare titleArticle varchar(200);
 declare nameJournalistArticle varchar(30);
 declare lastnameJournalistArticle varchar(30);
 declare approveDate DATE;
 declare lengthArticle int(9);
 declare startPageArticle int(9);
 declare currentPath varchar(200);
 declare previousPath varchar(200);
 declare totalPages int(9);
 declare SM int(9);
 

 declare lcursor cursor for select Name,Lastname,date,title,length,path from submits
 inner join article on submittedArticle = path inner join Worker 
 on submits.journalistSubEmail=Worker.Email
 where magazine=magazinenumber and newspaper=namenewspaper and state="accepted" order by position;
 declare continue handler for not found set nf=1;
 set previousPath="NULL";
 set startPageArticle=0;
 set nf=0;
 set SM=0;
 open lcursor;

   fetch lcursor into nameJournalistArticle,lastnameJournalistArticle,approveDate,titleArticle,lengthArticle,currentPath;	
   WHILE (nf=0) DO

        IF (currentPath != previousPath) THEN 
           
          select nameJournalistArticle,lastnameJournalistArticle,approveDate,titleArticle,lengthArticle,startPageArticle;
		  set startPageArticle=startPageArticle + lengthArticle;

        END IF;

        set previousPath=currentPath;

	fetch lcursor into nameJournalistArticle,lastnameJournalistArticle,approveDate,titleArticle,lengthArticle,currentPath;
   END WHILE;


  select pages into totalPages from magazine where magazineNum=magazinenumber and newspaperName = namenewspaper;
  
  

   if(totalPages - startPageArticle <= 0) then
	SELECT "false" as hasMoreSpace;
   
   elseif(totalPages - startPageArticle > 0)then
	SELECT "true" as hasMoreSpace, totalPages - startPageArticle as availablePages;
	

	
   end if;
 close lcursor;
end$
delimiter ;
  



drop procedure if exists salaryCalculator;

delimiter $
create procedure salaryCalculator(in workerEmail varchar(50))
begin
	
	declare monthsBeforeRecruitment int(4);
	declare workerRecruitmentDate date;
	declare monthsAfterRecruitment int(4);
	declare totalMonths int(4);
	declare currentSalary int(6);
	declare newSalary int(6);



	select priorExperience into monthsBeforeRecruitment from worker where email = workerEmail;
	select recruitmentDate into workerRecruitmentDate from worker where email = workerEmail;
	select Salary into currentSalary from worker where email = workerEmail;

	SELECT TIMESTAMPDIFF(MONTH, workerRecruitmentDate, NOW()) into monthsAfterRecruitment;

	SELECT monthsBeforeRecruitment,monthsAfterRecruitment;

	set totalMonths = monthsBeforeRecruitment + monthsAfterRecruitment;
	set newSalary = currentSalary + (currentSalary*0.5)*totalMonths;
	SELECT monthsBeforeRecruitment,monthsAfterRecruitment,newSalary;

	update worker set salary = newSalary where email = workerEmail;



end$

delimiter ; 



drop trigger if exists salarySetter;
 delimiter $

 create trigger salarySetter
 after insert on working
 for each row 
 begin

 	update worker set salary = 650 where email = new.workerEmail;


 end$

 delimiter ;





drop trigger if exists columnisttArticleTrigger;
delimiter $

create trigger columnisttArticleTrigger
before insert on submits
for each row
begin

	declare isaColumnist INT(1);
	declare columnistEmail VARCHAR(50);
	SET isaColumnist = 0;

	select isColumnist,journalistEmail into isaColumnist,columnistEmail from journalist where journalistEmail=NEW.journalistSubEmail;


	IF isaColumnist=1 THEN


		insert into approves values(columnistEmail,NEW.submittedArticle,now());
		update article set state = 'accepted' where path = NEW.submittedArticle;


	END IF;

end$

 delimiter ;








drop trigger if exists insertArticleTrigger;
delimiter $

create trigger insertArticleTrigger
before update on article
for each row
begin

	declare magazineSpace int(10);
	declare currentFullSpace int(10);
	declare availableSpace int(10);
	declare positionCount int(3);
	declare articleLength int(10);
	
		
		
	select count(position) into positionCount from article where magazine = new.magazine;
	



	if(new.state = "accepted" and old.state <> "accepted") then

		select pages into magazineSpace from magazine where magazineNum = new.magazine and newspaperName = new.newspaper;	
		select sum(length) into currentFullSpace from article where state = 'accepted' and magazine = new.magazine and newspaper = new.newspaper;
		select new.length into articleLength;

		if(currentFullSpace is NULL) then

			set currentFullSpace = 0;

		end if;



		set availableSpace = magazineSpace - currentFullSpace;

		if(availableSpace - articleLength >=0) then

			set new.position = positionCount + 1;

		else 
			
			insert into submits values(null);


		end if;	


	end if;


	


end$

delimiter ;



drop procedure if exists journalistArticles;
delimiter $

create procedure journalistArticles(IN journalistEmail VARCHAR(30))
begin
	

	declare secondAuthor varchar(30);
	declare articlesPath varchar(200);

	declare stateP varchar(30);
	declare titleP varchar(200);
	declare magazineP int(4);
	declare positionP int(3);
	declare categoryP int(2);
	declare journalistEmailP varchar(30);
	declare pathP varchar(200);
	declare flag1 int(2);



	declare journalistArticlesC cursor for
	select state,title,magazine,position,category,journalistSubEmail,path
	from article
	inner join submits on article.path = submits.submittedArticle
	where journalistSubEmail = journalistEmail
	order by state,path asc;
	declare continue handler for not found set flag1=1;

	
	open journalistArticlesC;
	
	fetch journalistArticlesC into stateP,titleP,magazineP,positionP,categoryP,journalistEmailP,pathP;
	set flag1 = 0;
	set secondAuthor = "none";


	while(flag1 = 0) do


		select journalistSubEmail into secondAuthor
		from article 
		inner join submits on article.path = submits.submittedArticle
		where path = pathP and journalistSubEmail <> journalistEmailP;
		set flag1 = 0;

		select stateP,titleP,magazineP,positionP,categoryP,secondAuthor,journalistEmailP,pathP;

	
		fetch journalistArticlesC into stateP,titleP,magazineP,positionP,categoryP,journalistEmailP,pathP;
		set secondAuthor = "none";

	end while;



end$



delimiter ;





