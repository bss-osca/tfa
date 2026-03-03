# Reinforcement Learning for Business

Teaching notes, modules, tutorials etc. for the 'Reinforcement Learning for Business' course. 

The course notes are automatically generated using GitHub Actions when push to GitHub and can be seen at https://bss-osca.github.io/rl/. They are stored in the branch `gh-pages`.

Folders:

   - `book` Files for the teaching nodes. Files related to modules are named `<module number>\_<desc>.Rmd`. Teaching notes can be seen at https://bss-osca.github.io/rl/. The course notes are automatically generated using GitHub Actions when push to GitHub.
   - `book-backup-2023` Backup of the `book` folder for the 2023 five ECTS course. The `book` folder is currently used for the 2025 ten ECTS course.
   - `notebooks` Jupyter notebooks for the course. Files related to modules are named `<module number>\_<desc>.ipynb`. 
   - `renv` Package project library using [renv](https://rstudio.github.io/renv). Restore using `renv::restore()`.
   - `student` A clone of the repository https://github.com/bss-osca/rl-student with student resources. Changes are automatically pushed to the `rl-student` repo using GitHub Actions when push to GitHub. [currently not used]
   - `slides` Course slides. Files related to modules are named `<module number>\_<desc>-slides.Rmd`. The slides can be seen at https://bss-osca.github.io/rl/slides/. The slides must be generated manually inside the `slides` folder and are automatically copied to the `gh-pages` branch using GitHub Actions when push to GitHub.
