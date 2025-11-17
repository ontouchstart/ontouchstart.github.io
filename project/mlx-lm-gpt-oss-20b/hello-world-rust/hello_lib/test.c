#include <stdio.h>
#include <stdlib.h>

extern const char* hello();
extern void hello_free(char*);

int main() {
    const char* msg = hello();
    printf("C sees: %s\n", msg);
    hello_free((char*)msg);
    return 0;
}
