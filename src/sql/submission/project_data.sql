INSERT INTO FACILITY_CLASSIFICATION(classification_type) VALUES('PRIMARY');
INSERT INTO FACILITY_CLASSIFICATION(classification_type) VALUES('SECONDARY');
INSERT INTO FACILITY_CLASSIFICATION(classification_type) VALUES('TERTIARY');

INSERT INTO staff_department_type(type_name) values ('MEDICAL');
INSERT INTO staff_department_type(type_name) values ('NONMEDICAL');

insert into priority(type) values('HIGH');
insert into priority(type) values('NORMAL');
insert into priority(type) values('QUARANTINE');

insert into symptom(SYMPTOM_NAME) values('PAIN');
insert into symptom(SYMPTOM_NAME) values('DIARRHEA');
insert into symptom(SYMPTOM_NAME) values('FEVER');
insert into symptom(SYMPTOM_NAME) values('PHYSICAL EXAM');
insert into symptom(SYMPTOM_NAME) values('LIGHTHEADEDNESS');
insert into symptom(SYMPTOM_NAME) values('BLURRED VISION');
insert into symptom(SYMPTOM_NAME) values('BLEEDING');

insert into body_part(name) values('LEFT ARM');
insert into body_part(name) values('RIGHT ARM');
insert into body_part(name) values('ABDOMINAL');
insert into body_part(name) values('EYE');
insert into body_part(name) values('HEART');
insert into body_part(name) values('CHEST');
insert into body_part(name) values('HEAD');

insert into symptom_body_part(symptom_code, body_part_code) values('SYM2','BP3');
insert into symptom_body_part(symptom_code, body_part_code) values('SYM5','BP7');
insert into symptom_body_part(symptom_code, body_part_code) values('SYM6','BP4');

execute create_new_facility('WOLF VILLAGE WAY','RALEIGH', 'NC', 'US', '2650', 'WOLF HOSPITAL','TERTIARY', 300);
execute create_new_facility('SACRAMENTO','SANTA CRUZ', 'CA', 'US', '2500', 'CALIFORNIA HEALTHCARE','SECONDARY', 150);
execute create_new_facility('FIRST AVENUE 10001','NEW YORK', 'NEW YORK', 'US', '489', 'SUNY MEDICAL CENTER','PRIMARY', 10);

insert into staff_1(name, hire_date, type_id) values ('MEDICAL ROBOT', TO_DATE('2019/06/21', 'yyyy/mm/dd'), 1);
insert into staff_1(name, hire_date, type_id) values ('MUSCULAR ROB', TO_DATE('1983/10/12', 'yyyy/mm/dd'), 1);
insert into staff_1(name, hire_date, type_id) values ('MECHANICAL ROBOTO', TO_DATE('2019/06/21', 'yyyy/mm/dd'), 1);
insert into staff_1(name, hire_date, type_id) values ('MISCELLANEOUS ROBOTOR', TO_DATE('2014/08/19', 'yyyy/mm/dd'), 2);
insert into staff_1(name, hire_date, type_id) values ('MUSICIAN ROOT', TO_DATE('2017/10/18', 'yyyy/mm/dd'), 2);
insert into staff_2(name, hire_date, type_id) values ('MUSICAL ROBERT', TO_DATE('2018/08/29', 'yyyy/mm/dd'), 1);
insert into staff_2(name, hire_date, type_id) values ('MILLENNIUM ROBERTEN', TO_DATE('2018/09/20', 'yyyy/mm/dd'), 1);
insert into staff_2(name, hire_date, type_id) values ('MISSIONARY ROBINSON', TO_DATE('1993/10/01', 'yyyy/mm/dd'), 1);
insert into staff_3(name, hire_date, type_id) values ('MASSAGING ROBIN', TO_DATE('1990/12/10', 'yyyy/mm/dd'), 1);

INSERT INTO certification(certification_name) values ('COMPREHENSIVE STROKE CERTIFICATION');
INSERT INTO certification(certification_name) values ('ISO CERTIFICATION');
INSERT INTO certification(certification_name) values ('PRIMARY STROKE CERTIFICATION');

insert into facility_certificates(facility_id, certification_id, start_date, end_date) values(1,1,TO_DATE('1990/11/12', 'yyyy/mm/dd'), TO_DATE('2025/11/11', 'yyyy/mm/dd'));
insert into facility_certificates(facility_id, certification_id, start_date, end_date) values(2,2,TO_DATE('2011/05/09', 'yyyy/mm/dd'),TO_DATE('2024/02/08', 'yyyy/mm/dd'));
insert into facility_certificates(facility_id, certification_id, start_date, end_date) values(3,2,TO_DATE('2011/05/09', 'yyyy/mm/dd'),TO_DATE('2024/02/08', 'yyyy/mm/dd'));
insert into facility_certificates(facility_id, certification_id, start_date, end_date) values(3,3,TO_DATE('2018/01/01', 'yyyy/mm/dd'),TO_DATE('2028/12/31', 'yyyy/mm/dd'));

insert into service_department(service_dept_code, name) values('ER000', 'EMERGENCY ROOM');
insert into service_department(service_dept_code, name) values('GP000', 'GENERAL PRATICE DEPARTMENT');
insert into service_department(service_dept_code, name) values('GP001', 'GENERAL PRATICE DEPARTMENT');
insert into service_department(service_dept_code, name) values('OP000', 'OPTOMETRY');
insert into service_department(service_dept_code, name) values('SE000', 'SECURITY');
insert into service_department(service_dept_code, name) values('ER001', 'EMERGENCY ROOM');

insert into fc_has_serv_dept_1(service_dept_code, director_id) values('GP000',2);
insert into fc_has_serv_dept_1(service_dept_code, director_id) values('OP000',1);
insert into fc_has_serv_dept_1(service_dept_code, director_id) values('SE000',4);
insert into fc_has_serv_dept_2(service_dept_code, director_id) values('ER000',1);
insert into fc_has_serv_dept_2(service_dept_code, director_id) values('GP001',2);
insert into fc_has_serv_dept_3(service_dept_code, director_id) values('ER001',1);

insert into serv_dept_spec_1(service_dept_code, body_part_code) values('OP000','BP4');

insert into service_1(service_code, service_dept_code, equipment, name) values('SER01','ER000','ER combo rack', 'EMERGENCY');
insert into service_1(service_code, service_dept_code, equipment, name) values('SGP01','GP000','Blood pressure monitor, thermometer', 'GENERAL PRACTICE');
insert into service_2(service_code, service_dept_code, equipment, name) values('SGP01','GP001','Blood pressure monitor, thermometer', 'GENERAL PRACTICE');
insert into service_1(service_code, service_dept_code, equipment, name) values('VIS01','OP000','Vision Screener', 'VISION');

insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('OP000', 1, 'Y');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('GP000', 2, 'Y');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('GP000', 3, 'Y');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('OP000', 3, 'N');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('GP000', 3, 'Y');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('SE000', 4, 'Y');
insert into staff_in_serv_dept_1(service_dept_code,staff_id, is_primary) values('SE000', 5, 'Y');
insert into staff_in_serv_dept_2(service_dept_code,staff_id, is_primary) values('ER000', 1, 'Y');
insert into staff_in_serv_dept_2(service_dept_code,staff_id, is_primary) values('GP001', 2, 'Y');
insert into staff_in_serv_dept_3(service_dept_code,staff_id, is_primary) values('ER001', 2, 'Y');

insert into symptom_severity_1(type, symptom_code, staff_id) values('RANGE', 'SYM1', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('RANGE', 'SYM1', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('RANGE', 'SYM1', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM2', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM2', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM2', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM3', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM3', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM3', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM4', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM4', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM4', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM5', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM5', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM5', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM6', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM6', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM6', 1);
insert into symptom_severity_1(type, symptom_code, staff_id) values('ENUM', 'SYM7', 1);
insert into symptom_severity_2(type, symptom_code, staff_id) values('ENUM', 'SYM7', 1);
insert into symptom_severity_3(type, symptom_code, staff_id) values('ENUM', 'SYM7', 1);

insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,1,'1');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,2,'2');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,3,'3');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,4,'4');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,5,'5');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,6,'6');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,7,'7');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,8,'8');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,9,'9');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(1,10,'10');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(2,1,'NORMAL');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(2,2,'SEVERE');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(3,1,'LOW');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(3,2,'HIGH');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(4,1,'NORMAL');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(4,2,'PREMIUM');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(5,1,'NORMAL');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(5,2,'SEVERE');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(6,1,'NORMAL');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(6,2,'SEVERE');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(7,1,'MODERATE');
insert into severity_scale_1(symptom_severity_id,index_number,value) values(7,2,'HEAVY');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,1,'1');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,2,'2');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,3,'3');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,4,'4');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,5,'5');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,6,'6');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,7,'7');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,8,'8');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,9,'9');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(1,10,'10');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(2,1,'NORMAL');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(2,2,'SEVERE');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(3,1,'LOW');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(3,2,'HIGH');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(4,1,'NORMAL');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(4,2,'PREMIUM');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(5,1,'NORMAL');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(5,2,'SEVERE');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(6,1,'NORMAL');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(6,2,'SEVERE');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(7,1,'MODERATE');
insert into severity_scale_2(symptom_severity_id,index_number,value) values(7,2,'HEAVY');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,1,'1');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,2,'2');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,3,'3');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,4,'4');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,5,'5');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,6,'6');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,7,'7');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,8,'8');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,9,'9');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(1,10,'10');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(2,1,'NORMAL');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(2,2,'SEVERE');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(3,1,'LOW');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(3,2,'HIGH');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(4,1,'NORMAL');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(4,2,'PREMIUM');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(5,1,'NORMAL');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(5,2,'SEVERE');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(6,1,'NORMAL');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(6,2,'SEVERE');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(7,1,'MODERATE');
insert into severity_scale_3(symptom_severity_id,index_number,value) values(7,2,'HEAVY');

execute sign_up_new_patient(1,'AVENT FERRY ROAD','RALEIGH', 'NORTH CAROLINA', 'US', '100','JOHN', 'SMITH','1990/01/01',9007004567);
execute sign_up_new_patient(1,'LEXINGTON ROAD','NEW YORK', 'NEW YORK', 'US', '1016','JANE', 'DOE','2000/02/29',9192453245);
execute sign_up_new_patient(2,'AMPHITHEATRE PARKWAY','MOUNTAIN VIEW', 'CALIFORNIA', 'US', '1022','ROCK', 'STAR','1970/08/31',5403127893);
execute sign_up_new_patient(3,'SACRAMENTO','SANTA CRUZ', 'CALIFORNIA', 'US', '1210','SHELDON', 'COOPER','1984/05/26',6184628437);

insert into visit_1(patient_id, start_time) values(1, to_timestamp('2019/11/13 13:27', 'YYYY/MM/DD HH24:MI'));
insert into visit_1(patient_id, start_time) values(2, to_timestamp('2019/11/13 13:27', 'YYYY/MM/DD HH24:MI'));
insert into visit_2(patient_id, start_time) values(3, to_timestamp('2019/11/13 13:27', 'YYYY/MM/DD HH24:MI'));
insert into visit_3(patient_id, start_time) values(4, to_timestamp('2019/1/13 13:27', 'YYYY/MM/DD HH24:MI'));

insert into patient_symptoms_1(visit_id,symptom_code,severity_value,post_event,is_recurring ,duration) values(1, 'SYM3', 'HIGH', 'UNKNOWN', 'N', 1);
insert into patient_symptoms_1(visit_id,symptom_code,severity_value,post_event,is_recurring ,duration) values(2, 'SYM1', '5', 'FELL OFF BIKE', 'Y', 3);
insert into patient_symptoms_1(visit_id,symptom_code,severity_value) values(2, 'SYM7', 'HEAVY');
insert into patient_symptoms_2(visit_id,symptom_code,severity_value,post_event,is_recurring ,duration) values(1, 'SYM2', 'SEVERE', 'PEPPER CHALLENGE', 'N', 1);
insert into patient_symptoms_3(visit_id,symptom_code,severity_value,post_event,is_recurring ,duration) values(1, 'SYM6', 'NORMAL', 'UNKNOWN', 'N', 1);

insert into negative_experience(exp_name) values('Misdiagnosis');
insert into negative_experience(exp_name) values('Acquired infection during stay');

execute commit ;