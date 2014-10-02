create database if not exists gsb character set utf8 collate utf8_unicode_ci;
use gsb;

grant all privileges on gsb.* to 'gsb_user'@'localhost' identified by 'secret';