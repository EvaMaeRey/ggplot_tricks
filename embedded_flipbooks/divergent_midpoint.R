my_pal <- c("dodgerblue", "deepskyblue", "grey", "hotpink", "deeppink") 

ggplot(mpg) + 
  aes(displ, hwy, colour = cty - mean(cty)) +
  geom_point() +
  labs(
    x = "Engine displacement [L]",
    y = "Highway miles per gallon",
    colour = "Mean-\ncentered\nvalue"
  ) + 
  scale_colour_gradientn(
    colours = my_pal, 
  ) +
  scale_colour_gradientn(
    colours = my_pal, 
    rescaler = ~ scales::rescale_mid(.x, mid = 0) # opt 1 center
  ) +
  scale_colour_gradientn(
    colours = my_pal, 
    limits = ~ c(-1, 1) * max(abs(.x)) # opt 2 center limits
  )

