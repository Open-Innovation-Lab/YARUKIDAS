CREATE TABLE `cheer_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

CREATE TABLE `cheer_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `opened_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `subject` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`),
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `trainers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `trainers_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_id` int(11) DEFAULT NULL,
  `contents` text,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

CREATE TABLE `user_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `trainers_message_id` int(11) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `twitter_id` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `access_secret` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `protected` tinyint(1) DEFAULT NULL,
  `profile_background_color` varchar(255) DEFAULT NULL,
  `profile_sidebar_fill_color` varchar(255) DEFAULT NULL,
  `profile_link_color` varchar(255) DEFAULT NULL,
  `profile_sidebar_border_color` varchar(255) DEFAULT NULL,
  `profile_text_color` varchar(255) DEFAULT NULL,
  `profile_background_image_url` varchar(255) DEFAULT NULL,
  `profile_background_tiled` tinyint(1) DEFAULT NULL,
  `friends_count` int(11) DEFAULT NULL,
  `statuses_count` int(11) DEFAULT NULL,
  `followers_count` int(11) DEFAULT NULL,
  `favourites_count` int(11) DEFAULT NULL,
  `utc_offset` int(11) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=636 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20100923065947');

INSERT INTO schema_migrations (version) VALUES ('20100923083002');

INSERT INTO schema_migrations (version) VALUES ('20100923091817');

INSERT INTO schema_migrations (version) VALUES ('20100923092002');

INSERT INTO schema_migrations (version) VALUES ('20100923092124');

INSERT INTO schema_migrations (version) VALUES ('20100925045344');

INSERT INTO schema_migrations (version) VALUES ('20100925053737');

INSERT INTO schema_migrations (version) VALUES ('20100928093245');

INSERT INTO schema_migrations (version) VALUES ('20101005192834');

INSERT INTO schema_migrations (version) VALUES ('20101012110303');