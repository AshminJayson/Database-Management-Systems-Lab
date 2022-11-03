-- Ashmin Jayson S5 DS
-- Roll No : 14
-- Experiment 6 : Banking system using PLSQL
-- Date : 31/10/22

set serveroutput on
accept x char prompt '1.Debit 2.Credit 3.View Balance ';
accept paccno number prompt 'Enter the account number : ';
accept tval number prompt 'Enter the value to be transacted (or 0 if none) : ';
DECLARE
bal number(20);
minbal number(20):=500;
taccno number(20);
val number(20);
ch char;
BEGIN

ch:=&x;
taccno:=&paccno;
val:=&tval;

select balance into bal from accounts where accno = taccno;

case
	when ch = '1' then
		if ((bal - val) >= minbal) then
			bal:=bal-val;
			update accounts set balance = bal where accno = taccno;
			dbms_output.put_line('Rs ' || val || ' has been debited from account number ' || taccno);
			dbms_output.put_line('Current Balance : ' || bal);
			commit;
		else 
			dbms_output.put_line('Insufficient Funds available to perform debit');
		end if;
	when ch = '2' then
		bal:=bal+val;
		update accounts set balance = bal where accno = taccno;
		dbms_output.put_line('Rs ' || val || ' has been credited to account number ' || taccno);
		dbms_output.put_line('Current Balance : ' || bal);
		commit;
	when ch = '3' then
		dbms_output.put_line('Current Balance : ' || bal);
end case;

END;
/
