import os

import matplotlib.patches as mp
import matplotlib.pyplot as plt
import numpy as np
import sympy as sp
from matplotlib.path import Path
from matplotlib.ticker import FuncFormatter

# ── File type is SVG ────────────────────────────────────
plt.rcParams['svg.fonttype'] = 'none'   # keep <text> elements instead of
                                         # converting to <path> outlines
                                         # (editable in Inkscape / Illustrator)

# ── Symbolic layer ──────────────────────────────────────────────────────────
x = sp.Symbol('x')

# Each plot gets a *symbolic* definition.  `lambdify` turns it into a fast
# NumPy callable that matplotlib can consume.
FUNCS = {
    "x_squared":       x**2,
    "line_x_plus_1":   x + 1,
    "hole_quotient":   (x**2 - 1) / (x - 1),
    "inv_sq":          1 / x**2,
    "oscillate":       sp.sin(1 / x),
    "abs_over_x":      sp.Abs(x) / x,
    "left_piece":      2 - x**2,
    "right_piece":     x + 1,
}

# Pre-compile every expression once (modules="numpy" gives vectorised ufuncs)
F = {name: sp.lambdify(x, expr, modules="numpy") for name, expr in FUNCS.items()}

# Symbolic helpers -----------------------------------------------------------
def sym_limit(expr, point, side="+"):
    """Return the symbolic one- or two-sided limit of *expr* at *point*."""
    return sp.limit(expr, x, point, side)

def sym_simplify(expr):
    return sp.simplify(expr)

def singularities(expr):
    """Return the finite singularities of a rational expression."""
    return sp.solveset(sp.denom(expr), x, domain=sp.S.Reals)


# ── Matplotlib styling (unchanged) ──────────────────────────────────────────
BG, LINE = "#f7f5dc", "#4b3d75"

def setup_ax(ax, title=None):
    ax.set_facecolor(BG)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_color('gray')
    ax.spines['bottom'].set_color('gray')
    ax.spines['left'].set_position('zero')
    ax.spines['bottom'].set_position('zero')
    if title:
        ax.set_title(title, color=LINE, fontsize=12)
    ax.tick_params(colors='gray')
    ax.grid(False)
    ax.xaxis.set_major_formatter(FuncFormatter(lambda v, _: f"{v:g}"))
    ax.yaxis.set_major_formatter(
        FuncFormatter(lambda v, _: "" if np.isclose(v, 0) else f"{v:g}"))

def place_axis_labels(ax, xlabel='x', ylabel='f(x)', x_pos=None, y_pos=None):
    if x_pos is None:
         x_pos = ax.get_xlim()[1]
    if y_pos is None:
         y_pos = ax.get_ylim()[1]
    ax.text(x_pos, -0.3, xlabel, color=LINE, fontsize=10, ha='right', va='top')
    ax.text(0.3, y_pos, ylabel, color=LINE, fontsize=10, ha='right', va='bottom')

def curve_arrow(ax, xs, ys, at='end', n=12, ext=0.3, **style):
    if at == 'start':
        xs, ys = xs[::-1], ys[::-1]
    dx, dy = xs[-1] - xs[-1 - n], ys[-1] - ys[-1 - n]
    L = np.hypot(dx, dy)
    ux, uy = dx / L, dy / L
    verts = list(zip(xs[-n:], ys[-n:])) + [(xs[-1] + ux * ext, ys[-1] + uy * ext)]
    ax.add_patch(mp.FancyArrowPatch(
        path=Path(verts), arrowstyle='->', mutation_scale=18,
        capstyle='round', joinstyle='round', **style))


# ── Plots ───────────────────────────────────────────────────────────────────
def plot_limit_hole(save_path):
    """lim_{x→1} (x²−1)/(x−1) — SymPy simplifies & computes the limit."""
    expr       = FUNCS["hole_quotient"]
    simplified = sym_simplify(expr)          # → x + 1
    lim_val    = sym_limit(expr, 1)          # → 2
    print(f"simplified : {expr}  →  {simplified}")
    print(f"limit      : lim(x→1) = {lim_val}")

    # 501 points over [-1, 3] → spacing 0.008, and index 250 is exactly x=1
    xs = np.linspace(-1, 3, 501)
    ys = F["line_x_plus_1"](xs)              # plot the simplified form x + 1
    ys[np.isclose(xs, 1)] = np.nan           # punch the hole at x = 1

    fig, ax = plt.subplots(figsize=(6, 4.6), facecolor=BG)
    setup_ax(ax, r'$\lim_{x \to 1} \frac{x^2-1}{x-1}$')
    ax.plot(xs, ys, color=LINE, lw=2,
            label=rf'${sp.latex(simplified)},\; x \neq 1$')
    # open circle at the hole
    ax.scatter([1], [float(lim_val)], s=45,
               facecolors=BG, edgecolors=LINE, zorder=5)
    place_axis_labels(ax)
    plt.savefig(save_path, facecolor=BG)
    plt.close()



def plot_jump_discontinuity(save_path=None, ax=None):
    if ax is None:
        fig, ax = plt.subplots(figsize=(6, 4.6), facecolor=BG)
        setup_ax(ax, r'Jump Discontinuity at $a=1$')

    xs1 = np.linspace(0, 1, 250, endpoint=False)
    xs2 = np.linspace(1, 2, 250)

    ax.plot(xs1, F["left_piece"](xs1),  color=LINE, lw=2)
    ax.plot(xs2, F["right_piece"](xs2), color=LINE, lw=2)
    ax.scatter([1], [1], s=45, facecolors=BG, edgecolors=LINE, zorder=5)
    ax.scatter([1], [2], s=45, color=LINE, zorder=5)
    place_axis_labels(ax)

    if save_path:
        plt.savefig(save_path, facecolor=BG)
        plt.close()


def plot_onesided_limits(save_path):
    expr  = FUNCS["abs_over_x"]
    lim_l = sym_limit(expr, 0, side="-")
    lim_r = sym_limit(expr, 0, side="+")
    print(f"lim(x→0⁻) |x|/x = {lim_l},  lim(x→0⁺) = {lim_r}")

    xs_l = np.linspace(-2, 0, 100, endpoint=False)   # already excludes 0
    xs_r = np.linspace( 0, 2, 100)[1:]               # ← skip x=0

    fig, ax = plt.subplots(figsize=(6, 4.6), facecolor=BG)
    setup_ax(ax, r'$f(x)=\frac{|x|}{x}$')
    ax.plot(xs_l, F["abs_over_x"](xs_l), color=LINE, lw=2)
    ax.plot(xs_r, F["abs_over_x"](xs_r), color=LINE, lw=2)
    ax.scatter([0], [float(lim_l)], s=45, facecolors=BG, edgecolors=LINE, zorder=5)
    ax.scatter([0], [float(lim_r)], s=45, facecolors=BG, edgecolors=LINE, zorder=5)
    ax.set_ylim(-2, 2)
    place_axis_labels(ax)
    plt.savefig(save_path, facecolor=BG)
    plt.close()


def plot_all_conditions_combined(save_path):
    fig, axs = plt.subplots(2, 2, figsize=(10, 10), facecolor=BG)
    fig.suptitle('The Four Behaviors of Limits', color=LINE, fontsize=16)

    # 1 – exists & equal  (x²)
    xs = np.linspace(0, 2, 500)
    ys = F["x_squared"](xs)
    ys[np.isclose(xs, 1)] = np.nan
    setup_ax(axs[0, 0], 'Exists & Equal')
    axs[0, 0].plot(xs, ys, color=LINE)
    axs[0, 0].scatter([1], [1], s=45, facecolors=BG, edgecolors=LINE, zorder=5)

    # 2 – jump
    xl = np.linspace(-1, 0, 100, endpoint=False)
    xr = np.linspace( 0, 1, 100)
    setup_ax(axs[0, 1], 'Exists & Unequal (Jump)')
    axs[0, 1].plot(xl, np.full_like(xl, -1), color=LINE)
    axs[0, 1].plot(xr, np.full_like(xr,  1), color=LINE)
    axs[0, 1].scatter([0], [-1], s=45, facecolors=BG, edgecolors=LINE, zorder=5)
    axs[0, 1].scatter([0], [ 1], s=45, color=LINE, zorder=5)

    # 3 – blows up  (1/x²)
    xs3 = np.linspace(-1, 1, 1000)
    xs3 = xs3[xs3 != 0]
    setup_ax(axs[1, 0], r'Blows up ($\pm\infty$)')
    axs[1, 0].plot(xs3, F["inv_sq"](xs3), color=LINE)
    axs[1, 0].set_ylim(0, 20)

    # 4 – oscillates  (sin(1/x))
    xs4 = np.linspace(-0.5, 0.5, 1000)
    xs4 = xs4[xs4 != 0]
    setup_ax(axs[1, 1], 'Oscillates')
    axs[1, 1].plot(xs4, F["oscillate"](xs4), color=LINE)

    plt.tight_layout(rect=(0, 0.03, 1, 0.95))
    plt.savefig(save_path, facecolor=BG)
    plt.close()


def plot_mit_example(save_path):
    # These four pieces are *ad-hoc* visual curves, not textbook expressions,
    # so they stay as plain NumPy.  SymPy wouldn't add clarity here.
    x1 = np.linspace(-3.15, -2, 200, endpoint=False)
    y1 = 2.8 - 0.3*np.cos(2.5*np.pi*(x1+2.3)) + 0.8*(x1+2.3)**3
    x2 = np.linspace(-2, 1, 300)[1:-1]
    y2 = 1.5 - 0.5*np.cos(np.pi*x2)
    x3 = np.linspace(1, 2.90, 400)[1:]
    y3 = 1.5 + 0.5*np.cos(np.pi*(x3-1)/1.5) + 2e-4/(3-x3)**4
    x4 = np.linspace(3, 4.92, 400)
    y4 = 1 + 0.3*(x4-3) + (0.4+0.35*(x4-3))*np.cos(2.5*np.pi*(x4-3.6))

    fig, ax = plt.subplots(figsize=(9, 4.6), facecolor=BG)
    setup_ax(ax, title="Comprehensive Example")

    for xi, yi in [(x1,y1),(x2,y2),(x3,y3),(x4,y4)]:
        ax.plot(xi, yi, color=LINE, lw=2, solid_capstyle='round')

    ax.scatter(*zip(*[(-2,3),(-2,1),(1,2)]),
               s=45, facecolors=BG, edgecolors=LINE, lw=2, zorder=5)
    ax.scatter(*zip(*[(-2,2),(3,1)]),
               s=45, color=LINE, zorder=5)
    ax.axvline(3, color='gray', ls='--', lw=0.8, alpha=0.7)

    curve_arrow(ax, x1, y1, at='start', color=LINE, lw=2)
    curve_arrow(ax, x3, y3, color=LINE, lw=2)
    curve_arrow(ax, x4, y4, color=LINE, lw=2)

    ax.set_xticks(range(-3, 5))
    ax.set_yticks([1, 2, 3])
    ax.set_xlim(-3.4, 5.2)
    ax.set_ylim(0, 3.8)
    place_axis_labels(ax, x_pos=5.1, y_pos=3.7)
    plt.tight_layout()
    plt.savefig(save_path, facecolor=BG)
    plt.close()


def plot_jump_discontinuity_X2(save_path=None, ax=None):
    if ax is None:
        fig, ax = plt.subplots(figsize=(6, 4.6), facecolor=BG)
        setup_ax(ax, title="Jump Discontinuity")

    a = 2.0
    f_left  = 1.75 + 0.75*sp.cos(sp.pi*x) + 0.5*sp.cos(sp.pi*x/2)
    f_right = -1.4*x**2 + 7.8*x - 8.8
    F_left, F_right = (sp.lambdify(x, e, 'numpy') for e in (f_left, f_right))

    xL = np.linspace(0, a, 200, endpoint=False)
    xR = np.linspace(a, 4, 200)[1:]

    ax.plot(xL, F_left(xL), color=LINE, lw=2)
    ax.plot(xR, F_right(xR), color=LINE, lw=2)
    ax.scatter([a], [F_left(a)], s=45, facecolors=BG, edgecolors=LINE, zorder=5) # upper hole
    ax.scatter([a], [F_right(a)], s=45, facecolors=BG, edgecolors=LINE, zorder=5) # lower hole

    ax.set_xlim(-0.25, 4.35)
    ax.set_ylim(-0.1, 3.4)

    place_axis_labels(ax)

    if save_path:
        plt.savefig(save_path, facecolor=BG)
        plt.close()


def plot_removable_discontinuity_X2(save_path=None, ax=None):
    if ax is None:
        fig, ax = plt.subplots(figsize=(6, 4.6), facecolor=BG)
        setup_ax(ax, title="Removable Discontinuity")

    a = 2.0
    c = sp.symbols('c0:5')
    P = c[4]*x**4 + c[3]*x**3 + c[2]*x**2 + c[1]*x + c[0]
    pts = [(0, 2.8), (1, 0.8), (2, 1.6), (3, 2.4), (4, 0.8)]
    f2 = P.subs(sp.solve([P.subs(x, xi) - yi for xi, yi in pts], c))
    F2 = sp.lambdify(x, f2, 'numpy')

    x2 = np.linspace(0, 4, 400)

    ax.plot(x2, F2(x2), color=LINE, lw=2)
    ax.scatter([a], [F2(a)], s=45, facecolors=BG, edgecolors=LINE, zorder=5)

    ax.set_xlim(-0.25, 4.35)
    ax.set_ylim(-0.1, 3.4)

    place_axis_labels(ax)

    if save_path:
        plt.savefig(save_path, facecolor=BG)
        plt.close()


def plot_compare_discontinuity(save_path):
    fig = plt.figure(figsize=(10, 6), facecolor=BG)
    gs = fig.add_gridspec(2, 2)

    ax1 = fig.add_subplot(gs[0, 0])
    setup_ax(ax1, title="Jump Discontinuity (a=1)")
    plot_jump_discontinuity(ax=ax1)

    ax2 = fig.add_subplot(gs[1, 0])
    setup_ax(ax2, title="Jump Discontinuity (a=2)")
    plot_jump_discontinuity_X2(ax=ax2)

    ax3 = fig.add_subplot(gs[:, 1])
    setup_ax(ax3, title="Removable Discontinuity")
    plot_removable_discontinuity_X2(ax=ax3)

    plt.tight_layout()
    plt.savefig(save_path, facecolor=BG)
    plt.close()


def plot_piecewise_limit_graph(save_path=None, ax=None):
    """Worksheet graph: holes at (-2,1),(1,2),(3,2); solid dots at (1,1),(3,1);
    arrows on both tails."""
    if ax is None:
        fig, ax = plt.subplots(figsize=(9, 4.6), facecolor=BG)
        setup_ax(ax)

    # Ad-hoc visual pieces (plain NumPy, same convention as plot_mit_example)
    x1 = np.linspace(-3.05, -2, 200)                  # left tail, min at (-2.5, 0)
    y1 = 4*(x1 + 2.5)**2
    x2 = np.linspace(-2, -1, 200)                     # hump peaking at 2
    y2 = 1.5 - 0.5*np.cos(2*np.pi*(x2 + 2))
    x3 = np.linspace(-1, 1, 200)                      # line segment → hole (1, 2)
    y3 = 1.5 + 0.5*x3
    x4 = np.linspace(1, 3, 300)                       # dip between the two holes
    y4 = 1.5 + 0.5*np.cos(np.pi*(x4 - 1))
    x5 = np.linspace(3, 4.92, 400)                    # oscillating right tail
    y5 = 1 + 0.3*(x5-3) + (0.4 + 0.35*(x5-3))*np.cos(2.5*np.pi*(x5-3.6))

    for xi, yi in [(x1, y1), (x2, y2), (x3, y3), (x4, y4), (x5, y5)]:
        ax.plot(xi, yi, color=LINE, lw=2, solid_capstyle='round')

    # holes (open circles) and defined values (solid dots)
    ax.scatter(*zip(*[(-2, 1), (1, 2), (3, 2)]),
               s=45, facecolors=BG, edgecolors=LINE, lw=2, zorder=5)
    ax.scatter(*zip(*[(1, 1), (3, 1)]),
               s=45, color=LINE, zorder=5)

    curve_arrow(ax, x1, y1, at='start', color=LINE, lw=2)   # left arrow ↑
    curve_arrow(ax, x5, y5, color=LINE, lw=2)               # right arrow ↑

    ax.set_xticks(range(-3, 5))
    ax.set_yticks([1, 2, 3])
    ax.set_xlim(-3.4, 5.2)
    ax.set_ylim(-0.4, 3.4)
    place_axis_labels(ax, x_pos=5.1, y_pos=3.3)

    if save_path:
        plt.tight_layout()
        plt.savefig(save_path, facecolor=BG)
        plt.close()

# ── Main ────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    os.makedirs("assets", exist_ok=True)

    expr = FUNCS["hole_quotient"]
    print(f"singularities of {expr}: {singularities(expr)}")

    plot_limit_hole("assets/limit_plot.svg")
    plot_onesided_limits("assets/onesided_limits.svg")
    plot_all_conditions_combined("assets/four_conditions.svg")
    plot_mit_example("assets/mit_example.svg")
    plot_compare_discontinuity("assets/compare_discontinuity.svg")
    plot_piecewise_limit_graph("assets/piecewise_limit_graph.svg")
