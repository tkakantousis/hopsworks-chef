DROP TABLE IF EXISTS `remote_material_references`;

ALTER TABLE python_dep DROP COLUMN `install_type`;
ALTER TABLE python_dep DROP COLUMN `machine_type`;

ALTER TABLE python_dep DROP INDEX dependency;
ALTER TABLE python_dep ADD CONSTRAINT UNIQUE (`dependency`, `version`);

ALTER TABLE conda_commands DROP COLUMN `install_type`;
ALTER TABLE conda_commands DROP COLUMN `machine_type`;
