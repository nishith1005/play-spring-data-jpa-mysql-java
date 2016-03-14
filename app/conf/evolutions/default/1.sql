# default schema
 
# --- !Ups
 
CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
 
# --- !Downs
 
DROP TABLE User;
