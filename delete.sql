
-- Delete Alice's primary address 
DELETE A FROM address A INNER JOIN person P ON A.person_id=P.id WHERE username='alice' AND A.primary=true;

-- Remove the last widget in the Contact page. The last widget is the one with the highest value in the order field
DELETE W FROM widget W, (SELECT MAX(`order`) as max FROM widget) O WHERE W.order=O.max;

-- Delete page - Remove the last updated page in Wikipedia
DELETE P FROM pages P, (SELECT MAX(Pg.updated) as max, W.id as web_id FROM pages Pg, websites W WHERE Pg.website_id=W.id AND W.name='Wikipedia') O WHERE P.updated=O.max AND P.website_id=O.web_id;

-- Delete website - Remove the CNET web site, as well as all related roles and privileges relating developers to the Website and Pages
DELETE websites,website_roles, pages, page_roles,page_priviledges
	FROM websites 
	JOIN website_roles ON websites.id=website_roles.website_id
	JOIN pages ON pages.website_id=websites.id
	JOIN page_roles ON pages.id=page_roles.page_id 
	JOIN page_priviledges ON pages.id=page_priviledges.page_id
	WHERE websites.name='CNET';

