# A small nudge offset
offset <- 0.025

# Combining
mpg |>
ggplot() +
  aes(class, displ, colour = class)  +
  geom_boxplot(aes(xmax = after_scale(x))) +
  geom_errorbar(stat = "boxplot", width = 0.3,
                aes(xmax = after_scale(x))) +
  aes(x = stage(class, after_stat = x - offset)) +
  geom_violin(aes(
    xmin = after_scale(x), 
    x = stage(class, after_stat = x + offset)))
