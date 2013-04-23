DROP SCHEMA IF EXISTS yuukicontent;

CREATE SCHEMA yuukicontent
	CHARACTER SET = 'utf8'
	COLLATE = 'utf8_bin';
	
GRANT ALL PRIVILEGES ON `yuukicontent`.* TO 'yuukicontent'@'%';