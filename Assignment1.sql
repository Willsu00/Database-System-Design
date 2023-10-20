
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

COMMIT;    ---- ALWAYS COMMIT AFTER FINISHING TABLE

--------------------INSERT PROJECT-----------------------


SELECT * FROM projects;
DESC projects;

--------------------INSERT ROADS-----------------------


SELECT * FROM roads;

--------------------INSERT CONTRACT-----------------------


SELECT * FROM contracts;

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

COMMIT;        ---- ALWAYS COMMIT AFTER FINISHING TABLE

--------------------INSERT STAFF-----------------------


SELECT * FROM staff;

--------------------INSERT SUBSECTIONS-----------------------


SELECT * FROM subsections;

--------------------INSERT ROLE-----------------------


SELECT * FROM staff_roles;
