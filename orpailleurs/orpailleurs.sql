INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_orpailleurs','Orpailleurs',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_orpailleurs','Orpailleurs', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_orpailleurs', 'Orpailleurs', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('orpailleurs', 'Orpailleurs')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('orpailleurs',0,'recrue','Orpailleurs débutant', 500, '{}', '{}'),
	('orpailleurs',1,'novice','Orpailleurs Semi-Qualifié', 750, '{}', '{}'),
	('orpailleurs',2,'cdisenior','Orpailleurs Qualifié', 1200, '{}', '{}'),
	('orpailleurs',3,'boss','Patron Orpailleurs', 1600, '{}', '{}')
;


INSERT INTO `items` (`name`, `label`) VALUES
	('pepite_dor', 'Pepite dor'),
	('lingot_dor', 'Lingot Dor')
;