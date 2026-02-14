# What are SIMDs?

SIMD stands for **Single Instruction, Multiple Data**. It's a parallel processing technique, implemented as a hardware feature in modern processors, that performs the same operation on multiple data points simultaneously. This technology significantly reduces the number of CPU cycles required for certain tasks.

For example, consider adding two arrays of eight numbers. Without SIMD, a CPU would need to execute eight separate addition instructions sequentially. With a single SIMD instruction, all eight additions can be performed in parallel, potentially reducing the cycle cost from eight cycles to just one or two. This makes SIMD essential for performance-critical applications like multimedia processing, scientific computing, and machine learning.

SIMD is a hardware-level capability that requires explicit support from the software. Different processor architectures implement SIMD differently, meaning SIMD instructions are **architecture-dependent**. For instance:

- **x86_64** processors support SIMD extensions like SSE and AVX.
- **ARM** processors have their own SIMD implementations, such as NEON and SVE.
- **LoongArch** includes SIMD extensions like LSX and LASX.

Consequently, a program compiled to use SIMD instructions for one architecture (e.g., x86_64) cannot run on another (e.g., ARM) without recompilation. The target architecture must have the necessary hardware and instruction set support.

Compilers can generate SIMD instructions automatically when appropriate optimization flags are used (e.g., `-march=native` on GCC/Clang), depending on the target CPU architecture and its supported extensions. On x86_64, you'll commonly encounter:

- **SSE** (Streaming SIMD Extensions)
- **AVX** (Advanced Vector Extensions)

SIMD instructions are often accessed in high-level code through **intrinsics**—special functions that map directly to SIMD instructions, giving programmers fine-grained control without writing assembly.

For more detailed information, explore the **Intel Intrinsics Guide**: [Intel Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)

You can also read about the history of various SIMD instruction families:

- **MMX**: [Wikipedia: MMX (instruction set)](https://en.wikipedia.org/wiki/MMX_(instruction_set))
- **SSE**: [Wikipedia: Streaming SIMD Extensions](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions)
- **AVX**: [Wikipedia: Advanced Vector Extensions](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions)
