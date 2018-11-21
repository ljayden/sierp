--1542257163365

CREATE TABLE customer (
		  customer_seq integer PRIMARY KEY AUTOINCREMENT,
		  customer_code VARCHAR(8),
		  customer_name VARCHAR(30),
		  company_seq integer not null,
		  service_type VARCHAR(10)
);

INSERT INTO customer values(1, 'DEMOCOM', '���̾����д�', 1, 'BOTH')

CREATE TABLE customer_manager (
		  customer_seq integer,
		  id VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  password VARCHAR(100) not null,
		  name VARCHAR(20) not null,
		  phone_no VARCHAR(20),
		  position VARCHAR(20) not null,
		  auth_type CHAR(2),
		  
		  PRIMARY KEY (customer_seq, id)
);
 
INSERT INTO customer_manager values(1, 'demouser', 'test@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '�赥��', '010-5122-8991', '�븮', 'A1') --���1234
INSERT INTO customer_manager values(1, 'demouser2', 'test2@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '��ö��', '010-2429-9155', '����', 'A1') --���1234
INSERT INTO customer_manager values(1, 'demouser3', 'test3@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '�ֿ���', '010-6112-9412', '����', 'A1') --���1234
	
CREATE TABLE company(
          company_seq integer PRIMARY KEY,
		  customer_seq integer,
		  company_name VARCHAR(30),  
		  biz_no VARCHAR(10),
		  sido VARCHAR(20),
		  si_gun_gu VARCHAR(20),
		  detail_addr VARCHAR(100),
		  customer_memo VARCHAR(500),
		  register_ymdt DATETIME,
		  register_manager_id VARCHAR(50)
);

INSERT INTO company values(1 , 1, '���̹�', '1238796542', 'GYUNGGI', 'SUNGNAM_BUNDANG', '���ڿ�', '������ü', datetime('now'), 'demouser2');
INSERT INTO company values(2 , 1, '����',  '1211196542', 'GYUNGGI', 'SUNGNAM_BUNDANG', 'H������', '�����ü', datetime('now'), 'demouser3');

CREATE TABLE company_staff (
	company_staff_seq integer PRIMARY KEY AUTOINCREMENT,
	company_seq integer not NULL,
	name VARCHAR(20) not null,
	phone_no VARCHAR(20),
	company_phone_no,
	email VARCHAR(50),
	position  VARCHAR(20),
	part VARCHAR(40),
	customer_memo VARCHAR(500),
 	register_ymdt DATETIME,
	register_manager_id VARCHAR(50)
) ;
	
CREATE TABLE worker (
		  worker_seq integer PRIMARY KEY AUTOINCREMENT,
		  worker_type VARCHAR(10) not null, --����, ��������
		  customer_seq integer default 0,
		  name VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  phone_no VARCHAR(20) null,
		  birth_year integer not null,
		  birth_month integer null,
		  birth_day integer null,
		  sex CHAR(1) not null,
 
		  worker_expert_type VARCHAR(10) not null,
		  
		  academic_level VARCHAR(20) not null,
		  academic_level_val integer not null,
		  start_work_year integer,
		  start_work_month integer,
		
		  sido VARCHAR(20) not null,
		  sigungu VARCHAR(20) not null,
	      detail_addr VARCHAR(200) not null,
	
		  register_ymdt DATETIME,
		  modify_ymdt DATETIME
); 

CREATE TABLE worker_career (
          worker_career_seq integer PRIMARY KEY AUTOINCREMENT,
		  worker_seq integer not null,
		 
		  work_start_year integer not null,
		  work_start_month integer not null,
		
		  work_end_year integer,
		  work_end_month integer,
		  
		  recruit_type VARCHAR(10) not null,
		  job_desc VARCHAR(200) null,
	      company_name VARCHAR(100) not null 
); 

CREATE TABLE worker_advantage (
		  worker_seq integer not null, 
		  advantage_seq integer not null,
		  advantage_type VARCHAR(10) not null,
		  workmanship  VARCHAR(10),
		  workmanship_val integer,
		  PRIMARY KEY (worker_seq, advantage_seq)
); 
	   
	
CREATE TABLE freelancer (

	 freelancer_seq integer PRIMARY KEY AUTOINCREMENT,
     worker_seq integer not null,
     
     user_seq integer,
     hope_recruit_type_val integer not null,
	 hope_work_posi_type_val integer not null,
     customer_memo VARCHAR(500),
     
     seeking_work_status  VARCHAR(10) not null,
     seeking_work_status_re_confirm_ymd  VARCHAR(8),
     seeking_work_reject_cause VARCHAR(200),
     
     main_manager_id VARCHAR(50),
     modify_manager_id VARCHAR(50),		--������ ����
	 register_manager_id	VARCHAR(50) --������ ����
);
	 
   
CREATE TABLE advantage (
	advantage_seq integer PRIMARY KEY AUTOINCREMENT,
	advantage_name VARCHAR(50) not null,
	advantage_type VARCHAR(10) not null,
	skill_set_type VARCHAR(20),
	customer_seq integer delete 0,
	register_manager_id VARCHAR(50),
	register_ymdt DATETIME	
);

INSERT INTO advantage values(1 , '����ó�����', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(2 , '�������α�ɻ�', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(3 , 'CCNA', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(4 , '��������ڰ�(ITQ)', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(5 , '����700', 'LICENSE', null, 1, 'demouser', datetime('now'));
INSERT INTO advantage values(6 , '����900', 'LICENSE', null, 1, 'demouser', datetime('now'));

INSERT INTO advantage values(7 , '�ؿܱٹ�', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(8 , '����ٹ�', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(9 , '�������Ի���', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(10 , '����ȸȭ������', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(11 , '�߱������', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(12 , '����������', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(13 , 'û������', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(14 , '�μ�����', 'PREFERENCE', null, 1, 'demouser', datetime('now'));


INSERT INTO advantage values(15 , 'JAVA', 'SKILL', 'EXPERT', 0, '', datetime('now'));

INSERT INTO advantage values(16 , '��ȥ', 'PREFERENCE', null, 1, 'demouser', datetime('now'));