set serveroutput on

accept x number prompt 'Enter the account number : '

declare
taccno number(2);
bal number(10);
rating  varchar(20);

begin
taccno:=&x;
select balance into bal from accounts where accno = taccno; 
rating := categorize(bal);
dbms_output.put_line('The account number : ' || taccno || ' is in the ' || rating || ' category'); 

end;
/
