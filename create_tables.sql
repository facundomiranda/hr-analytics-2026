-- FIRST THINGS FIRST, WE CREATE THE DATABASE AND TABLE FOR OUR HR ANALYTICS PROJECT

CREATE DATABASE IF NOT EXISTS hr_analytics;

USE hr_analytics;

DROP TABLE IF EXISTS data;


CREATE TABLE data (

  EmployeeNumber INT PRIMARY KEY,

  Age INT,

  Attrition VARCHAR(3),

  BusinessTravel VARCHAR(30),

  DailyRate INT,

  Department VARCHAR(50),

  DistanceFromHome INT,

  Education INT,

  EducationField VARCHAR(50),

  EmployeeCount INT,

  EnvironmentSatisfaction INT,

  Gender VARCHAR(10),

  HourlyRate INT,

  JobInvolvement INT,

  JobLevel INT,

  JobRole VARCHAR(60),

  JobSatisfaction INT,

  MaritalStatus VARCHAR(20),

  MonthlyIncome INT,

  MonthlyRate INT,

  NumCompaniesWorked INT,

  Over18 VARCHAR(5),

  OverTime VARCHAR(5),

  PercentSalaryHike INT,

  PerformanceRating INT,

  RelationshipSatisfaction INT,

  StandardHours INT,

  StockOptionLevel INT,

  TotalWorkingYears INT,

  TrainingTimesLastYear INT,

  WorkLifeBalance INT,

  YearsAtCompany INT,

  YearsInCurrentRole INT,

  YearsSinceLastPromotion INT,

  YearsWithCurrManager INT,

  INDEX ix_attrition (Attrition),

  INDEX ix_department (Department),

  INDEX ix_jobrole (JobRole)


  -- AFTER THIS QUERY IS EXECUTED, WE LOAD OUR CSV THROUGH THE BELOW QUERY...

  LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/portfolio2/WA_Fn-UseC_-HR-Employee-Attrition.csv'



) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
