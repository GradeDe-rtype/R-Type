# R-Type Multiplayer Game

Welcome to **R-Type**, a cross-platform multiplayer/network game built using C++. This project combines classic side-scrolling shoot-em-up gameplay with modern multiplayer features. Designed with a server-client architecture and an Entity-Component-System (ECS) pattern, it ensures smooth, modular, and scalable gameplay.

<br>

---

<br>

## 📝 Summary

- **Type:** Multiplayer/network game.
- **Architecture:** Server-client, using ECS design.
- **Platforms:** Windows and Linux.
- **Language:** C++.

<br>

---

<br>

## 🌀 Global Presentation

The R-Type project is composed of three main sections:

### **Server**
The server is the central hub for:
- Managing player connections and rooms.
- Synchronizing game state across all clients.
- Handling game logic, events, and multiplayer interactions.

### **Client**
The client is the player's gateway to the game:
- Allows players to connect to servers, join rooms, and play games.
- Handles user input, visuals, and communication with the server.
- Ensures a smooth experience on both Windows and Linux.

### **Entity-Component-System (ECS)**
The ECS architecture ensures clean and modular game logic:
- **Entities:** Represent all game objects (e.g., players, enemies, and projectiles).
- **Components:** Store data attributes (e.g., position, health, and speed).
- **Systems:** Define how entities behave by processing their components.

This structure promotes performance and scalability.

<br>

---

<br>

## 🛠 Technologies Used

- **Language:** C++
- **Design Pattern:** Entity-Component-System (ECS)
- **Cross-Platform:** Built to run seamlessly on Windows and Linux.

<br>

---

<br>

## 📥 How to Clone the Repository

We use submodules to improve the code so to clone the repository and set up the project, follow these steps:

1. **Clone the repository:**
```bash
git clone git@github.com:GradeDe-rtype/R-Type.git
cd R-Type
```

<br>

2. **Initialize Submodules**
```bash
git submodule update --init --recursive
```

<br>

3. **Updating Submodules**

To update a submodule to its latest commit, go to the submodule’s directory and pull the changes:

```bash
cd submodules/
git pull origin main
```

You will have to do this with `Client`, `ECS` and `Server`

<br>

---

<br>

## 📚 More Information

For further details, please check the [documentation](./documentation) folder, which includes:
- **Good Practices:** Guidelines for writing commits, naming branches, and maintaining code quality.
- **Build Instructions:** Comprehensive steps to build the project.
- **Contributing:** Instructions for contributing to the development.

<br>

---

<br>

We hope you enjoy contributing to and playing **R-Type**! Feel free to open issues, submit pull requests, or reach out with ideas. 🚀
