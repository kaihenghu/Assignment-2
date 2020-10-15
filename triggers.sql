DELIMITER $$
CREATE TRIGGER
`website_roles_AFTER_INSERT`
AFTER INSERT ON website_roles 
FOR EACH ROW 
BEGIN
  IF NEW.role='admin' OR NEW.role='owner' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'create');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'delete');
  END IF;
  IF NEW.role='writer' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'create');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
  END IF;
  IF NEW.role='editor' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
  END IF;
  IF NEW.role='reviewer' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
  END IF;
END;
$$
DELIMITER;
DELIMITER $$
CREATE TRIGGER
`website_roles_AFTER_UPDATE`
AFTER UPDATE ON website_roles 
FOR EACH ROW
BEGIN
  DELETE FROM website_priviledges WHERE developer_id=NEW.developer_id AND website_id=NEW.website_id;
  IF NEW.role='admin' OR NEW.role='owner' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'create');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
	 INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'delete');
  END IF;
  IF NEW.role='writer' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'create');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
  END IF;
  IF NEW.role='editor' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'update');
  END IF;
  IF NEW.role='reviewer' THEN
     INSERT INTO website_priviledges(developer_id,website_id,priviledge_id) VALUES(NEW.developer_id, NEW.website_id, 'read');
  END IF;
END;
$$
DELIMITER;
DELIMITER $$
CREATE TRIGGER
`website_roles_AFTER_DELETE`
AFTER DELETE ON website_roles 
FOR EACH ROW
BEGIN
  DELETE FROM website_priviledges WHERE developer_id=OLD.developer_id AND website_id=OLD.website_id;
END;
$$
DELIMITER;
DELIMITER $$
CREATE TRIGGER
`page_roles_AFTER_INSERT`
AFTER INSERT ON page_roles 
FOR EACH ROW
BEGIN
  IF NEW.role='admin' OR NEW.role='owner' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'create');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'delete');
  END IF;
  IF NEW.role='writer' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'create');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
  END IF;
  IF NEW.role='editor' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
  END IF;
  IF NEW.role='reviewer' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
  END IF;
END;
$$
DELIMITER;
DELIMITER $$
CREATE TRIGGER
`page_roles_AFTER_UPDATE`
AFTER UPDATE ON page_roles 
FOR EACH ROW
BEGIN
  DELETE FROM page_priviledges WHERE developer_id=NEW.developer_id AND page_id=NEW.page_id;
  IF NEW.role='admin' OR NEW.role='owner' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'create');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
	 INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'delete');
  END IF;
  IF NEW.role='writer' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'create');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
  END IF;
  IF NEW.role='editor' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'update');
  END IF;
  IF NEW.role='reviewer' THEN
     INSERT INTO page_priviledges(developer_id,page_id,priviledge_id) VALUES(NEW.developer_id, NEW.page_id, 'read');
  END IF;
END;
$$
DELIMITER;
DELIMITER $$
CREATE TRIGGER
`page_roles_AFTER_DELETE`
AFTER DELETE ON page_roles 
FOR EACH ROW
BEGIN
  DELETE FROM page_priviledges WHERE developer_id=OLD.developer_id AND page_id=OLD.page_id;
END;
$$
DELIMITER ;


