#----------------------------------------------------
# This code creates the logos for the Calathea theme.
#----------------------------------------------------

#---------------------
# Libraries and Set up
#---------------------
library(here)
library(grid)

# Used for determining movement
golden_angle <- pi * (3 - sqrt(5))

#---------------------------
# Read in and arrange colors
#---------------------------
color_values <- read.csv(here::here("Calathea.csv"),
                         fileEncoding = "UTF-8-BOM",
                         stringsAsFactors = FALSE)
color_values <- color_values[color_values$Feature != "", ]

colors <- color_values[!(color_values$Feature %in% c("Background",
                                                     "Highlight",
                                                     "Keyword Operator",
                                                     "Selection",
                                                     "R Markdown Chunk")), ]
colors <- colors[match(c("Keyword Functions",
                         "String",
                         "Number",
                         "Code",
                         "Comment",
                         "Keyword Contants"), colors$Feature), ]

# Set up to alternate colors against the background
colors$Order <- seq(1, nrow(colors)) * 2

## Set background (change and re-run for other logos)
background <- color_values[color_values$Feature == "Background", ]
# background <- color_values[color_values$Feature == "Highlight", ]
# background <- color_values[color_values$Feature == "R Markdown Chunk", ]

# Set up to alternate colors against the background continued
background <- background[rep(1, nrow(colors) + 1), ]
background$Order <- seq(1, nrow(colors) + 1) * 2 - 1

color_values <- rbind(colors, background)
color_values <- color_values[order(color_values$Order), ]

#---------------------------
# Set up the circles
# These get progressively smaller as they are drawn.
# The non-background circles are off centers to give the appearance of cresents.
#---------------------------

# Sets up size bounds and changes
max_radius <- 2.5
min_radius <- max_radius / 4
radius_increase <- (max_radius - min_radius) / (nrow(color_values) - 1)
radius_increase_split <- radius_increase * (4 / 5)

## Sets the actual sizes
# Changes only happen when moving from a background circle to a non-bg one
color_values$radius <- seq(max_radius, min_radius,
                           length.out = nrow(color_values))
color_values$radius <- color_values$radius -
  c(rep(c(0, radius_increase_split), times = nrow(colors)), 0)

# Set up how the circles move:
# The background ones stay centered
# The non-bg ones move around based on the golden angle moving around a circle
# Then the non-bg circle movements are bound to the top half of the circle
color_values$rotation <- c(as.vector(rbind(0,
                                           golden_angle *
                                             seq(1, nrow(color_values) / 2))),
                           0)
color_values$rotation <- color_values$rotation %% (2 * pi)
color_values$rotation <- ((((3 / 4 * pi) - (1 / 4 * pi)) *
                             (color_values$rotation - 0)) /
  (2 * pi - 0))  + (1 / 4 * pi)

# Actually move the circles
color_values$x <- 0
color_values$y <- 0

color_values$x <- c(as.vector(rbind(0,
                                   rep(radius_increase,
                                       (nrow(color_values) - 1) / 2))), 0)
color_values$x_new <- cos(color_values$rotation) * color_values$x -
  sin(color_values$rotation) * color_values$y
color_values$y_new <- sin(color_values$rotation) * color_values$x +
  cos(color_values$rotation) * color_values$y

color_values$x_new <- color_values$x_new + max_radius
color_values$y_new <- color_values$y_new + max_radius

color_values$x <- color_values$x_new
color_values$y <- color_values$y_new

#-----------------------------------------
# Create the files and print out the image
#-----------------------------------------
png(file = here::here("images", "icon.png"),
    # file = here::here("icon_highlight.png"),
    # file = here::here("icon_chunk.png"),
    width = 5,
    height = 5,
    units = "in",
    res = 300,
    bg = "transparent")

for(i in seq(1, nrow(color_values))) {
  grid.circle(x = color_values$x[color_values$Order == i],
              y = color_values$y[color_values$Order == i],
              r = color_values$radius[color_values$Order == i],
              default.units = "in",
              gp = gpar(col = color_values$HEXCOL[color_values$Order == i],
                        fill = color_values$HEXCOL[color_values$Order == i]))
}

dev.off()