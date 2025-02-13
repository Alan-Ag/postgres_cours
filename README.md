# Module PostgreSQL

# https://github.com/yzpt/module_postgresql

#### Vidéos

| Ressource | Aperçu |
|-----------|--------|
| Tuto axé terminal/CLI : <br> https://www.youtube.com/watch?v=qw--VYLpxG4 | <img src="img/image-1.png" alt="alt text" style="max-width: 500px;"> |
| Tuto axé pgAdmin :<br> https://www.youtube.com/watch?v=85pG_pDkITY | <img src="img/image.png" alt="alt text" style="max-width: 500px;"> |

#### Exercices

* https://pgexercises.com/
  <img src="img/image-2.png" alt="alt text" style="max-width: 500px;">

#### Shortcuts 
- Shortcuts on VSCODE : Ctrl+(K puis S)
- Terminal on Vscode : Ctrl + 
- Configurer le shortcut : "Run Selected Text In Active Terminal"
- TODO: Faire vidéo

<hr>

# Mardi 11 février 2025
## 1. Installer postgresql sur votre machine !
Conseil : suivez le tuto https://www.youtube.com/watch?v=qw--VYLpxG4


## 2. Créer une base de données
Tables :
- clients
- commandes
- produits

## 3. Insérer des données dans les tables: quelques clients, quelques commandes, quelques produits.


<hr>

# Mercredi 12 février 2025

## 1. Créer 3 tables propres
- inspirées du fichir 1.0.database_commerce.sql
- avec SERIAL primary key pour l'id et quelques constraints not null sur des colonnes de votre choix
- avec des relations client/commandes (à chaque commande est associée un client)

## 2. Afficher votre données dans notebook à l'aide du module sqlAlchmey 
- Voir ficher 1.1.nb_sqlaclhemy.ipynb

## 3. Créer une table d'association entre produits et commandes
- avec une colonne pour la quantité

## 4. A partir d'un id de commande, afficher la commande (sans les produits) avec le nom du client
  indice : utiliser une jointure entre les tables commandes et clients
  
## 5. A partir d'un id de commande, afficher la commande (avec les produits) avec le nom du client
  indice : utiliser une jointure entre les tables commandes, clients et la table d'association

## 6. Insérer un grand nombre de clients, commandes et produits depuis un notebook
- clients : rechercher un générateur de données sur internet
- commandes : générer des commandes à l'aide de fonctions python
- produits : générer des produits à l'aide de fonctions python

## 7. Bonus/culture : créer un nouvel user dans postgresql
- all privileges sur la base de données 'commerce'





<hr>

# Dash/Plotly initiation

Vous devez au préalable installer les modules "dash" et "plotly" avec pip.

```bash
pip install dash
pip install plotly
```

Lancer l'application via la commande classqiue :
```bash
python dash_app.py
```
