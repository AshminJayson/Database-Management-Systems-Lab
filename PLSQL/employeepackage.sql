
create or replace package e_pack as 
    procedure addRec(
        e_id employeedetails.eid%type,
        e_name employeedetails.ename%type,
        e_address employeedetails.eaddress%type,
        e_sal employeedetails.esalary%type);

    procedure delRec(e_id employeedetails.eid%type);

    procedure listEmp;

    function getSal(x in number) return number;

end e_pack;
/

