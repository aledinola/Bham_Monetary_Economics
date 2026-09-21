# MATLAB material, 2026–2027

Course: **40073 Monetary Economics and the Macroeconomy**, University of Birmingham, Alessandro Di Nola.

Inventory checked on **21 September 2026** against the files in the Dropbox project's `2026_2027` folder. The public copy is in [Bham_Monetary_Economics](https://github.com/aledinola/Bham_Monetary_Economics/tree/main/2026_2027), with the same relative folder structure. All seven MATLAB files listed below are included: six source files and one saved workspace. There are no `.mlx` files in this folder; the two live scripts use MATLAB's plain-text `.m` format.

## Source files

Links are relative to this inventory and work both in the local folder and on GitHub.

| File | Type | Accompanies | What it does |
| --- | --- | --- | --- |
| [lecture4_extra.m](1_lectures/lecture4_extra.m) | Plain-text live script | **Lecture 4: Consumption, Saving, Interest Rates** | Solves a simple two-period Huggett-style pure-exchange economy using the gross interest rate `R`. Illustrates household bond demand and zero-net-supply bond-market clearing, checks the numerical equilibrium against the closed-form interest rate, and gives a short application showing how higher expected future income and greater earnings risk affect the equilibrium rate. |
| [huggett_household.m](1_lectures/huggett_household.m) | Function | **Lecture 4**, helper for `lecture4_extra.m` | Computes optimal bond holdings at a given gross interest rate `R`. Uses `fzero` on the household Euler equation over the interval implied by positive consumption. Returns bond holdings and consumption in the two periods. |
| [huggett_equilibrium.m](1_lectures/huggett_equilibrium.m) | Function | **Lecture 4**, helper for `lecture4_extra.m` | Calls `huggett_household` and uses a simple bisection directly on the gross interest rate `R` until desired bond holdings are approximately zero. Returns the equilibrium gross rate, bond holdings and consumption. |
| [seminar_class_1_matlab.m](2_seminar_classes/class_1/seminar_class_1_matlab.m) | Plain-text live script | **Seminar Class 1, Exercise 1**, based on **Lecture 1: Overview, Labor Demand and Supply** | Solves the household's partial-equilibrium labour-supply problem with log consumption utility and disutility of hours. Uses `fzero` to find optimal hours, plots marginal benefit against marginal cost, traces hours over a wage grid, and compares positive profit income with the zero-profit closed-form solution. |
| [app1.m](1_lectures/figures/app1.m) | Figure-generation script | **Lectures 1, 2, 3, 5, 7, 8, 9 and 10**; detailed mapping below | Produces schematic teaching diagrams for production and labour choice, equilibrium and welfare, capital demand, New Keynesian aggregate demand and policy, asset bubbles, and unemployment. Saves PNG and EPS figures in the current working folder. |
| [prescott.m](3_assessment/Assignments%20-%202.%20Supplementary%20Assessment/prescott.m) | Script with a local function | **Supplementary Assessment 2: Taxes, Labor Supply, and Welfare**, Part B calibration; related to the labour-supply material in Lectures 1–2 | Implements the Prescott calculation described in its header as an exercise from Kurlat's textbook. Compares the US and Europe using specified tax rates and transfers. Reports labour, leisure, output, consumption, utility, government deficits, the output gap, consumption-equivalent welfare and Frisch elasticities. It evaluates the supplied transfers rather than solving for balanced-budget transfers. |

The assessment association for `prescott.m` follows its folder and the matching parameters in `supp_assignment2.tex`. It is an assessment calculation, rather than a script explicitly assigned to a numbered lecture.

## Which lectures use `app1.m`?

The mapping below comes from matching the script's exported figure names to `includegraphics` references in the current `LectureN.tex` sources. Section labels inside the script are not always the current lecture numbers: in particular, several `lec7_*` figures are used in Lecture 8.

| Lecture | Exported figure names used in that lecture | Subject |
| --- | --- | --- |
| 1 — Overview, Labor Demand and Supply | `1`, `2`, `2b`, `3`, `4`, `5`, `6` | Production, marginal product of labour, profits, household preferences and budget constraints. |
| 2 — A Simple Macro Model, Equilibrium & Welfare Theorems | `2`, `6`, `7`, `8`, `9`, `10`, `11`, `12` | Competitive allocation, production and preferences, welfare and comparative statics. |
| 3 — The Power of Substitution: Germany without Russian Gas | `13` | An indifference-curve and tangent-line illustration used in the discussion of substitution. |
| 5 — Investment and Capital Accumulation | `lec5_1` through `lec5_5` | Capital demand, marginal product and the user cost of capital. |
| 7 — New Keynesian Model | `lec7_1`, `lec7_2`, `lec7_3`, `lec7_5` | Aggregate demand and supply diagrams. |
| 8 — Policy in the New Keynesian Model | `lec5_1`, `lec7_2`, `lec7_4`, `lec7_6` through `lec7_12` | Investment, aggregate demand and monetary-policy diagrams. |
| 9 — The Financial Crisis, Asset Bubbles | `lec9_1`, `lec9_2` | Fundamental asset value and explosive bubble paths. |
| 10 — Unemployment, Inequality in Macro | `11`, `lec10_1`, `lec10_2`, `lec10_3`, `lec10_4`, `lec10_5v2`, `lec10_6v2` | Labour-market equilibrium, matching frictions, employment and welfare. |

These are figure basenames; the script exports `.png` and `.eps` versions. It also generates variants that are not referenced in these lecture sources.

## Ancillary MATLAB file

| File | Purpose and association | Needed to run the source files? |
| --- | --- | --- |
| [matlab.mat](1_lectures/figures/matlab.mat) | Saved workspace in the figure folder. MATLAB's `whos -file` reports 23 variables, including plotting settings, a graphics text object, asset-price/time vectors and labour-market parameters. The names are consistent with the Lecture 9–10 sections of `app1.m`; the file does not identify a specific lecture or exercise. | No. None of the six source files loads this workspace. Included for completeness. |

## Running the material

- **Lecture 4:** open `1_lectures/lecture4_extra.m` in MATLAB's Live Editor and run the whole file once before experimenting with individual sections. Keep both Huggett helper functions in the same folder, and make that folder the current folder or add it to the MATLAB path.
- **Seminar Class 1:** open `2_seminar_classes/class_1/seminar_class_1_matlab.m` in the Live Editor and run its sections in order. It has no external code or data dependencies.
- **Live-script format:** these `.m` files contain `%[text]` markup for MATLAB's Live Editor.
- **Prescott calculation:** run `prescott` from its folder. Its `solve_country` helper is defined inside the file. The script clears the workspace and closes existing figures.
- **Figure generator:** use `app1.m` section by section in a separate output folder. It clears variables, closes figures and writes PNG/EPS files with fixed names. Some sections reuse output names, notably `lec10_4`, so a full run overwrites earlier versions. No external input files are loaded.


## Coverage and verification

This inventory covers the MATLAB source files and saved workspace under `2026_2027`, including lecture, seminar and assessment subfolders. The `matlab_codes` directory was empty at the inventory date. Existing files at the GitHub repository root are outside this academic-year inventory and remain in place.

Descriptions and teaching associations were checked against the source code, lecture figure references, the Seminar Class 1 exercise and the supplementary assessment calibration. The saved workspace was inspected with MATLAB's `whos -file`. The Lecture 4 MATLAB files have since been simplified directly in the GitHub repository for teaching use.
