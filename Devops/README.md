# R-Type Project: Documentation

## **Table des Matières**
1. [Introduction](#introduction)
2. [Structure du Projet](#structure-du-projet)
3. [Docker](#docker)
   - [Dockerfiles pour Windows et Linux](#dockerfiles-pour-windows-et-linux)
   - [Docker Compose](#docker-compose)
4. [CI/CD Pipeline](#cicd-pipeline)
5. [Tests](#tests)
   - [Tests unitaires](#tests-unitaires)
6. [Instructions pour Windows et Linux](#instructions-pour-windows-et-linux)
7. [FAQ et Dépannage](#faq-et-dépannage)

---

## **Introduction**
R-Type est un projet multi-composants (ECS, Server, Client) visant à fournir une architecture modulaire pour les jeux vidéo. Le projet utilise Docker pour la containerisation et un pipeline CI/CD complet.

---

## **Structure du Projet**
- **ECS** : Composant principal pour la gestion des entités et des systèmes.
- **Server** : Serveur pour gérer la logique de jeu.
- **Client** : Interface utilisateur et rendu.

---

## **Docker**

### **Dockerfiles pour Windows et Linux**
Chaque composant (ECS, Server, Client) possède deux Dockerfiles :
- **Linux** : Utilise `g++` et Conan pour la gestion des dépendances.
- **Windows** : Utilise Visual Studio Build Tools, `clang`, et Conan.

Exemple pour construire les Dockerfiles :
```bash
Pour Windows
docker build -t ecs_image -f ECS/Dockerfile.ecs .
docker build -t server_image -f Server/Dockerfile.server .
docker build -t client_image -f Client/Dockerfile.client .
```
Pour Windows
```bash
docker build -t ecs_image -f ECS/Dockerfile.windows.ecs .
docker build -t server_image -f Server/Dockerfile.windows.server .
docker build -t client_image -f Client/Dockerfile.windows.client .
```
Docker Compose

Le fichier docker-compose.yml permet de lancer simultanément ECS, Server et Client, que ce soit sous Windows ou Linux.
Commandes pour lancer les services :

```bash
docker-compose up --build
```
CI/CD Pipeline

Le pipeline CI/CD inclut :

    Compilation des images Docker pour chaque composant.
    Tests fonctionnels et unitaires conditionnels :
        Les tests unitaires sont priorisés si les tests Docker échouent sur Windows.
    Push miroir sur un dépôt distant en cas de succès.

Tests
Tests unitaires

Les tests unitaires sont intégrés dans la CI/CD et peuvent être exécutés localement pour chaque composant.
Lancer les tests unitaires localement

Pour exécuter les tests manuellement, utilisez :

```bash
bash Devops/ECS/run_tests.sh
```
Installation des dépendances avec Conan

Pour installer les dépendances avec Conan sur votre machine :

    Assurez-vous d’avoir Conan installé :

```bash
pip install conan
```
Exécutez la commande suivante dans le répertoire du projet :

```bash
    conan install . --build=missing -c tools.system.package_manager:mode=install
```
Si vous rencontrez des problèmes de dépendances, vérifiez vos configurations Conan dans le fichier ~/.conan2/profiles/default.
Structure du projet

Voici les principaux répertoires et fichiers :

```bash
    ECS/ : Contient les Dockerfiles et scripts spécifiques au composant ECS.
    Server/ : Contient les Dockerfiles et scripts pour le serveur.
    Client/ : Contient les Dockerfiles et scripts pour le client.
    Devops/ : Contient le fichier docker-compose.yml, les scripts de tests, et le CI/CD.
    
ECS/
├── Dockerfile.ecs
├── Dockerfile.windows.ecs
├── run_tests.sh
Server/
├── Dockerfile.server
├── Dockerfile.windows.server
Client/
├── Dockerfile.client
├── Dockerfile.windows.client
Devops/
├── docker-compose.yml
```

Exécution des commandes Docker localement
Lancer une image spécifique

Pour lancer une image Docker spécifique (exemple : ECS sur Linux) :

```bash
docker run -it ecs_image
```
Débogage sous Windows

Si vous rencontrez des problèmes spécifiques à Windows (comme l’absence de CMAKE_C_COMPILER), vous pouvez exécuter des tests unitaires isolés sans passer par CMake. Voir le fichier de test unitaire dans Devops/ECS/tests.
Notes importantes

    Compatibilité multiplateforme : Les Dockerfiles et le docker-compose.yml sont conçus pour fonctionner sous Linux et Windows.
    Mise à jour des dépendances : Si de nouvelles dépendances sont ajoutées, mettez à jour les fichiers Conan correspondants.