# stats_analysis.R
# Performs statistical tests on in vitro digestion data
# Author: Maruf Raihan

library(stats)
data <- read.table("sample_data.txt", header = TRUE, sep = ",")

anova_result <- aov(Protein_Digestibility ~ Condition, data = data)
summary(anova_result)
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
t_test_result <- t.test(
  data$Protein_Digestibility[data$Condition == "Control"],
  data$Protein_Digestibility[data$Condition == "Fermented"],
  paired = FALSE
)
print(t_test_result)