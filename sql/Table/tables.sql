USE [db_resume_management]
GO
/****** Object:  Table [dbo].[m01_user_master]    Script Date: 11-03-2019 01:07:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m01_user_master](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[DOB] [nvarchar](20) NULL,
	[email_id] [nvarchar](100) NOT NULL,
	[mobile] [nvarchar](11) NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
	[password] [nvarchar](500) NULL,
	[gender_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m02_user_contact_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m02_user_contact_master](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nvarchar](20) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[city_id] [int] NOT NULL,
	[state_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m04_company_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m04_company_master](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[comp_code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[logo] [nvarchar](200) NULL,
	[about_company] [nvarchar](300) NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[city_id] [int] NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m05_country_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m05_country_master](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](10) NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m06_city_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m06_city_master](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city] [nvarchar](20) NOT NULL,
	[state_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m07_login_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m07_login_master](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nvarchar](20) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m08_state_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m08_state_master](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state] [nvarchar](100) NOT NULL,
	[country_id] [int] NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [nvarchar](20) NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m09_gender_master]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m09_gender_master](
	[gender_id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nvarchar](10) NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t01_resume_skill_transaction]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t01_resume_skill_transaction](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nvarchar](20) NOT NULL,
	[education] [nvarchar](max) NULL,
	[language] [nvarchar](200) NULL,
	[skills] [nvarchar](max) NULL,
	[professional_summary] [nvarchar](max) NULL,
	[certificate] [nvarchar](max) NULL,
	[project] [nvarchar](max) NULL,
	[training] [nvarchar](max) NULL,
	[additional_details] [nvarchar](max) NULL,
	[hobbies] [nvarchar](200) NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
	[strengths] [nvarchar](max) NULL,
	[objective] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t02_company_skill_transaction]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t02_company_skill_transaction](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[comp_code] [nvarchar](20) NOT NULL,
	[profile] [nvarchar](100) NOT NULL,
	[type_of_internship] [nvarchar](100) NOT NULL,
	[location] [nvarchar](20) NOT NULL,
	[start_date] [nvarchar](50) NOT NULL,
	[skills] [nvarchar](100) NOT NULL,
	[perks] [nvarchar](20) NULL,
	[responsibilities] [nvarchar](50) NOT NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t03_company_social_url_transaction]    Script Date: 11-03-2019 01:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t03_company_social_url_transaction](
	[rec_id] [int] IDENTITY(1,1) NOT NULL,
	[comp_code] [nvarchar](20) NOT NULL,
	[website_url] [nvarchar](100) NULL,
	[facebook] [nvarchar](100) NULL,
	[instagram] [nvarchar](100) NULL,
	[linkdeln] [nvarchar](100) NULL,
	[youtube] [nvarchar](100) NULL,
	[created_by] [nvarchar](10) NULL,
	[created_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[m01_user_master] ON 

INSERT [dbo].[m01_user_master] ([rec_id], [user_code], [name], [DOB], [email_id], [mobile], [created_by], [created_date], [is_active], [password], [gender_id]) VALUES (2, N'ADM1000', N'Admin', N'', N'jassinghmalhotra@gmail.com', N'', N'Admin', CAST(0x663F0B00 AS Date), 1, N'tiger123', 0)
SET IDENTITY_INSERT [dbo].[m01_user_master] OFF
SET IDENTITY_INSERT [dbo].[m05_country_master] ON 

INSERT [dbo].[m05_country_master] ([country_id], [country], [created_by], [created_date], [is_active]) VALUES (1, N'India', N'Admin', CAST(0x593F0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[m05_country_master] OFF
SET IDENTITY_INSERT [dbo].[m06_city_master] ON 

INSERT [dbo].[m06_city_master] ([city_id], [city], [state_id], [country_id], [created_by], [created_date], [is_active]) VALUES (1, N'Bhopal', 1, 1, N'Admin', CAST(0x593F0B00 AS Date), 1)
INSERT [dbo].[m06_city_master] ([city_id], [city], [state_id], [country_id], [created_by], [created_date], [is_active]) VALUES (2, N'Indore', 1, 1, N'Admin', CAST(0x593F0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[m06_city_master] OFF
SET IDENTITY_INSERT [dbo].[m07_login_master] ON 

INSERT [dbo].[m07_login_master] ([rec_id], [user_code], [email_id], [password], [created_by], [created_date], [is_active]) VALUES (2, N'ADM1000', N'jassinghmalhotra@gmail.com', N'tiger123', N'Admin', CAST(0x663F0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[m07_login_master] OFF
SET IDENTITY_INSERT [dbo].[m08_state_master] ON 

INSERT [dbo].[m08_state_master] ([state_id], [state], [country_id], [created_by], [created_date], [is_active]) VALUES (1, N'Madhya Pradesh', 1, N'Admin', N'Feb 24 2019  8:03PM', 1)
SET IDENTITY_INSERT [dbo].[m08_state_master] OFF
SET IDENTITY_INSERT [dbo].[m09_gender_master] ON 

INSERT [dbo].[m09_gender_master] ([gender_id], [gender], [created_by], [created_date], [is_active]) VALUES (1, N'Male', N'Admin', CAST(0x4E3F0B00 AS Date), 1)
INSERT [dbo].[m09_gender_master] ([gender_id], [gender], [created_by], [created_date], [is_active]) VALUES (2, N'Female', N'Admin', CAST(0x4E3F0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[m09_gender_master] OFF
ALTER TABLE [dbo].[m01_user_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m01_user_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m01_user_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m02_user_contact_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m02_user_contact_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m02_user_contact_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m04_company_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m04_company_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m04_company_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m05_country_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m05_country_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m05_country_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m06_city_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m06_city_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m06_city_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m07_login_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m07_login_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m07_login_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[m08_state_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m08_state_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m08_state_master] ADD  DEFAULT ('1') FOR [is_active]
GO
ALTER TABLE [dbo].[m09_gender_master] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[m09_gender_master] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[m09_gender_master] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[t01_resume_skill_transaction] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[t01_resume_skill_transaction] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[t01_resume_skill_transaction] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[t02_company_skill_transaction] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[t02_company_skill_transaction] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[t02_company_skill_transaction] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[t03_company_social_url_transaction] ADD  DEFAULT ('Admin') FOR [created_by]
GO
ALTER TABLE [dbo].[t03_company_social_url_transaction] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[t03_company_social_url_transaction] ADD  DEFAULT ((1)) FOR [is_active]
GO
