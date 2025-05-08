# visualizations.R
# Creates publication-quality visualizations for digestion data
# Author: Maruf Raihan

install.packages("ggplot2")

library(ggplot2)

data <- read.table("sample_data.txt", header = TRUE, sep = ",")

bar_plot <- ggplot(data, aes(x = Condition, y = Protein_Digestibility, fill = Condition)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.4) +
  theme_minimal() +
  labs(
    title = "Protein Digestibility by Processing Condition",
    x = "Condition",
    y = "Protein Digestibility (%)"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
ggsave("bar_plot_digestibility.png", bar_plot, width = 6, height = 4)
box_plot <- ggplot(data, aes(x = Condition, y = Enzyme_Activity, fill = Condition)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Enzyme Activity by Processing Condition",
    x = "Condition",
    y = "Enzyme Activity (AU)"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
ggsave("box_plot_activity.png", box_plot, width = 6, height = 4)


bar_plot
