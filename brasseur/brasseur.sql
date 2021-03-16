INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_brasseur','Brasseur',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_brasseur', 'Brasseur', 1)
;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_brasseur','Brasseur',1)
;

INSERT INTO `jobs` (name, label) VALUES
	('brasseur', 'Brasseur')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('brasseur',0,'recrue','Brasseur',400,'{}','{}'),
  ('brasseur',1,'gerant','Gérant',650,'{}','{}'),
  ('brasseur',2,'boss','Patron',800,'{}','{}');
;

INSERT INTO `items` (`name`, `label`) VALUES
  ('houblon', 'Houblon'),
  ('brune', 'Brune'),
  ('bière', 'Bière');
;