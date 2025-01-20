# 🚀 **R-Type Multiplayer Game**

Welcome to **R-Type**, a cross-platform multiplayer/network game inspired by the classic side-scrolling shoot'em up. Developed in **C++**, this project leverages a **client-server architecture** and the **Entity-Component-System (ECS)** design pattern to ensure smooth, modular, and scalable gameplay.

<br>

---

<br>

## 📝 **Summary**

- **Type:** Multiplayer network game  
- **Architecture:** Client-server with ECS design pattern  
- **Platforms:** Windows and Linux  
- **Language:** C++  
- **Build System:** CMake  
- **Package Manager:** Conan

<br>

---

<br>

## 🎯 **Project Purpose**

The R-Type project aims to recreate a modern version of the legendary R-Type game, enriched with multiplayer capabilities and built upon a robust game engine architecture. The server manages the game's core logic, while the client provides an interactive and immersive interface for players.

<br>

---

<br>

## 🌀 **Global Overview**

The R-Type project is composed of three main sections : **Server**, **Client**, **Entity-Component-System**.

### **🖥️ Server**  
- Manages player connections and multiplayer sessions  
- Synchronizes game states across all clients  
- Handles game events (spawn, shooting, destruction, etc.)  
- Implements multithreading to ensure smooth performance  

### **🎮 Client**  
- Provides a graphical interface for players
- Allows players to connect to servers, join rooms, and play games
- Manages user input and communication with the server
- Optimized rendering for seamless gameplay on both Windows and Linu

### **🔄 Entity-Component-System (ECS)**  
- **Entities:** Represent game objects (players, enemies, projectiles)  
- **Components:** Store data attributes (position, health, speed)  
- **Systems:** Define entity behaviors by processing components  

This structure ensures high performance and modularity.

<br>

---

<br>

## 🛠️ **Technologies Used**

- **Language:** C++  
- **Libraries:** SFML (Rendering, Audio, Input)  
- **Design Pattern:** Entity-Component-System (ECS)  
- **Network Protocol:** UDP for in-game communication  
- **Build System:** CMake  
- **Package Manager:** Conan

<br>

---

<br>

## 📦 **Requirements**

Before building and running **R-Type**, ensure that your system meets the following requirements:

### 🖥️ **Operating System**
- **Linux**: Ubuntu 20.04+ or equivalent  
- **Windows**: Windows 10+  

### 🛠️ **Build Tools**
- **CMake**: ≥ 3.16  
- **Make**: For Linux environments  
- **Visual Studio Build Tools**: For Windows environments (MSVC compiler)  

### 🧩 **Dependencies**
The following dependencies are required:
- **Boost**: ≥ 1.70 (System component)  
- **SFML**: ≥ 2.5 (Graphics, Audio, Network)  
- **Conan**: Dependency management tool
- **Criterion**: Unit tests

### 🛡️ **Compilers**
- **GCC**: ≥ 9.3  
- **Clang**: ≥ 11  

### 📡 **Network Requirements**
- Open ports for both **UDP** (in-game communication) and **TCP** (for specific tasks).  
- Stable internet connection for multiplayer features.  

Make sure to install the dependencies using package manager (`Conan`) before proceeding with the build.

For dependency installation steps, refer to the [Installation Guide](https://github.com/GradeDe-rtype/R-Type/wiki).

<br>

---

<br>

## 📥 **Installation and Setup**

We use submodules to improve the code so to clone the repository and set up the project, follow these steps.

### 1️⃣ **Clone the Repository**
```bash
git clone git@github.com:GradeDe-rtype/R-Type.git
cd R-Type
```

### 2️⃣ **Initialize Submodules**
```bash
git submodule update --init --recursive
```

### 3️⃣ **Update Submodules**

To update a submodule to its latest commit, go to the submodule’s directory and pull the changes.

```bash
cd submodules/
git pull origin main
```

You will have to do this with `Client`, `ECS` and `Server`.

<br>

---

<br>

## 🚀 **Running the Game**

### **Build the Project with CMake**
```bash
mkdir build
cd build
cmake ..
make
```

### **Start the Server**
The server expects one main argument:
- **Port:** The server's port number (example : `4242`)
```bash
./r-type_server -p <SERVER_PORT>
```

### **Launch the Client**
The client expects two main arguments:
- **IP Address:** The server's IP address (example : `127.0.0.1`)
- **Port:** The server's port number (example : `4242`)
```bash
./r-type_client -i <SERVER_IP> -p <SERVER_PORT>
```

<br>

---

<br>

## 📚 **Documentation**

For more details on:
- **Installation Guide**  
- **Developer Documentation**
- **Code Conventions**
- **Contribution guidelines**
- **Technical and Comparative Study**
- **Protocol RFC Documentation**

Please refer to the [Documentation](https://github.com/GradeDe-rtype/R-Type/wiki) wiki.

<br>

---

<br>

## 🧩 **Key Features**

- Real-time multiplayer experience with robust connection management.  
- Modular architecture with a clear separation between client and server.  
- Cross-platform support for Windows and Linux.  
- Classic gameplay redesigned with modern mechanics.  
- Optimized network protocols for reduced latency and better performance.  

<br>

---

<br>

## 👥 **Authors**

- **Caroline Boilly**, [@Aeliondw](https://github.com/Aeliondw) | caroline.boilly@epitech.eu  
- **Damien Defer**, [@deferdam](https://github.com/deferdam) | damien.defer@epitech.eu  
- **Daniil Stepanov**, [@Dan13615](https://github.com/Dan13615) | daniil.stepanov@epitech.eu  
- **Léonard Oursel**, [@H4rdeol](https://github.com/H4rdeol) | leonard.oursel@epitech.eu  
- **Nathan Tirolf**, [@dragusheen](https://github.com/dragusheen) | nathan.tirolf@epitech.eu  

<br>

---

<br>

## 📄 **License**

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

<br>

---

<br>

## 🌐 **Useful Resources**

- [R-Type Overview](http://www.hardcoregaming101.net/r-type/)   
- [Wikipedia: Shoot 'em up](https://en.wikipedia.org/wiki/Shoot_'em_up)
- [Project Documentation](https://github.com/GradeDe-rtype/R-Type/wiki) 

<br>

---

<br>

**Enjoy playing and contributing to R-Type! Feel free to open issues, submit pull requests, or share your ideas.** 🚀
