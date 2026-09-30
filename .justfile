flash left right:
  #!/usr/bin/env bash
  set -euo pipefail
  sudo mount {{right}} /mnt/right
  sudo mount {{left}} /mnt/left
  sudo cp firmware/hillside46_right-nice_nano@2__zmk-zmk.uf2 /mnt/right
  sudo cp firmware/hillside46_left-nice_nano@2__zmk-zmk.uf2 /mnt/left
  sync
  sudo umount /mnt/left /mnt/right

dl:
  rm -rf firmware/*
  gh run download -n firmware -D firmware

status:
  gh run view $(gh run list --limit 1 --json databaseId -q '.[0].databaseId')
