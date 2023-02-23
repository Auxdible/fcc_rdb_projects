#!/bin/bash
# psql variable
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if there is no argument
if [[ ! $1 ]]
then
  # print message and exit application
  echo "Please provide an element as an argument."
else
  # if the argument is a number
  if [[ $1 =~ ^[0-9]*$ ]]
  then
    # try to use it as an atomic number...
    ELEMENT_QUERY=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
  else
    # try to use it as a name...
    ELEMENT_QUERY=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1' OR symbol='$1';")
  fi
  # if there is no element
  if [[ -z $ELEMENT_QUERY ]]
  then
    # print message and exit application
    echo "I could not find that element in the database."
  else
    # obtain element data
    ELEMENT_DATA=$($PSQL "SELECT elements.atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ELEMENT_QUERY;")
    # read element data
    echo $ELEMENT_DATA | while IFS=" | " read ATOMIC_NUMBER SYMBOL NAME MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
fi
