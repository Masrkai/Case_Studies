import matplotlib.pyplot as plt
import numpy as np

fig, axes = plt.subplots(1, 3, figsize=(15, 4))

# Define the x-ranges for left and right segments
x_left = np.linspace(0, 3, 500)   # includes 3
x_right = np.linspace(3, 6, 500)  # includes 3

# -------- 1. f(x) : jumps UP by 1 at x=3 --------
# f(x) = 0 if x <= 3,  f(x) = 1 if x > 3
axes[0].plot(x_left, np.zeros_like(x_left), 'b-', linewidth=2, label='y=0')
axes[0].plot(x_right, np.ones_like(x_right), 'b-', linewidth=2, label='y=1')
# Closed dot at (3, 0)  -> function equals 0 at x=3
axes[0].scatter([3], [0], color='black', s=100, zorder=5)
# Open dot at (3, 1)   -> function approaches 1, but does NOT include it at x=3
axes[0].scatter([3], [1], color='white', edgecolor='black', s=100, zorder=5)
axes[0].axvline(3, color='red', linestyle='--', alpha=0.5)
axes[0].set_title('f(x): Discontinuous at 3')
axes[0].grid(True)
axes[0].set_ylim(-1.5, 1.5)

# -------- 2. g(x) : jumps DOWN by 1 at x=3 --------
# g(x) = 0 if x <= 3,  g(x) = -1 if x > 3
axes[1].plot(x_left, np.zeros_like(x_left), 'orange', linewidth=2, label='y=0')
axes[1].plot(x_right, -np.ones_like(x_right), 'orange', linewidth=2, label='y=-1')
# Closed dot at (3, 0)  -> function equals 0 at x=3
axes[1].scatter([3], [0], color='black', s=100, zorder=5)
# Open dot at (3, -1)  -> function approaches -1, but does NOT include it at x=3
axes[1].scatter([3], [-1], color='white', edgecolor='black', s=100, zorder=5)
axes[1].axvline(3, color='red', linestyle='--', alpha=0.5)
axes[1].set_title('g(x): Discontinuous at 3')
axes[1].grid(True)
axes[1].set_ylim(-1.5, 1.5)

# -------- 3. h(x) = f(x) + g(x) = 0 for ALL x --------
# Perfectly continuous flat line at 0
x_all = np.linspace(0, 6, 1000)
axes[2].plot(x_all, np.zeros_like(x_all), 'green', linewidth=3)
axes[2].axvline(3, color='red', linestyle='--', alpha=0.5)
axes[2].set_title('h(x) = f(x) + g(x) = 0 (Continuous!)')
axes[2].grid(True)
axes[2].set_ylim(-1.5, 1.5)

plt.tight_layout()
plt.show()