-- 1

CREATE DATABASE bibliotheques;

--2

CREATE USER 'bibliothecaire'@'localhost' IDENTIFIED BY 'secret';

REVOKE ALL PRIVILEGES ON *. * FROM 'bibliothecaire'@'localhost';

GRANT ALL PRIVILEGES ON bibliotheques.* TO 'bibliothecaire'@'localhost';

SHOW GRANTS FOR 'bibliothecaire'@'localhost';

-- 3 

INSERT INTO adherent (nom, adresse,date_inscription)
VALUES 
( 'austen jane', 'rue de la bourboule coudes 63114', '2017-02-21'),
( 'dickens charles', 'rue de la folie cebazat 63118', '2014-05-11'),
( 'verne jules', 'rue de la maladie clermont 63000', '2017-02-21'),
( 'shelley marry', 'rue de la folie cebazat 63118', '2014-05-11');

INSERT INTO livre (isbn, titre, annee_publication, disponible)
VALUES 
(1, 'Orgueil et Préjugés', 1998, FALSE),
(2, 'David Copperfield', 2005, FALSE),
(3, 'Vingt Mille Lieues sous les Mers', 2021, FALSE),
(4, 'Frankenstein', 1978, FALSE);

INSERT INTO emprunt (isbn, id_adherent, date_emprunt)
VALUES 
(1, 2, '2020-03-17'),
(2, 1, '2020-03-17'),
(3, 4, '2020-03-17'),
(4, 3, '2020-03-17');


-- 4 

UPDATE adherent
SET adresse = '1 rue Nouvelle adresse, Clermont'
WHERE id = 4;


-- 5

CREATE VIEW les_jours_de_retard AS
SELECT 
    a.id AS adherent_id,
    a.nom AS nom_adherent,
    l.isbn,
    l.titre AS titre_livre,
    e.date_emprunt,
    CURRENT_DATE AS date_actuelle,
    (CURRENT_DATE - e.date_emprunt) AS jours_de_retard
FROM 
    emprunt e
JOIN 
    adherent a ON e.id_adherent = a.id
JOIN 
    livre l ON e.isbn = l.isbn
WHERE 
    (CURRENT_DATE - e.date_emprunt) > 30;

SELECT * FROM les_jours_de_retard

-- 6

-- 7 


-- 8 

DELETE FROM adherent 
WHERE id = 4