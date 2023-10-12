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

