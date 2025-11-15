/* hello_chinese.c
 *
 * Compile:   gcc -o hello_chinese hello_chinese.c
 * Run:       ./hello_chinese
 *
 * This program prints "Hello world" in Chinese: 你好，世界
 */

#include <stdio.h>

int main(void)
{
    /* UTF‑8 encoded string literal */
    printf("你好，世界\n");
    return 0;
}

