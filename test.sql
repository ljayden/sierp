CREATE TABLE customer (
		  customer_code VARCHAR(8) PRIMARY KEY,
		  customer_name VARCHAR(30),
		  company_seq integer not null,
		  service_type VARCHAR(10)
);

INSERT INTO customer values('DEMOCOM', '���̾����д�', 1, 'BOTH')

CREATE TABLE customer_manager (
		  customer_code VARCHAR(8),
		  id VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  password VARCHAR(100) not null,
		  name VARCHAR(20) not null,
		  phone_no VARCHAR(20) not null,
		  position VARCHAR(20) not null,
		  auth_type CHAR(2),
		  
		  PRIMARY KEY (customer_code,id)
);
 
INSERT INTO customer_manager values('DEMOCOM', 'demouser', 'test@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '�赥��', '010-5122-8991', '�븮', 'A1') --���1234
INSERT INTO customer_manager values('DEMOCOM', 'demouser2', 'test2@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '��ö��', '010-2429-9155', '����', 'A1') --���1234
INSERT INTO customer_manager values('DEMOCOM', 'demouser3', 'test3@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '�ֿ���', '010-6112-9412', '����', 'A1') --���1234
	
CREATE TABLE company(
          company_seq integer PRIMARY KEY,
		  customer_code VARCHAR(8),
		  company_name VARCHAR(30),  
		  biz_no VARCHAR(10),
		  sido VARCHAR(20),
		  si_gun_gu VARCHAR(20),
		  detail_addr VARCHAR(100),
		  register_ymdt DATETIME,
		  register_manager_id VARCHAR(50)
);

INSERT INTO company values(1 , 'DEMOCOM', '���̹�', '1238796542', 'GYUNGGI', 'SUNGNAM_BUNDANG', '���ڿ�', datetime('now'), '');


CREATE TABLE worker (
		  worker_seq integer PRIMARY KEY AUTOINCREMENT,
		  worker_type VARCHAR(10) not null, --����, ��������
		  customer_code VARCHAR(8) default 'COMMON', 
		  name VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  phone_no VARCHAR(20) null,
		  birth_year integer not null,
		  birth_month_day CHAR(4) null,
		  sex CHAR(1) not null,
 
		  worker_expert_type VARCHAR(10) not null,
		  
		  academic_level VARCHAR(20) not null,
		  start_work_year integer,
		  start_work_month integer,
		
		  sido VARCHAR(20) not null,
		  siGunGu VARCHAR(20) not null,
	      detailAddr VARCHAR(200) not null,
	
		  register_ymdt DATETIME,
		  modify_ymdt DATETIME
);
 

CREATE TABLE freelancer (

	 freelancer_seq integer PRIMARY KEY AUTOINCREMENT,
     worker_seq integer not null,
     
     user_seq integer,
     
     customer_memo VARCHAR(500),
     
     modify_manager_id VARCHAR(500),		--������ ����
	 register_manager_id	VARCHAR(500) --������ ����
);

   
CREATE TABLE advantage (
	advantageSeq integer PRIMARY KEY AUTOINCREMENT,
	advantage_name VARCHAR(50) not null,
	advantage_type VARCHAR(10) not null,
	skill_set_type VARCHAR(20),
	customer_code VARCHAR(8) default 'COMMON',
	register_manager_id VARCHAR(50),
	register_ymdt DATETIME	
);

INSERT INTO advantage values(1 , '����ó�����', 'LICENSE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(2 , '�������α�ɻ�', 'LICENSE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(3 , 'CCNA', 'LICENSE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(4 , '��������ڰ�(ITQ)', 'LICENSE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(5 , '����700', 'LICENSE', null, 'DEMOCOM', 'demouser', datetime('now'));
INSERT INTO advantage values(6 , '����900', 'LICENSE', null, 'DEMOCOM', 'demouser', datetime('now'));

INSERT INTO advantage values(7 , '�ؿܱٹ�', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(8 , '����ٹ�', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(9 , '�������Ի���', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(10 , '����ȸȭ������', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(11 , '�߱������', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(12 , '����������', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(13 , 'û������', 'PREFERENCE', null, 'COMMON', '', datetime('now'));
INSERT INTO advantage values(14 , '�μ�����', 'PREFERENCE', null, 'DEMOCOM', 'demouser', datetime('now'));


INSERT INTO advantage values(15 , 'JAVA', 'SKILL', 'EXPERT', 'COMMON', '', datetime('now'));