#!/bin/bash -e
source color.sh

format() {
  echo "|-$BOLD$1 $2 $NORMAL"
}

main() {
  format "$YELLOW" "Starting slack-service-runsh script"
  source /build/IN/slack-tester/runSh/slack-tester.env

  format "$BLUE" "Running scipt"
  cd /build/IN/slack-service-repo/gitRepo && ./post.sh $webhook_param $channel_param $message_param
}

main
