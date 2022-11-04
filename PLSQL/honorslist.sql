set serveroutput on

declare
cursor student_cursor is select * from students where sem1sgpa + sem2sgpa > 12 order by rollno;
maxg float(5);
begin
dbms_output.put_line('List of eligible honors students');
dbms_output.put_line('Name      RollNo      HighestMarks');
for i in student_cursor loop
	if i.sem1sgpa > i.sem2sgpa then
		maxg:=i.sem1sgpa;
	else
		maxg:=i.sem2sgpa;
	end if;

	dbms_output.put_line(i.name || '       '  || i.rollno || '             ' || maxg);
	end loop;
end;
/
