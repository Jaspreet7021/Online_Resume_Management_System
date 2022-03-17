USE [db_resume_management]
GO
/****** Object:  StoredProcedure [dbo].[USP_COMPANY_MASTER]    Script Date: 11-03-2019 00:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

	SELECT * FROM t02_company_skill_transaction	
	SELECT * FROM M04_company_master
	SELECT * FROM t03_company_social_url_transaction


	Truncate table m04_company_master
	Truncate table t02_company_skill_transaction
*/

CREATE PROCEDURE [dbo].[USP_COMPANY_MASTER](
@action nvarchar(50)=''
,@comp_code nvarchar(20)=NULL
,@name nvarchar(100)=NULL
,@email_id nvarchar(50)=NULL
,@logo nvarchar(200)=NULL
,@about_company nvarchar(300)=NULL
,@phone nvarchar(11)=NULL
,@city_id int=0
,@profile nvarchar(100)=NULL
,@type_of_internship nvarchar(100)=NULL
,@location nvarchar(20)=NULL
,@start_date nvarchar(50)=NULL
,@skills nvarchar(100)=NULL
,@perks nvarchar(20)=NULL
,@responsibilities nvarchar(50)=NULL
,@website_url nvarchar(100)=NULL
,@facebook nvarchar(100)=NULL
,@instagram nvarchar(100)=NULL
,@linkdeln nvarchar(100)=NULL
,@youtube nvarchar(100)=NULL
,@created_by nvarchar(10)='Admin'
,@created_date date=NULL
,@is_active bit=1
)
AS
BEGIN
	DECLARE @msg nvarchar(300)
	SET @created_date=GETDATE();
	IF(UPPER(@action)='INSERT_COMPANY_DETAILS')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF NOT EXISTS(Select comp_code FROM m04_company_master WHERE comp_code=@comp_code)
				BEGIN
					IF EXISTS(Select email_id FROM m04_company_master WHERE email_id=@email_id)
					BEGIN
						SET @msg='Email id already exists.'
					END
					ELSE
					BEGIN
					   INSERT INTO m04_company_master(comp_code ,name ,email_id ,logo ,about_company ,phone ,city_id,created_by ,created_date ,is_active) 
											   VALUES(@comp_code,@name ,@email_id,@logo,@about_company,@phone ,@city_id ,@created_by ,@created_date ,@is_active)
					   
						SET @msg='SUCCESS'
					END
				END
			COMMIT
		END TRY
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH
		
		SELECT @msg AS Msg	
	END
	
	ELSE IF(UPPER(@action)='INSERT_COMPANY_SKILL')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				INSERT INTO t02_company_skill_transaction(comp_code ,[profile] ,type_of_internship ,location ,[start_date] ,skills ,perks ,responsibilities ,created_by ,created_date ,is_active)
												   VALUES(@comp_code ,@profile ,@type_of_internship ,@location ,@start_date ,@skills ,@perks ,@responsibilities ,@created_by ,@created_date ,@is_active)

					SET @msg='SUCCESS'
			COMMIT
		END TRY
			
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE();
		END CATCH

		SELECT @msg AS Msg
	END

	ELSE IF(UPPER(@action)='INSERT_COMPANY_SOCIAL_URL')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF EXISTS(SELECT comp_code FROM m04_company_master WHERE comp_code=@comp_code)
				BEGIN
					INSERT INTO t03_company_social_url_transaction(comp_code ,website_url ,facebook ,instagram ,linkdeln ,youtube ,created_by ,created_date ,is_active)
															VALUES(@comp_code ,@website_url ,@facebook ,@instagram ,@linkdeln ,@youtube ,@created_by ,@created_date ,@is_active)
					
					SET @msg='SUCCESS'
				END
			COMMIT
		END TRY
			
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE();
		END CATCH

		SELECT @msg AS Msg
	END
	
	ELSE IF(UPPER(@action)='UPDATE_COMPANY_DETAILS')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF EXISTS(SELECT comp_code FROM m04_company_master WHERE comp_code=@comp_code)
				BEGIN
					DECLARE @update_query nvarchar(1000)=''

					SET @update_query='UPDATE m04_company_master SET name='''+@name+''',email_id='''+@email_id+''', logo='''+@logo+
					''',about_company='''+@about_company+''',phone='''+@phone+''',city_id='''+CONVERT(varchar,@city_id)
					+''' WHERE comp_code='''+@comp_code+ ''''	
					PRINT(@update_query);						   
					EXEC(@update_query);
					SET @msg='SUCCESS'
				END
			COMMIT
		END TRY

		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH


		SELECT @msg AS Msg
	END
	ELSE IF(UPPER(@action)='UPDATE_COMPANY_SKILL_DETAILS')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF EXISTS(SELECT comp_code FROM m04_company_master WHERE comp_code=@comp_code)
				BEGIN
					DECLARE @update_skill nvarchar(1000)=''

					SET @update_skill='UPDATE t02_company_skill_transaction SET profile='''+@profile+''',type_of_internship='''+@type_of_internship+''', location='''+@location+
					''',start_date='''+@start_date+''',skills='''+@skills+''',perks='''+@perks+''',responsibilities='''+@responsibilities
					+''' WHERE comp_code='''+@comp_code+ ''''	
					PRINT(@update_skill);						   
					EXEC(@update_skill);

					  SET @msg='SUCCESS'
				END
				
			COMMIT
		END TRY

		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH

		SELECT @msg AS Msg
	END
	
	ELSE IF(UPPER(@action)='UPDATE_COMPANY_SOCIAL_URL_DETAILS')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF EXISTS(SELECT comp_code FROM m04_company_master WHERE comp_code=@comp_code)
				BEGIN
					DECLARE @update_url nvarchar(1000)=''

					SET @update_url='UPDATE t03_company_social_url_transaction SET website_url='''+@website_url+''',facebook='''+@facebook
					+''', instagram='''+@instagram+''',linkdeln='''+@linkdeln+''',youtube='''+@youtube+''' WHERE comp_code='''+@comp_code+ ''''	
					PRINT(@update_url);						   
					EXEC(@update_url);
					SET @msg='SUCCESS'
				END
				ELSE
				BEGIN
				   INSERT INTO t03_company_social_url_transaction(comp_code ,website_url ,facebook ,instagram ,linkdeln ,youtube ,created_by ,created_date ,is_active)
															VALUES(@comp_code ,@website_url ,@facebook ,@instagram ,@linkdeln ,@youtube ,@created_by ,@created_date ,@is_active)
					
					SET @msg='SUCCESS'

				END
			COMMIT
		END TRY

		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH


		SELECT @msg AS Msg
	END
	ELSE IF(UPPER(@action)='SELECT_REGISTERED_COMPANY')
	BEGIN
		SELECT M04.comp_code,M04.name,M04.email_id
		FROM m04_company_master AS M04
		INNER JOIN t03_company_social_url_transaction AS T03 ON T03.comp_code=M04.comp_code
	END
	
	ELSE IF(UPPER(@action)='SELECT_COMPANY_WITH_CODE')
	BEGIN
		SELECT M04.comp_code,M04.name,M04.email_id,M04.about_company,M06.city,M04.phone,M04.logo
		FROM m04_company_master AS M04
		INNER JOIN m06_city_master AS M06 ON M06.city_id=M04.city_id  WHERE M04.comp_code=@comp_code
	END

	ELSE IF(UPPER(@action)='SELECT_COMPANY_URL_WITH_CODE')
	BEGIN
		SELECT facebook,instagram,linkdeln,website_url,youtube
		FROM t03_company_social_url_transaction WHERE comp_code=@comp_code
	END
	
	ELSE IF(UPPER(@action)='SELECT_COMPANY_PROFILE')
	BEGIN
		SELECT comp_code,[profile],type_of_internship FROM t02_company_skill_transaction
	END	
	
	ELSE IF(UPPER(@action)='SELECT_COMPANY_URL')
	BEGIN
		SELECT comp_code,facebook,website_url,instagram,linkdeln,youtube FROM t03_company_social_url_transaction
	END

	ELSE IF(UPPER(@action)='SELECT_COMPANY_PROFILE_WITH_CODE')
	BEGIN
		SELECT * FROM t02_company_skill_transaction WHERE comp_code=@comp_code
	END	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_DDL_SELECT]    Script Date: 11-03-2019 00:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	  SELECT * FROM t02_company_Skill_transaction
	  TRUNCATE TABLE t01_resume_skill_transaction
	  EXEC USP_DDL_SELECT 'SELECT_CITY_HAVING_DATA','lore','part time' 
*/
CREATE PROCEDURE [dbo].[USP_DDL_SELECT](
   @action nvarchar(50)
   ,@location nvarchar(100)=NULL
   ,@type_of_internship nvarchar(100)=NULL
   ,@profile nvarchar(100)=NULL
   ,@country nvarchar(200)=NULL
   ,@state nvarchar(200)=NULL
   ,@city nvarchar(200)=NULL
   ,@city_id int=0
   ,@state_id int=0
   ,@country_id int=0
   ,@is_active bit=1
   ,@created_date datetime=NULL
   ,@created_by nvarchar(6)=Admin
)
AS
BEGIN
	SET @created_date=GETDATE()
	IF(UPPER(@action)='SELECT_COUNTRY')
	BEGIN
		SELECT country_id,country FROM m05_country_master
	END
	ELSE IF(UPPER(@action)='SELECT_STATE')
	BEGIN
		SELECT state_id,[state] FROM m08_state_master
	END
	ELSE IF(UPPER(@action)='SELECT_CITY')
	BEGIN
		SELECT city_id,city FROM m06_city_master
	END
	ELSE IF(UPPER(@action)='SELECT_CITY_HAVING_DATA')
	BEGIN
		SELECT M04.logo,M04.name,T02.location,T02.perks,T02.[start_date] 
		FROM m04_company_master AS M04
		INNER JOIN t02_company_skill_transaction AS T02 on T02.comp_code=M04.comp_code 
		WHERE location Like '%'+ @location +'%' AND type_of_internship Like '%'+ @type_of_internship +'%' AND
		profile Like '%'+ @profile +'%'  
	END

  END

GO
/****** Object:  StoredProcedure [dbo].[USP_GENDER_MASTER]    Script Date: 11-03-2019 00:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	INSERT INTO m09_gender_master(gender) VALUES('Female')
	 ALTER TABLE m01_user_master ADD gender_id int
	 SELECT * FROM m01_user_master
	SELECT * FROM m09_gender_master
*/

CREATE PROCEDURE [dbo].[USP_GENDER_MASTER](
@action nvarchar(50)
,@gender nvarchar(10)=NULL
,@created_by nvarchar(10)='Admin'
,@created_date date=NULL
,@is_active bit=1 
)
AS
BEGIN
	DECLARE @msg nvarchar(500)
	SET @created_date=GETDATE()
	IF(UPPER(@action)='SELECT_GENDER')
	BEGIN
		SELECT gender_id,gender FROM m09_gender_master
	END	
	/*
		ELSE IF(UPPER(@action)='VACANY_FOR_FEMALE')
	BEGIN
		
	END
	*/
	
END


GO
/****** Object:  StoredProcedure [dbo].[USP_LOGIN_MASTER]    Script Date: 11-03-2019 00:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	SELECT * FROM m01_user_master
	SELECT * FROM m07_login_master
*/


CREATE PROCEDURE [dbo].[USP_LOGIN_MASTER](
 @action nvarchar(50)=''
 ,@user_code nvarchar(20)=NULL
 ,@email_id nvarchar(50)=NULL
 ,@password nvarchar(500)=NULL
 ,@name nvarchar(100)=NULL
 ,@created_by nvarchar(10)='Admin'
 ,@created_date date=NULL
 ,@is_active bit=1
) 
AS
BEGIN
	DECLARE @msg nvarchar(300)
	IF(UPPER(@action)='ON_LOGIN')
	BEGIN
		IF(@email_id!='' and @password!='')
		BEGIN
			IF EXISTS(SELECT email_id FROM m07_login_master WHERE email_id=@email_id)
			BEGIN
				IF EXISTS(SELECT [password] FROM m07_login_master WHERE [password]=@password)
				BEGIN
					SET @msg='SUCCESS'
					SELECT @user_code=user_code,@name=name FROM m01_user_master WHERE email_id=@email_id
				END
				ELSE
				BEGIN
					SET @msg='Please enter correct password.'
				END
			END
			ELSE
			BEGIN
				SET @msg='Please enter correct email id. '
			END
		END
		ELSE
		BEGIN
		   SET @msg='Please enter value in fields.'
		END
		SELECT @msg AS msg,@user_code AS user_code,@name AS name
	END
END


GO
/****** Object:  StoredProcedure [dbo].[USP_USER_MASTER]    Script Date: 11-03-2019 00:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*	
ALTER TABLE m01_user_master ALTER COLUMN DOB nvarchar(20) 
	SELECT * FROM m01_user_master
	SELECT * FROM m02_user_contact_master
	SELECT * FROM m07_login_master
	SELECT * FROM t01_resume_skill_transaction
	SELECT * FROM m09_gender_master
	EXEC USP_USER_MASTER 'INSERT_USER','STU100','jaspreet','3/2/2019','jassinghmalhotra1@gmail.com','password','8821807243','address',1,1,1
	TRUNCATE TABLE m01_user_master
	TRUNCATE TABLE m02_user_contact_master
	TRUNCATE TABLE m07_login_master
	TRUNCATE TABLE t01_resume_skill_transaction
	EXEC USP_USER_MASTER 'UPDATE_USER','STU1001','abhishek','4/2/2019','jassinghmalhotra@gmail.com','7748042888','address',1,1,1,


*/
CREATE PROCEDURE [dbo].[USP_USER_MASTER](
@action nvarchar(50)
,@education nvarchar(1000)=NULL
,@language nvarchar(200)=NULL
,@skills nvarchar(MAX)=NULL
,@professional_summary nvarchar(MAX)=NULL
,@certificate nvarchar(MAX)=NULL
,@project nvarchar(MAX)=NULL
,@training nvarchar(MAX)=NULL
,@additional_details nvarchar(MAX)=NULL
,@hobbies nvarchar(200)=NULL
,@objective nvarchar(MAX)=NULL
,@strengths nvarchar(MAX)=NULL
,@user_code nvarchar(20)=NULL
,@name nvarchar(100)=NULL
,@DOB nvarchar(20)=NULL
,@email_id nvarchar(100)=NULL
,@password nvarchar(500)=NULL
,@mobile nvarchar(11)=NULL
,@gender_id int=0 
,@address nvarchar(100)=NULL
,@city_id int=0
,@state_id int=0
,@country_id int=0

,@created_by nvarchar(10)='Admin'
,@created_date date=NULL
,@is_active bit=1
) 

AS

BEGIN
	DECLARE @msg nvarchar(500)

	SET @created_date=GETDATE()

	IF(UPPER(@action)='INSERT_USER')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				IF NOT EXISTS(Select user_code FROM m01_user_master WHERE user_code=@user_code)
				BEGIN
					IF EXISTS(Select email_id FROM m01_user_master WHERE email_id=@email_id)
					BEGIN
						SET @msg='Email id already exists.'
					END
					ELSE
					BEGIN
					   INSERT INTO m01_user_master(user_code ,name ,DOB ,email_id,[password] ,mobile,gender_id,created_by,created_date,is_active) 
											VALUES(@user_code ,@name ,@DOB ,@email_id,@password,@mobile,@gender_id,@created_by,@created_date,@is_active)

					   INSERT INTO m02_user_contact_master(user_code,[address],city_id,state_id,country_id,created_by,created_date,is_active)
													VALUES(@user_code,@address,@city_id,@state_id,@country_id,@created_by,@created_date,@is_active)
						SET @msg='SUCCESS'
					END
				END
				
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH
		SELECT @msg as Msg
	END

	ELSE IF(UPPER(@action)='SELECT_USER_WITH_CONTACT')
	BEGIN
		SELECT M01.user_code ,name ,DOB ,email_id ,mobile,[address],M06.city,M08.state 
		FROM m01_user_master AS M01
		INNER JOIN m02_user_contact_master AS M02 ON M02.user_code=M01.user_code
		INNER JOIN m06_city_master AS M06 ON M02.city_id=M06.city_id
		INNER JOIN m08_state_master AS M08 ON M02.state_id=M06.state_id
		
	END

	ELSE IF(UPPER(@action)='SELECT_USER_WITH_USER_CODE')
	BEGIN
	IF NOT EXISTS(SELECT user_code FROM t01_resume_skill_transaction WHERE user_code=@user_code)
	BEGIN
		 INSERT INTO t01_resume_skill_transaction(user_code) VALUES(@user_code)
	END
		SELECT M01.user_code,T01.education,T01.additional_details,T01.certificate,T01.hobbies,T01.language,T01.professional_summary,
		T01.project,T01.skills,T01.training,T01.objective,T01.strengths,
		name ,DOB ,email_id,m01.gender_id,mobile,[address],M06.city,M08.state 
		FROM m01_user_master AS M01
		INNER JOIN t01_resume_skill_transaction AS T01 ON T01.user_code=M01.user_code
		INNER JOIN m02_user_contact_master AS M02 ON M02.user_code=M01.user_code
		INNER JOIN m06_city_master AS M06 ON M02.city_id=M06.city_id
		INNER JOIN m08_state_master AS M08 ON M02.state_id=M06.state_id WHERE M01.user_code=@user_code
		
	END

	ELSE IF(UPPER(@action)='SELECT_USER_WITH_RESUME')
	BEGIN
		SELECT M01.user_code ,M01.name ,M01.DOB ,M01.email_id ,M01.mobile,M02.[address],M02.city_id,M02.state_id,
		T01.additional_details,T01.[certificate],T01.education,T01.hobbies,T01.[language],T01.professional_summary,
		T01.project,T01.skills,T01.objective,T01.strengths 
		FROM m01_user_master AS M01
		INNER JOIN m02_user_contact_master AS M02 ON M02.user_code=M01.user_code
		INNER JOIN t01_resume_skill_transaction AS T01 ON T01.user_code=M01.user_code
	END
	ELSE IF(UPPER(@action)='UPDATE_USER')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				DECLARE @update_query nvarchar(1000)='',@update_query_contact nvarchar(1000)='',@field1 nvarchar(500)=''
				IF EXISTS(Select user_code FROM m01_user_master WHERE user_code=@user_code)
				BEGIN
					SET @update_query='UPDATE m01_user_master SET name='''+@name+''', DOB='''+ @DOB+''',email_id='''+@email_id+
					''', mobile='''+@mobile+''' WHERE user_code='''+@user_code+ ''''	
					PRINT(@update_query);						   
					EXEC(@update_query);

					SET @update_query_contact='UPDATE m02_user_contact_master SET address='''+@address+''', city_id='''+ CONVERT(varchar,@city_id)
					+''',state_id='''+CONVERT(varchar,@state_id)+''', country_id='''+CONVERT(varchar,@country_id)+''' WHERE user_code='''+@user_code+ ''''	
					PRINT(@update_query_contact);						   
					EXEC(@update_query_contact);
					
					SET @msg='SUCCESS'
				END
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH
		SELECT @msg as Msg
	END

	ELSE IF(UPPER(@action)='UPDATE_RESUME')
	BEGIN
		DECLARE @update_query_skills nvarchar(1000)='' 
			IF NOT EXISTS(SELECT user_code FROM t01_resume_skill_transaction WHERE user_code=@user_code)
					BEGIN
						INSERT INTO t01_resume_skill_transaction(user_code,education,[language],skills,professional_summary,
																[certificate],project,training,additional_details,hobbies,objective,strengths)

														  VALUES(@user_code,@education,@language,@skills,@professional_summary,
														  @certificate,@project,@training,@additional_details,@hobbies,@objective,@strengths)
							SET @msg='SUCCESS'
					END
					ELSE 
					BEGIN
						UPDATE t01_resume_skill_transaction SET education=@education,language=@language,skills=@skills,
						professional_summary=professional_summary,certificate=@certificate,project=@project,training=@training
						,additional_details=@additional_details,hobbies=@hobbies,objective=@objective,strengths=@strengths
						 WHERE user_code=@user_code

						PRINT(@update_query_skills);
						EXEC(@update_query_skills);

						SET @msg='SUCCESS'
					END
					SELECT @msg AS msg
	END

	ELSE IF(UPPER(@action)='DELETE_USER')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				DELETE FROM m01_user_master WHERE user_code=@user_code
				DELETE FROM m02_user_contact_master WHERE user_code=@user_code
				DELETE FROM t01_resume_skill_transaction WHERE user_code=@user_code
				SET @msg='SUCCESS'
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE()
		END CATCH
		SELECT @msg as Msg
	END
	ELSE IF(UPPER(@action)='UPDATE_PASSWORD')
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				UPDATE m01_user_master SET @password=[password] WHERE user_code=@user_code
				SET @msg='SUCCESS'
			COMMIT TRANSACTION
		END TRY

		BEGIN CATCH
			ROLLBACK;
			SET @msg=ERROR_MESSAGE();
		END CATCH
		SELECT @msg AS Msg
	END
END


GO
