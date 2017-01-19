# Exercise 6: Husky Football 2015 Season
# Read in the Husky Football 2015 game data into a variable called `husky.games.2015`
husky.games.2015 <- read.csv("data/huskies_2015.csv")


# Create a vector of the teams that the Huskies played against during that season
other.teams <- husky.games.2015$opponent


# Create a vector of the their final scores for the games
# Call this variable `husky.scores`
husky.scores <- husky.games.2015$uw_score


# Create 2 variables called `rushing.yards` and `passing.yards` to represent the yards the Huskies rushed and passed
rushing.yards <- husky.games.2015$rushing_yards
passing.yards <- husky.games.2015$passing_yards


# Create a variable called `combined.yards` that is the total yardage of the Huskies for each game
combined.yards <- rushing.yards + passing.yards


# Add the `combined.yards` vector to the dataframe with the column name being `combined`
husky.games.2015["combined"] <- combined.yards


# Write the dataframe to a new `.csv` file called `huskies_2015_improved.csv` into the `data directory`
write.csv(husky.games.2015, "data/huskies_2015_improved.csv")


# What is the score of the game where the Huskies had the most combined yards?
most.combined.yards <- husky.scores[combined.yards == max(combined.yards)]


# Define a function `MostYardsScore` that takes in an argument `games` (a data frame) and
# returns a descriptive sentence about the game that was played that had the most yards scored in it.
MostYardsScore <- function (games) {
  dates <- games$date
  opponents <- games$opponent
  home.score <- games$uw_score
  opponent.score <- games$opponent_score
  
  passing.yards <- games$passing.yards
  scoring.yards <- games$scoring.yards
  combined.yards <- games$combined.yards
  
  most.yards <- max(combined.yards)
  opponent <- opponents[combined.yards == most.yards]
  date <- dates[combined.yards == most.yards]
  highest.score <- home.score[combined.yards == most.yards]
  
  return(paste("The Huskies scored the highest score of", highest.score, "on", date, "against", opponent))
}


# Challenge!
# What was the highest yardage game so far this season?
# Hint: Read in the dataset titled `huskies_2016.csv` and save it as a variable