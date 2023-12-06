create user 'root'@'%' IDENTIFIED BY 'root';
grant all privileges ON *.* TO 'root'@'%' with grant option;
CREATE USER 'sungshin'@'172.18.0.3' IDENTIFIED BY 'tjdtls!';
CREATE USER 'sungshin'@'172.18.0.2' IDENTIFIED BY 'tjdtls!';
grant all privileges on FLOWN.* to 'sungshin'@'172.18.0.3';
grant all privileges on FLOWN.* to 'sungshin'@'172.18.0.2';
drop user 'root'@'%';
FLUSH PRIVILEGES;