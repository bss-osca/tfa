## Common code relevant for all chapters

library(tidyverse)
library(bsplus)
library(htmltools)
library(knitr)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  # fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
  # dpi = 300,
  # out.width = "70%",
  fig.align = 'center',
  # fig.width = 6,
  # fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

# options(
#   rlang_trace_top_env = rlang::current_env(),
#   rlang__backtrace_on_error = "none"
# )

options(
  width = 100,
  digits = 3,
  # str = strOptions(strict.width = "cut"),
  knitr.kable.NA = ''
)

# if (knitr::is_latex_output()) {
#   knitr::opts_chunk$set(width = 69)
#   options(width = 69)
#   options(crayon.enabled = FALSE)
#   options(cli.unicode = TRUE)
# }

# knitr::knit_hooks$set(
#   small_mar = function(before, options, envir) {
#     if (before) {
#       par(mar = c(4.1, 4.1, 0.5, 0.5))
#     }
#   }
# )

knit_hooks$set(solution = function(before, options, envir) {
  if (!before) {
    addSolution(options$code)
  }
})


# knitr::knit_hooks$set(chunk_envvar = function(before, options, envir) {
#   envvar <- options$chunk_envvar
#   if (before && !is.null(envvar)) {
#     old_envvar <<- Sys.getenv(names(envvar), names = TRUE, unset = NA)
#     do.call("Sys.setenv", as.list(envvar))
#     #print(str(options))
#   } else {
#     do.call("Sys.setenv", as.list(old_envvar))
#   }
# })

# check_quietly <- purrr::quietly(devtools::check)
# install_quietly <- purrr::quietly(devtools::install)
#
# shhh_check <- function(..., quiet = TRUE) {
#   out <- check_quietly(..., quiet = quiet)
#   out$result
# }
#
# pretty_install <- function(...) {
#   out <- install_quietly(...)
#   output <- strsplit(out$output, split = "\n")[[1]]
#   output <- grep("^(\\s*|[-|])$", output, value = TRUE, invert = TRUE)
#   c(output, out$messages)
# }


#' Add a icon
#'
#' @param name Name of icon. Icons are drawn from the [Font Awesome Free set](https://fontawesome.com/icons) and Glyphicons libraries. Note that
#'   the "fa-" and "glyphicon-" prefixes should not be used in icon names (i.e. the "fa-calendar"
#'   icon should be referred to as "calendar").
#' @param attrib Additional attributes to add. A list with tag names.
#' @param lib Icon library to use ("font-awesome" or "glyphicon")
#'
#' @return
#' @export
#'
#' @examples
#' addIcon("calendar", attrib = list(title = "See calendar"))
#' addIcon("calendar", attrib = list(title = "See calendar", style="font-size: 3em; color: Tomato;"))
#' addIcon("credit-card", attrib = list(title = "Card"), lib = "glyphicon")
addIcon <- function(name, attrib = NULL, lib = "font-awesome")
{
  prefixes <- list(`font-awesome` = "fa", glyphicon = "glyphicon")
  prefix <- prefixes[[lib]]
  if (is.null(prefix)) {
    stop("Unknown font library '", lib, "' specified. Must be one of ",
         paste0("\"", names(prefixes), "\"", collapse = ", "))
  }
  prefix_class <- prefix
  if (prefix_class == "fas" && name %in% shiny:::font_awesome_brands) {
    prefix_class <- "fab"
  } else if (prefix_class == "fa") prefix_class <- "fas"
  iconClass <- str_c(prefix_class, " ", prefix, "-", name)
  attrib$class = str_c(attrib$class, iconClass, sep=" ")
  if (lib == "font-awesome") {
    iconTag <- do.call(htmltools::tags$i, attrib)
    htmltools::htmlDependencies(iconTag) <-
      htmltools::htmlDependency(
        "font-awesome",
        "5.3.1",
        "www/shared/fontawesome",
        package = "shiny",
        stylesheet = c("css/all.min.css", "css/v4-shims.min.css")
      )
  }
  if (lib == "glyphicon") {
    iconTag <- do.call(htmltools::tags$span, attrib)
    # htmltools::htmlDependencies(iconTag) <-
    #   htmltools::htmlDependency("bootstrap", "3.3.7",
    #                             c(href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7"),
    #                             stylesheet = "css/bootstrap.min.css",
    #                             script = "js/bootstrap.min.js",
    #                             all_files = F)
  }
  htmltools::browsable(iconTag)
}

strLPath <- "We are all different and you may like different learning styles compared to others. As a result you may prefer a different learning path than suggested. Here is a list of possible different learning paths that may be usefull for you."

ctrSol <- 0
addSolution <- function(code = "", text = "") {
  {
    sink("tmp.md")
    cat('\n```r\n', str_trim(code), '\n```', sep="")
    cat('\n', text)
    sink()
  }
  id = str_c("solution", ctrSol)
  ctrSol <<- ctrSol + 1
  tagList(bs_modal(id = id, title = "Solution", body = includeMarkdown("tmp.md")),
          bs_button("Solution", style="float:right") %>%
            bs_attach_modal(id_modal = id))
}
