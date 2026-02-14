# Effectiveness

for all practical purposes, MMX is obsolete, You should not use it for new code.

## 1. The "Rosetta Stone": How to read the names

The names look like random letters, but they follow a strict logic. Once you crack the code, you can guess what an instruction does without looking it up.

**The Intrinsics (C++ style):**
Most start with `_mm_` (MultiMedia).

* **`_mm_add_...`**: The operation (Add).
* **`pi16` / `pi8` / `pi32`**: The data type.
  * `pi8` = Packed Integer 8-bit (treats the 64-bit register as **8 separate bytes**).
  * `pi16` = Packed Integer 16-bit (treats the register as **4 separate shorts**).
  * `pi32` = Packed Integer 32-bit (treats the register as **2 separate ints**).

**The Assembly (The lowercase names like `paddb`):**

* **`p`**: Packed.
* **`add`**: Operation.
* **`b` / `w` / `d`**: Size suffix.
  * `b` = Byte (8-bit).
  * `w` = Word (16-bit).
  * `d` = Double-word (32-bit).
  * `q` = Quad-word (64-bit).

**Example:**

* `_mm_add_pi8` (Assembly: `paddb`) adds **8 bytes** in parallel.
  * If you have `[1, 2, 3, 4, 5, 6, 7, 8]` + `[1, 1, 1, 1, 1, 1, 1, 1]`, the result is `[2, 3, 4, 5, 6, 7, 8, 9]` in one single CPU cycle.

> **Correction on your list:** In your provided text, the mapping for the first few items is slightly misaligned.
>
> * `_mm_add_pi16` corresponds to `paddw` (Word/16-bit), not `paddd`.
> * `_mm_add_pi32` corresponds to `paddd` (Double/32-bit).
> * `_mm_add_pi8` corresponds to `paddb` (Byte/8-bit).

---

## 2. The Categories Explained

Here is what those groups of instructions actually do, in plain English.

### A. Arithmetic (The Math)

* **`add` / `sub`**: Standard addition and subtraction.
  * *Important:* If you add `255 + 1` using `pi8`, standard math wraps to `0` (overflow).
* **`adds` (Saturating Arithmetic)**:
  * This is "smart" math often used for graphics.
  * If you add `200 + 100` using `adds_pu8` (Unsigned Saturate), the result doesn't wrap; it **stops at the limit (255)**.
  * If you subtract `10 - 20`, it stops at **0**.
  * *Use case:* Calculating brightness/color values. You don't want a pixel to wrap from bright white to black; you want it to stay white.
* **`mul` (Multiply)**:
  * `_mm_mullo_pi16`: Keeps the lower half of the result (standard integer multiply).
  * `_mm_mulhi_pi16`: Keeps the upper half (useful for fixed-point math or scaling).
  * `_mm_madd_pi16`: Multiply then add adjacent pairs. Extremely useful for matrix math and audio filters (dot products).

### B. Logical (Bitwise)

* **`and` / `or` / `xor`**:
  * Standard binary logic.
  * `_mm_and_si64`: Used to mask out specific bits. For example, removing the "Red" channel from an RGB pixel value.

### C. Comparison

* **`pcmpeq` (Equal)** / **`pcmpgt` (Greater Than)**:
  * These do **not** return "True" or "False". They return a bitmask.
  * If the comparison is true, the destination is filled with `1`s (`0xFF` or `0xFFFF`).
  * If false, it is filled with `0`s.
  * *Use case:* You can use the result as a mask for a logical `AND` to delete specific data values without using `if` statements.

### D. Shifting

* **`psll` (Shift Left)** / **`psrl` (Shift Right Logical)** / **`psra` (Shift Right Arithmetic)**:
  * Shifts bits.
  * `psrl` (Logical) fills empty spots with zeros.
  * `psra` (Arithmetic) fills empty spots with the sign bit (preserves negative numbers).
  * *Use case:* Fast multiplication or division by powers of 2. Dividing a pixel coordinate by 2.

### E. Packing / Unpacking (Data Rearrangement)

This is often the hardest to grasp but the most powerful.

* **Pack (`_mm_packs_...`)**: Takes larger numbers and squeezes them into smaller numbers.
  * Takes two 32-bit integers and packs them into two 16-bit integers.
  * Uses saturation (clamping). If the number is too big for 16-bit, it clamps it.
* **Unpack (`_mm_unpack_...`)**: Interleaves data.
  * Takes the low parts of variable A and the low parts of variable B and merges them.
  * *Use case:* Converting 8-bit color data to 16-bit for processing, or merging audio channels (Left/Right).

### F. State Management (`emms`)

* **`_mm_empty` / `_m_empty`**:
  * **Crucial historical artifact:** MMX registers `mm0-mm7` share physical silicon with the x87 Floating-Point registers `st0-st7`.
  * If you use MMX, the FPU state is marked as "occupied."
  * **You must call `_mm_empty()`** after you finish MMX work and before doing standard floating-point math, or your FPU will crash or return garbage.

---

## 3. How to think and navigate this

Do not try to memorize the list. Instead, identify the job you want to do:

1. **What is my data?**
    * Am I working with bytes (pixels, text)? Look for **`pi8`** or **`b`** instructions.
    * Am I working with shorts (audio samples, screen coordinates)? Look for **`pi16`** or **`w`** instructions.

2. **Do I need protection from overflow?**
    * If yes (graphics), look for **`adds`** (saturating).
    * If no (cryptography, hashing), use regular **`add`**.

3. **Do I need to move data around?**
    * Use **`unpack`** or **`pack`**.

## 4. What is this useful for?

MMX is old technology (superseded by SSE, AVX, etc.), but the concepts are timeless. These instructions help with:

1. **Image Processing:**
    * Adjusting brightness (Add saturation).
    * Alpha blending (Multiply + Add).
    * Converting RGB to Grayscale (Dot product / Multiply-Add).
2. **Audio Processing:**
    * Volume control (Multiply).
    * Mixing two audio streams (Add).
    * Audio filters (Multiply-Add).
3. **Digital Signal Processing (DSP):**
    * Fast Fourier Transforms or simple FIR filters rely heavily on the `pmaddwd` (Multiply-Add) instruction.

## Summary

You are looking at a parallel processing engine.

* **Normal CPU:** Does 1 math problem at a time.
* **MMX:** Does 8 math problems at the exact same time (for 8-bit data).

The naming convention tells you the **Operation** (Add), the **Data Size** (pi16), and the **Behavior** (Saturation).
