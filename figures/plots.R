library(dplyr)
library(ggplot2)
setwd("C:/Users/emily/Desktop/2022 Fall/DS4002/DS4002-M1")
raw_data <- read.csv("./data/salary_potential.csv")
df = data.frame(raw_data)
df <- na.omit(df)
filtered_df <- subset(df, state_name == "Virginia")
filtered_df
max(filtered_df$stem_percent)
match(max(filtered_df$stem_percent), filtered_df$stem_percent)
# school with highest stem percentage - Virginia Military Institute
filtered_df$name[match(max(filtered_df$stem_percent), filtered_df$stem_percent)]
# school with minimum stem percentage - Jefferson College of Health Sciences
filtered_df$name[match(min(filtered_df$stem_percent), filtered_df$stem_percent)]
# difference in between early salaries - $10400
filtered_df$early_career_pay[match(max(filtered_df$stem_percent), filtered_df$stem_percent)] - filtered_df$early_career_pay[match(min(filtered_df$stem_percent), filtered_df$stem_percent)]
less_20df <- subset(filtered_df, stem_percent < 20)
more_20df <- subset(filtered_df, stem_percent >= 20)
less_20df
more_20df
average_less <- mean(less_20df$early_career_pay)
average_more <- mean(more_20df$early_career_pay)
# average early career salary of schools < 20 percent stem (51376.47)
average_less
# average early career salary of schools >= 20 percent stem (58387.5)
average_more
# difference of $7011.03
average_more - average_less