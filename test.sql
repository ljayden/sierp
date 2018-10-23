CREATE TABLE customer (
		  customer_code VARCHAR(6) PRIMARY KEY,
		  customer_name VARCHAR(30),
		  company_seq integer not null,
		  service_type VARCHAR(10)
);

INSERT INTO customer values('DEMOCOM', '다이어컴패니', 1, 'BOTH')

CREATE TABLE customer_manager (
		  customer_code VARCHAR(6),
		  id VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  password VARCHAR(100) not null,
		  name VARCHAR(20) not null,
		  phone_no VARCHAR(20) not null,
		  position VARCHAR(20) not null,
		  auth_type CHAR(2),
		  
		  PRIMARY KEY (customer_code,id)
);
 
INSERT INTO customer_manager values('DEMOCOM', 'demouser', 'test@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '김데모', '010-5122-8991', '대리', 'A1') --비번1234
	
CREATE TABLE company(
          company_seq integer PRIMARY KEY,
		  customer_code VARCHAR(6), 
		  company_name VARCHAR(30),  
		  biz_no VARCHAR(10),
		  sido VARCHAR(20),
		  si_gun_gu VARCHAR(20),
		  detail_addr VARCHAR(100),
		  register_ymdt TIMESTAMP,
		  resiter_manager_id VARCHAR(50)
)

INSERT INTO company values(1 , 'DEMO', '네이버', '1238796542', 'GYUNGGI', 'SUNGNAM_BUNDANG', '정자역', datetime('now'), '')


CREATE TABLE worker (
		  worker_seq integer PRIMARY KEY AUTOINCREMENT,
		  worker_type VARCHAR(10) not null, --직원, 프리랜서
		  customer_code VARCHAR(6) not null,
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
	
		  register_ymdt TIMESTAMP,
		  modify_ymdt TIMESTAMP
);
 

CREATE TABLE freelancer (

	 freelancer_seq integer PRIMARY KEY AUTOINCREMENT,
     worker_seq integer not null,
     
     user_seq integer,
     
     customer_memo VARCHAR(500),
     
     modify_manager_id VARCHAR(500),		--없으면 본인
	 resiter_manager_id	VARCHAR(500) --없으면 본인
);

   


   
	