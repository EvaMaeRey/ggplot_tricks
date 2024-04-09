# A basic plot to reuse for examples
mpg |>
ggplot() +
  aes(class, displ, colour = class) +
  geom_boxplot() + 
  aes(xmin = after_scale(x)) +
  # make it pretty
  aes_fill_transparent_after_color +
  labs(y = "Engine Displacement [L]", x = "Type of car") +
  guides(colour = "none", fill = "none") 
