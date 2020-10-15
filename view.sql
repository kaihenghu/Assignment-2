-- Implement View 
CREATE VIEW deleveloper_roles_and_privileges AS
SELECT 
	 P.first_name , 
     P.last_name, 
     P.username, 
     P.email, 
     W.name as website_name, 
     W.visits as  website_visits, 
     W.updated as website_updated, 
     WR.role as website_role, 
     WP.priviledge_id as website_priviledge, 
     Pg.title as page_title, 
     Pg.views as page_views, 
     Pg.updated as page_updated, 
     PgR.role as page_role, 
     PgP.priviledge_id as page_priviledge
FROM person P, 
	 developer D, 
	 websites W, 
     website_roles WR, 
     website_priviledges WP,
     pages Pg, 
     page_roles PgR, 
     page_priviledges PgP
WHERE P.id = D.id AND 
	  D.id = WR.developer_id AND
      WR.website_id = W.id AND 
      D.id = WP.developer_id AND 
      WP.website_id=W.id AND 
      D.id =PgR.developer_id AND 
      PgR.page_id = Pg.id AND 
      D.id = PgP.developer_id AND 
      PgP.page_id = Pg.id;
	
-- select website_id, developer_id, GROUP_CONCAT(DISTINCT priviledge_id  SEPARATOR ';') FROM website_priviledges GROUP BY website_id, developer_id;