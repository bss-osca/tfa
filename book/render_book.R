sink("render_book.log", append=F, split=T)
sessionInfo()
setwd("book")
bookdown::render_book("index.Rmd", output_dir = "../docs/", quiet = TRUE)
warnings()
sink()