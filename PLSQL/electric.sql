set serveroutput on
accept x char prompt 'Enter consumer no : ';
declare 
cursor homeowners is select * from homes;
unit float;
unitc float;
bill float;
choice int;

begin
choice := &x;
for i in homeowners loop
	if i.cno = choice then
		bill := 0;
		unit := i.currunits - i.prevunits;
		unitc := unit;
	if (unit > 500) then
		bill := bill + 100 * 5 + 200 * 7.5 + 200 * 15;
		unit := unit - 500;
		bill := bill + 22.5 * unit;
	elsif (unit > 300) then
		bill := bill + 100 * 5 + 200 * 7.5;
		unit := unit - 300;
		bill := bill + 15 * unit;
	elsif (unit > 100) then
		bill := bill * 100 * 5;
		unit := unit - 100;
		bill := bill + 7.5 * unit;
	else
		bill := unit * 5;
	end if;
	dbms_output.put_line('Consumer No : ' || i.cno);
	dbms_output.put_line('Consumer Name : ' || i.name);
	dbms_output.put_line('Units consumed : ' || unitc);
	dbms_output.put_line('Bill Amount : ' || bill);
	end if;
	end loop;


end;
/
