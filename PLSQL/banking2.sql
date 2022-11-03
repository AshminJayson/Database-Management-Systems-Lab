set serveroutput on

accept paccno number prompt 'Enter the account number : ';
DECLARE
bal number(20);
minbal number(20):=500;
taccno number(20);
val number(20):=200;

BEGIN

taccno:=&paccno;

select balance into bal from accounts where accno = taccno;

if ((bal - val) > minbal) then
	bal:=bal-200;
	update accounts set balance = bal where taccno = accno;
	commit;
	dbms_output.put_line('Rs 200 has be debited from account number : ' || taccno);
else
	dbms_output.put_line('Insufficient funds in account');
end if;
dbms_output.put_line('Current Balance : ' || bal);
end;
/
