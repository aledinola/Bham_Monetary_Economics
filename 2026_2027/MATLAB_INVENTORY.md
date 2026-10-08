# MATLAB material, 2026–2027

Course: **40073 Monetary Economics and the Macroeconomy**, University of Birmingham, Alessandro Di Nola.

Updated on **8 October 2026**. The shared MATLAB files are synchronized between Dropbox and [Bham_Monetary_Economics](https://github.com/aledinola/Bham_Monetary_Economics/tree/main/2026_2027). The original central collection retains its contents from the [pre-reorganisation GitHub snapshot, commit `42ca70d`](https://github.com/aledinola/Bham_Monetary_Economics/tree/42ca70d40122466e1131d686f953853dffa00f08). The FRED wartime fiscal exercise was added on 27 September 2026 as an authorized self-contained exception.

The central teaching-code folder is **`matlab_codes/`**, containing **12 MATLAB source files and one saved workspace** in both locations. There are no `.mlx` files; the four live scripts use plain-text `.m` format. The figure generator `1_lectures/figures/app1.m` is **Dropbox-only**, preserved at its existing location because it generates plots imported by the lecture TeX files. GitHub has no `1_lectures/` folder. There are no duplicate assessment-folder copies of the shared MATLAB files.

The shared collection now has **13 MATLAB source files** in total. The FRED script and its data are kept together in **`2_seminar_classes/class_3/data_exercise/`**, with no duplicate in `matlab_codes/`, by explicit user instruction. Its slides and generated figures remain in that same Dropbox folder and are not published to GitHub.

## Source files

The shared-file links below work relative to this inventory in both Dropbox and GitHub. This inventory has identical contents in both locations. Dropbox-only material is documented separately using plain-text paths.

| File | Type | Accompanies | What it does |
| --- | --- | --- | --- |
| [walrasian_auctioneer.m](matlab_codes/walrasian_auctioneer.m) | Script | **Lecture 2: A Simple Macro Model, Equilibrium & Welfare Theorems**, Walrasian auctioneer supplement | Computes an approximate competitive equilibrium in the Robinson Crusoe economy. Obtains firm labour demand and profits at a trial wage, solves household labour supply using `fzero`, and adjusts the wage using relative excess demand. Plots the wage and relative excess-demand paths, reports the resulting wage and allocation, and compares consumption and labour with the social planner solution. Uses base MATLAB with no external code or data dependencies. |
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
| [fiscal_wars_fred.m](2_seminar_classes/class_3/data_exercise/fiscal_wars_fred.m) | Script | **Seminar Class 3: Robinson Crusoe Economy and Government Spending**, empirical companion | Downloads and caches eight U.S. BEA/FRED series, merges annual and quarterly observations, indexes real output, consumption and government purchases, exports three PDF figures, and saves processed data and source metadata. Confronts the one-period model with WWII and Korean War observations. These are descriptive comparisons, not estimates of causal fiscal multipliers. Uses base MATLAB; no helper functions or specialized toolboxes. |

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

## FRED exercise data and outputs

All files below are in `2_seminar_classes/class_3/data_exercise/`, beside `fiscal_wars_fred.m`. Raw CSVs are downloaded from `https://fred.stlouisfed.org/graph/fredgraph.csv?id=SERIES_ID` only when absent. The script tries MATLAB `websave` first and invokes `curl` on PATH if the HTTP download fails; current Windows includes curl. Cached reruns need neither network access nor curl. Keep the raw files to reproduce the saved vintage; deliberate refreshes require removing the relevant raw files and rechecking FRED metadata.

| Files | Role |
| --- | --- |
| `GDPCA.csv`, `PCECCA.csv`, `GCECA.csv`, `A824RE1A156NBEA.csv` | Raw annual real GDP, real personal consumption, real government consumption and gross investment, and federal national defense share of GDP. First-run internet access is required; cached files support offline reruns. |
| `GDPC1.csv`, `PCECC96.csv`, `GCEC1.csv`, `A824RE1Q156NBEA.csv` | Quarterly counterparts for the Korean War appendix. The three real series are seasonally adjusted annual rates; the published defense share is not seasonally adjusted. |
| `fred_series_metadata.csv` | Exact series titles, units, frequency, seasonal adjustment, source/download URLs, metadata verification date, retrieval timestamps in UTC, and raw observation coverage. Preserves retrieval timestamps on cached reruns. |
| `fiscal_wars_processed.csv` | Annual data for 1929–1960: dates, original `gdp`, `cons`, `gov`, `def_share`, and three indices with 1939 = 100. The WWII plot uses 1935–1950. |
| `fiscal_wars_quarterly_processed.csv` | Quarterly data for 1947Q1–1955Q4, with the same original quantities/share and indices with 1950Q1 = 100. |

The script, eight raw CSVs, both processed CSVs and metadata are synchronized with GitHub. The local PDF figures (`wwii_y_c_g.pdf`, `defense_share_gdp.pdf`, `korean_war_y_c_g.pdf`) are reproducible script outputs. The local `fiscal_wars_slides.tex` and `fiscal_wars_slides.pdf` provide six main slides plus one appendix slide. Presentation sources, compiled slides and generated figures are Dropbox-only. The original exercise brief is also local.

## Running the material

- **Lecture 2, Walrasian auctioneer:** run `matlab_codes/walrasian_auctioneer.m` in full. It is a standalone base-MATLAB script with no external data or helpers; it clears the workspace and closes figures. At the supplied settings, it performs exactly 50 wage updates, using relative excess demand `(labour demand - labour supply)/(labour demand + labour supply)` and adjustment speed `lambda = 0.1`. Its opening comments and the lecture supplement describe a tolerance-based stopping rule, but the current code does not implement that check. Inspect the residual and planner comparison rather than treating the iteration cap as a convergence guarantee.
- **Lecture 4:** open `matlab_codes/lecture4_extra.m` in MATLAB's Live Editor and run the whole file once before experimenting with individual sections. Both Huggett helpers are in that same folder; make `matlab_codes` the current folder or add it to the MATLAB path.
- **Lecture 4, precautionary saving:** open `matlab_codes/lecture4_precautionary_saving.m` in the Live Editor and run sections in order. Keep `hh_objective_precautionary.m` in that same folder and make it the current folder or add it to the MATLAB path.
- **Lecture 5:** open `matlab_codes/lecture5_investment.m` in the Live Editor and run sections in order. All calculations are contained in this file; no external helper or data files are required.
- **Seminar Class 1:** open `matlab_codes/seminar_class_1_matlab.m` in the Live Editor and run its sections in order. It has no external code or data dependencies. Its embedded `seminar_class_1.pdf` link assumes its former location and does not resolve from the central folder; the PDF remains in Dropbox at `2_seminar_classes/class_1/` and is not published in this repository. The script itself is unchanged.
- **Live-script format:** these `.m` files contain `%[text]` markup for MATLAB's Live Editor.
- **Seminar Class 3, wartime fiscal data:** run `2_seminar_classes/class_3/data_exercise/fiscal_wars_fred.m` in full. Paths are resolved relative to the script, so another starting working directory is supported. Data validation rejects missing plotting observations rather than interpolating. Real indices are checked numerically at their base dates. Government purchases exclude transfers and debt interest; chained-dollar components are not additive. Source notes and the accompanying local slides distinguish observed consumption from counterfactual crowding out.
- **Prescott calculation:** run `prescott` or `main_prescott` from `matlab_codes`. Each defines its own local `solve_country` helper. Both clear the workspace and close figures.
- **Davila calculation:** run `main_davila` from `matlab_codes`. All its functions are defined inside the file. It clears the workspace and closes figures.
- **Figure generator (Dropbox only):** use `app1.m` section by section in a separate output folder. It clears variables, closes figures and writes PNG/EPS files with fixed names. Some sections reuse output names, notably `lec10_4`, so a full run overwrites earlier versions. No external input files are loaded.


## Coverage and verification

The shared collection contains 13 source files and one saved workspace: 12 sources and the saved workspace under `matlab_codes/`, plus the self-contained FRED script in `2_seminar_classes/class_3/data_exercise/`. The earlier consolidation preserved the original files' contents. The previously GitHub-only `lecture5_investment.m` was copied unchanged into Dropbox. GitHub's `app1.m` was removed; the original Dropbox file remains in place.

Verification of the earlier reorganisation compared exact file hashes and relative paths, inventory coverage and documentation links, and the two inventory copies. That reorganisation did not involve MATLAB execution or numerical tests. The original central files retain the pre-reorganisation contents linked above.

The FRED exercise is separately checked through a full MATLAB download/process/export run, a cached rerun, complete annual and quarterly teaching-window coverage, and exact base-date normalization checks. Its local deck is compiled and visually inspected. Publication compares file hashes and relative paths against GitHub and confirms that the two inventory copies match.

Existing lecture-figure and seminar/assessment associations are retained from the earlier review of local teaching sources. The new Lecture 4 and Lecture 5 entries follow their script contents and stated lecture associations. The workspace-variable description records an earlier inspection; it does not imply MATLAB was run for this reorganisation.

The Lecture 2 auctioneer script was added on 8 October 2026 and preserved byte-for-byte. Its inventory entry follows a full source inspection, including the fixed iteration count and absence of a tolerance-based stopping check. No MATLAB execution or numerical convergence test was performed for this addition. Publication verifies the script and inventory against the remote repository.
