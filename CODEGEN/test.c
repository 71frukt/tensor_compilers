#include <stdio.h>

// rdi = a, rsi = n
extern long function1(int* a, int n);

int function1_ref(int* a, int n) {
    int result = 0;
    for (int i = 0; i < n; ++i) {
        int x = 5;
        for (int j = 0; j < n; ++j) {
            if (j % 2 == 0)
                continue;
            result += 2 * 3 * a[j] * x - i - 2;
        } 
    }

    return result;
}

int main() {
    int a[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
    int n = 10;

    int result = function1(a, n);
    int result_ref = function1_ref(a, n);
    printf("Result:     %d\n", result);
    printf("Result ref: %d\n", result_ref);
    return 0;
}