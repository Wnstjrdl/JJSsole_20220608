## 프로젝트 기획안
## 작성일 : 2022. O6. O7
## 작성자 : 전준석

## 프로젝트 명 JJSsolo_20220627
## 기획 의도 
● 게임 캐릭터들의 순위와 정보를 알수있고 유저들이 댓글을 달수있음 <br/>
●기존의 했었던 회원제게시판을 참조하여 캐릭터의 정보와 유저들의 댓글을 볼수있음
## 벤치마킹 
●  예전에 한 게임의 캐릭터 정보사이트를 참고하였습니다
## 주요 기능 
● 로그인 회원가입<br/>
● 등록된 캐릭터의 대한 댓글을 적을 수있음
● 등록된 캐릭터를 검색하여 찾아볼수있음
● 운영자의 계정으로 유저를 삭제할수있음 
● 자신의 회원 탈퇴 기능  
● 자신의 회원 수정 기능 
● 캐릭터의 사진 을볼 수 있는 갤러리가 있음

## 기타
● 회원가입게시판을 복습하는 겸 응용할 생각입니다.

## 사용된테이블

-- 2022-06-08
## 회원관리용 테이블
create table member_table(
id bigint auto_increment,<br />
memberId 	varchar(20),<br />
memberPassword varchar(50) not null,<br />
memberName     varchar(20) not null,<br />
memberEmail    varchar(50) ,<br />
memberMobile   varchar(50)not null,<br />
constraint pk_member_table primary key(id),<br />
constraint unique(memberId)  <br />
);

alter table member_table add column memberFileName varchar(100);

select * from member_table;

## 게시판관리용 테이블
create table board_table(
id bigint auto_increment,<br />
boardTitle  varchar(20) not null ,<br />
boardWriter varchar(20),<br />
boardContents varchar(500) not null,<br />
boardHits    int default 0,<br />
boardCreatedDate timestamp,<br />
constraint pk_board_table primary key(id),<br />
constraint fk_board_table foreign key(boardWriter) references member_table(memberId) on delete cascade<br />
);

select * from board_table;

alter table board_table add column boardFileName varchar(100);

## 댓글관리용 테이블
create table comment_table(
id bigint auto_increment,<br />
boardId    bigint,<br />
commentWriter varchar(20) not null,<br />
commentCreatedDate timestamp,<br />
commentContents varchar(500) not null,<br />
constraint pk_comment_table primary key(id),<br />
constraint fk_comment_table_writer foreign key(commentWriter) references member_table(memberId) on delete cascade,<br />
constraint fk_comment_table_id foreign key(boardId) references board_table(id) on delete cascade<br />


);
## 공지사항관리용 테이블
create table notice_table(
id bigint auto_increment, <br />
noticeTitle  varchar(20) not null ,<br />
noticeWriter varchar(20),<br />
noticeContents varchar(500) not null,<br />
noticeHits    int default 0,<br />
noticeCreatedDate timestamp,<br />
constraint pk_notice_table primary key(id),<br />
constraint fk_notice_table foreign key(noticeWriter) references member_table(memberId) on delete cascade
);<br />
alter table notice_table add column noticeFileName varchar(100);<br />