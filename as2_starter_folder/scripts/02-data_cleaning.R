#### Preamble ####
# Purpose: clean the data and mutate some new variable of interest in the clean dataset
# Author: Chenhang Huang
# Date: 04 Feb 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no
# Any other information needed? no

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

raw_data1 <- read_csv("data/raw_data/raw_data1.csv")

top5 = c("Quarterly Journal of Economics","Journal of Political Economy","Econometrica","American Economic Review","Review of Economic Studies")
top3 = c("Quarterly Journal of Economics","Journal of Political Economy","American Economic Review")

cleaned_data <-
  raw_data |>
  select(journal,title, year, t, method) |>
  mutate(top5 = as.numeric(journal %in% top5),
         top3 = as.numeric(journal %in% top3))|>
  tidyr::drop_na()

cleaned_data1 <-
  raw_data1 |>
  select(journal,year, t, method) |>
  tidyr::drop_na()


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
write_csv(cleaned_data1, "data/analysis_data/analysis_data1.csv")
