--1542257163365

CREATE TABLE customer (
		  customer_seq integer PRIMARY KEY AUTOINCREMENT,
		  customer_code VARCHAR(8),
		  customer_name VARCHAR(30),
		  company_seq integer not null,
		  service_type VARCHAR(10)
);

INSERT INTO customer values(1, 'DEMOCOM', '다이어컴패니', 1, 'BOTH')

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
 
INSERT INTO customer_manager values(1, 'demouser', 'test@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '김데모', '010-5122-8991', '대리', 'A1') --비번1234
INSERT INTO customer_manager values(1, 'demouser2', 'test2@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '이철수', '010-2429-9155', '부장', 'A1') --비번1234
INSERT INTO customer_manager values(1, 'demouser3', 'test3@hanmail.net', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', '최영희', '010-6112-9412', '과장', 'A1') --비번1234
	
CREATE TABLE company(
          company_seq integer PRIMARY KEY,
		  customer_seq integer,
		  company_name VARCHAR(30),
		  company_intro VARCHAR(5000),
		  biz_no VARCHAR(10),
		  sido VARCHAR(20),
		  sigungu VARCHAR(20),
		  detail_addr VARCHAR(100),
		  manager_memo VARCHAR(500),
		  register_ymdt DATETIME,
		  register_manager_id VARCHAR(50),
		  modify_ymdt DATETIME,
		  modify_manager_id VARCHAR(50)
);

INSERT INTO company values(1 , 1, '네이버', '1238796542', 'GYUNGGI', 'SUNGNAM_BUNDANG', '정자역', '갑질업체', datetime('now'), 'demouser2');
INSERT INTO company values(2 , 1, '다음',  '1211196542', 'GYUNGGI', 'SUNGNAM_BUNDANG', 'H스퀘어', '진상업체', datetime('now'), 'demouser3');

CREATE TABLE company_staff (
	company_staff_seq integer PRIMARY KEY AUTOINCREMENT,
	company_seq integer not NULL,
	name VARCHAR(20) not null,
	phone_no VARCHAR(20),
	company_phone_no,
	email VARCHAR(50),
	position  VARCHAR(20),
	part VARCHAR(40),
	manager_memo VARCHAR(500),
 	register_ymdt DATETIME,
	register_manager_id VARCHAR(50),
	modify_ymdt DATETIME,
	modify_manager_id VARCHAR(50),
	remove_yn char(1) default 'N'
) ;
	
CREATE TABLE worker (
		  worker_seq integer PRIMARY KEY AUTOINCREMENT,
		  worker_type VARCHAR(10) not null, --직원, 프리랜서
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
     modify_manager_id VARCHAR(50),		--없으면 본인
	 register_manager_id	VARCHAR(50) --없으면 본인
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

INSERT INTO advantage values(1 , '정보처리기사', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(2 , '웹디자인기능사', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(3 , 'CCNA', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(4 , '정보기술자격(ITQ)', 'LICENSE', null, 0, '', datetime('now'));
INSERT INTO advantage values(5 , '토익700', 'LICENSE', null, 1, 'demouser', datetime('now'));
INSERT INTO advantage values(6 , '토익900', 'LICENSE', null, 1, 'demouser', datetime('now'));

INSERT INTO advantage values(7 , '해외근무', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(8 , '지방근무', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(9 , '공모전입상자', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(10 , '영어회화가능자', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(11 , '중국어가능자', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(12 , '국가유공자', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(13 , '청년인턴', 'PREFERENCE', null, 0, '', datetime('now'));
INSERT INTO advantage values(14 , '인성좋음', 'PREFERENCE', null, 1, 'demouser', datetime('now'));


INSERT INTO advantage values(15 , 'JAVA', 'SKILL', 'EXPERT', 0, '', datetime('now'));

INSERT INTO advantage values(16 , '미혼', 'PREFERENCE', null, 1, 'demouser', datetime('now'));



CREATE TABLE project (
	project_seq integer PRIMARY KEY AUTOINCREMENT,
	customer_seq integer,
	main_manager_id  VARCHAR(50),
	company_seq integer not NULL,
	company_staff_seq integer,
	main_company_seq integer,
	main_company_staff_seq integer,
	project_name VARCHAR(100),
	start_year integer,
	start_month integer,
	start_day integer,
	start_ymdt DATETIME,
	end_year integer,
	end_month integer,
	end_day integer,
	end_ymdt DATETIME,
	sido VARCHAR(20),
	sigungu VARCHAR(20),
	detail_addr VARCHAR(200),
	project_desc VARCHAR(500),
	manager_memo VARCHAR(2000),
	register_manager_id VARCHAR(50),
	register_ymdt DATETIME,
	modify_ymdt DATETIME,
	modify_manager_id VARCHAR(50),
	remove_yn char(1) default 'N',
	end_yn VARCHAR(1)
);




CREATE TABLE posting (
	posting_seq integer PRIMARY KEY AUTOINCREMENT,
	customer_seq integer not null,
	
	posting_title VARCHAR(200) not null,
	
	status VARCHAR(10) not null,
	end_ymdt DATETIME,
	site_post_yn CHAR(1) not null,
	
	company_seq integer not null,			
	company_staff_seq integer,
	project_seq integer,
	
	work_type VARCHAR(10),
	
	recruit_type VARCHAR(10) not null,
	recruit_man_count integer,

	need_academic_level VARCHAR(10),
	need_academic_level_value integer not null,
	need_free_grade VARCHAR(10),
	need_free_grade_value integer not null,
	limit_work_year_min integer,
	limit_work_year_max integer,
	limit_age_min integer,
	limit_age_max integer,
	
	recruit_contract_unit_value integer,
	
	reward_type VARCHAR(10),
	reward_min_price integer,
	reward_max_price integer,
	
	work_sido VARCHAR(20)  not null,
	work_sigungu VARCHAR(20) not null,
	work_detail_addr VARCHAR(200),
	
	office_work_yn CHAR(1) not null,
	office_home_work_yn CHAR(1) not null,
	home_work_yn CHAR(1) not null,

	job_info VARCHAR(1000),
	recruit_info VARCHAR(1000),

	manager_memo VARCHAR(1000),
	
	main_manager_id  VARCHAR(50),
	register_manager_id VARCHAR(50) not null,
	register_ymdt DATETIME not null,
	
	modify_manager_id VARCHAR(50),
	modify_ymdt DATETIME
);


CREATE TABLE posting_condition (
	posting_condition_seq integer PRIMARY KEY AUTOINCREMENT,
	posting_seq integer not null,
	
	condition_type VARCHAR(10),
	
	advantage_seq integer not null,
	advantage_type VARCHAR(10) not null,
	workmanship  VARCHAR(10),
	workmanship_val integer
);