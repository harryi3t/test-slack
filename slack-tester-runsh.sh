#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

testEnv() {
  RES_PARAMS="mesg_and_token"
  RES_PARAMS_UP=$(echo $RES_PARAMS | awk '{print toupper($0)}')
  RES_PARAMS_STR=$RES_PARAMS_UP"_PARAMS"
  SLACK_TOKEN=$(eval echo "$"$RES_PARAMS_STR"_TOKEN")
  echo ""
  echo "slack token (chetan's way): $SLACK_TOKEN"
  echo ""
  echo "trying shrivara's way:"
  printenv
  echo ""
}

main() {
  format "$YELLOW" "Starting slack-tester-runsh script"

  format "$BLUE" "this should generate a message and the destination room"
  format "$BLUE" "that it will pass to the slack-service"
  format "$BLUE" "slack-service will send it to the room specified"
  echo ""

  format "$YELLOW" "content of mesg-and-token params resource"

  cd /build/IN/mesg-and-token

  sed -E "s,(.*)=(.*),\1_param=\"\2\",g" params > params.conf
  source params.conf

  if [ -z "$token_param" ];then
    format "$RED" "Error. token not found"
    exit 1
  fi
  if [ -z "$message_param" ];then
    format "$RED" "Error. message not found"
    exit 1
  fi

  echo "message is: $message_param"
  echo "token is: $token_param"

  cat params.conf > $JOB_STATE/slack-tester.env
  echo "have written the token and message to the env file in the state folder"
  echo "this should be avialable to the slack-service in the /build/IN/slack-tester/runSh/slack-tester.env file"
}

main
testEnv
