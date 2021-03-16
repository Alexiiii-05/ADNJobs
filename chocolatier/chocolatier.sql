INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_chocolatier','Chocolatier',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_chocolatier', 'Chocolatier', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_chocolatier','Chocolatier',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('chocolatier', 'Chocolatier')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('chocolatier',0,'recrue','Chocolatier',400,'{}','{}'),
  ('chocolatier',1,'gerant','Gérant',650,'{}','{}'),
  ('chocolatier',2,'boss','Patron',800,'{}','{}');
;

INSERT INTO `items` (`name`, `label`) VALUES
  ('chocolat', 'Chocolat'),
  ('tablette', 'Tablette');
;