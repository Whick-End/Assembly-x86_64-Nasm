#include <stdio.h>

extern int my_strlen();         //Prototype for extern function

int main(void) {

        printf("strlen(\"Test\") = %d\n", my_strlen("Test"));       //Print return of the extern function my_strlen
        return 0;
}
