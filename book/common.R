## Common code relevant for all chapters

library(knitr)
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  message = FALSE,
  warning = FALSE,
  # cache = TRUE,
  # fig.retina = 0.8, # figures are either vectors or 300 dpi diagrams
  # dpi = 300,
  # out.width = "70%",
  fig.align = 'center',
  # fig.width = 6,
  # fig.asp = 0.618,  # 1 / phi
  fig.show = "hold"
)

library(tidyverse)
options(dplyr.summarise.inform = FALSE)
library(bsplus)
library(htmltools)
# To install igraph on OSX you may have to run 'brew unlink suite-sparse', install igraph and finally 'brew link suite-sparse' to re-enable.
library(igraph)
library(DiagrammeR)
library(googlesheets4)
library(fs)
library(conflicted)
conflict_prefer("filter", "dplyr", quiet = TRUE)
conflict_prefer("select", "dplyr", quiet = TRUE)
conflict_prefer("lag", "dplyr", quiet = TRUE)

options(
  width = 100,
  digits = 3,
  # str = strOptions(strict.width = "cut"),
  knitr.kable.NA = '',
  crayon.enabled = FALSE,
  rlang_trace_top_env = rlang::current_env(),
  rlang__backtrace_on_error = "none"
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


opts_hooks$set(solution = function(options) {
  if (isTRUE(options$solution)) {
    options$str_id <- stringi::stri_rand_strings(1, 20)
  }
  options
})

opts_hooks$set(hint = function(options) {
  if (isTRUE(options$hint)) {
    options$str_id <- stringi::stri_rand_strings(1, 20)
    options$eval = FALSE
  }
  options
})

knit_hooks$set(solution = function(before, options, envir) {
  if (is.null(options$title)) options$title <- "Solution"
  if (before) {
    paste0('\n<div class="modal fade bs-example-modal-lg" id="', options$str_id, '" tabindex="-1" role="dialog" aria-labelledby="', options$str_id, '-title">',
           '<div class="modal-dialog modal-lg" role="document">',
           '<div class="modal-content">',
           '<div class="modal-header">',
           '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
           '<h4 class="modal-title" id="', options$str_id, '-title">', options$title, '</h4>',
           '</div><div class="modal-body">\n')
  } else {
    text <- "\n"
    if (!is.null(options$text)) text <- paste0(text, markdown::renderMarkdown(text = options$text), '\n')
    paste0(text, '</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div>',
           '</div></div></div>',
           '<button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#', options$str_id, '">', options$title, '</button>\n')
  }
})

knit_hooks$set(hint = function(before, options, envir) {
  if (is.null(options$title)) options$title <- "Hint"
  if (before) {
    paste0('\n<div class="modal fade bs-example-modal-lg" id="', options$str_id, '" tabindex="-1" role="dialog" aria-labelledby="', options$str_id, '-title">',
           '<div class="modal-dialog modal-lg" role="document">',
           '<div class="modal-content">',
           '<div class="modal-header">',
           '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
           '<h4 class="modal-title" id="', options$str_id, '-title">', options$title, '</h4>',
           '</div><div class="modal-body">\n')
  } else {
    text <- "\n"
    if (!is.null(options$text)) text <- paste0(text, markdown::renderMarkdown(text = options$text), '\n')
    paste0(text, '</div><div class="modal-footer"><button class="btn btn-default" data-dismiss="modal">Close</button></div>',
           '</div></div></div>',
           '<button class="btn btn-default btn-xs" style="float:right" data-toggle="modal" data-target="#', options$str_id, '">', options$title,'</button>\n')
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

strLPath <- "We are all different and you may like different learning styles compared to others. You may prefer a different learning path than suggested. Here is a list of possible different learning paths that may be useful for you. Note these suggestions are not a part of syllabus!"

strExercises <- "Below you will find a set of exercises. Always have a look at the exercises before you meet in your study group and try to solve them yourself. Are you stuck, see the [help page](#help). Some of the solutions to each exercise can be seen by pressing the button at each question. Beware, you will not learn by giving up too early. Put some effort into finding a solution!"

ctrSol <- 0
addSolution <- function(code = "", text = "", title = "Solution", evalCode = TRUE) {
  if (evalCode) eval(parse(text = code), envir = globalenv())
  {
    sink("tmp.md")
    if (code != "") cat('\n```r\n', str_trim(code), '\n```', sep="")
    cat('\n', text)
    sink()
  }
  id = str_c("solution", ctrSol)
  ctrSol <<- ctrSol + 1
  tagList(bs_modal(id = id, title = title, body = includeMarkdown("tmp.md"), size = "large"),
          bs_button(title, style="float:right", button_size = "extra-small") %>%
            bs_attach_modal(id_modal = id))
}



add_graph_legend <- function(graph, x, y) {
  graph %>%
    add_node(
      label = c("", "Color:", "mandatory", "alternative", "extra", "Shape:", "non-interactive", "interactive"),
      node_data =
        node_aes(x = c(x+2.4, x-0.23, x, x+1, x+2, x+3.5-0.3, x+3.5, x+4.75),
                 y = c(y-0.34, y, rep(y-0.4, 3), y, rep(y-0.4, 2)),
                 fontcolor = c("white", "black", rep("white", 3), "black", "white", "white"),
                 fontsize = 9,
                 shape = c("rect", "none", rep("rect", 3), "none", "rect", "egg"),
                 fillcolor = c(NA, "none", "DarkSeaGreen4", "DarkOrange4", "PeachPuff3", "none", rep("Grey40", 2)),
                 width = c(6, rep(0.8, 4), rep(1,3)),
                 height = c(1, 0, NA, NA, NA, 0, NA, NA),
                 penwidth = c(0.5, 0, 2, 2, 2, 0, 2, 2),
                 tooltip = c(" ", " ",
                             "Mandatory syllabus.",
                             "Alternative syllabus if you prefer another learning style.",
                             "Extra learning if you are interested (not part of syllabus).",
                             " ",
                             "Non-interactive learning content (e.g. reading).",
                             "Interactive learning content (tutorial, exercises etc.).")
        ))
}

create_learning_path <- function(url, sheet, x_legend = 0, y_legend = 0, margin_node = 0.2) {
  gs4_deauth()
  dat <- read_sheet(url, sheet = sheet, col_types = "iccccccdd")
  dat <- dat %>%
    mutate(link_to = map(link_to, ~rlang::parse_quo(str_c("c(", .x, ")"), env = baseenv()))) %>%
    mutate(link_to = map(link_to, ~rlang::eval_tidy(.x))) %>%
    mutate(link_to = map(link_to, ~tibble(to = .x)))
  nodes <- dat %>%
    select(-link_to)
  edges <- dat %>%
    select(from = id, to = link_to) %>%
    unnest(cols = to) %>%
    filter(!is.na(to))
  edges <-
    create_edge_df(
      from = edges$from,
      to =   edges$to)
  graph <-
    create_graph(nodes_df = nodes, edges_df = edges) %>%
    mutate_node_attrs(
      style = "filled",
      fixedsize = FALSE,
      fontsize = 11,
      fontcolor = "white",
      penwidth = 2,
      fontname = "Helvetica-bold",
      shape = case_when(
        type == "reading" ~ "rect",
        type == "tutorial" ~ "egg",
        type == "exercises" ~ "egg",
        type == "recap" ~ "rect",
        type == "video" ~ "rect",
        TRUE ~ "oval"),
      emo = case_when(
        type == "reading" ~ "📖 ",
        type == "recap" ~ "📖 ",
        type == "tutorial" ~ "💡 ",
        type == "exercises" ~ "💻 ",
        type == "video" ~ "🎬 ",
        TRUE ~ ""),
      label = str_c(emo, "", label),
      margin = margin_node,
      fillcolor = case_when(
        type1 == "alternative" ~ "DarkOrange4",
        type1 == "mandatory" ~ "DarkSeaGreen4",
        type1 == "extra" ~ "PeachPuff3",
        TRUE ~ "#F4A261")
    ) %>%
    mutate_edge_attrs(
      color = "black",
      alpha = 0.5,
      arrowhead = "vee") %>%
    add_graph_legend(x_legend, y_legend)
  return(graph)
}


