-- guestbook ver mysql. 
CREATE TABLE `guestbook` (
	`seq` INT(11) NOT NULL AUTO_INCREMENT,	-- 식별자
	`email` VARCHAR(128) NOT NULL,			-- 이메일
	`passwd` VARCHAR(128) NOT NULL,			-- 비밀번호
	`content` VARCHAR(4000) NULL,			-- 내용(공통)
	`createtime` datetime NOT NULL,			-- 작성시간 
	`modifiedtime` datetime NULL,			-- 수정시간
	
	PRIMARY KEY(`seq`),
	UNIQUE KEY seq (`seq`)
);

CREATE TABLE guestbook(
seq INTEGER AUTO_INCREMENT(1,1) NOT NULL,
email VARCHAR(255) COLLATE utf8_bin  NOT NULL,
passwd VARCHAR(255) COLLATE utf8_bin  NOT NULL,
content VARCHAR(4096) COLLATE utf8_bin ,
createtime DATETIME NOT NULL,
modifiedtime DATETIME,
CONSTRAINT pk PRIMARY KEY(seq)
) COLLATE utf8_bin  REUSE_OID ;
