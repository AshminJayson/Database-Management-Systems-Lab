set serveroutput on
create or replace trigger ted
before insert or update of rollno, name, sem1sgpa, sem2sgpa or 
delete
on students
for each row
begin
case 
    when inserting then
        dbms_output.put_line('Trigger Message : Inserting ' || :new.name);
    when updating('rollno') then   
        dbms_output.put_line('Trigger Message : Updating rollno ' || :old.rollno || ' to ' || :new.rollno);
    when updating('sem1sgpa') then 
        dbms_output.put_line('Trigger Message : Updating sem1 grade ' || :old.sem1sgpa || ' to ' || :new.sem1sgpa);
    when updating('sem2sgpa') then 
        dbms_output.put_line('Trigger Message : Updating sem2 grade ' || :old.sem2sgpa || ' to ' || :new.sem2sgpa);
    when deleting then
        dbms_output.put_line('Trigger Message : Deleting ' || :old.name);
end case;
end;
/