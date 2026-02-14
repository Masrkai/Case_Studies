#include <iostream>
#include <chrono>

#define N 1024  // Array size

// GOOD: Clean, branchless loop that's easy to auto-vectorize
void add_arrays_good(const float* a, const float* b, float* c, int n) {
    for (int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];
    }
}

// BAD: Complex loop with branch and non-unit stride - hard to vectorize
void add_arrays_bad(const float* a, const float* b, float* c, int n) {
    for (int i = 0; i < n; i++) {
        if (i % 2 == 0) {  // Conditional branch
            c[i] = a[i] + b[i];
        } else {
            c[i] = a[i] * b[i];  // Different operation
        }
    }
}

int main() {
    alignas(32) float a[N];
    alignas(32) float b[N];
    alignas(32) float c[N];

    // Initialize arrays
    for (int i = 0; i < N; i++) {
        a[i] = i * 1.0f;
        b[i] = i * 2.0f;
    }

    // Call both versions
    add_arrays_good(a, b, c, N);
    add_arrays_bad(a, b, c, N);

    // Verify result
    std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;

    return 0;
}