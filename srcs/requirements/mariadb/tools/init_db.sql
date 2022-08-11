
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER 'mwen'@'localhost' IDENTIFIED BY 'mwen42';
CREATE USER 'mwen'@'wordpress.inception' IDENTIFIED BY 'mwen42';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mwen'@'localhost';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mwen'@'wordpress.inception';

FLUSH PRIVILEGES;