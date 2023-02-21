#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~ My Salon ~~"
echo -e "\nWelcome to My Salon, how can I help you?"
SERVICES_MENU() {
  # print argument
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # get all services
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  # print every service
  echo "$SERVICES" | while read SERVICE_ID PIPE NAME
  do
      echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SCHEDULE $SERVICE_ID_SELECTED
}
SCHEDULE() {
  if [[ ! $1 ]]
  then
    SERVICES_MENU
  fi
  # if the service id is not a number
    if [[ -z $1 || ! $1 =~ ^[0-9]*$ ]] 
    then
      # send to service menu
      SERVICES_MENU "That is not a number."
    else
      # get the service with the service id
      REQUEST_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$1")
      # if the service does not exist
      if [[ -z $REQUEST_SERVICE ]]
      then
        # send to service menu
        SERVICES_MENU "That service does not exist."
      else
        SERVICE_NAME_FORMATTED=$( echo "$REQUEST_SERVICE" | sed -E 's/^ *| *$//g')
        # ask for number
        echo -e "\nWhat is your phone number?"
        read CUSTOMER_PHONE
        
        # get if the number is valid
        if [[ -z $CUSTOMER_PHONE ]]
          then
            # send to service menu
            SERVICES_MENU "That is not a valid phone number."
          else
            # get customer from number
            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
            # if customer id is empty
            if [[ -z $CUSTOMER_ID ]]
              then
                # get customer name
                echo -e "\nWhat is your name?"
                read CUSTOMER_NAME
                # create customer
                if [[ -z $CUSTOMER_NAME ]]
                  then
                    SERVICES_MENU "You need to enter a name!"
                  else
                    CREATE_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
                fi
                CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'") 
              else
                CUSTOMER_NAME=$(echo "$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")" | sed -E 's/^ *| *$//g')
            fi
            echo -e "What time do you want your appointment to be?"
            read SERVICE_TIME
            CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ($CUSTOMER_ID,$1,'$SERVICE_TIME')")
            echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
      fi
    fi
 }
SERVICES_MENU