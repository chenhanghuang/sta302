#### Preamble ####
# Purpose: Replicated graphs from “Methods Matter: p-Hacking and Publication Bias in Causal Analysis in Economics”
# Author: Chenhang Huang
# Date: 11 February 2023
# Contact: chenhang.huang@mail.utoronto.ca
# License: UOT
# Pre-requisites:No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(readr)
library(gridExtra)

# [...UPDATE THIS...]

#### Load data ####
data = read_csv("data/analysis_data/analysis_data.csv")
data1 = read_csv("data/analysis_data/analysis_data1.csv")

#### summary statistic table 1
## Column (6)
c6 = data %>% group_by(journal) %>% summarise(Tests = n())
c6_total_test = sum(c6$Tests)
##Column (1)
c1 = data %>% group_by(journal) %>%filter(method == "DID")%>% summarise(DID = length(unique(title)), tests = n())
c1_total_artical = sum(c1$DID)
c1_total_test = sum(c1$tests)

##Column (2)
c2 = data %>% group_by(journal) %>%filter(method == "IV")%>% summarise(IV = length(unique(title)), tests = n())
c2_total_artical = sum(c2$IV)
c2_total_test = sum(c2$tests)
##Column (3)
c3 = data %>% group_by(journal) %>%filter(method == "RCT")%>% summarise(RCT = length(unique(title)), tests = n())
c3_total_artical = sum(c3$RCT)
c3_total_test = sum(c3$tests)
##Column (4)
c4 = data %>% group_by(journal) %>%filter(method == "RDD")%>% summarise(RDD = length(unique(title)), tests = n())
c4_total_artical = sum(c4$RDD)
c4_total_test = sum(c4$tests)
##Column (5)
c5 = data %>% group_by(journal) %>% summarise(Articles = length(unique(title)))
c5_total_artical = sum(c5$Articles)



size = 0.25

#### Figure 1. z-Statistics in 25 Top Economics Journals


p<-data %>% filter(t<=10) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size = size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size = size))+
  labs(title = "Distribution of t statistic",
       y = "Density",
       x = "z-statistic")  

p


p1<-data %>% filter(t<=10 & top5 == 1) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "Top 5",
       y = "Density",
       x = "z-statistic")  
p1


p2<-data %>% filter(t<=10 & top5 == 0) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "Non-top 5",
       y = "Density",
       x = "z-statistic")  
p2


grid.arrange(p, arrangeGrob(p1, p2, ncol = 2), nrow = 2)



### Figure 2. z-Statistics by Method


DID<-data %>% filter(t<=10 & method == "DID") %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "DID",
       y = "Density",
       x = "z-statistic")  


IV<-data %>% filter(t<=10 & method == "IV") %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "IV",
       y = "Density",
       x = "z-statistic")  



RCT <-data %>% filter(t<=10 & method == "RCT") %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "RCT",
       y = "Density",
       x = "z-statistic")  

RDD <-data %>% filter(t<=10 & method == "RDD") %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "RDD",
       y = "Density",
       x = "z-statistic")  

grid.arrange(DID,IV,RCT,RDD, nrow = 2)




### Figure 3. z-Statistics over Time

Top3B2015 <- data1 %>% filter(t<=10) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "2005-2011",
       y = "Density",
       x = "z-statistic")  



Top3_2015_2018 = data %>% filter(t<=10 & top3 == 0) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "2015 & 2018",
       y = "Density",
       x = "z-statistic")  



Y2015 <-data %>% filter(t<=10 & year == 2015) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "2015",
       y = "Density",
       x = "z-statistic")  



Y2018 <-data %>% filter(t<=10 & year == 2018) %>%
  ggplot(aes(x=t)) + 
  geom_histogram(aes(y = ..density..),color="gray", fill="gray", binwidth = 0.1) +
  geom_density() +
  geom_vline(xintercept = qnorm(0.95), colour="green") + 
  geom_vline(xintercept = qnorm(0.975), colour="blue") + 
  geom_vline(xintercept = qnorm(0.995), colour="red") +
  geom_text(aes(x = qnorm(0.95), y = -0.005, label = "*",label.size =size))+
  geom_text(aes(x = qnorm(0.975), y = -0.005, label = "**",label.size =size))+
  geom_text(aes(x = qnorm(0.995), y = -0.005, label = "***",label.size =size))+
  labs(title = "2018",
       y = "Density",
       x = "z-statistic")  


grid.arrange(Top3B2015,Top3_2015_2018,Y2015,Y2018, nrow = 2)


