#include <stdio.h>

int main() {
    int array[6];
    int first_array[3] = {0, 1, 2};
    int second_array[3] = {3, 4, 5};

    int i, j, f_len, s_len;
    f_len = s_len = 3;
    j = 0;

    for(i = 0; i < f_len; i++) {
        array[j] = first_array[i];
        j++;
    }

    for(i = 0; i < s_len; i++) {
        array[j] = second_array[i];
        j++;
    }

    printf("\nFirst array -> ");

    for(i = 0; i < f_len; i++)
        printf(" %d", first_array[i]);

    printf("\nSecond array -> ");

    for(i = 0; i < s_len; i++)
        printf(" %d", second_array[i]);

    printf("\nConcat -> ");

    for(i = 0; i < 6; i++)
        printf(" %d", array[i]);

    return 0;
}
