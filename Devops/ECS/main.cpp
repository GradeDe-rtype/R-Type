#include <iostream>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

int main() {
    // Vecteur 3D
    glm::vec3 position(0.0f, 0.0f, 0.0f);

    // Matrice de transformation
    glm::mat4 transform = glm::mat4(1.0f);
    transform = glm::translate(transform, glm::vec3(1.0f, 2.0f, 3.0f));

    // Transformation de la position
    glm::vec4 newPosition = transform * glm::vec4(position, 1.0f);

    std::cout << "Nouvelle position : "
              << newPosition.x << ", "
              << newPosition.y << ", "
              << newPosition.z << std::endl;

    return 0;
}
