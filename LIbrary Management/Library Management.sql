create database library;
use library; 
show tables; 


create table book(book_id int, title varchar(25), language_id int, mrp float, publisher_id int, published_date date, 
volume int, status varchar(25));

create table author(author_id int, name varchar(25), email varchar(25), phone_number int, status varchar(25));
create table book_author(book_id int, author_id int);
create table publisher(publisher_id int, name varchar(25), address varchar(25));
create table member(member_id int, name varchar(25), branch_code varchar(25), roll_number int, phone_number int, email_id varchar(25), 
date_of_join date, status varchar(25));
create table book_issue(issue_id int, date_of_issue date, book_id int, member_id int, expected_date_of_return date,
status varchar(25));
create table book_return(issue_id int, actual_date_of_return date, latedays int, latefee float);
create table language(language_id int, name char(25));
create table late_fee_rule(fromdays date, todays date, amount int);

show tables;

-- Setting up key contraints 

alter table language add primary key (language_id);
alter table book add constraint fk_book_lang foreign key (language_id) references language(language_id);
alter table publisher add primary key (publisher_id);
alter table book add constraint fk_book_publisher foreign key (publisher_id) references publisher(publisher_id); 

alter table author add primary key (author_id);
alter table book_author add constraint fk_book_author_author foreign key (author_id) references author(author_id);

alter table book add primary key (book_id);
alter table book_issue add constraint fk_book_issue_book foreign key (book_id) references book(book_id);
alter table member add primary key (member_id);
alter table book_issue add constraint fk_book_issue_member foreign key (member_id) references member(member_id);

alter table book_issue add primary key (issue_id);
alter table book_return add constraint fk_book_return_book_issue foreign key (issue_id) references book_issue(issue_id);

-- select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
-- from information_schema.KEY_COLUMN_USAGE
-- where TABLE_NAME = 'book_author';


