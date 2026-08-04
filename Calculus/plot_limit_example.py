import matplotlib.pyplot as plt
import numpy as np

# Define x range
x = np.linspace(0, 2, 500)
# The function is x + 1, but undefined at x = 1.
# We replace the value at 1 with NaN for proper plotting.
y = x + 1
y[np.isclose(x, 1)] = np.nan

# Plot
plt.figure(figsize=(8, 6))
plt.plot(x, y, label=r'$f(x) = \frac{x^2 - 1}{x - 1} = x + 1$', linewidth=2)

# Add the "hole" at (1, 2)
plt.scatter([1], [2], color='white', edgecolor='red', s=100, zorder=5, label='Hole at (1, 2)')

plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.grid(True, linestyle='--', alpha=0.7)
plt.legend()
plt.title(r'Limit Analysis: $\lim_{x \to 1} \frac{x^2 - 1}{x - 1}$')
plt.xlabel('x')
plt.ylabel('f(x)')

# Save the plot
plt.savefig('assets/limit_plot.png')
plt.close()
