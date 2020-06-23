--- 
title: "Tools for Analytics (TFA)"
subtitle: "Course notes R part"
author: 
- Lars Relund Nielsen
knit: "bookdown::render_book"
site: bookdown::bookdown_site
url: 'https\://relund.dk/'
github-repo: Tools4Analytics/classroomTFA
cover-image: assets/logo.png
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "Course notes for the 'Tools for Analytics' course (R part)"
favicon: assets/favicon.ico
date: "2020-06-22"
editor_options: 
  chunk_output_type: console
---

# Introduction




[BSS]: https://bss.au.dk/en/

[cran]: https://cloud.r-project.org

[Datacamp]: https://www.datacamp.com/
[datacamp-signup]: https://www.datacamp.com/groups/shared_links/cbaee6c73e7d78549a9e32a900793b2d5491ace1824efc1760a6729735948215
[dplyr-cran]: https://CRAN.R-project.org/package=dplyr

[google-form]: https://forms.gle/s39GeDGV9AzAXUo18
[google-grupper]: https://docs.google.com/spreadsheets/d/1DHxthd5AQywAU4Crb3hM9rnog2GqGQYZ2o175SQgn_0/edit?usp=sharing
[GitHub]: https://github.com/
[git-install]: https://git-scm.com/downloads

[happy-git]: https://happygitwithr.com
[hg-install-git]: https://happygitwithr.com/install-git.html

[Peergrade]: https://peergrade.io
[peergrade-signup]: https://app.peergrade.io/join

[R]: https://www.r-project.org
[RStudio]: https://rstudio.com
[rstudio-download]: https://rstudio.com/products/rstudio/download/#download
[rstudio-customizing]: https://support.rstudio.com/hc/en-us/articles/200549016-Customizing-RStudio
[rstudio-key-shortcuts]: https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts
[rstudio-video-projects]: https://vimeo.com/319318233

[stat-545]: https://stat545.com

[tidyverse-main-page]: https://www.tidyverse.org

[Udemy]: https://www.udemy.com/

[wiki-snake-case]: https://en.wikipedia.org/wiki/Snake_case
[wiki-camel-case]: https://en.wikipedia.org/wiki/Camel_case
[wiki-interpreted]: https://en.wikipedia.org/wiki/Interpreted_language





<!-- OLD -->

[cran]: https://cloud.r-project.org
[cran-faq]: https://cran.r-project.org/faqs.html
[cran-R-admin]: http://cran.r-project.org/doc/manuals/R-admin.html
[cran-add-ons]: https://cran.r-project.org/doc/manuals/R-admin.html#Add_002don-packages


[software-carpentry]: https://software-carpentry.org
[cran-r-extensions]: https://cran.r-project.org/doc/manuals/r-release/R-exts.html


<!--RStudio Links-->
[rstudio-preview]: https://www.rstudio.com/products/rstudio/download/preview/

[rstudio-workbench]: https://www.rstudio.com/wp-content/uploads/2014/04/rstudio-workbench.png
[rstudio-support]: https://support.rstudio.com/hc/en-us
[rstudio-R-help]: https://support.rstudio.com/hc/en-us/articles/200552336-Getting-Help-with-R


[rstudio-command-history]: https://support.rstudio.com/hc/en-us/articles/200526217-Command-History
[rstudio-using-projects]: https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects
[rstudio-code-snippets]: https://support.rstudio.com/hc/en-us/articles/204463668-Code-Snippets
[rstudio-dplyr-cheatsheet-download]: https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf
[rstudio-regex-cheatsheet]: https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf
[rstudio-devtools]: https://www.rstudio.com/products/rpackages/devtools/

<!--HappyGitWithR Links-->


[hg-git-client]: https://happygitwithr.com/git-client.html
[hg-github-account]: https://happygitwithr.com/github-acct.html
[hg-install-r-rstudio]: https://happygitwithr.com/install-r-rstudio.html
[hg-connect-intro]: https://happygitwithr.com/connect-intro.html
[hg-browsability]: https://happygitwithr.com/workflows-browsability.html
[hg-shell]: https://happygitwithr.com/shell.html

<!--Package Links-->
[rmarkdown]: https://rmarkdown.rstudio.com
[knitr-faq]: https://yihui.name/knitr/faq/

[tidyverse-main-page]: https://www.tidyverse.org
[tidyverse-web]: https://tidyverse.tidyverse.org
[tidyverse-github]: https://github.com/hadley/tidyverse

[dplyr-web]: https://dplyr.tidyverse.org
[dplyr-cran]: https://CRAN.R-project.org/package=dplyr
[dplyr-github]: https://github.com/hadley/dplyr
[dplyr-vignette-intro]: https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html
[dplyr-vignette-window-fxns]: https://cran.r-project.org/web/packages/dplyr/vignettes/window-functions.html
[dplyr-vignette-two-table]: https://dplyr.tidyverse.org/articles/two-table.html

[lubridate-web]: https://lubridate.tidyverse.org
[lubridate-cran]: https://CRAN.R-project.org/package=lubridate
[lubridate-github]: https://github.com/tidyverse/lubridate
[lubridate-vignette]: https://cran.r-project.org/web/packages/lubridate/vignettes/lubridate.html

[tidyr-web]: https://tidyr.tidyverse.org
[tidyr-cran]: https://CRAN.R-project.org/package=tidyr 

[readr-web]: https://readr.tidyverse.org
[readr-vignette-intro]: https://cran.r-project.org/web/packages/readr/vignettes/readr.html

[stringr-web]: https://stringr.tidyverse.org
[stringr-cran]: https://CRAN.R-project.org/package=stringr

[ggplot2-web]: https://ggplot2.tidyverse.org
[ggplot2-tutorial]: https://github.com/jennybc/ggplot2-tutorial
[ggplot2-reference]: https://docs.ggplot2.org/current/
[ggplot2-cran]: https://CRAN.R-project.org/package=ggplot2
[ggplot2-github]: https://github.com/tidyverse/ggplot2
[ggplot2-theme-args]: https://ggplot2.tidyverse.org/reference/ggtheme.html#arguments

[gapminder-web]: https://www.gapminder.org
[gapminder-cran]: https://CRAN.R-project.org/package=gapminder

[assertthat-cran]: https://CRAN.R-project.org/package=assertthat
[assertthat-github]: https://github.com/hadley/assertthat

[ensurer-cran]: https://CRAN.R-project.org/package=ensurer
[ensurer-github]: https://github.com/smbache/ensurer

[assertr-cran]: https://CRAN.R-project.org/package=assertr
[assertr-github]: https://github.com/ropensci/assertr

[assertive-cran]: https://CRAN.R-project.org/package=assertive
[assertive-bitbucket]: https://bitbucket.org/richierocks/assertive/src/master/

[testthat-cran]: https://CRAN.R-project.org/package=testthat
[testthat-github]: https://github.com/r-lib/testthat
[testthat-web]: https://testthat.r-lib.org

[viridis-cran]: https://CRAN.R-project.org/package=viridis
[viridis-github]: https://github.com/sjmgarnier/viridis
[viridis-vignette]: https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html

[colorspace-cran]: https://CRAN.R-project.org/package=colorspace
[colorspace-vignette]: https://cran.r-project.org/web/packages/colorspace/vignettes/hcl-colors.pdf

[cowplot-cran]: https://CRAN.R-project.org/package=cowplot
[cowplot-github]: https://github.com/wilkelab/cowplot
[cowplot-vignette]: https://cran.r-project.org/web/packages/cowplot/vignettes/introduction.html

[devtools-cran]: https://CRAN.R-project.org/package=devtools
[devtools-github]: https://github.com/r-lib/devtools
[devtools-web]: https://devtools.r-lib.org
[devtools-cheatsheet]: https://www.rstudio.com/wp-content/uploads/2015/03/devtools-cheatsheet.pdf
[devtools-cheatsheet-old]: https://rawgit.com/rstudio/cheatsheets/master/package-development.pdf
[devtools-1-6]: https://blog.rstudio.com/2014/10/02/devtools-1-6/
[devtools-1-8]: https://blog.rstudio.com/2015/05/11/devtools-1-9-0/
[devtools-1-9-1]: https://blog.rstudio.com/2015/09/13/devtools-1-9-1/

[googlesheets-cran]: https://CRAN.R-project.org/package=googlesheets
[googlesheets-github]: https://github.com/jennybc/googlesheets

[tidycensus-cran]: https://CRAN.R-project.org/package=tidycensus
[tidycensus-github]: https://github.com/walkerke/tidycensus
[tidycensus-web]: https://walkerke.github.io/tidycensus/index.html

[fs-web]: https://fs.r-lib.org/index.html
[fs-cran]: https://CRAN.R-project.org/package=fs
[fs-github]: https://github.com/r-lib/fs

[plumber-web]: https://www.rplumber.io
[plumber-docs]: https://www.rplumber.io/docs/
[plumber-github]: https://github.com/trestletech/plumber
[plumber-cran]: https://CRAN.R-project.org/package=plumber

[plyr-web]: http://plyr.had.co.nz

[magrittr-web]: https://magrittr.tidyverse.org
[forcats-web]: https://forcats.tidyverse.org
[glue-web]: https://glue.tidyverse.org
[stringi-cran]: https://CRAN.R-project.org/package=stringi
[rex-github]: https://github.com/kevinushey/rex
[rcolorbrewer-cran]: https://CRAN.R-project.org/package=RColorBrewer
[dichromat-cran]: https://CRAN.R-project.org/package=dichromat

[rdryad-web]: https://docs.ropensci.org/rdryad/
[rdryad-cran]: https://CRAN.R-project.org/package=rdryad
[rdryad-github]: https://github.com/ropensci/rdryad

[roxygen2-cran]: https://CRAN.R-project.org/package=roxygen2
[roxygen2-vignette]: https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html

[shinythemes-web]: https://rstudio.github.io/shinythemes/
[shinythemes-cran]: https://CRAN.R-project.org/package=shinythemes

[shinyjs-web]: https://deanattali.com/shinyjs/
[shinyjs-cran]: https://CRAN.R-project.org/package=shinyjs
[shinyjs-github]: https://github.com/daattali/shinyjs

[leaflet-web]: https://rstudio.github.io/leaflet/
[leaflet-cran]: https://CRAN.R-project.org/package=leaflet
[leaflet-github]: https://github.com/rstudio/leaflet

[ggvis-web]: https://ggvis.rstudio.com
[ggvis-cran]: https://CRAN.R-project.org/package=ggvis
 
[usethis-web]: https://usethis.r-lib.org
[usethis-cran]: https://CRAN.R-project.org/package=usethis
[usethis-github]: https://github.com/r-lib/usethis

[pkgdown-web]: https://pkgdown.r-lib.org
[gh-github]: https://github.com/r-lib/gh

[httr-web]: https://httr.r-lib.org
[httr-cran]: https://CRAN.R-project.org/package=httr
[httr-github]: https://github.com/r-lib/httr

[gistr-web]: https://docs.ropensci.org/gistr
[gistr-cran]: https://CRAN.R-project.org/package=gistr
[gistr-github]: https://github.com/ropensci/gistr

[rvest-web]: https://rvest.tidyverse.org
[rvest-cran]: https://CRAN.R-project.org/package=rvest
[rvest-github]: https://github.com/tidyverse/rvest

[xml2-web]: https://xml2.r-lib.org
[xml2-cran]: https://CRAN.R-project.org/package=xml2
[xml2-github]: https://github.com/r-lib/xml2

[jsonlite-paper]: https://arxiv.org/abs/1403.2805
[jsonlite-cran]: https://CRAN.R-project.org/package=jsonlite
[jsonlite-github]: https://github.com/jeroen/jsonlite

[readxl-web]: https://readxl.tidyverse.org
[readxl-github]: https://github.com/tidyverse/readxl
[readxl-cran]: https://CRAN.R-project.org/package=readxl

[janitor-web]: http://sfirke.github.io/janitor/
[janitor-cran]: https://CRAN.R-project.org/package=janitor
[janitor-github]: https://github.com/sfirke/janitor

[purrr-web]: https://purrr.tidyverse.org
[curl-cran]: https://CRAN.R-project.org/package=curl

<!--Shiny links-->
[shinydashboard-web]: https://rstudio.github.io/shinydashboard/
[shinydashboard-cran]: https://CRAN.R-project.org/package=shinydashboard
[shinydashboard-github]: https://github.com/rstudio/shinydashboard


[shiny-official-web]: https://shiny.rstudio.com
[shiny-official-tutorial]: https://shiny.rstudio.com/tutorial/
[shiny-cheatsheet]: https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
[shiny-articles]: https://shiny.rstudio.com/articles/
[shiny-bookdown]: https://bookdown.org/yihui/rmarkdown/shiny-documents.html
[shiny-google-groups]: https://groups.google.com/forum/#!forum/shiny-discuss
[shiny-stack-overflow]: https://stackoverflow.com/questions/tagged/shiny
[shinyapps-web]: https://www.shinyapps.io
[shiny-server-setup]: https://deanattali.com/2015/05/09/setup-rstudio-shiny-server-digital-ocean/
[shiny-reactivity]: https://shiny.rstudio.com/articles/understanding-reactivity.html
[shiny-debugging]: https://shiny.rstudio.com/articles/debugging.html
[shiny-server]: https://www.rstudio.com/products/shiny/shiny-server/

<!--Publications--> 
[adv-r]: http://adv-r.had.co.nz
[adv-r-fxns]: http://adv-r.had.co.nz/Functions.html
[adv-r-dsl]: http://adv-r.had.co.nz/dsl.html
[adv-r-defensive-programming]: http://adv-r.had.co.nz/Exceptions-Debugging.html#defensive-programming
[adv-r-fxn-args]: http://adv-r.had.co.nz/Functions.html#function-arguments
[adv-r-return-values]: http://adv-r.had.co.nz/Functions.html#return-values
[adv-r-closures]: http://adv-r.had.co.nz/Functional-programming.html#closures

[r4ds]: https://r4ds.had.co.nz
[r4ds-transform]: https://r4ds.had.co.nz/transform.html
[r4ds-strings]: https://r4ds.had.co.nz/strings.html
[r4ds-readr-strings]: https://r4ds.had.co.nz/data-import.html#readr-strings
[r4ds-dates-times]: https://r4ds.had.co.nz/dates-and-times.html
[r4ds-data-import]: http://r4ds.had.co.nz/data-import.html
[r4ds-relational-data]: https://r4ds.had.co.nz/relational-data.html
[r4ds-pepper-shaker]: https://r4ds.had.co.nz/vectors.html#lists-of-condiments

[r-pkgs2]: https://r-pkgs.org/index.html
[r-pkgs2-whole-game]: https://r-pkgs.org/whole-game.html
[r-pkgs2-description]: https://r-pkgs.org/description.html
[r-pkgs2-man]: https://r-pkgs.org/man.htm
[r-pkgs2-tests]: https://r-pkgs.org/tests.html
[r-pkgs2-namespace]: https://r-pkgs.org/namespace.html
[r-pkgs2-vignettes]: https://r-pkgs.org/vignettes.html
[r-pkgs2-release]: https://r-pkgs.org/release.html
[r-pkgs2-r-code]: https://r-pkgs.org/r.html#r

[r-graphics-cookbook]: http://shop.oreilly.com/product/0636920023135.do

[cookbook-for-r]: http://www.cookbook-r.com 
[cookbook-for-r-graphs]: http://www.cookbook-r.com/Graphs/
[cookbook-for-r-multigraphs]: http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/

[elegant-graphics-springer]: https://www.springer.com/gp/book/9780387981413

[testthat-article]: https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf
[worry-about-color]: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2&cad=rja&uact=8&ved=2ahUKEwi0xYqJ8JbjAhWNvp4KHViYDxsQFjABegQIABAC&url=https%3A%2F%2Fwww.researchgate.net%2Fprofile%2FAhmed_Elhattab2%2Fpost%2FPlease_suggest_some_good_3D_plot_tool_Software_for_surface_plot%2Fattachment%2F5c05ba35cfe4a7645506948e%2FAS%253A699894335557644%25401543879221725%2Fdownload%2FWhy%2BShould%2BEngineers%2Band%2BScientists%2BBe%2BWorried%2BAbout%2BColor_.pdf&usg=AOvVaw1qwjjGMd7h_z6TLUjzu7Nb
[escaping-rgbland-pdf]: https://eeecon.uibk.ac.at/~zeileis/papers/Zeileis+Hornik+Murrell-2009.pdf
[escaping-rgbland-doi]: https://doi.org/10.1016/j.csda.2008.11.033


<!--R Documentation-->
[rdocs-extremes]: https://rdrr.io/r/base/Extremes.html
[rdocs-range]: https://rdrr.io/r/base/range.html
[rdocs-quantile]: https://rdrr.io/r/stats/quantile.html
[rdocs-c]: https://rdrr.io/r/base/c.html
[rdocs-list]: https://rdrr.io/r/base/list.html
[rdocs-lm]: https://rdrr.io/r/stats/lm.html
[rdocs-coef]: https://rdrr.io/r/stats/coef.html
[rdocs-devices]: https://rdrr.io/r/grDevices/Devices.html
[rdocs-ggsave]: https://rdrr.io/cran/ggplot2/man/ggsave.html
[rdocs-dev]: https://rdrr.io/r/grDevices/dev.html


<!--Wikipedia Links-->

[wiki-hello-world]: https://en.wikipedia.org/wiki/%22Hello,_world!%22_program
[wiki-janus]: https://en.wikipedia.org/wiki/Janus
[wiki-nesting-dolls]: https://en.wikipedia.org/wiki/Matryoshka_doll
[wiki-pure-fxns]: https://en.wikipedia.org/wiki/Pure_function
[wiki-camel-case]: https://en.wikipedia.org/wiki/Camel_case
[wiki-mojibake]: https://en.wikipedia.org/wiki/Mojibake
[wiki-row-col-major-order]: https://en.wikipedia.org/wiki/Row-_and_column-major_order
[wiki-boxplot]: https://en.wikipedia.org/wiki/Box_plot
[wiki-brewer]: https://en.wikipedia.org/wiki/Cynthia_Brewer
[wiki-vector-graphics]: https://en.wikipedia.org/wiki/Vector_graphics
[wiki-raster-graphics]: https://en.wikipedia.org/wiki/Raster_graphics
[wiki-dry]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[wiki-web-scraping]: https://en.wikipedia.org/wiki/Web_scraping
[wiki-xpath]: https://en.wikipedia.org/wiki/XPath
[wiki-css-selector]: https://en.wikipedia.org/wiki/Cascading_Style_Sheets#Selector


<!--Misc. Links-->
[split-apply-combine]: https://www.jstatsoft.org/article/view/v040i01
[useR-2014-dropbox]: https://www.dropbox.com/sh/i8qnluwmuieicxc/AAAgt9tIKoIm7WZKIyK25lh6a
[gh-pages]: https://pages.github.com
[html-preview]: http://htmlpreview.github.io
[tj-mahr-slides]: https://github.com/tjmahr/MadR_Pipelines
[dataschool-dplyr]: https://www.dataschool.io/dplyr-tutorial-for-faster-data-manipulation-in-r/
[xckd-randall-munroe]: https://fivethirtyeight.com/features/xkcd-randall-munroe-qanda-what-if/
[athena-zeus-forehead]: https://tinyurl.com/athenaforehead
[tidydata-lotr]: https://github.com/jennybc/lotr-tidy#readme
[minimal-make]: https://kbroman.org/minimal_make/
[write-data-tweet]: https://twitter.com/vsbuffalo/statuses/358699162679787521
[belt-and-suspenders]: https://www.wisegeek.com/what-does-it-mean-to-wear-belt-and-suspenders.htm
[research-workflow]: https://www.carlboettiger.info/2012/05/06/research-workflow.html
[yak-shaving]: https://seths.blog/2005/03/dont_shave_that/
[yaml-with-csv]: https://blog.datacite.org/using-yaml-frontmatter-with-csv/
[reproducible-examples]: https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example
[blog-strings-as-factors]: https://notstatschat.tumblr.com/post/124987394001/stringsasfactors-sigh
[bio-strings-as-factors]: https://simplystatistics.org/2015/07/24/stringsasfactors-an-unauthorized-biography
[stackexchange-outage]: https://stackstatus.net/post/147710624694/outage-postmortem-july-20-2016
[email-regex]: https://emailregex.com
[fix-atom-bug]: https://davidvgalbraith.com/how-i-fixed-atom/
[icu-regex]: https://userguide.icu-project.org/strings/regexp
[regex101]: https://regex101.com
[regexr]: https://regexr.com
[utf8-debug]: http://www.i18nqa.com/debug/utf8-debug.html
[unicode-no-excuses]: https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/
[programmers-encoding]: http://kunststube.net/encoding/
[encoding-probs-ruby]: https://www.justinweiss.com/articles/3-steps-to-fix-encoding-problems-in-ruby/
[theyre-to-theyre]: https://www.justinweiss.com/articles/how-to-get-from-theyre-to-theyre/
[lubridate-ex1]: https://www.r-exercises.com/2016/08/15/dates-and-times-simple-and-easy-with-lubridate-part-1/
[lubridate-ex2]: https://www.r-exercises.com/2016/08/29/dates-and-times-simple-and-easy-with-lubridate-exercises-part-2/
[lubridate-ex3]: https://www.r-exercises.com/2016/10/04/dates-and-times-simple-and-easy-with-lubridate-exercises-part-3/
[google-sql-join]: https://www.google.com/search?q=sql+join&tbm=isch
[min-viable-product]: https://blog.fastmonkeys.com/?utm_content=bufferc2d6e&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer
[telescope-rule]: http://c2.com/cgi/wiki?TelescopeRule
[unix-philosophy]: http://www.faqs.org/docs/artu/ch01s06.html
[twitter-wrathematics]: https://twitter.com/wrathematics
[robbins-effective-graphs]: https://www.amazon.com/Creating-Effective-Graphs-Naomi-Robbins/dp/0985911123
[r-graph-catalog-github]: https://github.com/jennybc/r-graph-catalog
[google-pie-charts]: https://www.google.com/search?q=pie+charts+suck
[why-pie-charts-suck]: https://www.richardhollins.com/blog/why-pie-charts-suck/
[worst-figure]: https://robjhyndman.com/hyndsight/worst-figure/
[naomi-robbins]: http://www.nbr-graphs.com
[hadley-github-index]: https://hadley.github.io
[scipy-2015-matplotlib-colors]: https://www.youtube.com/watch?v=xAoljeRJ3lU&feature=youtu.be
[winston-chang-github]: https://github.com/wch
[favorite-rgb-color]: https://manyworldstheory.com/2013/01/15/my-favorite-rgb-color/
[stowers-color-chart]: https://web.archive.org/web/20121022044903/http://research.stowers-institute.org/efg/R/Color/Chart/
[stowers-using-color-in-R]: https://www.uv.es/conesa/CursoR/material/UsingColorInR.pdf
[zombie-project]: https://imgur.com/ewmBeQG
[tweet-project-resurfacing]: https://twitter.com/JohnDCook/status/522377493417033728
[rgraphics-looks-tips]: https://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html
[rgraphics-svg-tips]: https://blog.revolutionanalytics.com/2011/07/r-svg-graphics.html
[zev-ross-cheatsheet]: http://zevross.com/blog/2014/08/04/beautiful-plotting-in-r-a-ggplot2-cheatsheet-3/
[parker-writing-r-packages]: https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
[broman-r-packages]: https://kbroman.org/pkg_primer/
[broman-tools4rr]: https://kbroman.org/Tools4RR/
[leeks-r-packages]: https://github.com/jtleek/rpackages
[build-maintain-r-packages]: https://thepoliticalmethodologist.com/2014/08/14/building-and-maintaining-r-packages-with-devtools-and-roxygen2/
[murdoch-package-vignette-slides]: https://web.archive.org/web/20160824010213/http://www.stats.uwo.ca/faculty/murdoch/ism2013/5Vignettes.pdf
[how-r-searches]: http://blog.obeautifulcode.com/R/How-R-Searches-And-Finds-Stuff/

<!-- R links: -->

<!-- https://learn.datacamp.com/courses/introduction-to-data-in-r -->

This site/book contains course notes for the R part of the course "Tools for Analytics" held at [BSS]. The notes organize what we will be doing in each week. The course is an intorductonary course at the [Operations and Supply Chain Analytics programme](https://kandidat.au.dk/en/operationsandsupplychainanalytics/) and intended to give knowledge about IT tools for Analytics. 

Since the amount of available data has increased extensively in many companies, there is a need for analysts with the ability to do tasks within Analytics. For instance, extract relevant data and perform valid quantitative analysis. Clearly, it is also important that the analyst can communicate the results of the analysis to their surroundings. This requires for the analyst to be particularly qualified in handling IT based tools beyond e.g. basic Excel. 
<!-- The use of programming is the basis for performing a variety of analytical tasks including impact studies, risk analysis, and design of reports. -->

Business Analytics (BA) (or just Analytics) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem and the creation of business value by integration of concepts, methods and data. As a process, it can be characterized by descriptive, predictive, and prescriptive model building using data sources. For a full definition see the [appendix](#sec:ba).

Within a Business Analytics (BA) framework the course focus on giving you an introduction to programming, handeling data and doing descriptive analytics. Descriptive analytics categorizes, characterizes, consolidates, and classifies data. Examples are standard reporting and dashboards (key performance indicators (KPIs), what happened or is happening now?) and ad-hoc reporting (how many/often?). Descriptive analytics often serves as a first step in the successful application of predictive or prescriptive analytics. Predictive and prescriptive analytics are covered in other courses of the [programme](https://kandidat.au.dk/en/operationsandsupplychainanalytics/).

<!-- The student is given an introduction to the compiled programming language VBA (Visual Basic for Applications) in Excel. This includes declaration of variables, the use of logic constraints and loops, and debugging. In addition, the student will acquire skills to structure a computer program using modules and subroutines. -->

<!-- Furthermore, the student is given an introduction to the interpreted programming language R. This includes among other things the use of data structures, import and export of data, and tools for cleaning, transforming and analysing datasets. The student will also learn to present data and results graphically. -->

Analytics may be seen as a data driven process:

<div class="figure" style="text-align: center">
<img src="img/process.png" alt="Analytics as a data driven process."  />
<p class="caption">(\#fig:process)Analytics as a data driven process.</p>
</div>

<!-- Tidying your data also including cleaning your data.  -->

For doing data driven analytics you first must __import__ your data. That is, take data from a database, file, web API etc. and transform it into a data frame. In general raw data may be messy and need to be structured in a __tidy__ way. Tidying your data means storing it in a structured form sutaiable for analysis. In brief, when your data is __tidy__, each column is a variable, and each row is an observation. Tidy data is important because the consistent structure lets you focus your struggle on questions about the data. 
Once you have tidy data, a common first step is to __transform__ it. Transformation includes narrowing in on observations of interest (e.g. only observations from a specific year or warehouse), creating new variables based on existing variables (like the cost of using the machine that day given idle time). Together, tidying and transforming are called __wrangling__, because 
it can be a hard process to get your data in the right form.

The next step is to do a simple __exploration__ of you data such as calculating a set of summary statistics (like counts, means or KPIs). A good way to get an overview over your data is by __visualisation__. A good visualisation will show you things that you did not expect, raise new questions about the data or confirm your hypotesis. A good visualisation might also hint that you're asking the wrong question, or you need to collect different data. Exploration and visusalization are descriptive analytics and used to answer questions such as: What happend? How many, how often, where? Where exactly is the problem? What actions are needed?
__Models__ are complementary tools to visualisation. Once you have made your questions sufficiently precise, you can use a model to answer them. A model is a description of a system using mathematical concepts and a simplification of the real system. That is, the results of a model are based on a set of assumptions. Models for statistical analysis, forecasting, system behaivior are predictive analytics and answer questions like: Why is this happening? What if these trends continue? What will happen next? Models for prescriptive analytics use optimization and other decision modelling techniques to suggest decision options with the goal of improving business performance and answer questions like: What is the best that can happen?

Exploration, visualizaton and modelling may be seen as different steps which can be used for __analysing__ the data and answer the overall questions. This part of the course will focus on the different parts of the course except modelling. 

Given an analysis, __communication__ is an absolutely critical part. It doesn't matter how well your models and visualisation have led you to understand the data unless you can also communicate your results to decision makers. Note that analytics is not a one-way process is is common that you several times have to tidy and transform your data, explore and visulize based on the results of a model, rerun the model given feedback on you communication the decision makers etc. Common connections are visulized using directed arrowes in Figure \@ref(fig:process). 

Surrounding the process is __programming__. Programming is the swiss army knive you use during parts of the process. An introduction to programming is given in the first part of the course using VBA in Excel. We will cover functional programming using R in this part of the course.


## How this book is organised

The book consists of different parts each containing teaching modules about a specific topic:

   * [Part I](#sec:start) focus on signing up for the different online resources the course will use, installing the needed programs on your computer and giving you a short introduction to R.
   * In Part ?? the focus is on import/export, tidy and transformation of data.
   * Part ??? consider vizualization. 
   
In all parts communication are considered ...

<!-- The previous description of the tools of data science is organised roughly according to the order in which you use them in an analysis (although of course you'll iterate through them multiple times). In our experience, however, this is not the best way to learn them: -->

<!-- * Starting with data ingest and tidying is sub-optimal because 80% of the time  -->
<!--   it's routine and boring, and the other 20% of the time it's weird and -->
<!--   frustrating. That's a bad place to start learning a new subject! Instead,  -->
<!--   we'll start with visualisation and transformation of data that's already been -->
<!--   imported and tidied. That way, when you ingest and tidy your own data, your -->
<!--   motivation will stay high because you know the pain is worth it. -->



<!-- * Programming tools are not necessarily interesting in their own right,  -->
<!--   but do allow you to tackle considerably more challenging problems. We'll -->
<!--   give you a selection of programming tools in the middle of the book, and  -->
<!--   then you'll see how they can combine with the data science tools to tackle  -->
<!--   interesting modelling problems. -->

<!-- Within each chapter, we try and stick to a similar pattern: start with some motivating examples so you can see the bigger picture, and then dive into the details. Each section of the book is paired with exercises to help you practice what you've learned. While it's tempting to skip the exercises, there's no better way to learn than practicing on real problems. -->


You can expect it to be updated when the course runs. The date listed above is the last time this guide was updated.

The R part of the course covers learning goals:

* explore, groom, visualize, and analyze data,
* make all of that reproducible, reusable, and shareable,
* using R.



<!-- The design of Tools for Analytics was motivated by the need to provide more balance in applied statistical training. Data analysts spend a considerable amount of time on project organization, data cleaning and preparation, and communication. These activities can have a profound effect on the quality and credibility of an analysis. Yet these skills are rarely taught, despite how important and necessary they are. Tools for Analytics aims to address this gap. -->

## Learning goals
							
The purpose of this course is to give students a knowledge about IT tools for Analytics which requires the analyst to be qualified in handling tools beyond e.g. basic Excel. After having participated in the course, the student must, in addition to achieving general academic skills, demonstrate:			
							
Knowledge of	

  1.	how a computer works at a basic level.						
  2.	basic programming such as variables, arrays, loops, functions and procedures. 						
  3.	what an algorithm is. 						
  4.	how to implement an algorithm based on a description. 						
  5.	different programming languages. 						
  6.	how to manage a code in a collaborative working environment.						
							
Skills to 		

  7.	handle data such as import, tidy, transform, visualize and export. 						
  8.	develop well-structured code. 						
  9.	perform testing and debugging. 						
  10.	implement/code selected algorithms. 						
  11.	apply analytical techniques on data.						
  12.	apply relevant methods, algorithms and techniques from this course in order to solve a specific problem.						
							
Competences to		

  13.	independently handle data given a problem. 						
  14.	independently analyse data given a relevant research question.						
  15.	compare different programming languages.						
  16.	compare different algorithms solving a problem and discuss their advantages and disadvantages.						
  17.	interpret and discuss results based on a data analysis in relation to the relevant academic literature.						
  18.	communicate results from applied research in a scientific way, e.g. using literate programming.						







<!-- ## Prerequisites -->

<!-- We've made a few assumptions about what you already know in order to get the most out of this book. You should be generally numerically literate, and it's helpful if you have some programming experience already. If you've never programmed before, you might find [Hands on Programming with R](http://amzn.com/1449359019) by Garrett to be a useful adjunct to this book. -->

<!-- There are four things you need to run the code in this book: R, RStudio, a collection of R packages called the __tidyverse__, and a handful of other packages. Packages are the fundamental units of reproducible R code. They include reusable functions, the documentation that describes how to use them, and sample data.  -->

<!-- ### R  -->

<!-- To download R, go to CRAN, the **c**omprehensive **R** **a**rchive **n**etwork. CRAN is composed of a set of mirror servers distributed around the world and is used to distribute R and R packages. Don't try and pick a mirror that's close to you: instead use the cloud mirror, <https://cloud.r-project.org>, which automatically figures it out for you. -->

<!-- A new major version of R comes out once a year, and there are 2-3 minor releases each year. It's a good idea to update regularly. Upgrading can be a bit of a hassle, especially for major versions, which require you to reinstall all your packages, but putting it off only makes it worse. -->

<!-- ### RStudio -->

<!-- RStudio is an integrated development environment, or IDE, for R programming. Download and install it from <http://www.rstudio.com/download>. RStudio is updated a couple of times a year. When a new version is available, RStudio will let you know. It's a good idea to upgrade regularly so you can take advantage of the latest and greatest features. For this book, make sure you have at least RStudio 1.0.0. -->

<!-- When you start RStudio, you'll see two key regions in the interface: -->

<!-- ```{r echo = FALSE, out.width = "75%"} -->
<!-- #knitr::include_graphics("diagrams/rstudio-console.png") -->
<!-- ``` -->

<!-- For now, all you need to know is that you type R code in the console pane, and press enter to run it. You'll learn more as we go along! -->

<!-- ### The tidyverse -->

<!-- You'll also need to install some R packages. An R __package__ is a collection of functions, data, and documentation that extends the capabilities of base R. Using packages is key to the successful use of R. The majority of the packages that you will learn in this book are part of the so-called tidyverse. The packages in the tidyverse share a common philosophy of data and R programming, and are designed to work together naturally.  -->

<!-- You can install the complete tidyverse with a single line of code: -->

<!-- ```{r, eval = FALSE} -->
<!-- install.packages("tidyverse") -->
<!-- ``` -->

<!-- On your own computer, type that line of code in the console, and then press enter to run it. R will download the packages from CRAN and install them on to your computer. If you have problems installing, make sure that you are connected to the internet, and that <https://cloud.r-project.org/> isn't blocked by your firewall or proxy.  -->

<!-- You will not be able to use the functions, objects, and help files in a package until you load it with `library()`. Once you have installed a package, you can load it with the `library()` function: -->

<!-- ```{r} -->
<!-- library(tidyverse) -->
<!-- ``` -->

<!-- This tells you that tidyverse is loading the ggplot2, tibble, tidyr, readr, purrr, and dplyr packages. These are considered to be the __core__ of the tidyverse because you'll use them in almost every analysis.  -->

<!-- Packages in the tidyverse change fairly frequently. You can see if updates are available, and optionally install them, by running `tidyverse_update()`. -->

<!-- ### Other packages -->

<!-- There are many other excellent packages that are not part of the tidyverse, because they solve problems in a different domain, or are designed with a different set of underlying principles. This doesn't make them better or worse, just different. In other words, the complement to the tidyverse is not the messyverse, but many other universes of interrelated packages. As you tackle more data science projects with R, you'll learn new packages and new ways of thinking about data.  -->

<!-- In this book we'll use three data packages from outside the tidyverse: -->

<!-- ```{r, eval = FALSE} -->
<!-- install.packages(c("nycflights13", "gapminder", "Lahman")) -->
<!-- ``` -->

<!-- These packages provide data on airline flights, world development, and baseball that we'll use to illustrate key data science ideas. -->



<!-- There are two main differences. In your console, you type after the `>`, called the __prompt__; we don't show the prompt in the book. In the book, output is commented out with `#>`; in your console it appears directly after your code. These two differences mean that if you're working with an electronic version of the book, you can easily copy code out of the book and into the console. -->

<!-- Throughout the book we use a consistent set of conventions to refer to code: -->

<!-- * Functions are in a code font and followed by parentheses, like `sum()`,  -->
<!--   or `mean()`. -->

<!-- * Other R objects (like data or function arguments) are in a code font, -->
<!--   without parentheses, like `flights` or `x`. -->

<!-- * If we want to make it clear what package an object comes from, we'll use -->
<!--   the package name followed by two colons, like `dplyr::mutate()`, or    -->
<!--   `nycflights13::flights`. This is also valid R code. -->

<!-- ## Getting help and learning more -->

<!-- This book is not an island; there is no single resource that will allow you to master R. As you start to apply the techniques described in this book to your own data you will soon find questions that I do not answer. This section describes a few tips on how to get help, and to help you keep learning. -->

<!-- If you get stuck, start with Google. Typically adding "R" to a query is enough to restrict it to relevant results: if the search isn't useful, it often means that there aren't any R-specific results available. Google is particularly useful for error messages. If you get an error message and you have no idea what it means, try googling it! Chances are that someone else has been confused by it in the past, and there will be help somewhere on the web. (If the error message isn't in English, run `Sys.setenv(LANGUAGE = "en")` and re-run the code; you're more likely to find help for English error messages.) -->

<!-- If Google doesn't help, try [stackoverflow](http://stackoverflow.com). Start by spending a little time searching for an existing answer, including `[R]` to restrict your search to questions and answers that use R. If you don't find anything useful, prepare a minimal reproducible example or __reprex__.  A good reprex makes it easier for other people to help you, and often you'll figure out the problem yourself in the course of making it. -->

<!-- There are three things you need to include to make your example reproducible: required packages, data, and code. -->

<!-- 1.  **Packages** should be loaded at the top of the script, so it's easy to -->
<!--     see which ones the example needs. This is a good time to check that you're -->
<!--     using the latest version of each package; it's possible you've discovered -->
<!--     a bug that's been fixed since you installed the package. For packages -->
<!--     in the tidyverse, the easiest way to check is to run `tidyverse_update()`. -->

<!-- 1.  The easiest way to include **data** in a question is to use `dput()` to  -->
<!--     generate the R code to recreate it. For example, to recreate the `mtcars`  -->
<!--     dataset in R, I'd perform the following steps: -->

<!--     1. Run `dput(mtcars)` in R -->
<!--     2. Copy the output -->
<!--     3. In my reproducible script, type `mtcars <- ` then paste. -->

<!--     Try and find the smallest subset of your data that still reveals -->
<!--     the problem. -->

<!-- 1.  Spend a little bit of time ensuring that your **code** is easy for others to -->
<!--     read: -->

<!--     * Make sure you've used spaces and your variable names are concise, yet -->
<!--       informative. -->

<!--     * Use comments to indicate where your problem lies. -->

<!--     * Do your best to remove everything that is not related to the problem.   -->
<!--       The shorter your code is, the easier it is to understand, and the  -->
<!--       easier it is to fix. -->

<!-- Finish by checking that you have actually made a reproducible example by starting a fresh R session and copying and pasting your script in.  -->

<!-- You should also spend some time preparing yourself to solve problems before they occur. Investing a little time in learning R each day will pay off handsomely in the long run. One way is to follow what Hadley, Garrett, and everyone else at RStudio are doing on the [RStudio blog](https://blog.rstudio.org). This is where we post announcements about new packages, new IDE features, and in-person courses. You might also want to follow Hadley ([\@hadleywickham](https://twitter.com/hadleywickham)) or Garrett ([\@statgarrett](https://twitter.com/statgarrett)) on Twitter, or follow [\@rstudiotips](https://twitter.com/rstudiotips) to keep up with new features in the IDE. -->

<!-- To keep up with the R community more broadly, we recommend reading <http://www.r-bloggers.com>: it aggregates over 500 blogs about R from around the world. If you're an active Twitter user, follow the `#rstats` hashtag. Twitter is one of the key tools that Hadley uses to keep up with new developments in the community. -->


<!-- This book isn't just the product of Hadley and Garrett, but is the result of many conversations (in person and online) that we've had with the many people in the R community. There are a few people we'd like to thank in particular, because they have spent many hours answering our dumb questions and helping us to better think about data science: -->

<!-- * Jenny Bryan and Lionel Henry for many helpful discussions around working -->
<!--   with lists and list-columns. -->

<!-- * The three chapters on workflow were adapted (with permission), from -->
<!--   <http://stat545.com/block002_hello-r-workspace-wd-project.html> by  -->
<!--   Jenny Bryan. -->

<!-- * Genevera Allen for discussions about models, modelling, the statistical -->
<!--   learning perspective, and the difference between hypothesis generation and  -->
<!--   hypothesis confirmation. -->

<!-- * Yihui Xie for his work on the [bookdown](https://github.com/rstudio/bookdown)  -->
<!--   package, and for tirelessly responding to my feature requests. -->

<!-- * Bill Behrman for his thoughtful reading of the entire book, and for trying  -->
<!--   it out with his data science class at Stanford. -->

<!-- * The \#rstats twitter community who reviewed all of the draft chapters -->
<!--   and provided tons of useful feedback. -->

<!-- * Tal Galili for augmenting his dendextend package to support a section on clustering that did not make it into the final draft. -->


<!-- An online version of this book is available at <http://r4ds.had.co.nz>. It will continue to evolve in between reprints of the physical book. The source of the book is available at <https://github.com/hadley/r4ds>. The book is powered by <https://bookdown.org> which makes it easy to turn R markdown files into HTML, PDF, and EPUB. -->

<!-- This book was built with: -->

<!-- ```{r} -->
<!-- sessioninfo::session_info(c("tidyverse")) -->
<!-- ``` -->


<!-- ## History and future {-} -->

<!-- These materials originated in the "Tools for Analytics" course at [BSS] -->

<!-- > "The Tools for Analytics course became notable as an early example of a data science course taught in a statistics program. It is also notable for its focus on teaching using modern R packages, Git and GitHub, its extensive sharing of teaching materials openly online, and its strong emphasis on practical data cleaning, exploration, and visualization skills, rather than algorithms and theory."  -->
<!-- >   -->
<!-- > --- [Wikipedia](https://en.wikipedia.org/wiki/Jenny_Bryan) -->

<!-- The main author, Jenny Bryan ([jennybryan.org](https://jennybryan.org)), developed this version of Tools for Analytics as a professor at UBC. She has since joined [RStudio](https://www.rstudio.com/) as a Software Engineer, on the [tidyverse](https://www.tidyverse.org/) and [r-lib](https://github.com/r-lib/) teams and is an adjunct professor at UBC. In September 2019, we (amicably) created separate spaces for the ongoing maintenance of this content and the continued offerings of Tools for Analytics at UBC (<https://stat545.stat.ubc.ca>), which is alive and well. -->

<!-- We plan to continue maintaining these resources, as they are still used in [Tools for Analytics at UBC](https://stat545.stat.ubc.ca) and by people teaching themselves R. Some topics have since been developed more fully elsewhere and we may link out to those resources. For example, the Git and GitHub content of Tools for Analytics eventually grew into its own website: [happygitwithr.com](https://happygitwithr.com). Some material has been retired, but is archived in the [repository of the old website](https://github.com/STAT545-UBC/STAT545-UBC-original-website). Finally, the new website has URLs that are more human-friendly; we believe we created the necessary redirects, so we don't break other people's links. If you think we've missed one, please let us know [in an issue](https://github.com/rstudio-education/stat545/issues). -->


## Acknowledgements 

Some of the materials in this book are taken from various places

  * The bookdown scheleton and some notes are based on the [Stat545][stat-545] course.
  * Notes about git and GitHub are based on [Happy Git and GitHub for the useR][happy-git] site.
  * Several Tools for Analytics TAs were instrumental in the development of these materials and members of the RStudio Education Team ported the [original website](https://github.com/STAT545-UBC/STAT545-UBC-original-website) into the modern and more maintainable framework we enjoy today
  


