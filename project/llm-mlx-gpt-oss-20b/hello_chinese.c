/* hello_chinese.c
 *
 * A tiny C program that prints "Hello, World!" in Chinese.
 * Compile with:   gcc -o hello_chinese hello_chinese.c
 * Run:            ./hello_chinese
 */

#include <stdio.h>

int main(void)
{
    /* Print the Chinese greeting.
       The string is encoded in UTF‑8. */
    printf("你好，世界\n");

    return 0;
}
