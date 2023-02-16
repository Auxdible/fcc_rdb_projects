#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams;")

while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then

    WINNER_EXISTS=$($PSQL "SELECT * FROM teams WHERE name='$winner';")

    if [[ -z $WINNER_EXISTS ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$winner');")
      echo -e "[!] $winner team does not exist. Creating team.";
    fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")

    OPPONENT_EXISTS=$($PSQL "SELECT * FROM teams WHERE name='$opponent';")
    
    if [[ -z $OPPONENT_EXISTS ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent');")
      echo -e "[!] $opponent team does not exist. Creating team.";
    fi
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
    
    INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($year,'$round',$WINNER_ID,$OPPONENT_ID,$winner_goals,$opponent_goals);")
    echo -e "\n[Game Data]\n\nYear: $year\nRound: $round\nWinning Team: $winner (ID: $WINNER_ID)\nOpponent Team: $opponent (ID: $OPPONENT_ID)\nWinner Goals: $winner_goals\nOpponent Goals: $opponent_goals\n"
  fi
done < "games.csv"
IFS=""