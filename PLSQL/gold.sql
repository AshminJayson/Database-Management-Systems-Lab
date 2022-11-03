create or replace function dc(x in number) return varchar is 
msg varchar(10);
begin
	if x > 50000 then
		msg:='Platinum';
	elsif x > 10000 then
		msg:='Gold';
	else 
		msg:='Silver';
	end if;
	return msg;
end;
/
