set serveroutput on

declare
eidtodelete employeedetails.eid%type;
eidtodisplay number(10);
begin
eidtodelete:=&eidtodelete;
eidtodisplay:=&eidtodisplay;
e_pack.addRec(1, 'Rish', 'Kothamangalam', 150000);
e_pack.addRec(3, 'Kish', 'Kottayam', 200000);
e_pack.listEmp();
e_pack.delRec(eidtodelete);
e_pack.addRec(5, 'Mish', 'Mangalam', 2000);
e_pack.listEmp();
e_pack.addRec(10, 'Pish', 'Thamangalam', 200040);
dbms_output.put_line('Salary : ' || e_pack.getSal(eidtodisplay));
end;
/