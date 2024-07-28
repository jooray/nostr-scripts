# nostr-scripts

These are a few scripts that I use for Nostr.

They usually need [nak](https://github.com/fiatjaf/nak) in PATH.

## nostr-backup.sh

Used to backup my notes to my own relay. You need to edit the script to configure everything,
it's well commented.

I run it from cron.

## slow-post.py

Used to slowly post events to a nostr relay. Many relays have rate limits, so I want to delay
posting, so I don't hammer them with events. You can adjust the speed of posting by changing the sleep time in the source code.

## slow-post-all.sh

Micro script that orchestrates posting to many relays at once. Uses slow-post.py.
