library(tidyverse)
library(fRisbee)
library(glue)

mens_ranks = fRisbee::load_rankings_men()
womens_ranks = fRisbee::load_rankings_women()

mens_teams = mens_ranks$Team
womens_teams = womens_ranks$Team


scrape_mens_games = function(inputTeam) {
  team_results = fRisbee::load_team_results_men(inputTeam)
  return(team_results)
}

scrape_womens_games = function(inputTeam) {
  team_results = fRisbee::load_team_results_women(inputTeam)
  return(team_results)
}

mens_games = map_dfr(.x = mens_teams, .f = ~ scrape_mens_games(.x))
womens_games = map_dfr(.x = womens_teams, .f = ~ scrape_womens_games(.x))

write_csv(mens_games, file = "full-games/AllMensGames.csv")
write_csv(womens_games, file = "full-games/AllWomensGames.csv")



