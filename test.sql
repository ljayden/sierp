CREATE TABLE customer (
		  customer_code VARCHAR(6) PRIMARY KEY,
		  customer_name VARCHAR(30),
		  company_seq integer not null,
		  service_type VARCHAR(10)
);

INSERT INTO customer values('DEMO', '다이어컴패니', 1, 'BOTH')

CREATE TABLE customer_manager (
		  customer_code VARCHAR(6),
		  id VARCHAR(50) not null,
		  email VARCHAR(50) not null,
		  password VARCHAR(100) not null,
		  name VARCHAR(20) not null,
		  phoneNo VARCHAR(20) not null,
		  position VARCHAR(20) not null,
		  auth_type CHAR(2) 
);
 
INSERT INTO customer_manager values('DEMO', 'demouser', 'test@hanmail.net', '1234', '김데모', '010-5122-8991', '대리', 'A1')
	
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
 