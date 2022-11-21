create sequence trainseq;
create or replace trigger te
before insert on trains
for each row
begin
    select trainseq.nextval into :new.tno from dual;
end;
/