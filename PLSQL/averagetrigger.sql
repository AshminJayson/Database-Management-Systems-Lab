delimiter //

create trigger averager 
before insert on students
for each row 
begin
set new.total = new.mark1 + new.mark2 + new.mark3;
set new.average = new.total / 3;
end
//



