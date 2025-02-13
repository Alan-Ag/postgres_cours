cd "C:\Program Files\PostgreSQL\17\bin"

 -- ------ Initialisation de la base de données -----------------------------------------
 ./psql -U postgres

-- listing des database:
\l

-- Création d'une database
DROP DATABASE IF EXISTS mon_commerce;
CREATE DATABASE commerce;
ALTER DATABASE commerce OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE commerce to postgres;

-- Connexion à la database
\c postgres
\c commerce

-- liste des tables
\dt
-- ------- Clients ---------------------------------------------------------------------------
-- Création de la table clients
CREATE TABLE clients (
    id SERIAL NOT NULL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255)
);
ALTER TABLE clients OWNER TO postgres;


-- Insérer des données dans la table clients
INSERT INTO clients (nom, prenom, email) VALUES ('Doe', 'John', 'john.doe@gmail.Com');
INSERT INTO clients (nom, prenom, email) VALUES ('Zapart', 'Yohann', 'yohann.zapart@gmail.Com');
INSERT INTO clients (nom, prenom, email) VALUES ('Doe', 'Jane', 'doe.jane@gmail.com');
INSERT INTO clients (nom, prenom, email) VALUES ('Dpont', 'Pierre', 'dupont.pierre@gmail.com');
INSERT INTO clients (nom, prenom, email) VALUES ('Smith', 'Will', 'will.smith@gmail.com');
INSERT INTO clients (nom, prenom, email) VALUES ('Brown', 'Charlie', 'charlie.brown@gmail.com');


-- ------- Commandes ---------------------------------------------------------------------------
-- Création table commandes
CREATE TABLE commandes (
    id SERIAL NOT NULL PRIMARY KEY,
    date_commande DATE NOT NULL,
    montant DECIMAL(10, 2) NOT NULL,
    client_id INTEGER REFERENCES clients(id)
);
ALTER TABLE commandes OWNER TO postgres;

-- Insérer des données dans la table commandes
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-06', 600.00, 0);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-01', 100.00, 1);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-02', 200.00, 1);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-03', 300.00, 1);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-04', 400.00, 2);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-05', 500.00, 2);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-07', 700.00, 3);
INSERT INTO commandes (date_commande, montant, client_id) VALUES ('2021-01-08', 800.00, 4);

-- SELECT * FROM commandes;

-- ------- Produits ---------------------------------------------------------------------------
-- Création table produits
CREATE TABLE produits (
    id SERIAL NOT NULL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10, 2) NOT NULL
);
ALTER TABLE produits OWNER TO postgres;

-- Insérer des données dans la table produits
INSERT INTO produits (nom, prix) VALUES ('Chaussettes GUCCI', 100.00);
INSERT INTO produits (nom, prix) VALUES ('Pantoufles VERSACE', 200.00);
INSERT INTO produits (nom, prix) VALUES ('T-shirt DIOR', 300.00);
INSERT INTO produits (nom, prix) VALUES ('Pantalon CHANEL', 400.00);
INSERT INTO produits (nom, prix) VALUES ('Casquette NIKE', 50.00);
INSERT INTO produits (nom, prix) VALUES ('Chaussures ADIDAS', 150.00);

-- SELECT * FROM produits;

-- ------- Commandes/Produits association ---------------------------------------------------------------------------
-- Création table commandes_produits
CREATE TABLE commandes_produits (
    id SERIAL NOT NULL PRIMARY KEY,
    commande_id INTEGER REFERENCES commandes(id),
    produit_id INTEGER REFERENCES produits(id)
);

-- Insérer des données dans la table commandes_produits
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (3, 4);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (3, 1);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (4, 2);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (4, 3);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (2, 4);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (5, 5);
INSERT INTO commandes_produits (commande_id, produit_id) VALUES (6, 6);


DROP TABLE IF EXISTS commandes_produits;

-- Création de la table commandes_produits avec une colonne pour la quantité
CREATE TABLE commandes_produits (
    id SERIAL NOT NULL PRIMARY KEY,
    commande_id INTEGER REFERENCES commandes(id),
    produit_id INTEGER REFERENCES produits(id),
    quantite INTEGER NOT NULL
);

-- Insérer des données dans la table commandes_produits avec la quantité
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (3, 4, 2);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (3, 1, 1);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (4, 2, 3);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (4, 3, 1);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (2, 4, 4);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (5, 5, 2);
INSERT INTO commandes_produits (commande_id, produit_id, quantite) VALUES (6, 6, 1);




SELECT * FROM commandes_produits;

select cl.prenom, cl.nom, cl.email, p.nom, (p.prix * cp.quantite) as montant_total
from clients cl
inner JOIN commandes c on cl.id = c.client_id
inner JOIN commandes_produits cp on c.id = cp.commande_id
inner JOIN produits p on cp.produit_id = p.id;

--A partir d'un id de commande, afficher la commande (sans les produits) avec le nom du client


SELECT c.id AS commande_id, c.date_commande, c.montant, cl.nom, cl.prenom
FROM commandes c
INNER JOIN clients cl ON c.client_id = cl.id
WHERE c.id = 1; 

--A partir d'un id de commande, afficher la commande (avec les produits) avec le nom du client

select c.id as commande_id, c.date_commande, c.montant, cl.nom, cl.prenom, p.nom as produit, cp.quantite
from commandes c
inner join clients cl on c.client_id = cl.id
inner join commandes_produits cp on c.id = cp.commande_id
inner join produits p on cp.produit_id = p.id
where c.id = 1;

--6. Insérer un grand nombre de clients, commandes et produits depuis un notebook

