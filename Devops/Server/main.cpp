#include <iostream>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>

int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);

    // Créer le socket
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == 0) {
        std::cerr << "Erreur : Impossible de créer le socket\n";
        return -1;
    }

    // Configurer le socket
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(8080);

    // Lier le socket
    if (bind(server_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
        std::cerr << "Erreur : Impossible de lier le socket\n";
        return -1;
    }

    // Écouter les connexions
    if (listen(server_fd, 3) < 0) {
        std::cerr << "Erreur : Échec de l'écoute\n";
        return -1;
    }

    std::cout << "Serveur en attente de connexion sur le port 8080...\n";

    // Accepter une connexion
    new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
    if (new_socket < 0) {
        std::cerr << "Erreur : Impossible d'accepter la connexion\n";
        return -1;
    }

    std::cout << "Connexion acceptée !\n";

    close(new_socket);
    close(server_fd);
    return 0;
}
