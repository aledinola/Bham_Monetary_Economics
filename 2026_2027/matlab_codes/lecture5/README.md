# Lecture 5: Classical Monetary Theory

These MATLAB files implement the **classical money-in-the-utility-function (MIU) model** described in Alessandro Di Nola's Lecture 5 slides and accompanying model write-up for *Monetary Economics and the Macroeconomy*.

Prices and wages are flexible. Households choose consumption, hours worked, money holdings and nominal bonds; firms produce using labour alone. Households value real money balances directly in their utility. The central bank sets the nominal interest rate in response to inflation and a monetary policy disturbance.

The examples illustrate **classical dichotomy**: productivity shocks affect output, consumption, hours and real wages, while monetary policy shocks leave these quantities unchanged. Inflation, nominal interest rates and real money balances respond to monetary policy.

## Accompanying course materials

The following files are in the local Dropbox course workspace, with paths relative to the course root:

- `2026_2027/1_lectures/Lecture5_swp_new.tex` — slides, *Classical Monetary Theory and Classical Dichotomy*. The compiled version is `Lecture5_swp_new.pdf` in the same folder.
- `2026_2027/1_lectures/Lecture5_new_model_writeup.pdf` — *Classical dichotomy in a money-in-the-utility model*. Sections 2–4 set out the equilibrium conditions, steady state and solution for equilibrium paths. Its LaTeX source is `Lecture5_new_model_writeup.tex` in the same folder.

These teaching documents remain in Dropbox and are not included in the public GitHub repository.

## Files and usage

| File | Purpose |
| --- | --- |
| [main.m](main.m) | Sets parameters and shocks, computes the steady state and plots responses to productivity and monetary policy innovations over 40 quarters. |
| [solve_steady_state.m](solve_steady_state.m) | Computes the model's steady state with zero inflation. |
| [solve_equilibrium_path.m](solve_equilibrium_path.m) | Computes equilibrium paths for the productivity and monetary policy innovations supplied by the main script. |

Set MATLAB's current folder to `2026_2027/matlab_codes/lecture5/` and run:

```matlab
main
```

Keep all three `.m` files together. They use base MATLAB and require no external data or additional toolboxes. The script clears the workspace and closes existing figures, then opens two figures showing the responses to each shock. Each period is one quarter. Edit the parameters and shock vectors in `main.m` to explore other examples.

## Source references

The Lecture 5 reading slide also lists **C. E. Walsh, Chapter 2**, and **J. Galí, Chapter 2**. As the slide explains, the course model omits physical capital and includes endogenous labour supply.

See the [MATLAB inventory](../../MATLAB_INVENTORY.md) for the wider course collection.
