ALTER TABLE `user` ADD INDEX `user_idx_0` (`mail`, `password`);
ALTER TABLE `user` ADD INDEX `user_idx_1` (`entry_date`, `kana`);
ALTER TABLE `user` ADD INDEX `user_idx_2` (`office_id`);
