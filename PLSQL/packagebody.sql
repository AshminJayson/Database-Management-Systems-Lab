set serveroutput on

create or replace package body e_pack as 

    procedure addRec(
        e_id employeedetails.eid%type,
        e_name employeedetails.ename%type,
        e_address employeedetails.eaddress%type,
        e_sal employeedetails.esalary%type)
    is 
    begin
        insert into employeedetails(eid, ename, eaddress, esalary) values (e_id, e_name, e_address, e_sal);
        dbms_output.put_line('Inserted EID : ' || e_id);
        dbms_output.put_line('-------------Insertion Completed---------------');

    end addRec;

    procedure delRec(e_id employeedetails.eid%type)
    is
    begin
        delete from employeedetails where eid = e_id;
        dbms_output.put_line('Deleted EID : ' || e_id);
        dbms_output.put_line('------------Deletion Completed----------------');

    end delRec;

    procedure listEmp
    is
        cursor cur is select * from employeedetails;
    begin
        for i in cur loop
            dbms_output.put_line('EID : ' || i.eid || ' Name : ' || i.ename || ' Address: ' || i.eaddress || ' Salary : ' || i.esalary);
        end loop;
        dbms_output.put_line('---------------------------------------');
    end listEmp;

    function getSal(x in number) return number
    is
    e_sal employeedetails.esalary%type;
    begin
        select esalary into e_sal from employeedetails where eid = x;
        dbms_output.put_line('Employee ID : ' || x || ' Salary : ' || e_sal);
        return e_sal;
    end getSal;

end e_pack;
/