set serveroutput on

declare 
cursor homeowners is select * from homes;
unitsused number(38);
billamount float(38);

begin
dbms_output.put_line('Electricity Bills');
for i in homeowners loop
	unitsused := i.currunits - i.prevunits;
	if unitsused > 500 then
		billamount := unitsused * 22.5;
	elsif unitsused > 300 then
		billamount := unitsused * 15;
	elsif unitsused > 100 then
		billamount := unitsused * 7.5;
	else 
		billamount := unitsused * 5;
	end if;
dbms_output.put_line('Name : ' || i.name || ' Units Consumed : ' || unitsused || ' Bill Amount : ' || billamount);
end loop;
end;
/
