# Polynomial Factoring

## 1. Foundational Principle

Factoring is the process of decomposing a polynomial into a product of two or more non-constant polynomials (or constants) such that their product yields the original expression. It is the inverse operation of polynomial expansion.

For a polynomial \( P(x) \), factoring seeks to express it as:
\[
P(x) = c \cdot f_1(x) \cdot f_2(x) \cdots f_n(x)
\]
where \( c \) is a constant (often the greatest common factor) and each \( f_i(x) \) is an **irreducible factor** over the specified number system.

---

## 2. Defining the Coefficient Domain

The decision of when to stop factoring is **strictly dependent** on the number set over which coefficients are permitted. This is the most critical concept to establish before beginning any factoring procedure.

| Domain | Symbol | Stopping Criterion |
| :--- | :--- | :--- |
| **Integers / Rationals** | \( \mathbb{Z} \) / \( \mathbb{Q} \) | Factors must have integer or rational coefficients. Stop when all factors are linear or irreducible quadratics whose discriminant is **not a perfect square** (and not negative for rationals, as irrational roots imply irreducibility over \( \mathbb{Q} \)). |
| **Real Numbers** | \( \mathbb{R} \) | Factors must have real coefficients. Stop when all factors are linear or irreducible quadratics whose discriminant is **strictly negative** (\( \Delta < 0 \)). |
| **Complex Numbers** | \( \mathbb{C} \) | By the Fundamental Theorem of Algebra, every polynomial factors completely into **linear** factors. Stop when all factors are of the form \( (x - r) \), where \( r \in \mathbb{C} \). |

**Standard Convention:** Unless explicitly stated otherwise, elementary algebra assumes factoring **over the integers or rationals** (\( \mathbb{Q} \)). This guide defaults to that convention but highlights domain-specific exceptions.

---

## 3. The Sequential Factoring Algorithm

To ensure no factor is missed, execute the following steps in strict hierarchical order. After each step, re-evaluate every resulting factor by returning to Step 1.

### Step 1: Greatest Common Factor (GCF)

Extract the largest monomial that divides every term of the polynomial.

- **Proceed if:** The GCF is greater than 1 or contains a variable.
- **Stop if:** The GCF is exactly 1. Proceed to Step 2.

**Edge Case:** If the leading coefficient is negative, factor out \( -1 \) to standardize the polynomial for easier subsequent factoring.

### Step 2: Term Count Classification

Evaluate the number of terms in the remaining polynomial.

| Term Count | Applicable Techniques | Action |
| :--- | :--- | :--- |
| **2 Terms** (Binomial) | Difference of Squares: \( a^2 - b^2 = (a-b)(a+b) \) <br> Sum of Cubes: \( a^3 + b^3 = (a+b)(a^2-ab+b^2) \) <br> Difference of Cubes: \( a^3 - b^3 = (a-b)(a^2+ab+b^2) \) | Factor immediately if pattern matches. |
| **3 Terms** (Trinomial) | See **Section 3.1** below for a detailed mechanical procedure. | Factor using the AC Method. |
| **4 or More Terms** (Polynomial) | Grouping: Group terms to extract common binomial factors. | Factor by grouping. |

### 3.1 Detailed Mechanical Procedure for Factoring Trinomials (\( ax^2 + bx + c \))

To eliminate guesswork, execute the following AC Method rigorously. This method works for all trinomials with integer coefficients.

**Step A:** Compute the product \( a \cdot c \).

**Step B:** Find two integers \( m \) and \( n \) such that:

- \( m \cdot n = a \cdot c \)
- \( m + n = b \)

**Step C:** If no such integers \( m \) and \( n \) exist, the trinomial is **irreducible** over the integers. **Stop** (proceed to Section 4 to confirm the discriminant condition).

**Step D:** If such integers exist, rewrite the middle term \( bx \) as \( mx + nx \). The trinomial becomes:
\[
ax^2 + mx + nx + c
\]

**Step E:** Apply factoring by grouping to the four-term polynomial:

- Group the first two terms and the last two terms.
- Extract the GCF from each group.
- Factor out the common binomial factor.

**Example:** Factor \( 6x^2 + 11x + 3 \).

- \( a \cdot c = 6 \cdot 3 = 18 \).
- Find \( m, n \): \( m \cdot n = 18 \), \( m + n = 11 \). The integers are \( 9 \) and \( 2 \).
- Rewrite: \( 6x^2 + 9x + 2x + 3 \).
- Group: \( 3x(2x + 3) + 1(2x + 3) \).
- Result: \( (2x + 3)(3x + 1) \).

### Step 3: Substitution (Quadratic Form)

If the polynomial is of even degree and follows the pattern \( ax^{2n} + bx^n + c \), substitute \( u = x^n \). Factor the resulting quadratic in \( u \) using the AC Method from Section 3.1, then substitute back.

- **Proceed if:** The substituted quadratic factors.
- **Stop if:** The substituted quadratic is irreducible over the domain.

### Step 4: Recursive Evaluation

After applying Steps 1 through 3, **examine each resulting factor independently**. A factor that is of degree 2 or higher must be tested against Steps 1 and 2 again. This recursion is the mechanism by which higher-order polynomials are completely decomposed.

---

## 4. Definitive Criteria: Proceed vs. Stop

This section formalizes the exact conditions under which you must continue factoring versus declare the process complete.

### 4.1 Conditions to Proceed (Continue Factoring)

Perform further factorization if **any** of the following conditions are true for a given factor:

1. **Common Monomial Exists:** The factor has a variable or integer common factor that was previously overlooked.
2. **Matches a Special Product:** The factor is a binomial that matches the difference of squares or sum/difference of cubes pattern exactly.
3. **Factorable Trinomial:** The factor is a trinomial \( ax^2 + bx + c \) where the AC Method (Section 3.1) successfully yields integers \( m \) and \( n \).
4. **Grouping Potential:** The factor contains 4 or more terms that can be rearranged to reveal a shared binomial factor.
5. **Composite Exponent:** The factor is of degree 3 or higher and can be rewritten as a quadratic through substitution (e.g., \( x^4 \) becomes \( (x^2)^2 \)).

### 4.2 Conditions to Stop (Terminate Factoring)

Declare a factor **irreducible** (stop processing it) if **any** of the following conditions are met:

1. **Linear Factor:** The factor has degree 1. A linear factor \( ax + b \) cannot be decomposed into non-constant polynomials with real coefficients.
2. **Irreducible Quadratic over \( \mathbb{Q} \):** The factor is \( ax^2 + bx + c \) with integer coefficients, and the discriminant \( \Delta = b^2 - 4ac \) is **positive but not a perfect square**. In this case, the roots are irrational, so the factor remains irreducible over the rationals.
3. **Irreducible Quadratic over \( \mathbb{R} \):** The factor is \( ax^2 + bx + c \), and the discriminant \( \Delta = b^2 - 4ac \) is **strictly negative**. The quadratic has no real roots and cannot be factored over real numbers. *(Note: Over complex numbers, you would proceed, but this is outside the standard convention).*
4. **Prime Constant Factor:** The remaining factor is a constant integer (e.g., 5, -2, 1). Constants are considered fully factored.
5. **No Shared Factors:** In the context of a larger expression, if a factor shares no common variable or integer with the other factors, it is individually complete.

---

## 5. Comprehensive Edge Cases and Exceptions

A professional approach requires explicit handling of non-standard scenarios.

- **The Zero Polynomial:** \( P(x) = 0 \). The zero polynomial has an infinite number of factors. Factoring is generally undefined or intentionally omitted from factoring exercises. If encountered, state that the polynomial is trivial.

- **Constant Polynomials:** \( P(x) = k \), where \( k \neq 0 \). Constants are prime in the context of polynomial rings. They are already fully factored.

- **Missing Terms (Zero Coefficients):** When encountering higher-degree polynomials with missing terms (e.g., \( x^5 + 0x^4 + x^3 \)), do not skip the GCF. Factor out the lowest power of \( x \) first: \( x^3(x^2 + 1) \). Then re-evaluate.

- **Fractional Coefficients:** If coefficients are rational non-integers (e.g., \( \frac{1}{2}x^2 - 2 \)), factor out the fractional GCF \( \frac{1}{2} \) to simplify: \( \frac{1}{2}(x^2 - 4) = \frac{1}{2}(x-2)(x+2) \). Stop when the interior polynomial is irreducible over the rationals.

- **Repeated Factors:** If a factor appears multiple times (e.g., \( (x-1)^3 \)), it is fully factored as a power. Do not attempt to expand and refactor.

- **Domain Switching:** The same polynomial has different stopping points depending on the domain:
  - \( x^4 - 4 \) over \( \mathbb{Q} \): Stop at \( (x^2 - 2)(x^2 + 2) \).
  - \( x^4 - 4 \) over \( \mathbb{R} \): Proceed to \( (x - \sqrt{2})(x + \sqrt{2})(x^2 + 2) \).
  - \( x^4 - 4 \) over \( \mathbb{C} \): Proceed to \( (x - \sqrt{2})(x + \sqrt{2})(x - i\sqrt{2})(x + i\sqrt{2}) \).
  Always confirm the required domain before beginning.

---

## 6. Worked Examples Demonstrating the Proceed/Stop Logic

### Example A: Degree 4 with Recursion

**Expression:** \( 16x^4 - 81 \)

- **Step 1 (GCF):** GCF = 1. Proceed.
- **Step 2 (Binomial):** Recognize and explicitly rewrite as a difference of squares:
  \[
  16x^4 - 81 = (4x^2)^2 - (9)^2
  \]
  Apply the difference of squares formula:
  \[
  (4x^2 - 9)(4x^2 + 9)
  \]
- **Evaluate Factor 1:** \( 4x^2 - 9 \). Explicitly rewrite: \( (2x)^2 - (3)^2 \). This is a difference of squares. **Decision: Proceed.**
  - Factor to \( (2x - 3)(2x + 3) \). Both are linear. **Decision: Stop** for these.
- **Evaluate Factor 2:** \( 4x^2 + 9 \). Discriminant \( \Delta = 0 - 4(4)(9) = -144 < 0 \). Over reals, irreducible. **Decision: Stop.**
- **Final Answer (over \( \mathbb{R} \)):** \( (2x - 3)(2x + 3)(4x^2 + 9) \).

### Example B: Degree 5 with Hidden Grouping

**Expression:** \( x^5 - x^3 + x^2 - 1 \)

- **Step 1 (GCF):** GCF = 1. Proceed.
- **Step 2 (4 terms):** Grouping required. Group as \( (x^5 - x^3) + (x^2 - 1) \).
  - Factor first group: \( x^3(x^2 - 1) \).
  - Factor second group: \( 1(x^2 - 1) \).
  - Combine: \( (x^2 - 1)(x^3 + 1) \).
- **Evaluate Factor 1:** \( x^2 - 1 \). Explicitly rewrite as \( (x)^2 - (1)^2 \). Difference of squares. **Decision: Proceed.**
  - Factor to \( (x-1)(x+1) \). Linear. **Stop.**
- **Evaluate Factor 2:** \( x^3 + 1 \). Sum of cubes: \( a^3 + b^3 \) with \( a=x, b=1 \). **Decision: Proceed.**
  - Factor to \( (x + 1)(x^2 - x + 1) \).
  - Evaluate \( x+1 \): Linear. **Stop.**
  - Evaluate \( x^2 - x + 1 \): \( \Delta = (-1)^2 - 4(1)(1) = 1 - 4 = -3 < 0 \). Irreducible over reals. **Stop.**
- **Final Answer:** \( (x-1)(x+1)^2(x^2 - x + 1) \). *(Note: \( x+1 \) appears twice due to overlap, which is correct).*

### Example C: Quadratic with Non-Perfect Discriminant

**Expression:** \( x^2 + 3x + 1 \)

- **Step 1 (GCF):** GCF = 1. Proceed.
- **Step 2 (Trinomial via AC Method):** \( a=1, b=3, c=1 \). \( a \cdot c = 1 \). Find \( m, n \) such that \( m \cdot n = 1 \) and \( m + n = 3 \). The factor pairs of 1 are (1, 1) and (-1, -1). Neither sums to 3. No integers exist.
- **Decision (Over \( \mathbb{Q} \)):** Calculate \( \Delta = 9 - 4 = 5 \). 5 is positive but not a perfect square. The roots are irrational. **Stop.** The polynomial is irreducible over the integers/rationals.
- **Decision (Over \( \mathbb{R} \)):** \( \Delta = 5 > 0 \). **Proceed** to factor using the quadratic formula: \( (x - \frac{-3+\sqrt{5}}{2})(x - \frac{-3-\sqrt{5}}{2}) \). This demonstrates domain dependency.

---

## 7. Decision Workflow

1. **Determine the domain** (\( \mathbb{Q} \), \( \mathbb{R} \), or \( \mathbb{C} \)).
2. **Extract GCF**. If none, proceed.
3. **Apply term-count technique** (binomial, trinomial via AC Method, or grouping).
4. **For every resulting factor**:
    - Is it linear? \( \to \) **Stop**.
    - Is it quadratic with \( \Delta < 0 \)? \( \to \) **Stop** (over \( \mathbb{R} \)).
    - Is it quadratic with \( \Delta \ge 0 \) but not a perfect square? \( \to \) **Stop** (over \( \mathbb{Q} \)); **Proceed** (over \( \mathbb{R} \)).
    - Does it contain a known special product or common term? \( \to \) **Proceed** (recursively apply steps 1-3).
5. **Verify** by multiplying the final factors to ensure the product equals the original polynomial. This validation is non-negotiable.
