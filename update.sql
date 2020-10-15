-- Update developer - Update Charlie's primary phone number to 333-444-5555 
UPDATE phone LEFT JOIN person ON phone.person_id = person.id SET phone='333-444-5555' WHERE person.username ='Charlie' AND phone.primary=true;

-- Update widget - Update the relative order of widget head345 on the page so that it's new order is 3. Note that the other widget's order needs to update as well 
UPDATE widget w1 JOIN widget w2 ON w1.page_id = w2.page_id AND ((w1.name='head345' AND w2.order=3) OR (w2.name='head345' AND w1.order=3))
 	SET w1.order = w2.order;

-- Update page - Append 'CNET - ' to the beginning of all CNET's page titles
UPDATE pages LEFT JOIN websites ON pages.website_id=websites.id set title=concat('CNET - ', title) WHERE websites.name='CNET';

-- Update roles - Swap Charlie's and Bob's role in CNET's Home page 
SELECT @page_id:=Pg.id FROM websites W, pages Pg WHERE W.id=Pg.website_id AND Pg.title='HOME' AND W.name='CNET';
SELECT @charlie:=id FROM person WHERE username='charlie';
SELECT @bob:=id FROM person WHERE username='bob';
UPDATE page_roles p1 JOIN page_roles p2 ON p1.page_id=@page_id AND p2.page_id=@page_id AND ((p1.developer_id=@charlie AND p2.developer_id=@bob) OR (p1.developer_id=@bob AND p2.developer_id=@charlie))
	SET p1.role = p2.role;

