#!/bin/bash

# Gets the events authored by users mentioned in the for cycle
# and publishes them to a target relay

# Use when you deploy your own relay and want to use it as a backup
# for your events

# See comments for what and how to adjust

# Where to publish it to (f.e. your own relay)
TARGET_RELAY="wss://nostr.my.relay"
# Since when to start getting events. If you run this from cron, can be
# for example 7 days ago.
SINCE=$(date -d "7 days ago" +%s)
# For first run:
# SINCE=0

# Make sure ~/tmp exists, or else it will fail
> ~/tmp/nostr-backup.json

# hex of the nostr account you want to backup (get hex from npub
# at https://nostrcheck.me/converter/ )
# You can add as many as you want, add \ to the end of each but the last line

for author in \
  "dab6c6065c439b9bafb0b0f1ff5a0c68273bce5c1959a4158ad6a70851f507b6"
do
    echo "Getting notes for author ${author}..."
    # Here is the set of source relays (where we want to get events from)
    for relay in \
        "wss://nostr.mom" \
        'wss://nos.lol' \
        'wss://nostr.bitcoiner.social' \
        'wss://relay.nostr.band' \
        'wss://relay.damus.io' \
        'wss://relay.nostrplebs.com'
    do
        echo " --> from relay ${relay}..."
        nak req --author "${author}" --since "${SINCE}" "${relay}" >> ~/tmp/nostr-backup.json
    done
done

echo "Publishing to ${TARGET_RELAY}..."
sort -u ~/tmp/nostr-backup.json | nak event ${TARGET_RELAY}
