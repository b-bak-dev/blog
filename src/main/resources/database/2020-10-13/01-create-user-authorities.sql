--liquibase formatted sql
create table users(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username varchar ( 50 ) not null UNIQUE,
    password varchar ( 100 ) not null,
    enabled boolean not null
);
create table authorities (
    username varchar ( 50 ) not null,
    authority varchar ( 50 ) not null,
    constraint fk_authorities_users foreign key (username) references
    users(username) ,
    UNIQUE KEY username_authority (username, authority)
);
insert into users (id, username, password, enabled)
values (1, 'test', '{bcrypt}$2a$10$upzXFsFUOClFRR69OMKF8eajGMRs0vhcSHqvNDKy9yfW45w7o9z6O', true);
insert into authorities (username, authority) values ('test','USER');