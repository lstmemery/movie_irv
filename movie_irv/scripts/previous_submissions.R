library(tidyverse)

all_csvs <- list.files("../data", full.names = TRUE)

all_entries <- map_df(all_csvs, read_csv)


all_entries %>% 
  select_at(vars(contains("movie"))) %>% 
  pivot_longer(contains("movie")) %>% 
  distinct(value) %>% 
  filter(!is.na(value)) %>% 
  rename(movie = "value") %>% 
  arrange(-row_number()) %>% 
  write_csv("../results/all_previous_submissions.csv")
