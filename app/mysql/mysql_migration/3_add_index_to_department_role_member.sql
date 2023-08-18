ALTER TABLE `department_role_member` ADD INDEX `department_role_member_idx_0` (`department_id`, `belong`);
ALTER TABLE `department_role_member` ADD INDEX `department_role_member_idx_1` (`role_id`, `belong`);
ALTER TABLE `department_role_member` ADD INDEX `department_role_member_idx_2` (`user_id`, `belong`);
