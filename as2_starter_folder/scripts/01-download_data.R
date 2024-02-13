#### Preamble ####
# Purpose: Downloads and saves the data from open.toronto.ca
# Author: Chenhang Huang
# Date: 2 Feb 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites: no
# data source: https://www.aeaweb.org/articles?id=10.1257/aer.20190687


#### Workspace setup ####
library(tidyverse)
library(haven)
library(dplyr)
library(readr)

#### Download data ####


# load the first datastore resource as a sample
data <- read_dta("data/raw_data/MM Data.dta", encoding = "latin1")
head(data)

data1 <- read_dta("data/raw_data/Star Wars Data.dta", encoding = "latin1")
head(data1)

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data, "data/raw_data/raw_data.csv") 

write_csv(data1, "data/raw_data/raw_data1.csv") 

