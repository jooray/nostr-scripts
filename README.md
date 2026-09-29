# nostr-scripts

These are a few scripts that I use for Nostr.

<!-- jooray-links:start -->
### More from me

**Related projects**

- [nostr-emanator](https://github.com/jooray/nostr-emanator): schedule Nostr posts, paired over NIP-46 and Amber
- [nostrautica](https://github.com/jooray/nostrautica): Nostr-native event organizer with end-to-end encrypted data
- [nsite-clay](https://github.com/jooray/nsite-clay): a self-editable site on Nostr, all in one HTML file
- [oracolo](https://github.com/jooray/oracolo): a Nostr blog in a single HTML file
- [anonmicroblog](https://github.com/jooray/anonmicroblog): anonymous microblogs on Nostr

**Full project showcase:** [Nostr Scripts in my project showcase](https://juraj.bednar.io/showcase/#PUB-07), or [all my projects](https://juraj.bednar.io/showcase/).

I write about building things on [my blog](https://juraj.bednar.io/en/blog-en/). I also wrote a cypherpunk novel, [Tamers of Entropy](https://tamersofentropy.net/), and there is a [trailer](https://tamersofentropy.net/#trailer).
<!-- jooray-links:end -->

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
