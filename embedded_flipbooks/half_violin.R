mpg |>
ggplot() +
  aes(class, displ, colour = class) + 
  geom_violin() +
  aes(xmin = after_scale(x)) ->
p 

update_geom_defaults("violin", list(xmin = NULL))

p 
