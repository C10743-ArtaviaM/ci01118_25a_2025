#include <stdio.h>

int factorial(int num); // Declaración de la función


int main() {
    int resultado = factorial(5);
    printf("Factorial de 5 es %d\n", resultado);
    return 0;
}

int factorial(int num) {
    if (num == 0) {
        return 1;
    }
    return(num * factorial(num-1));
}