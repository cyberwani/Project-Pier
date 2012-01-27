UPDATE `<?php echo $table_prefix ?>config_options` set `value` = 'marine' where `category_name` = 'general' and `name` = 'theme';
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('features', 'login_show_options', '1', 'BoolConfigHandler', 0, 0, 'Show options on the login page') ON DUPLICATE KEY UPDATE `name` = `name`;
INSERT INTO `<?php echo $table_prefix ?>config_categories` (`name`, `is_system`, `category_order`) VALUES ('authentication', 0, 8);
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('authentication', 'authdb server', 'localhost', 'StringConfigHandler', 0, 1, NULL);
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('authentication', 'authdb username', 'root', 'StringConfigHandler', 0, 2, NULL);
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('authentication', 'authdb password', '', 'PasswordConfigHandler', 0, 3, NULL);
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('authentication', 'authdb database', '', 'StringConfigHandler', 0, 3, NULL);
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('authentication', 'authdb sql', "select `user_email` as email from `wp_users` where `user_login` = '$username' and user_pass = md5('$password') limit 1", 'StringConfigHandler', 0, 4, NULL);
ALTER TABLE `<?php echo $table_prefix ?>wiki_pages` ADD `parent_id` INT( 10 ) NOT NULL DEFAULT 0 AFTER `id`;
CREATE UNIQUE INDEX `subpages` ON `<?php echo $table_prefix ?>wiki_pages` ( `parent_id`, `id` );
INSERT INTO `<?php echo $table_prefix ?>config_options` (`category_name`, `name`, `value`, `config_handler_class`, `is_system`, `option_order`, `dev_comment`) VALUES ('general', 'dashboard_logs_count', '50', 'IntegerConfigHandler', 0, 27, NULL);