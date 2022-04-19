insert into roles (id, name)
values (1, 'ROLE_ADMIN'), (2,'ROLE_STAFF'),(3,'ROLE_CUSTOMER');

INSERT INTO users (created_at,updated_at,email,password,username) VALUES
 (now(),now(),'admin@saloon.com','$2a$10$ishPp2Me2Cw7FHMh.5UrMuePICMPxKEPG4ppoks.BQRcUrroSX5JG','admin');

insert  into user_roles (user_id, role_id)
values (1,1);