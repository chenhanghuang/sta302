#### Preamble ####
# Purpose: test the variable to see if the variable in the right format and range  
# Author: Chenhang Huang
# Date: 04 Feb 2024
# Contact: chenhang.huang@mail.utoronto.ca
# License: Uoft
# Pre-requisites: no



## There are 7 variables in the clean dataset

## Jounrnal is the string variable including the name of Journal
## year is the publish year of the article 
## title is the string variable including the name of the article
## t represents the t value for the test
## method tell us what method are used for the test, there are four levels:IV, DID, RDD,RCT
## top5 is a dummy variable, true or False.
## top3 is a dummy variable, true or False.



#### Workspace setup ####
library(tidyverse)

#### Test data ####

data = read_csv("data/analysis_data/analysis_data.csv")

## test if there are only four methods :"IV" , "RDD","DID", "RCT"
data$method |>
  unique() == c("IV" , "RDD","DID", "RCT")

## test if the journal is string variable 
data$journal |> class() == "character"


## test if the title is string variable 
data$title |> class() == "character"

## test if the maximum of year is 2018
data$year |> max() == 2018
## test if the minimum of year is 2015
data$year |> min() == 2015


## test if t statistic is larger than 0, two side t test

data$t |> min() >= 0

## test if t statistic is numeric
data$t |> class() == "numeric"


## test if Top5 is dummy variable, 1 or 0
data$top5 |>
  unique() == c(0,1)


## test if Top3 is dummy variable, 1 or 0
data$top3 |>
  unique() == c(0,1)


#### Test data1 ####

data1 = read_csv("data/analysis_data/analysis_data1.csv")

## test if there are only four methods :"IV" , "RDD","DID", "RCT"
data1$method |>
  unique() == c("DID", "RCT", "IV",  "RDD")

## test if the journal is string variable 
data1$journal |> class() == "character"


## test if the maximum of year no more than 2015
data1$year |> max() <= 2015


## test if t statistic is larger than 0, two side t test

data1$t |> min() >= 0

## test if t statistic is numeric
data1$t |> class() == "numeric"




