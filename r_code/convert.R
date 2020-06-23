#--------------------------------------
# This code converts tmTheme to rstheme
#--------------------------------------

library(here)
library(rstudioapi)

help("convertTheme")
rstudioapi::convertTheme(here("utilizations", "Calathea.tmTheme"),
                         outputLocation = here("utilizations"))
