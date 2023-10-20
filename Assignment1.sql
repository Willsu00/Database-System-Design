CREATE TABLE rlocations (
    location_id_PK NUMBER(4) NOT NULL,
    location_name VARCHAR2(50) NOT NULL,
    location_desc VARCHAR2(50),
    location_longitude NUMBER(10,20),
    location_latitude NUMBER(10,20),
    CONSTRAINT location_id_primary PRIMARY KEY (location_id_PK)
);

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

