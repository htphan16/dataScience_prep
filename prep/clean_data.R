library(xlsx)
library(dplyr)
df <- read.xlsx('Dr2_401_500.xlsx', sheetIndex = 1)
head(df)
# clean empty rows
df <- df %>% filter(Gender == 'Male' | Gender == 'Female')
# filter patients with unknown base heart rate
heart_df <- df %>% filter(Base.Heart.Rate != 'Unknown')
heart_df
# filter patients with unknown risk factors and unknown medication
risk_df <- df %>% filter(Risk.Factor.1 != 'Unknown', Current.Medication != 'Unknown')
risk_df