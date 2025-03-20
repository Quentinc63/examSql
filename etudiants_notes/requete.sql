-- 1

CREATE DATABASE bibliotheques;

--2

CREATE USER 'bibliothecaire'@'localhost' IDENTIFIED BY 'secret';

REVOKE ALL PRIVILEGES ON *. * FROM 'bibliothecaire'@'localhost';

GRANT ALL PRIVILEGES ON bibliotheques.* TO 'bibliothecaire'@'localhost';

SHOW GRANTS FOR 'bibliothecaire'@'localhost';

-- 3 