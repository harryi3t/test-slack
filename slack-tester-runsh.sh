#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

main() {
  format "$YELLOW" "Starting slack-tester-runsh script"

  cd /build/IN/mesg-and-token
  sed -E "s,(.*)=(.*),\1_param=\"\2\",g" params > params.conf
  source params.conf

  cat params.conf > $JOB_STATE/slack-tester.env
  echo "have written the params (webhookurl, channel & message) to the env file in the state folder"
  echo "this should be avialable to the slack-service in the /build/IN/slack-tester/runSh/slack-tester.env file"
}

main
