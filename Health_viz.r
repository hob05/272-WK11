library(tidyverse)
library(GGally)
library(readr)
library(NHANES)

# load in the nhanes data set

data("NHANES")
View(NHANES)

# create a sub heath data table

health_data <- NHANES %>% select(c(Age, BMI, Gender, TotChol))
View(health_data)

# create a histogram plot

ggplot(health_data, aes(x = BMI)) +
  geom_histogram(binwidth = 1, fill = "skyblue", colour = "black") +
  labs(title = "Mean height in Waes is higher than European Average") +
  theme_gray()

val_cor <- health_data %>% select(BMI,Age,TotChol) %>%
  cor(use = "complete.obs")

ggcorr(val_cor, label = TRUE, label_alpha = TRUE)
