#include <stdio.h>

int main(void) {
    int value1, value2, value3;
    int min, max;

    extern void min_max(int, int, int, int*, int*);

    printf("Ingrese el numero 1: ");
    scanf("%d", &value1);

    printf("Ingrese el numero 2: ");
    scanf("%d", &value2);

    printf("Ingrese el numero 3: ");
    scanf("%d", &value3);

    min_max(value1, value2, value3, &min, &max);
    printf("El minimo valor es: %d\nEl maximo valor es: %d\n", min, max);
    return 0;
}