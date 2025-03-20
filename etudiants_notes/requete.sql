-- 1

CREATE DATABASE bibliotheques;

--2

CREATE USER 'bibliothecaire'@'localhost' IDENTIFIED BY 'secret';

REVOKE ALL PRIVILEGES ON *. * FROM 'bibliothecaire'@'localhost';

GRANT ALL PRIVILEGES ON bibliotheques.* TO 'bibliothecaire'@'localhost';

SHOW GRANTS FOR 'bibliothecaire'@'localhost';

-- 3 

INSERT INTO adherent (nom, adresse, date_inscription, a_surveiller)
VALUES 
( 'austen jane', 'rue de la bourboule coudes 63114', '2017-02-21', FALSE),
( 'dickens charles', 'rue de la folie cebazat 63118', '2014-05-11', FALSE),
( 'verne jules', 'rue de la maladie clermont 63000', '2017-02-21', FALSE),
( 'shelley marry', 'rue de la folie cebazat 63118', '2014-05-11', FALSE);


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

DELIMITER //
CREATE TRIGGER update_livre_disponible
AFTER UPDATE ON emprunt
FOR EACH ROW
BEGIN
    IF NEW.date_retour IS NOT NULL THEN
        UPDATE livre
        SET disponible = TRUE
        WHERE isbn = NEW.isbn;
    END IF;
END//

-- 7 

DELIMITER //

CREATE PROCEDURE surveiller_retards()
BEGIN
    UPDATE adherent a
    JOIN emprunt e ON a.id = e.id_adherent
    SET a.a_surveiller = TRUE
    WHERE e.date_retour IS NULL
    AND DATEDIFF(CURDATE(), e.date_emprunt) > 30;
END //

DELIMITER ;

CALL surveiller_retards();


-- 8 

DELETE FROM adherent 
WHERE id = 4

-- 9 

-- Dans le cas de nos requetes au dessus et du nombre de fois ou on utilise date_emprunt dans la table emprunts
-- ca me paraitrait legitime d'en mettre un ici pour recupéré le plus vite possible même si ca augmente leurs poids
-- Sinon en regle general j'ai tendance a faire des recherche par un id 


