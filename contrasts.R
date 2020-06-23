#------------------------------------------------------------
# This code finds the contrast values for the Calathea theme.
# https://www.w3.org/TR/WCAG20-TECHS/G17.html
#------------------------------------------------------------

#---------------------
# Libraries and Set up
#---------------------
library(here)
library(dplyr)

#-------------
# Read in data
#-------------
color_values <- read.csv(here::here("Calathea.csv"),
                         fileEncoding = "UTF-8-BOM",
                         stringsAsFactors = FALSE)

#---------------
# Convert colors
#---------------

# Hex to RGB
color_values <- color_values %>%
  mutate(RGB_R = col2rgb(HEXCOL)[1, ], # Red
         RGB_G = col2rgb(HEXCOL)[2, ], # Green
         RGB_B = col2rgb(HEXCOL)[3, ]) # Blue

# Helper for luminance conversion
help_convert <- function(color_channel) {
  color_channel <- color_channel / 255
  color_channel <- ifelse(color_channel <= 0.03928,
                          color_channel / 12.92,
                          ((color_channel + 0.055) / 1.055) ^ 2.4)
  return(color_channel)
}

color_values <- color_values %>%
  mutate(RGB_R = help_convert(RGB_R), # Red
         RGB_G = help_convert(RGB_G), # Green
         RGB_B = help_convert(RGB_B)) # Blue

# RGB to Luminance
color_values <- color_values %>%
  mutate(luminance = 0.2126 * RGB_R +
                     0.7152 * RGB_G +
                     0.0722 * RGB_B)

# Compare foregrounds to backgrounds
background_luminance <- color_values[color_values$Feature == "Background",
                                     "luminance"]
selection_luminance <- color_values[color_values$Feature == "Selection",
                                     "luminance"]
chunk_luminance <- color_values[color_values$Feature == "R Markdown Chunk",
                                     "luminance"]

color_values <- color_values %>%
  mutate(background_contrast = (luminance + 0.05) /
           (background_luminance + 0.05),
         selection_contrast = (luminance + 0.05) /
           (selection_luminance + 0.05),
         chunk_contrast = (luminance + 0.05) /
           (chunk_luminance + 0.05))

#---------------------
# Save contrast values
#---------------------
contrast_values <- color_values %>%
  filter(Feature %in% c("Code",
                        "Comment",
                        "Keyword Contants",
                        "Keyword Functions",
                        "Number",
                        "String")) %>%
  select(Feature,
         Color.Name,
         background_contrast,
         selection_contrast,
         chunk_contrast) %>%
  rename(feature = Feature,
         color_name = Color.Name)

write.csv(contrast_values,
          here::here("contrast_values.csv"),
          row.names = FALSE)
