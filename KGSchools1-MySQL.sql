CREATE TABLE `schools` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(128) NOT NULL,
	`type` enum('public', 'private') NOT NULL,
	`fees_id` bigint NOT NULL,
	`contact_id` bigint NOT NULL,
	`address_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `school_fees` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`entrance_fee` DECIMAL(5) NOT NULL,
	`monthly_fee` DECIMAL(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `contacts` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`contact_num1` varchar(15) NOT NULL,
	`contact_num2` varchar(15) NOT NULL,
	`email` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `address` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`city` varchar(64) NOT NULL,
	`street` varchar(128) NOT NULL,
	`postal_code` varchar(32) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `parents` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`first_name` varchar(128) NOT NULL,
	`last_name` varchar(128) NOT NULL,
	`patronymic` varchar(128) NOT NULL,
	`occupation` varchar(32) NOT NULL,
	`passport_id` bigint NOT NULL,
	`address_id` bigint NOT NULL,
	`contact_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `passports` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`citizenship` varchar(64) NOT NULL,
	`birth_date` DATE NOT NULL,
	`gneder` enum('Male','Female') NOT NULL,
	`tin` bigint NOT NULL,
	`issue_date` DATE NOT NULL,
	`exp_date` DATE NOT NULL,
	`issue_auth_name` varchar(128) NOT NULL,
	`issue_place` varchar(64) NOT NULL,
	`marital_status` enum('single','married') NOT NULL,
	`passport_scan` blob NOT NULL,
	`passport_pin` varchar(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `students` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`first_name` varchar(128) NOT NULL,
	`last_name` varchar(128) NOT NULL,
	`patronymic` varchar(128) NOT NULL,
	`enrollment_date` DATE NOT NULL,
	`school_id` bigint NOT NULL,
	`address_id` bigint NOT NULL,
	`parent_id` bigint NOT NULL,
	`contact_id` bigint NOT NULL,
	`birth_cert_id` bigint NOT NULL,
	`medical_form_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `birth_certificates` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`pin` bigint NOT NULL,
	`birth_date` DATE NOT NULL,
	`birth_place` varchar(64) NOT NULL,
	`gender` enum('male','female') NOT NULL,
	`registry_book_date` DATE NOT NULL,
	`registry_book_num` int NOT NULL,
	`nationality` varchar(64) NOT NULL,
	`registration_place` varchar(64) NOT NULL,
	`issue_date` DATE NOT NULL,
	`issue_auth_name` varchar(128) NOT NULL,
	`birth_certificate` blob NOT NULL,
	`father_name` varchar(128) NOT NULL,
	`mother_name` varchar(128) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `medical_forms` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`form_twenty_sex` blob NOT NULL,
	`form_sixty_three` blob NOT NULL,
	`health_certificate_date` year NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `staff` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`first_name` varchar(128) NOT NULL,
	`last_name` varchar(128) NOT NULL,
	`patronymic` varchar(128) NOT NULL,
	`hire_date` DATE NOT NULL,
	`salary` DECIMAL(5) NOT NULL,
	`degree` varchar(32) NOT NULL,
	`position` DECIMAL(5) NOT NULL,
	`school_id` bigint NOT NULL,
	`contact_id` bigint NOT NULL,
	`address_id` bigint NOT NULL,
	`passport_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `teachers` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`first_name` varchar(128) NOT NULL,
	`last_name` varchar(128) NOT NULL,
	`patronymic` varchar(128) NOT NULL,
	`school_id` bigint NOT NULL,
	`address_id` bigint NOT NULL,
	`contact_id` bigint NOT NULL,
	`hire_date` DATE NOT NULL,
	`salary` DECIMAL(5) NOT NULL,
	`passport_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `experience` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`teacher_id` bigint NOT NULL,
	`start_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`school_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `teacher_publications` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`teacher_id` bigint NOT NULL,
	`title` varchar(128) NOT NULL,
	`release_date` DATE NOT NULL,
	`publications` blob NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `teacher_education` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`teacher_id` bigint NOT NULL,
	`grad_school` varchar(128) NOT NULL,
	`university` varchar(128) NOT NULL,
	`uni_grad_year` DATE NOT NULL,
	`degree` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `speciality` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`teacher_id` bigint NOT NULL,
	`subject_id` bigint NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `grades` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`student_id` bigint NOT NULL,
	`subject_id` bigint NOT NULL,
	`subject_grade` enum NOT NULL,
	`exam_id` int NOT NULL,
	`class_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `subjects` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `classes` (
	`id` int NOT NULL AUTO_INCREMENT,
	`class_level` varchar(16) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `exams` (
	`id` int NOT NULL AUTO_INCREMENT,
	`exam_type` varchar(32) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `schools` ADD CONSTRAINT `schools_fk0` FOREIGN KEY (`fees_id`) REFERENCES `school_fees`(`id`);

ALTER TABLE `schools` ADD CONSTRAINT `schools_fk1` FOREIGN KEY (`contact_id`) REFERENCES `contacts`(`id`);

ALTER TABLE `schools` ADD CONSTRAINT `schools_fk2` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `parents` ADD CONSTRAINT `parents_fk0` FOREIGN KEY (`passport_id`) REFERENCES `passports`(`id`);

ALTER TABLE `parents` ADD CONSTRAINT `parents_fk1` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `parents` ADD CONSTRAINT `parents_fk2` FOREIGN KEY (`contact_id`) REFERENCES `contacts`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk0` FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk1` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk2` FOREIGN KEY (`parent_id`) REFERENCES `parents`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk3` FOREIGN KEY (`contact_id`) REFERENCES `contacts`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk4` FOREIGN KEY (`birth_cert_id`) REFERENCES `birth_certificates`(`id`);

ALTER TABLE `students` ADD CONSTRAINT `students_fk5` FOREIGN KEY (`medical_form_id`) REFERENCES `medical_forms`(`id`);

ALTER TABLE `staff` ADD CONSTRAINT `staff_fk0` FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`);

ALTER TABLE `staff` ADD CONSTRAINT `staff_fk1` FOREIGN KEY (`contact_id`) REFERENCES `contacts`(`id`);

ALTER TABLE `staff` ADD CONSTRAINT `staff_fk2` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `staff` ADD CONSTRAINT `staff_fk3` FOREIGN KEY (`passport_id`) REFERENCES `passports`(`id`);

ALTER TABLE `teachers` ADD CONSTRAINT `teachers_fk0` FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`);

ALTER TABLE `teachers` ADD CONSTRAINT `teachers_fk1` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`);

ALTER TABLE `teachers` ADD CONSTRAINT `teachers_fk2` FOREIGN KEY (`contact_id`) REFERENCES `contacts`(`id`);

ALTER TABLE `teachers` ADD CONSTRAINT `teachers_fk3` FOREIGN KEY (`passport_id`) REFERENCES `passports`(`id`);

ALTER TABLE `experience` ADD CONSTRAINT `experience_fk0` FOREIGN KEY (`teacher_id`) REFERENCES `teachers`(`id`);

ALTER TABLE `experience` ADD CONSTRAINT `experience_fk1` FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`);

ALTER TABLE `teacher_publications` ADD CONSTRAINT `teacher_publications_fk0` FOREIGN KEY (`teacher_id`) REFERENCES `teachers`(`id`);

ALTER TABLE `teacher_education` ADD CONSTRAINT `teacher_education_fk0` FOREIGN KEY (`teacher_id`) REFERENCES `teachers`(`id`);

ALTER TABLE `speciality` ADD CONSTRAINT `speciality_fk0` FOREIGN KEY (`teacher_id`) REFERENCES `teachers`(`id`);

ALTER TABLE `speciality` ADD CONSTRAINT `speciality_fk1` FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`);

ALTER TABLE `grades` ADD CONSTRAINT `grades_fk0` FOREIGN KEY (`student_id`) REFERENCES `students`(`id`);

ALTER TABLE `grades` ADD CONSTRAINT `grades_fk1` FOREIGN KEY (`subject_id`) REFERENCES `subjects`(`id`);

ALTER TABLE `grades` ADD CONSTRAINT `grades_fk2` FOREIGN KEY (`exam_id`) REFERENCES `exams`(`id`);

ALTER TABLE `grades` ADD CONSTRAINT `grades_fk3` FOREIGN KEY (`class_id`) REFERENCES `classes`(`id`);

