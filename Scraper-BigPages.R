library(tidyverse)
library(fRisbee)

mens_ranks = fRisbee::load_rankings_men()
womens_ranks = fRisbee::load_rankings_women()

write_csv(mens_ranks, "data/FullRankingsMen.csv")

write_csv(womens_ranks, "data/FullRankingsWomen.csv")
