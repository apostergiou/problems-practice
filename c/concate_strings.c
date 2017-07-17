#include <stdio.h>
#include <string.h>

int main() {
   char s1[11] = "hello";
   char s2[] = "world";

   int i, j;
   int n1 = strlen(s1);
   int n2 = strlen(s2);

   for(i = 0; i < n2; i++) {
      s1[n1 + i] = s2[i];
   }

   printf("%s", s1);
}
