START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;
UPDATE hopsworks.jobs jobs1
JOIN (	SELECT jobs.id, jobs.name, jobs.project_id
		FROM jobs
		JOIN (SELECT jobs.name as dup_name, jobs.project_id as dup_project_id, count(*) as num
			  FROM hopsworks.jobs
			  GROUP BY name,project_id
			  having num > 1
			  order by num desc, project_id asc) as dupjobs
		ON jobs.name = dupjobs.dup_name AND jobs.project_id = dupjobs.dup_project_id) as jobs2
ON jobs1.id = jobs2.id
SET jobs1.name = concat(jobs2.name, '-', jobs2.id);
SET SQL_SAFE_UPDATES = 1;
COMMIT;

ALTER TABLE `hopsworks`.`jobs`
DROP INDEX `name_idx` ,
ADD UNIQUE INDEX `name_project_idx` (`name` ASC, `project_id` ASC);
