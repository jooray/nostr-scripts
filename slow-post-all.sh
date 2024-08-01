#!/bin/bash

# Take a file as argument and publish it to relays mentioned in the for cycle below
# File should be a jsonl file with one json object per line

for RELAY in wss://relay.nostrplebs.com wss://relay.nostr.band
do
    echo "Publishing to ${RELAY}"
    # We can post to different relays in parallel, they don't know about each other
    python3 slow-post.py "${RELAY}" < "${1}" &
done
