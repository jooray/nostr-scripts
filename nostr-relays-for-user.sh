#!/usr/bin/env bash
# get-relays.sh — fetch a NIP-65 relay list (kind:10002) for a pubkey using nak + jq
# deps: nak, jq
# usage:
#   export author=<hex-pubkey>
#   ./get-relays.sh
#   RELAYS="wss://relay.damus.io wss://nos.lol" ./get-relays.sh   # optional custom relay set

set -euo pipefail

if [[ -z "${author:-}" ]]; then
    echo "error: set \$author to the user's hex pubkey." >&2
    exit 1
fi

# You can override the relay set via RELAYS env var (space-separated).
# These defaults are a balanced, commonly reachable mix.
read -r -a RELAY_LIST <<<"${RELAYS:-wss://relay.damus.io wss://nos.lol wss://nostr.wine wss://relay.primal.net wss://nostr.mom wss://nostr.fmt.wiz.biz wss://relay.nostr.band}"

nak req -k 10002 -a "$author" "${RELAY_LIST[@]}" |
    jq -r -s '
      (sort_by(.created_at)|last).tags
      | map(select(.[0]=="r"))
      | .[]
      | .[1]
    '
