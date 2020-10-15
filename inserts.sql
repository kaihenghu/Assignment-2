INSERT INTO person(id,username, password,first_name, last_name, email) VALUES(12, 'alice', 'alice','Alice','Wonder','alice@wonder.com');
INSERT INTO developer(id,developer_key) VALUES(12, '4321rewq');
INSERT INTO person(id,username, password,first_name, last_name, email) VALUES(23, 'bob', 'bob','Bob','Marley','bob@marley.com');
INSERT INTO developer(id,developer_key) VALUES(23, '5432trew');
INSERT INTO person(id,username, password,first_name, last_name, email) VALUES(34, 'charlie', 'charlie','Charlie','Garcia','chuch@garcia.com');
INSERT INTO developer(id,developer_key) VALUES(34, '6543ytre');
INSERT INTO person(id,username, password,first_name, last_name, email) VALUES(45, 'dan', 'dan','Dan','Garcia','dan@martin.com');
INSERT INTO user(id, user_agreement) VALUES(45, true);
INSERT INTO person(id,username, password,first_name, last_name, email) VALUES(56, 'ed', 'ed','Ed','Karaz','ed@kar.com');
INSERT INTO user(id, user_agreement) VALUES(56, false);

INSERT INTO websites(id, name, description, visits) VALUES(123,'Facebook', 'an online social media and social networking service',1234234);
INSERT INTO websites(id, name, description, visits) VALUES(234,'Twitter', 'an online news and social networking service',4321543);
INSERT INTO websites(id, name, description, visits) VALUES(345,'Wikipedia', 'a free online encyclopedia','1234234');
INSERT INTO websites(id, name, description, visits) VALUES(456,'CNN', 'an American basic cable and satellite television news channel',6543345);
INSERT INTO websites(id, name, description, visits) VALUES(567,'CNET', 'an American media website that publishes reviews, news, articles, blogs, podcasts and videos on technology and consumer electronics',5433455);
INSERT INTO websites(id, name, description, visits) VALUES(678,'Gizmodo', 'a design, technology, science and science fiction website that also writes articles on politics',4322345);
INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,123,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,123,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,123,'admin');

INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,234,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,234,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,234,'admin');

INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,345,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,345,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,345,'admin');

INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,456,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,456,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,456,'admin');

INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,567,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,567,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,567,'admin');

INSERT INTO website_roles(developer_id, website_id, role) VALUES(34,678,'owner');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(12,678,'editor');
INSERT INTO website_roles(developer_id, website_id, role) VALUES(23,678,'admin');

INSERT INTO pages(id, title, description, views, website_id) VALUES(123,'Home', 'Landing page',123434, 567);
INSERT INTO pages(id, title, description, views, website_id) VALUES(234,'About', 'Website description',234545, 678);
INSERT INTO pages(id, title, description, views, website_id) VALUES(345,'Contact', 'Addresses, phones, and contact info',345656, 345);
INSERT INTO pages(id, title, description, views, website_id) VALUES(456,'Preferences', 'Where users can configure their',456776, 456);
INSERT INTO pages(id, title, description, views, website_id) VALUES(567,'Profile', 'Landing page',567878, 567);
INSERT INTO page_roles(developer_id, page_id, role) VALUES(12,123,'editor');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(23,123,'reviewer');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(34,123,'writer');

INSERT INTO page_roles(developer_id, page_id, role) VALUES(23,234,'editor');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(34,234,'reviewer');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(12,234,'writer');

INSERT INTO page_roles(developer_id, page_id, role) VALUES(34,345,'editor');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(12,345,'reviewer');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(23,345,'writer');

INSERT INTO page_roles(developer_id, page_id, role) VALUES(12,456,'editor');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(23,456,'reviewer');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(34,456,'writer');

INSERT INTO page_roles(developer_id, page_id, role) VALUES(23,567,'editor');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(34,567,'reviewer');
INSERT INTO page_roles(developer_id, page_id, role) VALUES(12,567,'writer');

INSERT INTO widget(id,name,dtype,text,`order`,page_id) VALUES(123,'head123','heading','Welcome',0,123);
INSERT INTO widget(id,name,dtype,text,html,`order`,page_id) VALUES(234,'post234','html','<p>Lorem</p>','<p>Lorem</p>',0,234);
INSERT INTO widget(id,name,dtype,text,`order`,page_id) VALUES(345,'head345','heading','Hi',1,345);
INSERT INTO widget(id,name,dtype,text,html,`order`,page_id) VALUES(456,'intro456','html','<h1>Hi</h1>','<h1>Hi</h1>',2,345);
INSERT INTO widget(id,name,dtype,`order`,width,height,url,page_id) VALUES(567,'image345','image',3,50,100,'/img/567.png',345);
INSERT INTO widget(id,name,dtype,`order`,width,height,url,page_id) VALUES(678,'video456','youtube',0,400,300,'https://youtu.be/h6 7VX51QXiQ',456);


INSERT INTO phone(person_id,phone, `primary`) VALUES(12,'123-234-3456', true);
INSERT INTO phone(person_id,phone, `primary`) VALUES(12,'234-345-4566',false);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('123 Adam St.','Alton', '01234',true,12);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('234 Birch St.','Boston', '02345',false,12);
INSERT INTO phone(person_id,phone, `primary`) VALUES(23,'345-456-5677', true);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('345 Charles St.','Chelms', '03455​',true,23);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('456 Down St.','Dalton', '04566',false,23);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('543 East St.','Everett', '01112',false,23);
INSERT INTO phone(person_id,phone, `primary`) VALUES(34,'321-432-5435', true);
INSERT INTO phone(person_id,phone, `primary`) VALUES(34,'432-432-5433', false);
INSERT INTO phone(person_id,phone, `primary`) VALUES(34,'543-543-6544', false);
INSERT INTO address(street1,city,zip, `primary`,person_id) VALUES('654 Frank St.','Foulton', '04322',true,34);
