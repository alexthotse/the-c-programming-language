/////////////////////////////////////////////////////////////
// copy input to output; 1st version
/////////////////////////////////////////////////////////////

#include <stdio.h>

int main(void) {
  static int c;

  c = getchar();      // scanf("%d", &c);
  while (c != EOF) {  // != -> not equal to
    putchar(c);       // printf("%d", c);
    c = getchar();
  }

  return 0;
}
