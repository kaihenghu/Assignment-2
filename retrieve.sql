-- Retrieve developers
-- Retrieve all developers 
SELECT * FROM person P, developer D WHERE P.id = D.id;
-- Retrieve a developer with id equal to 34
SELECT P.*, D.* FROM person P, developer D WHERE P.id = D.id AND P.id = 34;
-- Retrieve all developers who have a role in Twitter other than owner 
SELECT P.*, D.* FROM person P, developer D, websites W, website_roles WR WHERE P.id = D.id AND WR.developer_id = D.id AND WR.website_id = W.id AND W.name ='Twitter' AND WR.role <> 'owner';
-- Retrieve all developers who are page reviewers of pages with less than 300000 visits 
SELECT P.*, D.* FROM person P, developer D, pages Pg, page_roles PgR WHERE P.id = D.id AND PgR.developer_id = D.id AND PgR.page_id = Pg.id AND PgR.role = 'reviewer' AND Pg.views < 300000;
-- Retrieve the writer developer who added a heading widget to CNET's home page
SELECT P.*, D.* FROM person P, developer D, websites W,page_roles PgR, pages Pg, widget WG WHERE  P.id = D.id AND PgR.developer_id = D.id AND PgR.page_id = Pg.id AND Pg.website_id = W.id AND W.name='CNET' AND Pg.title = 'HOME' AND role='writer' AND WG.page_id = Pg.id and WG.dtype='heading';

-- Retrieve websites
-- Retrieve the website with the least number of visits
SELECT * FROM websites WHERE visits = ( SELECT MIN(visits) FROM websites );
-- Retrieve the name of a website whose id is 678 
SELECT name FROM websites WHERE id=678;
-- Retrieve all websites with videos reviewed by bob 
SELECT W.* FROM person P, developer D, websites W, pages Pg,page_roles PgR, widget WG WHERE Pg.website_id=W.id AND WG.page_id = Pg.id AND PgR.developer_id = D.id AND PgR.page_id = Pg.id AND WG.dtype='youtube' AND P.username='bob' AND PgR.role='reviewer';
-- Retrieve all websites where alice is an owner 
SELECT W.* FROM person P, developer D, websites W, website_roles WR WHERE P.id=D.id AND D.id = WR.developer_id AND WR.website_id = W.id AND P.username = 'alice' AND WR.role='owner';
-- Retrieve all websites where charlie is an admin and get more than 6000000 visits 
SELECT W.* FROM person P, developer D, websites W, website_roles WR WHERE P.id=D.id AND D.id = WR.developer_id AND WR.website_id = W.id AND P.username = 'charlie' AND WR.role='admin' AND W.visits >6000000;

-- Retrieve pages
-- Retrieve the page with the most number of views
SELECT * FROM pages WHERE views = ( SELECT MAX(views) FROM pages );
-- Retrieve the title of a page whose id is 234
SELECT title FROM pages WHERE id=234;
-- Retrieve all pages where alice is an editor
SELECT Pg.title, Pg.description, Pg.website_id FROM  person P, developer D, pages Pg, page_roles PgR WHERE P.id=D.id AND Pg.id=PgR.page_id AND PgR.developer_id=D.id AND P.username='alice' AND PgR.role='editor';
-- Retrieve the total number of pageviews in CNET
SELECT sum(Pg.views) as total_views FROM websites W, pages Pg WHERE Pg.website_id = W.id AND W.name = 'CNET';
-- Retrieve the average number of page views in the Website Wikipedia
SELECT avg(Pg.views) as total_views FROM websites W, pages Pg WHERE Pg.website_id = W.id AND W.name = 'Wikipedia';

-- Retrieve widgets
-- Retrieve all widgets in CNET's Home page 
SELECT Wg.id, Wg.dtype, Wg.name FROM widget Wg, pages Pg, websites W WHERE W.id=Pg.website_id AND Wg.page_id = Pg.id AND Pg.title='HOME' AND W.name='CNET';
-- Retrieve all youtube widgets in CNN
SELECT Wg.id, Wg.dtype, Wg.name FROM widget Wg, pages Pg, websites W WHERE W.id=Pg.website_id AND Wg.page_id = Pg.id AND Wg.dtype='youtube' AND W.name='CNN';
-- Retrieve all image widgets on pages reviewed by Alice 
SELECT Wg.id, Wg.dtype, Wg.name FROM person P, developer D, widget Wg, pages Pg, page_roles PgR WHERE P.id=D.id AND Wg.page_id =Pg.id AND PgR.page_id=Pg.id AND PgR.developer_id = D.id AND P.username='alice' AND PgR.role='reviewer' AND Wg.dtype='image';
-- Retrieve how many widgets are in Wikipedia
SELECT count(*) as Wiki_widget_count FROM widget Wg, pages Pg, websites W WHERE W.id=Pg.website_id AND Wg.page_id = Pg.id AND W.name='Wikipedia';

-- To verify the page and website triggers written earlier function properly:
-- Retrieve the names of all the websites where Bob has DELETE privileges. 
SELECT W.name FROM person P, developer D, websites W, website_priviledges WP WHERE P.id= D.id AND W.id = WP.website_id AND D.id = WP.developer_id AND WP.priviledge_id='delete' AND P.username='bob';
-- Retrieve the names of all the pages where Charlie has CREATE privileges.
SELECT Pg.title FROM person P, developer D, pages Pg, page_priviledges PgP WHERE P.id= D.id AND Pg.id = PgP.page_id AND D.id = PgP.developer_id AND PgP.priviledge_id='create' AND P.username='charlie';


