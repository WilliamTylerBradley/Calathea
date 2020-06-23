#-----------------------------------------
# This creates ccs files to use for blogs.
#-----------------------------------------

#---------------------
# Libraries and Set up
#---------------------
library(here)
library(dplyr)
library(stringr)

#-------------
# Read in data
#-------------
color_values <- read.csv(here::here("Calathea.csv"),
                         fileEncoding = "UTF-8-BOM",
                         stringsAsFactors = FALSE)

#-------------
# Save to Hexo
#-------------
hexo <- color_values %>%
  select(Hexo,
         HEXCOL) %>%
  mutate(Hexo = str_replace(Hexo, "HEXCOL", HEXCOL)) %>%
  select(Hexo) %>%
  filter(Hexo != "") %>%
  mutate(Hexo = str_replace_all(Hexo, "\\{", "\\{\n"),
         Hexo = str_replace_all(Hexo, "\\}", "\n\\}\n"))

cat(paste0(hexo[, 1], collapse = "\n"),
    file = here::here("utilizations", "calathea_hexo.css"))

#------------------
# Save to Highlight
#------------------
highlight <- color_values %>%
  select(Highlight,
         HEXCOL) %>%
  mutate(Highlight = str_replace(Highlight, "HEXCOL", HEXCOL)) %>%
  select(Highlight) %>%
  filter(Highlight != "") %>%
  mutate(Highlight = str_replace_all(Highlight, "\\{", "\\{\n"),
         Highlight = str_replace_all(Highlight, "\\}", "\n\\}\n"))

cat(paste0(hexo[, 1], collapse = "\n"),
    file = here::here("utilizations", "calathea_highlight.css"))
