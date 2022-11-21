set serveroutput on
create or replace trigger avg
after insert on students
for each row
begin
insert into studentreport values(:new.rollno, :new.name, :new.mark1, :new.mark2, :new.mark3, :new.mark1 + :new.mark)
end;
/