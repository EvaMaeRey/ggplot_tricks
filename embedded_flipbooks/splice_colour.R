ggplot(mpg, aes(displ, hwy)) +
  geom_point(shape = 21) +
  aes(colour = factor(cyl)) + 
  # fill directly using variable
  aes(fill = hwy) + 
  # fill based on existing scale color
  aes(fill = after_scale(alpha(colour, 0.3))) ->
p;p 

# or reusably
aes(fill = after_scale(alpha(colour, 0.3))) ->
  aes_fill_transparent_after_color

ggplot(mpg) +
  aes(x = displ, y = hwy, 
      colour = factor(cyl), 
      !!!aes_fill_transparent_after_color) +
  geom_point(shape = 21)


# aes can be applied independently so following also works
ggplot(mpg) +
  aes(x = displ, y = hwy) +
  geom_point(shape = 21) + 
  aes_fill_transparent_after_color + 
  aes(colour = factor(cyl))
