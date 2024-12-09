#include <iostream>
#include <cassert>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>

int main() {
    glm::vec3 position(0.0f, 0.0f, 0.0f);
    glm::mat4 transform = glm::mat4(1.0f);
    transform = glm::translate(transform, glm::vec3(1.0f, 2.0f, 3.0f));
    glm::vec4 newPosition = transform * glm::vec4(position, 1.0f);

    // Assertions pour vérifier le résultat
    assert(newPosition.x == 1.0f);
    assert(newPosition.y == 2.0f);
    assert(newPosition.z == 3.0f);

    std::cout << "Tous les tests unitaires sont passés !" << std::endl;
    return 0;
}
