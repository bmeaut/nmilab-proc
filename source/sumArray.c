long long sumArray(int* inputArray, int length) {
  
  long long sum;

  for (int i = 0; i < length; ++i) {
    sum += inputArray[i];
  }

  return sum;
}


int main() {
    
  int a[64];
  long long s;

  for (int i = 0; i < 64; ++i) {
    a[i] = i*i;
  }

  s = sumArray(a, 64);

  return s;
}
