set serveroutput on
accept x number prompt 'Input the Roll Number of the student';
declare 
rno number(10);
mk1 number(10);
mk2 number(10);
mk3 number(10);
avgm number(10);
today varchar(20);
weekday varchar(20);
begin
rno:=&x;
select mark1 into mk1 from students where rollno = rno;
select mark2 into mk2 from students where rollno = rno;
select mark2 into mk3 from students where rollno = rno;

avgm:=mk1+mk2+mk3;
avgm:=avgm/3;
dbms_output.put_line('Average Marks : ' || avgm);
if avgm < 40 then
	dbms_output.put_line('Need Improvement');
end if;

select to_char(current_date, 'dd-mm-yyyy') into today from dual;
select to_char(current_date, 'DAY') into weekday from dual;

dbms_output.put_line('Date : ' || today);
dbms_output.put_line('Day of week : ' || weekday);

end;
/


