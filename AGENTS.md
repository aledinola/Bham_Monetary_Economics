# Workspace Instructions

## Course MATLAB material

- This project contains MATLAB code and live scripts that accompany lectures and seminar classes.
- This MATLAB material is also available in the course's public GitHub repository: https://github.com/aledinola/Bham_Monetary_Economics/tree/main.

## MATLAB inventory and GitHub publication

- Store all MATLAB scripts, live scripts and helper functions supporting lectures and seminar classes in `2026_2027/matlab_codes/`. Keep their dependencies together there; do not keep duplicate teaching-code copies in `1_lectures/` or `2_seminar_classes/`.
- Exception: keep `2026_2027/1_lectures/figures/app1.m` in its existing location because it generates plots imported by the lecture TeX files.
- The inventory for academic year 2026–2027 is `2026_2027/MATLAB_INVENTORY.md`. It describes each MATLAB source file, its lecture/seminar/assessment association, dependencies and usage, and separately lists ancillary MATLAB workspace files.
- Use the inventory to explain each file's role and teaching association, including files with generic names; directory placement alone is not documentation.
- When GitHub is identified as the updated source, copy from the current GitHub version and verify file contents before deleting superseded Dropbox copies. Do not overwrite newer GitHub code with older local versions.
- MATLAB live scripts may be plain-text `.m` files containing `%[text]` markup; do not search only for `.mlx` files.
- Keep this inventory current when adding, changing, moving or removing the MATLAB material it covers. Verify teaching associations from the file contents and course materials rather than guessing from filenames.
- **Automatic GitHub publication rule:** whenever the user asks to create a new MATLAB file or modify an existing MATLAB file in this course workspace, treat publication to GitHub as part of the same task. Update `2026_2027/MATLAB_INVENTORY.md` when needed, then commit the affected MATLAB file(s) and any corresponding inventory change to `aledinola/Bham_Monetary_Economics` on `main` and push the commit. Do not wait for a separate request to publish. Only skip the GitHub commit/push if the user explicitly says not to publish that change.
- Preserve paths under `2026_2027/` when publishing MATLAB material. After each publication, verify that the remote versions match the updated course files and report the commit SHA.
- The Dropbox project root is not itself a Git checkout. Use a separate checkout for GitHub publication, preserve unrelated repository content, and verify the commit and push before reporting success.
- Do not include other Dropbox teaching or assessment documents merely because they are next to the MATLAB files. Publish only the requested material and its necessary dependencies.

## Temporary-file cleanup

- At the end of every task, remove all temporary files and directories created during that task.
- Before deleting anything, validate the exact target paths and preserve pre-existing or user-created files.
- If any task-created temporary artifact cannot be removed, report its exact path and the reason.
