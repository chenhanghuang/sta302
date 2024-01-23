#### Preamble ####
# Purpose: Downloads and saves the data from open.toronto.ca
# Author: Chenhang Huang
# Date: 20 January 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: MIT
# Pre-requisites: no
# Any other information needed? no

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")

cleaned_data <-
  raw_data |>
  select(REPORT_YEAR, SUBTYPE, SEX,AGE_GROUP,AGE_COHORT,COUNT_) |>
  tidyr::drop_na()

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
