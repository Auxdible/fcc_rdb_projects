#!/bin/bash
# psql variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# random number between 1 and 1000
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

# title!
echo -e "\n~~ Number Guessing Game ~~"

# start guess function
# $1 = user id
# $2 = amount of guesses prior to current
# $3 = message to show
START_GUESS() {
  # get the new number of guesses
  NUMBER_OF_GUESSES=$(($2 + 1))

  # if there is no user id (bug)
  if [[ ! $1 ]]
  then
    # exit
    echo "No user id given, exiting."
  else
    # send message!
    echo -e $3 
    
    # read guess
    read GUESS
    
    # if guess is not an integer
    if [[ ! $GUESS =~ ^[0-9]*$ ]]
    then
      # restart
      START_GUESS $1 $2 "That is not an integer, guess again:"
    else
      # if guess is equal to the number
      if [[ $GUESS = $RANDOM_NUMBER ]]
      then
        # update the games played in psql
        UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id=$1;")
        # get the personal best
        PERSONAL_BEST=$($PSQL "SELECT best_game FROM users WHERE user_id=$1;")
        # if the personal best = 0 or if the number of guesses is less than the personal best
        if [[ 0 = $PERSONAL_BEST || $NUMBER_OF_GUESSES -lt $PERSONAL_BEST ]]
          then
          # update the personal best
          UPDATE_PB=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$1")
        fi
        # send the message with the stats of the game and exit
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      else
        # if the guess is greater than the number
        if [[ $GUESS -gt $RANDOM_NUMBER ]]
        then
          # prompt to guess again, lower than random number.
          START_GUESS $1 $NUMBER_OF_GUESSES "It's lower than that, guess again:"
        else
          # if the guess is less than the number
          if [[ $GUESS -lt $RANDOM_NUMBER ]]
            then
              # prompt to guess again, higher than random number.
              START_GUESS $1 $NUMBER_OF_GUESSES "It's higher than that, guess again:"
          fi
          
        fi
      fi
    fi
    
  fi
}

# login
LOGIN() {
  # prompt to enter username
  echo -e "\nEnter your username:\n"
  # get the username
  read USERNAME
  # query the username to see if a user exists
  USER_QUERY=$($PSQL "SELECT * FROM users WHERE name='$USERNAME'")
  # if there is no user
  if [[ -z $USER_QUERY ]]
    then
    # create the user and welcome them
    CREATE_USER=$($PSQL "INSERT INTO users(name) VALUES ('$USERNAME');")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    
    else
    # summarize stats and welcome user
    echo $USER_QUERY | while IFS=" | " read USER_ID NAME GAMES_PLAYED BEST_GAME
    do
    echo -e "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  # get the user id for START_GUESS
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")
  # let the games begin!!!
  START_GUESS $USER_ID 0 "Guess the secret number between 1 and 1000:"
}
# login to start script
LOGIN
