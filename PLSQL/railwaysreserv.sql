set serveroutput on
accept x char prompt '1.Reservation 2.Cancellation 3.View Available Seats';
declare
seatstobook int;
seatsremaining int;
trainno int;
choice char;
begin
choice := &x;
trainno := &trainno;
seatstobook := &seatstobook;
select seats into seatsremaining from trains where tno = trainno;

case choice
when '1' then  
    if ((seatsremaining - seatstobook) >= 0) then
        update trains set seats = seatsremaining - seatstobook where tno = trainno;
        commit;
        seatsremaining := seatsremaining - seatstobook;
        dbms_output.put_line('Successfully Booked - Train No : ' || trainno || ' -- ' || seatsremaining || ' seats remaining');
    else
        dbms_output.put_line('Booking unsuccessful ! Train No : ' || trainno || ' does not have sufficient seats');
    end if;
when '2' then
    update trains set seats = seatsremaining + seatstobook where tno = trainno;
    seatsremaining := seatsremaining + seatstobook;
    dbms_output.put_line('Cancellation Successful ! Train Number : ' || trainno || ' : ' || seatsremaining || ' seats remaining');
    commit;
when '3' then  
    dbms_output.put_line('Train Number : ' || trainno || ' : ' || seatsremaining || ' seats remaining');
end case;
end;
/