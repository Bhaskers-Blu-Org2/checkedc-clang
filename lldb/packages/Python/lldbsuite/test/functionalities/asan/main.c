//===-- main.c --------------------------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#include <stdio.h>
#include <stdlib.h>

char *pointer;
char *another_pointer;

void f1() {
    pointer = malloc(10); // malloc line
    another_pointer = malloc(20); // malloc2 line
}

void f2() {
    free(pointer); // free line
}

int main (int argc, char const *argv[])
{
    f1();
    f2();

    printf("Hello world!\n"); // break line

    pointer[0] = 'A'; // BOOM line

    return 0;
}
