set serveroutput on
declare 
avgm number(10);
today varchar(20);
weekday varchar(20);
begin
select avg(marks) into avgm from students;

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


