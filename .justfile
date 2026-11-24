default_left := "/run/media/jdsee/NICENANO"
default_right := "/run/media/jdsee/NICENANO1"

flash:
  nix run .#flash

flash-main part="left":
  nix run .#flash -- {{part}}

reset left=default_left right=default_right:
  sudo cp firmware/settings_reset-nice_nano@2__zmk-zmk.uf2 {{right}}
  sudo cp firmware/settings_reset-nice_nano@2__zmk-zmk.uf2 {{left}}
  sync

dl:
  rm -rf firmware/*
  gh run download -n firmware -D firmware

s:
  gh run view $(gh run list --limit 1 --json databaseId -q '.[0].databaseId')
