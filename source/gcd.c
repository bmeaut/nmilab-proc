int gcd(int x, int y) {

   // while x and y are not equal subtract the smaller
   // from​ the greater
   while (x != y) {
      if (x > y) {
         x -= y;
      }
      else {
         y -= x;
      }
   }

   // if x and y are equal the ​solution has been found
   return x;
}


int main() {

  int a = 994;
  int b = 133;
  int c;

  return gcd(a, b);
}
