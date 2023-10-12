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
    contract_name
);