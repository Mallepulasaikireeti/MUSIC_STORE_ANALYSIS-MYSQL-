create database music_store;
use music_store;

#EMPLOYEE TABLE
create table employee(employee_id int,
last_name varchar(55),
first_name varchar(55),
title varchar(55),
reports_to int,
levels varchar(55),
birthdate date,
hire_date date,
address varchar(55),
city varchar(55),
state varchar(55),
country varchar(55),
postal_code varchar(55),
phone int,
fax int,
email varchar(55),primary key(employee_id,reports_to));

#CUSTOMER TABLE
create table customer
(customer_id int primary key,
first_name varchar(55),
last_name varchar(55),
company varchar(55),
address varchar(55),
city varchar(55),
state varchar(55),
country varchar(55),
postal_code varchar(55),
phone int,
fax int,
email varchar(55),
support_rep_id int,foreign key(support_rep_id) references employee(employee_id));


#INVOICE TABLE
create table invoice
(invoice_id int primary key,
customer_id int,foreign key(customer_id) references customer(customer_id),
invoice_date date,
billing_address varchar(55),
billing_city varchar(55),
billing_state varchar(55),
billing_country varchar(55),
billing_postal_code varchar(55),
total float);

#ARTIST TABLE
create table artist
(artist_id int primary key,
name varchar(55));

#ALBUM TABLE
create table album
(album_id int primary key,
title varchar(55),
artist_id int,foreign key(artist_id) references artist(artist_id));

#MEDIA_TYPE TABLE
create table media_type
(media_type_id int primary key,
name varchar(55));

#GENRE TABLE
create table genre
(genre_id int primary key,
name varchar(55));

#TRACK TABLE
create table track
(track_id int primary key,
name varchar(55),
album_id int,foreign key(album_id) references album(album_id),
media_type_id int,foreign key(media_type_id) references media_type(media_type_id),
genre_id int,foreign key(genre_id) references genre(genre_id),
composer varchar(55),
milliseconds int,
bytes int,
unit_price float);

#INVOICE_LINE TABLE
create table invoice_line
(invoice_line_id int primary key,
invoice_id int,foreign key(invoice_id) references invoice(invoice_id),
track_id int,foreign key(track_id) references track(track_id),
unit_price float,
quantity int);

#PLAYLIST_TRACK TABLE
create table playlist_track
(playlist_id int primary key,
track_id int,foreign key(track_id) references track(track_id));

#PLAYLIST TABLE
create table playlist
(playlist_id int,foreign key(playlist_id) references playlist_track(playlist_id),
name varchar(55));
