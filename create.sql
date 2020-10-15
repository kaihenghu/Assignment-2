-- Tables 
CREATE TABLE `person` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `developer` (
  `id` int NOT NULL,
  `developer_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `user` (
  `id` int NOT NULL,
  `user_agreement` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE `websites` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visits` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `views` int DEFAULT NULL,
  `website_id` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `website_has_pages_idx` (`website_id`),
  CONSTRAINT `website_has_pages` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `widget` (
  `id` int NOT NULL,
  `page_id` int DEFAULT NULL,
  `dtype` varchar(45) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `html` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shareable` tinyint(1) DEFAULT NULL,
  `expandable` tinyint(1) DEFAULT NULL,
  `css_style` varchar(45) DEFAULT NULL,
  `css_class` varchar(45) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street1` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `primary` tinyint(1) DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_has_address` (`person_id`),
  CONSTRAINT `person_has_address` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `phone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `primary` tinyint DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_has_phone_idx` (`person_id`),
  CONSTRAINT `person_has_phone` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `roles` (
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`role`)
);

CREATE TABLE `priviledges` (
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`priviledge`)
);

CREATE TABLE `website_roles` (
  `developer_id` int NOT NULL,
  `website_id` int NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`developer_id`,`website_id`,`role`),
  KEY `website_roles_idx` (`role`),
  KEY `websiterole_website_relation_idx` (`website_id`),
  CONSTRAINT `website_roles` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `websiterole_developer_relation` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `websiterole_website_relation` FOREIGN KEY (`website_id`) REFERENCES `websites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `page_roles` (
  `developer_id` int NOT NULL,
  `page_id` int NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`developer_id`,`page_id`,`role`),
  KEY `page_role_idx` (`role`),
  KEY `pagerole_page_relation_idx` (`page_id`),
  CONSTRAINT `page_role` FOREIGN KEY (`role`) REFERENCES `roles` (`role`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_developer_relation` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_page_relation` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `website_priviledges` (
  `priviledge_id` varchar(45) NOT NULL,
  `website_id` int NOT NULL,
  `developer_id` int NOT NULL,
  PRIMARY KEY (`priviledge_id`,`website_id`,`developer_id`),
  CONSTRAINT `website_priviledge` FOREIGN KEY (`priviledge_id`) REFERENCES `priviledges` (`priviledge`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `page_priviledges` (
  `page_id` int NOT NULL,
  `developer_id` int NOT NULL,
  `priviledge_id` varchar(45) NOT NULL,
  PRIMARY KEY (`page_id`,`developer_id`,`priviledge_id`),
  KEY `page_priviledge_idx` (`priviledge_id`),
  CONSTRAINT `page_priviledge` FOREIGN KEY (`priviledge_id`) REFERENCES `priviledges` (`priviledge`)
);

INSERT INTO `priviledges` (`priviledge`) VALUES ('create');
INSERT INTO `priviledges` (`priviledge`) VALUES ('delete');
INSERT INTO `priviledges` (`priviledge`) VALUES ('read');
INSERT INTO `priviledges` (`priviledge`) VALUES ('update');


INSERT INTO `roles` (`role`) VALUES ('admin');
INSERT INTO `roles` (`role`) VALUES ('editor');
INSERT INTO `roles` (`role`) VALUES ('owner');
INSERT INTO `roles` (`role`) VALUES ('reviewer');
INSERT INTO `roles` (`role`) VALUES ('writer');




