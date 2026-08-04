import matplotlib.pyplot as plt
import numpy as np
import os

def setup_plot(title, xlabel='x', ylabel='f(x)'):
    plt.figure(figsize=(8, 6))
    plt.axhline(0, color='black', linewidth=0.5)
    plt.axvline(0, color='black', linewidth=0.5)
    plt.grid(True, linestyle='--', alpha=0.7)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)

def plot_limit_hole(save_path):
    x = np.linspace(0, 2, 500)
    y = x + 1
    y[np.isclose(x, 1)] = np.nan
    
    setup_plot(r'Limit Analysis: $\lim_{x \to 1} \frac{x^2 - 1}{x - 1}$')
    plt.plot(x, y, label=r'$f(x) = x + 1, x \neq 1$', linewidth=2)
    plt.scatter([1], [2], color='white', edgecolor='red', s=100, zorder=5, label='Hole at (1, 2)')
    plt.legend()
    plt.savefig(save_path)
    plt.close()

def plot_jump_discontinuity(save_path):
    # Defining a jump at a=1
    x1 = np.linspace(0, 1, 250, endpoint=False)
    y1 = 2 - x1**2  # Example curve approaching left
    
    x2 = np.linspace(1, 2, 250)
    y2 = x2 + 1  # Example curve approaching right

    setup_plot(r'Jump Discontinuity at $a=1$')
    plt.plot(x1, y1, color='orange', linewidth=2, label=r'Left limit ($x \to 1^-$)')
    plt.plot(x2, y2, color='blue', linewidth=2, label=r'Right limit ($x \to 1^+$)')
    
    # Circles for the hole/jump
    # Open circle at (1, 1) for left side
    plt.scatter([1], [1], color='white', edgecolor='orange', s=100, zorder=5) 
    
    # Closed circle at (1, 2) for right side
    plt.scatter([1], [2], color='blue', s=100, zorder=5) 
    
    plt.legend()
    plt.savefig(save_path)
    plt.close()

def plot_onesided_limits(save_path):
    x_left = np.linspace(-2, 0, 100, endpoint=False)
    y_left = np.full_like(x_left, -1)
    
    x_right = np.linspace(0, 2, 100)
    y_right = np.full_like(x_right, 1)
    
    setup_plot(r'One-Sided Limits: $f(x) = \frac{|x|}{x}$')
    plt.plot(x_left, y_left, color='orange', linewidth=2, label=r'Left limit ($x \to 0^-$)')
    plt.plot(x_right, y_right, color='blue', linewidth=2, label=r'Right limit ($x \to 0^+$)')
    
    # Open circles
    plt.scatter([0], [-1], color='white', edgecolor='orange', s=100, zorder=5)
    plt.scatter([0], [1], color='white', edgecolor='blue', s=100, zorder=5)
    
    plt.ylim(-2, 2)
    plt.legend()
    plt.savefig(save_path)
    plt.close()

if __name__ == "__main__":
    os.makedirs('assets', exist_ok=True)
    plot_limit_hole('assets/limit_plot.png')
    plot_jump_discontinuity('assets/jump_discontinuity.png')
    plot_onesided_limits('assets/onesided_limits.png')
