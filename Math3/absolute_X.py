import matplotlib.pyplot as plt
import numpy as np

# Generate x values from -3 to 3
x = np.linspace(-3, 3, 1000)
y = np.floor(x)          # floor function

plt.figure(figsize=(8, 5))
plt.step(x, y, where='post', linewidth=2, color='blue')

# Axes and grid
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.grid(True, linestyle='--', alpha=0.6)

plt.title(r'Graph of $k(x) = \lfloor x \rfloor$', fontsize=14)
plt.xlabel('x')
plt.ylabel('y')
plt.xlim(-3.5, 3.5)
plt.ylim(-3.5, 3.5)
plt.show()