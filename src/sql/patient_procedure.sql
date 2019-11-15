/* create new patient_<facility_id> table and patient_address_<facility_id> */

CREATE OR REPLACE PROCEDURE create_new_patient_tables
AUTHID CURRENT_USER IS
new_query varchar2(5000);
BEGIN
new_query := 'CREATE TABLE patient_address(
patient_address_id NUMBER(10) NOT NULL,
street_num VARCHAR2(50) NOT NULL,
street_id NUMBER(10) NOT NULL,
city_id NUMBER(10) NOT NULL,
state_id NUMBER(10) NOT NULL,
country_id NUMBER(10) NOT NULL,
CONSTRAINT patient_address_key PRIMARY KEY (patient_address_id),
CONSTRAINT fk_pa_street FOREIGN KEY (street_id) REFERENCES street(street_id),
CONSTRAINT fk_pa_city FOREIGN KEY (city_id) REFERENCES city(city_id),
CONSTRAINT fk_pa_state FOREIGN KEY (state_id) REFERENCES state(state_id),
CONSTRAINT fk_pa_country FOREIGN KEY (country_id) REFERENCES country(country_id)
)';
EXECUTE IMMEDIATE new_query;
new_query := 'CREATE SEQUENCE patient_address_seq START WITH 1';
EXECUTE IMMEDIATE new_query;
new_query := 'CREATE OR REPLACE TRIGGER patient_address_trigger
BEFORE INSERT ON patient_address
FOR EACH ROW
BEGIN
  SELECT patient_address_seq.NEXTVAL
  INTO   :new.patient_address_id
  FROM   dual;
END;';
EXECUTE IMMEDIATE new_query;
new_query := 'CREATE TABLE patient
                    (patient_id NUMBER(10) NOT NULL,
                     facility_id NUMBER(10) NOT NULL,
                    first_name VARCHAR2(30) NOT NULL,
                    last_name VARCHAR2(30) NOT NULL,
                    date_of_birth DATE NOT NULL,
                    phone_number NUMBER(10) NOT NULL,
                    patient_address_id NUMBER(30) NOT NULL,
                    CONSTRAINT patient_key PRIMARY KEY (patient_id),
                    CONSTRAINT fk_pt_pa FOREIGN KEY (patient_address_id) REFERENCES patient_address (patient_address_id),
                    CONSTRAINT fk_pt_fa FOREIGN KEY (facility_id) REFERENCES facility (facility_id))';
EXECUTE IMMEDIATE new_query;
new_query := 'CREATE SEQUENCE patient_seq START WITH 1';
EXECUTE IMMEDIATE new_query;
new_query := 'CREATE OR REPLACE TRIGGER patient_trigger
BEFORE INSERT ON patient
FOR EACH ROW
BEGIN
  SELECT patient_seq.NEXTVAL
  INTO   :new.patient_id
  FROM   dual;
END;';
EXECUTE IMMEDIATE new_query;
end create_new_patient_tables;
/

/* sign_up for patient */

CREATE OR REPLACE PROCEDURE sign_up_new_patient

(v_facility_id number, v_street_name varchar2, v_city_name varchar2,  v_state_name varchar2,
v_country_name varchar2, v_street_number varchar2, v_first_name varchar2, v_last_name varchar2,
v_date_of_birth varchar2, v_phone_number number)

AUTHID CURRENT_USER IS

new_query varchar2(5000);
v_street_id number;
v_city_id number;
v_state_id number;
v_country_id number;
v_patient_address_id number;
v_patient_id number;
BEGIN
new_query := 'INSERT INTO STREET(street_name) SELECT :b1 FROM DUAL WHERE NOT EXISTS(SELECT * FROM STREET WHERE STREET_NAME = :b2)';
execute immediate new_query using v_street_name,v_street_name;
SELECT street_id into v_street_id from STREET where street_name = v_street_name;
DBMS_OUTPUT.PUT_LINE('Street_id:' || to_char(v_street_id));

new_query := 'INSERT INTO CITY(city_name) SELECT :b1 FROM DUAL WHERE NOT EXISTS(SELECT * FROM CITY WHERE CITY_NAME = :b2)';
execute immediate new_query using v_city_name,v_city_name;
SELECT city_id into v_city_id from CITY where city_name = v_city_name;
DBMS_OUTPUT.PUT_LINE('City_id:' || to_char(v_city_id));

new_query := 'INSERT INTO STATE(state_name) SELECT :b1 FROM DUAL WHERE NOT EXISTS(SELECT * FROM STATE WHERE STATE_NAME = :b2)';
execute immediate new_query using v_state_name,v_state_name;
SELECT state_id into v_state_id from STATE where state_name = v_state_name;
DBMS_OUTPUT.PUT_LINE('State_id:' || to_char(v_state_id));

new_query := 'INSERT INTO COUNTRY(country_name) SELECT :b1 FROM DUAL WHERE NOT EXISTS(SELECT * FROM COUNTRY WHERE COUNTRY_NAME = :b2)';
execute immediate new_query using v_country_name,v_country_name;
SELECT country_id into v_country_id from COUNTRY where country_name = v_country_name;
DBMS_OUTPUT.PUT_LINE('Country_id:' || to_char(v_country_id));

new_query := 'INSERT INTO PATIENT_ADDRESS(street_num,street_id,city_id,state_id,country_id)
VALUES(:b1, :b2, :b3, :b4, :b5) returning patient_address_id into :b6';
execute immediate new_query using v_street_number, v_street_id, v_city_id, v_state_id, v_country_id returning into v_patient_address_id;
DBMS_OUTPUT.PUT_LINE('Patient_address_id:' || to_char(v_patient_address_id));

new_query := 'INSERT INTO PATIENT(first_name,last_name,date_of_birth,phone_number,patient_address_id, facility_id)
VALUES(:b1, :b2, :b3, :b4, :b5,:b6) returning patient_id into :b7';
execute immediate new_query using v_first_name, v_last_name, to_date(v_date_of_birth, 'yyyy/mm/dd'), v_phone_number, v_patient_address_id, v_facility_id returning into v_patient_id;
DBMS_OUTPUT.PUT_LINE('Patient_id:' || to_char(v_patient_id));

end sign_up_new_patient;
/

/*
exec sign_up_new_patient(1,'Baker Street','London', 'London', 'UK', '221B','Shantanu', 'Sharma','2019/10/24',9193333333)
*/
