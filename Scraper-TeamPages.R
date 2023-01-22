library(tidyverse)
library(fRisbee)
library(glue)

mens_ranks = fRisbee::load_rankings_men()
womens_ranks = fRisbee::load_rankings_women()

mens_teams = mens_ranks$Team
womens_teams = womens_ranks$Team


scrape_mens_team = function(inputTeam) {
  output_path = glue("team-pages-m/M-{inputTeam}.csv")
  team_results = fRisbee::load_team_results_men(inputTeam)
  write_csv(team_results, file = output_path)
}

scrape_womens_team = function(inputTeam) {
  output_path = glue("team-pages-w/W-{inputTeam}.csv")
  team_results = fRisbee::load_team_results_women(inputTeam)
  write_csv(team_results, file = output_path)
}


walk(.x = mens_teams, .f = ~ scrape_mens_team(.x))
walk(.x = womens_teams, .f = ~ scrape_womens_team(.x))

