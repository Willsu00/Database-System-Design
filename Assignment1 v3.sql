-- CREATE TABLE rlocations
CREATE TABLE rlocations (
    location_id_PK NUMBER(4) NOT NULL,
    location_name VARCHAR2(50) NOT NULL,
    location_desc VARCHAR2(50),
    location_longitude VARCHAR2(50),
    location_latitude VARCHAR2(50),
    CONSTRAINT location_id_primary PRIMARY KEY (location_id_PK)
);

-- CREATE TABLE contractor_companies
CREATE TABLE contractor_companies (
    cc_name_PK VARCHAR2(50) NOT NULL,
    cc_street_name VARCHAR2(50),
    cc_street_no NUMBER(4),
    cc_city VARCHAR2(50),
    CONSTRAINT cc_name_primary PRIMARY KEY (cc_name_PK)
);

-- CREATE TABLE roads
CREATE TABLE roads (
    road_name_PK VARCHAR2(50) NOT NULL,
    location_id_FK NUMBER(4) NOT NULL,
    road_desc VARCHAR2(50),
    road_category VARCHAR2(50),
    CONSTRAINT road_name_primary PRIMARY KEY (road_name_PK),
    CONSTRAINT road_location_id_foreign FOREIGN KEY (location_id_FK) REFERENCES rlocations (location_id_PK)
);

-- CREATE TABLE subsections
CREATE TABLE subsections (
    road_name_subsection_FK VARCHAR2(50) NOT NULL,
    CONSTRAINT road_name_sub_foreign FOREIGN KEY (road_name_subsection_FK) REFERENCES roads (road_name_PK)
);

-- CREATE TABLE contracts
CREATE TABLE contracts (
    contract_number_PK NUMBER(4) NOT NULL,
    cc_name_FK VARCHAR2(50),
    contract_name VARCHAR2(50) NOT NULL,
    contract_desc VARCHAR2(50),
    contract_est_cost NUMBER(38),
    contract_actual_cost NUMBER(38),
    contract_start_date DATE,
    contract_end_date DATE,
    CONSTRAINT contract_number_primary PRIMARY KEY (contract_number_PK),
    CONSTRAINT contract_cc_name FOREIGN KEY (cc_name_FK) REFERENCES contractor_companies (cc_name_PK)
);

-- CREATE TABLE projects
CREATE TABLE projects (
    project_code_PK NUMBER(4) NOT NULL,
    contract_number_FK NUMBER(4),
    road_name_fk VARCHAR2(50),
    project_name VARCHAR2(50) NOT NULL,
    project_desc VARCHAR2(50),
    project_start_date DATE,
    project_end_date DATE,
    CONSTRAINT project_code_primary PRIMARY KEY (project_code_PK),
    CONSTRAINT contract_number_foreign FOREIGN KEY (contract_number_FK) REFERENCES contracts (contract_number_PK),
    CONSTRAINT project_road_name_foreign FOREIGN KEY (road_name_fk) REFERENCES roads (road_name_PK)
);

-- CREATE TABLE staff
CREATE TABLE staff (
    employee_id_PK NUMBER(4) NOT NULL,
    project_code_FK NUMBER(4) NOT NULL,
    cc_name_FK VARCHAR2(50) NOT NULL,
    employee_fname VARCHAR2(50) NOT NULL,
    employee_lname VARCHAR2(50) NOT NULL,
    employee_employment_date DATE,
    employee_DOB DATE,
    employee_gender CHAR(1),
    employee_streetname VARCHAR2(50),
    employee_streetno NUMBER(4),
    employee_city VARCHAR2(50),
    employee_phone VARCHAR2(20),
    employee_email VARCHAR2(50),
    CONSTRAINT employee_id_primary PRIMARY KEY (employee_id_PK),
    CONSTRAINT project_code_foreign FOREIGN KEY (project_code_FK) REFERENCES projects (project_code_PK),
    CONSTRAINT cc_name_project_foreign FOREIGN KEY (cc_name_FK) REFERENCES contractor_companies (cc_name_PK)
);

-- CREATE TABLE staff_roles
CREATE TABLE staff_roles (
    role_name VARCHAR2(50) NULL,
    employee_id_PK_FK NUMBER(4) NOT NULL,
    role_desc VARCHAR2(50),
    role_start_date DATE,
    role_end_date DATE,
    CONSTRAINT staff_role_emp_id_primary PRIMARY KEY (employee_id_PK_FK),
    CONSTRAINT employee_id_role_foreign FOREIGN KEY (employee_id_PK_FK) REFERENCES staff (employee_id_PK)
);

--Inserts data into Locations
INSERT INTO rlocations VALUES
(
    2000,
    'AUCKLAND',
    'SUBURB',
    '-36.958742284',
    '174.915753202233'
);

INSERT INTO rlocations VALUES
(
    2001,
    'AUCKLAND',
    'SUBURB',
    '-36.965746165',
    '174.911547498514'
);

INSERT INTO rlocations VALUES
(
    2002,
    'AUCKLAND',
    'RURAL',
    '-36.955739122',
    '174.931667453249'
);

INSERT INTO rlocations VALUES
(
    2003,
    'AUCKLAND',
    'SUBURB',
    '-36.966104329',
    '174.902754013328'
);

INSERT INTO rlocations VALUES
(
    2003,
    'AUCKLAND',
    'SUBURB',
    '-36.966104329',
    '174.902754013328'
);

INSERT INTO rlocations VALUES
(
    2004,
    'AUCKLAND',
    'RURAL',
    '-36.954881606',
    '174.930519501069'
);

INSERT INTO rlocations VALUES
(
    2005,
    'AUCKLAND',
    'SUBURB',
    '-36.962875971',
    '174.92185021651'
);

INSERT INTO rlocations VALUES
(
    2006,
    'AUCKLAND',
    'RURAL',
    '-36.952766157',
    '174.922079783971'
);

INSERT INTO rlocations VALUES
(
    2007,
    'AUCKLAND',
    'SUBURB',
    '36.961452591',
    '174.930984885822'
);

INSERT INTO rlocations VALUES
(
    2008,
    'AUCKLAND',
    'SUBURB',
    '-36.968025181',
    '174.923780041643'
);

INSERT INTO rlocations VALUES
(
    2009,
    'AUCKLAND',
    'RURAL',
    '-36.976231881',
    '174.910773009105'
);

-------------------INSERT CONTRACT COMPANIES-------------

INSERT INTO contractor_companies VALUES (
    'John Smith Ltd',
    'Churchill Close',
    54,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Swamy Development',
    'Junction Road',
    12,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Enriquez Asphalt Plus',
    'Sycamore Drive',
    13,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Astrova',
    'Manor Drive',
    44,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Shek Men Co',
    'Greenfield Road',
    5,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Impass',
    'Darnell Road',
    69,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Terraway',
    'Queens Street',
    4,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Vidroad',
    'This Road',
    56,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Binaryroute',
    'Whythead Cresent',
    8,
    'AUCKLAND'
);

INSERT INTO contractor_companies VALUES (
    'Has Wells Ltd',
    'Grove Lane',
    23,
    'AUCKLAND'
);

--------------------INSERT ROADS-----------------------

INSERT INTO roads VALUES (
    'Stancombe Road',
    2000,
    'Dual Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Ormiston Road',
    2001,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Soljans Place',
    2002,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Michael Jones Drive',
    2003,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Chateau Rise',
    2004,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Malahide Drive',
    2005,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Gracechurch Road',
    2006,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Jeffs Road',
    2007,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Lemon Tree Lane',
    2008,
    'Single Lane',
    'Local Road'
);

INSERT INTO roads VALUES (
    'Castlebane Drive',
    2009,
    'Single Lane',
    'Local Road'
);

--------------------INSERT SUBSECTIONS-----------------------

INSERT INTO subsections VALUES (
    'Michael Jones Drive'
);

INSERT INTO subsections VALUES (
    'Jeffs Road'
);

--------------------INSERT CONTRACT-----------------------


INSERT INTO contracts VALUES(
    0100,
    'Swamy Development',
    'Stancombe Resurface',
    'Repair',
    246000,
    250000,
    '29-SEPTEMBER-2023',
    '11-NOVEMBER-2023'
);

INSERT INTO contracts VALUES(
    0101,
    'John Smith Ltd',
    'Ormiston PotHole',
    'Repaint',
    160500,
    160500,
    '1-SEPTEMBER-2023',
    '18-NOVEMBER-2023'
);

INSERT INTO contracts VALUES(
    0102,
    'Enriquez Asphalt Plus',
    'Soljans Line Markings',
    'Repair',
    73000,
    75000,
    '30-AUGUST-2023',
    '22-NOVEMBER-2023'
);


INSERT INTO contracts VALUES(
    0103,
    'Astrova',
    'Michael Jones PotHole',
    'Repaint',
    60400,
    59000,
    '1-SEPTEMBER-2023',
    '28-NOVEMBER-2023'
);


INSERT INTO contracts VALUES(
    0104,
    'Shek Men Co',
    'Chateau Resurface',
    'Repair',
    101500,
    105000,
    '10-SEPTEMBER-2023',
    '07-DECEMBER-2023'
);

INSERT INTO contracts VALUES(
    0105,
    'Impass',
    'Malahide Line Markings',
    'Repaint',
    159000,
    164000,
    '20-SEPTEMBER-2023',
    '09-DECEMBER-2023'
);

INSERT INTO contracts VALUES(
    0106,
    'Terraway',
    'Gracechurch PotHole',
    'Repair',
    185000,
    155000,
    '20-SEPTEMBER-2023',
    '12-DECEMBER-2023'
);

INSERT INTO contracts VALUES(
    0107,
    'Vidroad',
    'Jeffs Resurface',
    'Repaint',
    137000,
    132000,
    '05-OCTOBER-2023',
    '13-DECEMBER-2023'
);

INSERT INTO contracts VALUES(
    0108,
    'Binaryroute',
    'Lemon Tree PotHole',
    'Repair',
    191000,
    82000,
    '10-DECEMBER-2023',
    '14-DECEMBER-2023'
);

INSERT INTO contracts VALUES(
    0109,
    'Has Wells Ltd',
    'Castlebane Line Markings',
    'Repaint',
    67000,
    122000,
    '20-OCTOBER-2023',
    '20-DECEMBER-2023'
);

--------------------INSERT PROJECT-----------------------


INSERT INTO projects VALUES (
    1000,
    0100,
    'Stancombe Road',
    'Stan Resurf',
    'Road resurfacing',
    '01-SEPTEMBER-2023',
    '10-NOVEMBER-2023'
);

INSERT INTO projects VALUES (
    1001,
    0101,
    'Ormiston Road',
    'Ormi PotHole',
    'Pothole Repairs',
    '05-SEPTEMBER-2023',
    '17-NOVEMBER-2023'
);


INSERT INTO projects VALUES (
    1002,
    0102,
    'Soljans Place',
    'Solj Markings',
    'Line Road Markings',
    '07-SEPTEMBER-2023',
    '21-NOVEMBER-2023'
);


INSERT INTO projects VALUES (
    1003,
    0103,
    'Michael Jones Drive',
    'Mich PotHole',
    'Pothole Repairs',
    '08-SEPTEMBER-2023',
    '27-NOVEMBER-2023'
);

INSERT INTO projects VALUES (
    1004,
    0104,
    'Chateau Rise',
    'Chat Resurf',
    'Road resurfacing',
    '20-SEPTEMBER-2023',
    '06-DECEMBER-2023'
);

INSERT INTO projects VALUES (
    1005,
    0105,
    'Malahide Drive',
    'Mala Markings',
    'Line Road Markings',
    '25-SEPTEMBER-2023',
    '08-DECEMBER-2023'  
);

INSERT INTO projects VALUES (
    1006,
    0106,
    'Gracechurch Road',
    'Grac PotHole',
    'Pothole Repairs',
    '25-SEPTEMBER-2023',
    '08-DECEMBER-2023'
);

INSERT INTO projects VALUES (
    1007,
    0107,
    'Jeffs Road',
    'Jeff Resurf',
    'Road resurfacing',
    '11-OCTOBER-2023',
    '12-DECEMBER-2023'
);

INSERT INTO projects VALUES (
    1008,
    0108,
    'Lemon Tree Lane',
    'Lemo PotHole',
    'Pothole Repairs',
    '12-OCTOBER-2023',
    '13-DECEMBER-2023'
);

INSERT INTO projects VALUES (
    1009,
    0109,
    'Castlebane Drive',
    'Cast Markings',
    'Line Road Markings',
    '01-NOVEMBER-2023',
    '19-DECEMBER-2023'
);

------------------INSERT STAFF-----------------------

INSERT INTO staff VALUES (
    0001,
    1000,
    'Swamy Development',
    'Molly',
    'Bull',
    '02-AUGUST-2016',
    '01-MARCH-1978',
    'F',
    'Queenspark Drive',
    92,
    'Auckland',
    '(026) 7157-574',
    'Mbull'
);

INSERT INTO staff VALUES (
    0002,
    1001,
    'John Smith Ltd',
    'Russell',
    'Whittaker',
    '17-APRIL-2017',
    '01-JUNE-1981',
    'M',
    'Roimata Place',
    151,
    'Auckland',
    '(020) 6359-398',
    'RWhittaker'
);

INSERT INTO staff VALUES (
    0003,
    1002,
    'Enriquez Asphalt Plus',
    'Ria',
    'Rees',
    '05-AUGUST-2019',
    '19-OCTOBER-1981',
    'F',
    'Hillary Crescent',
    169,
    'Auckland',
    '(022) 4485-124',
    'RRees'
);

INSERT INTO staff VALUES (
    0004,
    1003,
    'Astrova',
    'James',
    'Peters',
    '29-OCTOBER-2019',
    '23-DECEMBER-1981',
    'M',
    'Greenhurst Street',
    170,
    'Auckland',
    '(028) 6791-312',
    'JPeters'
);

INSERT INTO staff VALUES (
    0005,
    1004,
    'Shek Men Co',
    'Hazel',
    'Goodwin',
    '12-JUNE-2020',
    '17-MAY-1982',
    'F',
    'Wood Street',
    194 ,
    'Auckland',
    '(026) 0162-515',
    'HGoodwin'
);

INSERT INTO staff VALUES (
    0006,
    1005,
    'Impass',
    'Seth',
    'Butler',
    '16-NOVEMBER-2020',
    '30-APRIL-1987',
    'M',
    '167 Foreman Road',
    167 ,
    'Auckland',
    '(027) 9357-415',
    'SButler'
);

INSERT INTO staff VALUES (
    0007,
    1006,
    'Terraway',
    'Yasmin',
    'Ward',
    '12-JANUARY-2021',
    '15-APRIL-1993',
    'F',
    '25 Highfields Terrace',
    25 ,
    'Auckland',
    '(020) 7088-538',
    'YWard'
);

INSERT INTO staff VALUES (
    0008,
    1007,
    'Vidroad',
    'Jasper',
    'Cross',
    '07-OCTOBER-2021',
    '28-OCTOBER-1993',
    'M',
    'Bowlers Wharf Lane',
    28 ,
    'Auckland',
    '(021) 8352-600',
    'JCross'
);

INSERT INTO staff VALUES (
    0009,
    1008,
    'Binaryroute',
    'Sienna',
    'Carlson',
    '07-JANUARY-2022',
    '25-FEBRUARY-1994',
    'F',
    'Dampier Street',
    44 ,
    'Auckland',
    '(022) 8824-622',
    'SCarlson'
);

INSERT INTO staff VALUES (
    0010,
    1009,
    'Has Wells Ltd',
    'Dale',
    'Rawlings',
    '12/04/2022',
    '01/03/1994',
    'M',
    '87 Oxford Terrace',
    87 ,
    'Auckland',
    '(021) 4491-623',
    'DRawlings'
);

--------------------INSERT ROLE-----------------------

INSERT INTO staff_roles VALUES (
    'MGR',
    '0001',
    'Manager',
    '02-AUGUST-2016',
    '23-JUNE-2022'
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '0002',
    'Worker',
    '17-APRIL-2017',
    '20-APRIL-2020'
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '0003',
    'Worker',
    '05-AUGUST-2019',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '0004',
    'Engineer',
    '29-OCTOBER-2019',
    NULL
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '0005',
    'Worker',
    '12-JUNE-2020',
    NULL
);

INSERT INTO staff_roles VALUES (
    'MGR',
    '0006',
    'Manager',
    '16-MARCH-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '0007',
    'Worker',
    '12-JANUARY-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '0008',
    'Engineer',
    '07-OCTOBER-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'MGR',
    '0009',
    'Manager',
    '07-AUGUST-2022',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '0010',
    'Engineer',
    '12-APRIL-2022',
    NULL
);

--SQL QUERIES
--This shows employee full name and the project they are working on with start and end date
SELECT s.employee_fName || ' ' || s.employee_lname AS "Employee Name", 
        'Project Code: ' || p.project_code_pk || ' Start Date: ' || p.project_start_date || ' End Date: ' || p.project_end_date AS "Project Info"
FROM staff s, projects p
WHERE s.project_code_fk = p.project_code_pk;

--This shows the project dates and the location info for the projects.
SELECT
    P.Project_Code_pk || ' - ' || P.Project_Start_Date || ' to ' || P.Project_End_Date AS "Project Info",
    L.Location_Name || ' (' || L.Location_Desc || ') - ' || 'Lat: ' || L.Location_Latitude || ', Lon: ' || L.Location_Longitude AS "Location Info",
    R.Road_Name_pk || ' (' || R.Road_Desc || ') - ' || R.Road_Category AS "Road Info"
FROM Projects P, RLocations L, Roads R
WHERE R.Road_Name_pk = P.Road_Name_fk
AND L.Location_ID_PK = R.Location_ID_FK;

--This Orders the project and location information and road category by the project start date.
SELECT
    P.Road_Name_Fk,
    P.Project_Start_Date,
    P.Project_End_Date,
    L.Location_Name,
    R.Road_Category
FROM Projects P, RLocations L, Roads R
  WHERE L.Location_ID_PK = R.Location_ID_FK
  AND R.Road_Name_pk = P.Road_Name_Fk
  AND P.Project_Start_Date >= '01/09/2023' 
  AND R.Road_Category = 'Local Road'
ORDER BY P.Project_Start_Date;

--This displays the Contract information and the Contractor Company information and orders it by Contract Actual Cost
SELECT
    C.Contract_Name,
    C.Contract_Number_pk,
    C.Contract_Desc,
    C.Contract_Actual_Cost,
    C.Contract_start_date,
    C.Contract_end_date,
    CC.CC_Name_pk,
    CC.CC_Street_Name,
    CC.CC_Street_No,
    CC.CC_City
FROM Contracts C, Contractor_Companies CC
WHERE C.CC_Name_fk = CC.CC_Name_PK
ORDER BY C.Contract_Actual_Cost ASC;

--This displays the employee information and there role as a staff member and sorts it by firstnames.
SELECT
    S.Employee_FName,
    S.Employee_LName,
    S.Employee_Employment_Date,
    S.Employee_Email,
    R.Role_Name,
    R.Employee_ID_pk_fk,
    R.Role_Desc,
    R.Role_Start_Date,
    R.Role_End_Date
FROM Staff S, Staff_Roles R
WHERE S.Employee_ID_Pk = R.Employee_ID_PK_FK
ORDER BY S.Employee_FName ASC;

