#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

main() {
  format "$YELLOW" "Starting slack-service-runsh script"

  format "$BLUE" 'cat "IN/slack-tester/runSh/slack-tester.env"'
  cat "IN/slack-tester/runSh/slack-tester.env"

  format "$BLUE" 'ls "IN/slack-tester/runSh"'
  ls "IN/slack-tester/runSh"

  format "$BLUE" "\nRunning scipt"
  cd IN/slack-service-repo/gitRepo && ./script.sh

  format "$BLUE" "sleeping for 4 min"
  sleep 240
}

main
