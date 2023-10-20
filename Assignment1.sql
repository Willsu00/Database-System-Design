
----------------------CREATING TABLES----------------------

CREATE TABLE rlocations (
    location_id_PK NUMBER(4) NOT NULL,
    location_name VARCHAR2(50) NOT NULL,
    location_desc VARCHAR2(50),
    location_longitude VARCHAR2(50),
    location_latitude VARCHAR2(50),
    CONSTRAINT location_id_primary PRIMARY KEY (location_id_PK)
);

ALTER TABLE rlocations
MODIFY location_latitude VARCHAR2(50)
MODIFY location_longitude VARCHAR2(50);

DESC rlocations;



CREATE TABLE contractor_companies (
    cc_name_PK VARCHAR2(50) NOT NULL,
    cc_street_name VARCHAR2(50),
    cc_street_no NUMBER(4),
    cc_city VARCHAR2(50),
    CONSTRAINT cc_name_primary PRIMARY KEY(cc_name_PK)
);

DESC contractor_companies;

CREATE TABLE contracts (
    contract_number_PK NUMBER(4)NOT NULL,
    cc_name_FK VARCHAR2(50),
    contract_name VARCHAR2(50) NOT NULL,
    contract_desc VARCHAR(50),
    contract_est_cost NUMBER(10,20),
    contract_actual_cost NUMBER(10,20),
    contract_start_date DATE,
    contract_end_date DATE,
    CONSTRAINT contract_number_primary PRIMARY KEY(contract_number_PK),
    CONSTRAINT contract_cc_name FOREIGN KEY (cc_name_FK)
        REFERENCES contractor_companies (cc_name_PK)
);

ALTER TABLE contracts
MODIFY contract_est_cost NUMBER(38)
MODIFY contract_actual_cost NUMBER(38);
DESC contracts;


CREATE TABLE projects (
    project_code_PK NUMBER(4) NOT NULL,
    contract_number_FK NUMBER(4),
    project_name VARCHAR(50) NOT NULL,
    project_desc VARCHAR(50),
    project_start_date DATE,
    project_end_date DATE,
    CONSTRAINT project_code_primary PRIMARY KEY(project_code_PK),
    CONSTRAINT contract_number_foreign FOREIGN KEY(contract_number_FK)
        REFERENCES contracts (contract_number_PK)
);

ALTER TABLE projects
ADD road_name_fk VARCHAR2(50);

ALTER TABLE projects
ADD CONSTRAINT project_road_name_foreign FOREIGN KEY (road_name_fk)
    REFERENCES roads (road_name_PK);

DESC projects;

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
    employee_phone NUMBER(10),
    employee_email VARCHAR2(50),
    CONSTRAINT employee_id_primary PRIMARY KEY (employee_id_PK),
    CONSTRAINT project_code_foreign FOREIGN KEY (project_code_FK)
        REFERENCES projects (project_code_PK),
    CONSTRAINT cc_name_project_foreign FOREIGN KEY (cc_name_FK)
        REFERENCES contractor_companies (cc_name_PK)
);

ALTER TABLE staff
MODIFY employee_phone VARCHAR2(20);

DESC staff;

CREATE TABLE staff_roles (
    role_name_PK VARCHAR2(50) NOT NULL,
    employee_id_FK NUMBER(4) NOT NULL,
    role_desc VARCHAR2(50),
    role_start_date DATE,
    role_end_date DATE,
    CONSTRAINT role_name_primary PRIMARY KEY(role_name_PK),
    CONSTRAINT employee_id_role_foreign FOREIGN KEY(employee_id_FK)
        REFERENCES staff (employee_id_PK)
);

ALTER TABLE staff_roles
RENAME COLUMN role_name_PK to role_name;

ALTER TABLE staff_roles
DROP CONSTRAINT role_name_primary;

ALTER TABLE staff_roles
RENAME COLUMN employee_id_fk to employee_id_PK_fk;

ALTER TABLE staff_roles
DROP CONSTRAINT role_name_primary;

ALTER TABLE staff_roles
RENAME COLUMN employee_id_fk to employee_id_PK_fk;

ALTER TABLE staff_roles
MODIFY role_name VARCHAR2(50) NULL;

ALTER TABLE staff_roles
ADD CONSTRAINT staff_role_emp_id_primary PRIMARY KEY (EMPLOYEE_ID_PK_FK);

DESC staff_roles;

CREATE TABLE roads (
    road_name_PK VARCHAR2(50) NOT NULL,
    location_id_FK NUMBER(4) NOT NULL,
    road_desc VARCHAR2(50),
    road_category VARCHAR2(50),
    CONSTRAINT road_name_primary PRIMARY KEY(road_name_PK),
    CONSTRAINT road_location_id_foreign FOREIGN KEY (location_id_FK)
        REFERENCES rlocations (location_id_PK)
);

DESC roads;

CREATE TABLE subsections (
    road_name_subsection_FK VARCHAR2(50) NOT NULL,
    CONSTRAINT road_name_sub_foreign FOREIGN KEY (road_name_subsection_FK)
        REFERENCES roads (road_name_PK)
);

DESC subsections;



--------------------INSERT TABLES--------------------

------------------INSERT LOCATIONS-------------------

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

SELECT * FROM rlocations;

COMMIT;

--------------------INSERT PROJECT-----------------------


INSERT INTO projects VALUES (
    1000,
    0100,
    'Stan Resurf',
    'Road resurfacing',
    '01-SEPTEMBER-2023',
    '10-NOVEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Stancombe Road'
WHERE project_code_pk = '1000';

SELECT * FROM projects;

INSERT INTO projects VALUES (
    1001,
    0101,
    'Ormi PotHole',
    'Pothole Repairs',
    '05-SEPTEMBER-2023',
    '17-NOVEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Ormiston Road'
WHERE project_code_pk = '1001';

INSERT INTO projects VALUES (
    1002,
    0102,
    'Solj Markings',
    'Line Road Markings',
    '07-SEPTEMBER-2023',
    '21-NOVEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Soljans Place'
WHERE project_code_pk = '1002';

SELECT * FROM projects;

INSERT INTO projects VALUES (
    1003,
    0103,
    'Mich PotHole',
    'Pothole Repairs',
    '08-SEPTEMBER-2023',
    '27-NOVEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Michael Jones Drive'
WHERE project_code_pk = '1003';

INSERT INTO projects VALUES (
    1004,
    0104,
    'Chat Resurf',
    'Chateau Rise',
    '20-SEPTEMBER-2023',
    '06-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Chateau Rise'
WHERE project_code_pk = '1004';

UPDATE projects
SET project_desc = 'Road resurfacing'
WHERE project_code_pk = '1004';

INSERT INTO projects VALUES (
    1005,
    0105,
    'Mala Markings',
    'Malahide Drive',
    '25-SEPTEMBER-2023',
    '08-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Malahide Drive'
WHERE project_code_pk = '1005';

UPDATE projects
SET project_desc = 'Line Road Markings'
WHERE project_code_pk = '1005';

INSERT INTO projects VALUES (
    1006,
    0106,
    'Grac PotHole',
    'Pothole Repairs',
    '25-SEPTEMBER-2023',
    '08-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Gracechurch Road'
WHERE project_code_pk = '1006';

INSERT INTO projects VALUES (
    1007,
    0107,
    'Jeff Resurf',
    'Road resurfacing',
    '11-OCTOBER-2023',
    '13-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Jeffs Road'
WHERE project_code_pk = '1007';

UPDATE projects
SET project_end_date = '12-DECEMBER-2023'
WHERE project_code_pk = '1007';

INSERT INTO projects VALUES (
    1008,
    0108,
    'Lemo PotHole',
    'Pothole Repairs',
    '12-OCTOBER-2023',
    '13-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Lemon Tree Lane'
WHERE project_code_pk = '1008';

INSERT INTO projects VALUES (
    1009,
    0109,
    'Cast Markings',
    'Line Road Markings',
    '01-NOVEMBER-2023',
    '19-DECEMBER-2023'
);

UPDATE projects
SET road_name_fk = 'Castlebane Drive'
WHERE project_code_pk = '1009';

SELECT * FROM projects;
DESC projects;

COMMIT;

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

SELECT * FROM roads;
DESC roads;

COMMIT;

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
    0103,
    'Enriquez Asphalt Plus',
    'Soljans Line Markings',
    'Repair',
    73000,
    75000,
    '30-AUGUST-2023',
    '22-NOVEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0102
WHERE cc_name_fk = 'Enriquez Asphalt Plus';

INSERT INTO contracts VALUES(
    0104,
    'Astrova',
    'Michael Jones PotHole',
    'Repaint',
    60400,
    59000,
    '1-SEPTEMBER-2023',
    '28-NOVEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0103
WHERE cc_name_fk = 'Astrova';

INSERT INTO contracts VALUES(
    0105,
    'Shek Men Co',
    'Chateau Resurface',
    'Repair',
    101500,
    105000,
    '10-SEPTEMBER-2023',
    '07-DECEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0104
WHERE cc_name_fk = 'Shek Men Co';

INSERT INTO contracts VALUES(
    0106,
    'Impass',
    'Malahide Line Markings',
    'Repaint',
    159000,
    164000,
    '20-SEPTEMBER-2023',
    '09-DECEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0105
WHERE cc_name_fk = 'Impass';

INSERT INTO contracts VALUES(
    0107,
    'Terraway',
    'Gracechurch PotHole',
    'Repair',
    185000,
    155000,
    '20-SEPTEMBER-2023',
    '12-DECEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0106
WHERE cc_name_fk = 'Terraway';

INSERT INTO contracts VALUES(
    0108,
    'Vidroad',
    'Jeffs Resurface',
    'Repaint',
    137000,
    132000,
    '05-OCTOBER-2023',
    '13-DECEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0107
WHERE cc_name_fk = 'Vidroad';

INSERT INTO contracts VALUES(
    0109,
    'Binaryroute',
    'Lemon Tree PotHole',
    'Repair',
    191000,
    82000,
    '10-DECEMBER-2023',
    '14-DECEMBER-2023'
);

UPDATE contracts
SET contract_number_PK = 0108
WHERE cc_name_fk = 'Binaryroute';

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

SELECT * FROM contracts;
DESC contracts;

COMMIT;

--------------------INSERT CONTRACT COMPANIES-------------

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

SELECT * FROM contractor_companies;

COMMIT;

--------------------INSERT STAFF-----------------------

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

SELECT * FROM staff;
DESC staff;

COMMIT;

--------------------INSERT SUBSECTIONS-----------------------

INSERT INTO subsections VALUES (
    'Michael Jones Drive'
);

INSERT INTO subsections VALUES (
    'Jeffs Road'
);

SELECT * FROM subsections;

COMMIT;

--------------------INSERT ROLE-----------------------

INSERT INTO staff_roles VALUES (
    'MGR',
    '1',
    'Manager',
    '02-AUGUST-2016',
    '23-JUNE-2022'
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '2',
    'Worker',
    '17-APRIL-2017',
    '20-APRIL-2020'
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '3',
    'Worker',
    '05-AUGUST-2019',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '4',
    'Engineer',
    '29-OCTOBER-2019',
    NULL
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '5',
    'Worker',
    '12-JUNE-2020',
    NULL
);

INSERT INTO staff_roles VALUES (
    'MGR',
    '6',
    'Manager',
    '16-MARCH-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'WRK',
    '7',
    'Worker',
    '12-JANUARY-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '8',
    'Engineer',
    '07-OCTOBER-2021',
    NULL
);

INSERT INTO staff_roles VALUES (
    'MGR',
    '9',
    'Manager',
    '07-AUGUST-2022',
    NULL
);

INSERT INTO staff_roles VALUES (
    'ENG',
    '10',
    'Engineer',
    '12-APRIL-2022',
    NULL
);

SELECT * FROM staff_roles;
DESC staff_roles;

COMMIT;