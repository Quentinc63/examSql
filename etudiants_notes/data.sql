BEGIN;

CREATE TABLE adherent (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255),
    adresse VARCHAR(255),
    date_inscription DATE NOT NULL,
    a_surveiller BOOLEAN not NULL 
);

CREATE TABLE livre (
    isbn INT PRIMARY KEY NOT NULL,
    titre VARCHAR(255),
    annee_publication INT NOT NULL,
    disponible BOOLEAN NOT NULL 
);

CREATE TABLE emprunt (
    id_adherent INT NOT NULL REFERENCES adherent(id) ON DELETE CASCADE,
    isbn INT NOT NULL REFERENCES livre(isbn) ON DELETE CASCADE,
    PRIMARY KEY (isbn, id_adherent),
    date_emprunt DATE NOT NULL,
    date_retour DATE

);


COMMIT;