create table client (
   client_no number primary key,
   client_id nvarchar2(20),
   client_pw nvarchar2(20),
   client_gender char(1) NOT NULL,
   constraints check3 check (client_gender in('m', 'f')),
   client_age number NOT NULL
   );

   
create table park (
   park_no number,
   sensor_no number,
   constraints park1 primary key(park_no, sensor_no),
   client number,
   constraints client1 FOREIGN KEY(client)
   references client(client_no)
   );
   
   
create table time_history(
   park_no number,
   park_date date NOT NULL,
   sensor_no number,
   constraints park2 primary key(park_no, sensor_no),
   client number,
   constraints client2 FOREIGN KEY(client)
   references client(client_no);
   --time date default sysdate
   );

drop table time_history:
   create sequence seq_5
   increment by 1
   start with 0
   minvalue 0
   maxvalue 100
   nocycle
   nocache;
   
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'mdy', '0501', 'm', 2);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'ptj', '0525', 'm', 3);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'pcr', '1234', 'f', 4);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'lmw', '0814', 'm', 3);
insert into client(client_no, client_id, client_pw, client_gender, client_age) values (seq_5.nextval, 'kdi', '1121', 'f', 2);


   
insert into park(park_no, sensor_no, client) values (1, 2, 3); 
insert into park(park_no, sensor_no, client) values (2, 4, 4); 


select * from client a, park b
where a.client_no = b.client;
-- 예시

CREATE or replace package pkg is
    type t_ref is ref cursor;
end;
create or replace PROCEDURE TEST_2
(
    ret_cur1 out pkg.t_ref
)
is
begin
open ret_cur1 for
select park_no,sensor_no from park;
end;


create trigger Auto_input
after 
insert or update ON PARK
for each row

  select park_no from park;
  
  create trigger auto_input
  after insert on PARK
  begin
  insert into time_history
  values(obj.park_no,obj.sensor_no,obj.client);
  ends;
  drop trigger auto_input;
  drop trigger sum_trigger;
--연습 2
CREATE TABLE T1
(
 NUM INT,
 NAME VARCHAR(10)
); 
SELECT * FROM T1;

INSERT into T1 VALUES(2, '나나나');

delete  from T1;

--연습 3

CREATE OR REPLACE trigger sum_trigger
after
INSERT OR UPDATE ON park
FOR EACH ROW
declare temp_parkno
begin
select temp_parkno into park_no from time_history;
end;

--연습 4(ㅇ)

create table park_2 as select * from park;

create or replace trigger insert_park_2
after insert on park
for each row
declare
begin
  insert into park_2
  values(:new.park_no,:new.sensor_no,:new.client);
end;

insert into park(park_no,sensor_no,client) values (2,3,4);
insert into park(park_no,sensor_no,client) values (3,1,2);
insert into park(park_no,sensor_no,client) values (1,2,3);
drop trigger insert_time_history;
drop trigger history_input;
drop trigger insert_park_2;
select * from park_2
drop table TIME_HISTORY;
--연습 5

create or replace trigger insert_history
after insert or update on PARK
for each row
declare
begin 
  insert into TIME_HISTORY
  values(:new.park_no,sysdate,:new.sensor_no,:new.client);
end;
/* 고민의 흔적들..
insert into time_history(park_no, sensor_no, client, time)
select    from client a, park b
 where a.park_no = b.
update time_history set park_no = 
*/