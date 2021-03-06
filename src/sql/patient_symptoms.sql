/* create patient_symptoms_<facility_id> */

CREATE OR REPLACE PROCEDURE new_patient_symptoms
(facility_id number)
AUTHID CURRENT_USER IS
new_query varchar2(5000);

BEGIN
new_query := 'CREATE TABLE patient_symptoms_'|| to_char(facility_id) || '(
visit_id NUMBER(10) NOT NULL,
symptom_code VARCHAR2(20) NOT NULL,
severity_value VARCHAR2(20) NOT NULL,
post_event VARCHAR2(100),
is_recurring CHAR(1),
duration NUMBER(10),
CONSTRAINT patient_symptoms_'|| to_char(facility_id) ||'_key PRIMARY KEY (visit_id, symptom_code),
CONSTRAINT fk_pat_symptoms_visit_id_'|| to_char(facility_id) || ' FOREIGN KEY (visit_id) REFERENCES visit_' || to_char(facility_id) || '(visit_id),
CONSTRAINT fk_pat_sym_sym_code_'|| to_char(facility_id) || ' FOREIGN KEY (symptom_code) REFERENCES symptom (symptom_code))';

EXECUTE IMMEDIATE new_query;
end new_patient_symptoms;
/