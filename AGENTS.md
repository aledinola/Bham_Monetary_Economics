# Repository maintenance instructions

## Layout and documentation

- Keep all shared 2026–2027 MATLAB scripts, plain-text live scripts, helper functions and supporting workspace files in `2026_2027/matlab_codes/`. Keep dependencies together; do not create duplicate MATLAB files elsewhere in the repository.
- `app1.m` is Dropbox-only at `2026_2027/1_lectures/figures/app1.m`. Never publish it or create a `2026_2027/1_lectures/` folder in this repository. Preserve the original Dropbox file and local lecture figures.
- Maintain one `2026_2027/MATLAB_INVENTORY.md` in this repository and one at the same relative path in Dropbox, with identical contents. Include each file's purpose, teaching association, dependencies and usage; list ancillary workspace files separately. Describe `app1.m` separately using its plain-text local path.
- Verify teaching associations from file contents and course materials; do not infer them from filenames alone. MATLAB live scripts may be `.m` files containing `%[text]` markup, not only `.mlx` files.
- Keep `README.md` short, linking to the central code folder and inventory. Keep maintenance rules here rather than duplicating the inventory.

## Synchronization and publication

- When adding, modifying, moving or removing shared MATLAB material, synchronize the shared collection and inventory with the corresponding Dropbox course workspace as part of the same task. Keep relative paths and file contents identical. If Dropbox is unavailable, report that synchronization remains outstanding rather than claiming completion.
- Compare both copies and the current GitHub revision before synchronization. Never overwrite divergent or newer content blindly. For restructuring-only tasks, preserve all MATLAB file bytes, including line endings, and verify hashes before removing redundant copies.
- Work in a separate Git checkout; the Dropbox course root is not a Git repository. Preserve unrelated content and publish only requested material and necessary dependencies, not adjacent teaching or assessment documents.
- Commit affected shared files and inventory changes to `aledinola/Bham_Monetary_Economics` on `main` and push as part of the requested task, unless the user explicitly says not to publish. Never publish `app1.m`; synchronize inventory changes describing it without adding the file.
- After publication, verify the remote paths and contents against Dropbox and report the commit SHA. Do not claim synchronization based only on a successful push.

## Temporary files

- Remove task-created temporary files and directories at task completion. Validate exact resolved paths before deletion and preserve pre-existing or user-created files. Report the exact path and reason for any temporary artifact that cannot be removed.
