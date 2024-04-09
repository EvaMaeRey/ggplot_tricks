contrast <- function(colour) {
  out   <- rep("grey20", length(colour))
  light <- farver::get_channel(colour, "l", 
                               space = "hcl")
  out[light < 50] <- "grey80"
  out
}

aes(colour = after_scale(contrast(fill))) ->
  aes_colour_autocontrast_after_fill

library(tidyverse)
cor(mtcars) |>
  as.data.frame() |>
  tibble::rownames_to_column("row") |>
  pivot_longer(-row, names_to = "col") |>
  ggplot(aes(row, col)) +
  geom_raster() +
  aes(fill = value) + 
  geom_text(aes(label = round(value, 2)), size = 3) +
  coord_equal() +
  aes_colour_autocontrast_after_fill + 
  scale_fill_viridis_c(direction =  1) +
  scale_fill_viridis_c(direction = -1)
