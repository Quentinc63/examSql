BEGIN; 

DROP TABLE IF EXISTS chef, type, chef_type, style, restaurant, chef_restaurant;
CREATE TABLE chef (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    date_naissance DATE NOT NULL,
    experience_annee INT NOT NULL
);

CREATE TABLE type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE chef_type (
    type_id INT NOT NULL REFERENCES type(id),
    chef_id INT NOT NULL REFERENCES chef(id),
    PRIMARY KEY (type_id, chef_id)
);
CREATE TABLE style (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL
);

CREATE TABLE restaurant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    capaciter INT NOT NULL,
    style_id INT NOT NULL REFERENCES style(id)

);

CREATE TABLE chef_restaurant (
    chef_id INT NOT NULL REFERENCES chef(id),
    restaurant_id INT NOT NULL REFERENCES restaurant(id),
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY (restaurant_id, chef_id)

);
COMMIT;