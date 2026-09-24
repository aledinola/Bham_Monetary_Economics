# MATLAB material, 2026–2027

Course: **40073 Monetary Economics and the Macroeconomy**, University of Birmingham, Alessandro Di Nola.

Updated on **24 September 2026**. The shared MATLAB files are synchronized between Dropbox and [Bham_Monetary_Economics](https://github.com/aledinola/Bham_Monetary_Economics/tree/main/2026_2027/matlab_codes). Their contents are preserved from the [pre-reorganisation GitHub snapshot, commit `42ca70d`](https://github.com/aledinola/Bham_Monetary_Economics/tree/42ca70d40122466e1131d686f953853dffa00f08).

The central teaching-code folder is **`matlab_codes/`**, containing **11 MATLAB source files and one saved workspace** in both locations. There are no `.mlx` files; the four live scripts use plain-text `.m` format. The figure generator `1_lectures/figures/app1.m` is **Dropbox-only**, preserved at its existing location because it generates plots imported by the lecture TeX files. GitHub has no `1_lectures/` folder. There are no duplicate assessment-folder copies of the shared MATLAB files.

## Source files

The shared-file links below work relative to this inventory in both Dropbox and GitHub. This inventory has identical contents in both locations. Dropbox-only material is documented separately using plain-text paths.

| File | Type | Accompanies | What it does |
| --- | --- | --- | --- |
| [lecture4_extra.m](matlab_codes/lecture4_extra.m) | Plain-text live script | **Lecture 4: Consumption, Saving, Interest Rates** | Solves a simple two-period Huggett-style pure-exchange economy using the gross interest rate `R`. Illustrates household bond demand and zero-net-supply bond-market clearing, compares the numerical equilibrium with the closed-form interest rate, and gives a short application showing how higher expected future income and greater earnings risk affect the equilibrium rate. |
| [huggett_household.m](matlab_codes/huggett_household.m) | Function | **Lecture 4**, helper for `lecture4_extra.m` | Computes optimal bond holdings at a given gross interest rate `R`. Uses `fzero` on the household Euler equation over the interval implied by positive consumption. Returns bond holdings and consumption in the two periods. |
| [huggett_equilibrium.m](matlab_codes/huggett_equilibrium.m) | Function | **Lecture 4**, helper for `lecture4_extra.m` | Calls `huggett_household` and uses a simple bisection directly on the gross interest rate `R` until desired bond holdings are approximately zero. Returns the equilibrium gross rate, bond holdings and consumption. |
| [lecture4_precautionary_saving.m](matlab_codes/lecture4_precautionary_saving.m) | Plain-text live script | **Lecture 4: Consumption, Saving, Interest Rates**, precautionary saving | Solves a two-period household saving problem with log utility, a fixed interest rate and two equally likely future-income states. Uses `fminbnd` and `hh_objective_precautionary` to compute optimal saving, then varies income risk and plots the saving response. |
| [hh_objective_precautionary.m](matlab_codes/hh_objective_precautionary.m) | Function | **Lecture 4**, helper for `lecture4_precautionary_saving.m` | Returns negative expected lifetime log utility for given saving, discount factor, interest rate, current income and future-income risk. The script supplies consumption-feasible bounds to `fminbnd`. |
| [lecture5_investment.m](matlab_codes/lecture5_investment.m) | Plain-text live script | **Lecture 5: Investment and Capital Accumulation** | Studies partial-equilibrium investment and capital demand, a two-period general equilibrium with linear production and CRRA preferences, current and future productivity shocks, and the role of the intertemporal elasticity of substitution. Uses `fzero` for numerical equilibrium and includes an optional diminishing-returns exercise. Uses base MATLAB with no external code or data dependencies. |
| [seminar_class_1_matlab.m](matlab_codes/seminar_class_1_matlab.m) | Plain-text live script | **Seminar Class 1, Exercise 1**, based on **Lecture 1: Overview, Labor Demand and Supply** | Solves the household's partial-equilibrium labour-supply problem with log consumption utility and disutility of hours. Uses `fzero` to find optimal hours, plots marginal benefit against marginal cost, traces hours over a wage grid, and compares positive profit income with the zero-profit closed-form solution. |
| [prescott.m](matlab_codes/prescott.m) | Script with a local function | **Supplementary Assessment 2: Taxes, Labor Supply, and Welfare**, Part B calibration; related to the labour-supply material in Lectures 1–2 | Implements the Prescott calculation described in its header as an exercise from Kurlat's textbook. Compares the US and Europe using specified tax rates and transfers. Reports labour, leisure, output, consumption, utility, government deficits, the output gap, consumption-equivalent welfare and Frisch elasticities. It evaluates the supplied transfers rather than solving for balanced-budget transfers. |
| [main_prescott.m](matlab_codes/main_prescott.m) | Script with a local function | Same Prescott calculation and supplementary-assessment calibration as `prescott.m` | Originally stored at the repository root. It implements the same calculations as `prescott.m`, with formatting differences. Both distinct files are preserved unchanged in the central folder. |
| [main_davila.m](matlab_codes/main_davila.m) | Script with local functions | **Main Assessment 2**, competitive-equilibrium calculation; related to saving, investment and uninsurable earnings risk | Solves a two-period production economy based on Davila et al. with risky labour endowments, CRRA utility and Cobb–Douglas production. Iterates on aggregate capital, computes factor prices, solves household saving with `fminbnd`, and dampens the capital update until markets clear. Also solves the equilibrium Euler equation using `fzero`. Implements the competitive-equilibrium benchmark, not a planner solution. The model and calibration match `assignment2.tex`; no numbered lecture or seminar is stated in the script. |
| [main.m](matlab_codes/main.m) | Basic test script | No specific lecture or seminar identified | Clears the workspace and figures, prints `Hello, world!`, assigns `x = 4` and displays it. Copied for completeness from the repository root. |

The redundant assessment-folder copy of `prescott.m` was removed after confirming it was byte-for-byte identical to the central copy. Use `matlab_codes/prescott.m` for this calculation.

The assessment association for `prescott.m` follows its original folder and the matching parameters in `supp_assignment2.tex`. It is an assessment calculation, rather than a script explicitly assigned to a numbered lecture.

## Dropbox-only figure generator: `app1.m`

Local path relative to the course workspace: `2026_2027/1_lectures/figures/app1.m`. This file is intentionally excluded from GitHub and from the shared-file count. Its contents and local location are unchanged.

It produces schematic diagrams for production and labour choice, equilibrium and welfare, capital demand, New Keynesian aggregate demand and policy, asset bubbles, and unemployment. It saves PNG and EPS figures in the current working folder and has no external input-file dependencies.

### Which lectures use `app1.m`?

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
| [matlab.mat](matlab_codes/matlab.mat) | Saved workspace copied from the GitHub figure folder. The earlier MATLAB `whos -file` inspection reported 23 variables, including plotting settings, a graphics text object, asset-price/time vectors and labour-market parameters. The names are consistent with the Lecture 9–10 sections of `app1.m`; the file does not identify a specific lecture or exercise. | No. None of the source files listed here loads this workspace. Included for completeness. |

## Running the material

- **Lecture 4:** open `matlab_codes/lecture4_extra.m` in MATLAB's Live Editor and run the whole file once before experimenting with individual sections. Both Huggett helpers are in that same folder; make `matlab_codes` the current folder or add it to the MATLAB path.
- **Lecture 4, precautionary saving:** open `matlab_codes/lecture4_precautionary_saving.m` in the Live Editor and run sections in order. Keep `hh_objective_precautionary.m` in that same folder and make it the current folder or add it to the MATLAB path.
- **Lecture 5:** open `matlab_codes/lecture5_investment.m` in the Live Editor and run sections in order. All calculations are contained in this file; no external helper or data files are required.
- **Seminar Class 1:** open `matlab_codes/seminar_class_1_matlab.m` in the Live Editor and run its sections in order. It has no external code or data dependencies. Its embedded `seminar_class_1.pdf` link assumes its former location and does not resolve from the central folder; the PDF remains in Dropbox at `2_seminar_classes/class_1/` and is not published in this repository. The script itself is unchanged.
- **Live-script format:** these `.m` files contain `%[text]` markup for MATLAB's Live Editor.
- **Prescott calculation:** run `prescott` or `main_prescott` from `matlab_codes`. Each defines its own local `solve_country` helper. Both clear the workspace and close figures.
- **Davila calculation:** run `main_davila` from `matlab_codes`. All its functions are defined inside the file. It clears the workspace and closes figures.
- **Figure generator (Dropbox only):** use `app1.m` section by section in a separate output folder. It clears variables, closes figures and writes PNG/EPS files with fixed names. Some sections reuse output names, notably `lec10_4`, so a full run overwrites earlier versions. No external input files are loaded.


## Coverage and verification

The shared collection contains 11 source files and one saved workspace, all under `matlab_codes/`. Lecture, seminar, assessment and repository-root MATLAB files were consolidated there without changing their contents. The previously GitHub-only `lecture5_investment.m` was copied unchanged into Dropbox. GitHub's `app1.m` was removed; the original Dropbox file remains in place.

Verification for this reorganisation compares exact file hashes and relative paths, checks inventory coverage and documentation links, and confirms that the two inventory copies match. The shared files retain the exact contents of the pre-reorganisation GitHub snapshot linked above. No MATLAB execution, code formatting, code edits or numerical tests are part of this task.

Existing lecture-figure and seminar/assessment associations are retained from the earlier review of local teaching sources. The new Lecture 4 and Lecture 5 entries follow their script contents and stated lecture associations. The workspace-variable description records an earlier inspection; it does not imply MATLAB was run for this reorganisation.
