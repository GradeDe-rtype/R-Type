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
# Pour Linux
docker build -t ecs_image -f ECS/Dockerfile.ecs .
docker build -t server_image -f Server/Dockerfile.server .
docker build -t client_image -f Client/Dockerfile.client .

# Pour Windows
docker build -t ecs_image -f ECS/Dockerfile.windows.ecs .
docker build -t server_image -f Server/Dockerfile.windows.server .
docker build -t client_image -f Client/Dockerfile.windows.client .

Docker Compose

Le fichier docker-compose.yml permet de lancer simultanément ECS, Server et Client, que ce soit sous Windows ou Linux.

Commandes pour lancer les services :

docker-compose up --build

CI/CD Pipeline

Le pipeline CI/CD inclut :

    Compilation des images Docker pour chaque composant.
    Tests fonctionnels et unitaires conditionnels.
    Push miroir sur un dépôt distant en cas de succès.

Tests
Tests unitaires

Les tests unitaires sont intégrés dans le CI/CD et peuvent être exécutés localement pour chaque composant.

Exemple de compilation et exécution manuelle des tests :

# Compiler et exécuter un test unitaire
g++ -o unit_test.exe test_main.cpp -Ipath_to_glm -Lpath_to_dependencies
./unit_test.exe

Instructions pour Windows et Linux

    Clonez le dépôt :

git clone <repository_url>
cd R-Type

Installez Conan :

pip install conan

Détectez le profil Conan :

conan profile detect --force

Installez les dépendances :

conan install . --output-folder=build/conan --build=missing

Compilez avec CMake :

mkdir build && cd build
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build .

Lancez les tests :

    ./run_tests.sh

FAQ et Dépannage

    Problème : Impossible de trouver un compilateur sous Windows. Assurez-vous que MinGW ou Visual Studio Build Tools sont installés et configurés dans le chemin système.

    Problème : Dépendances manquantes avec Conan. Exécutez conan profile detect --force et vérifiez que toutes les bibliothèques sont disponibles sur ConanCenter.

    Problème : Échec du push dans le pipeline CI/CD. Vérifiez que votre clé SSH est correctement configurée et que le dépôt distant est accessible.
---