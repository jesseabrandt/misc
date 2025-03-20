library(tidyverse) #load useful packages

df <- read_csv("118th_House_Master_data_.csv") #read dataset
#note: I saved this as a csv for convenience rather than reading directly from Excel

df %>% glimpse() # look at data

unique(df$...10) #see what is in these blank columns
unique(df$...9)

df <- df %>% # get rid of blank columns
  select(c(1:8))


#Statistic 1
ca_parties <- df %>% filter(State == "CA") %>% #filter to only CA members
  group_by(Party) %>%
  summarize(members = n()) #find number of members by party

ca_parties %>%
  mutate(share = members / sum(ca_parties$members)) #convert numbers to proportion
#R share: 0.231.

#Statistic 2
df %>% group_by(Party) %>%
  summarize(avg_terms_served = mean(TermsServed)) #calculate average terms served by party
#D average: 6.08
