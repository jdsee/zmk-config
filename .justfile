default_left := "/run/media/jdsee/NICENANO1"
default_right := "/run/media/jdsee/NICENANO"

flash left=default_left right=default_right:
  sudo cp firmware/hillside46_right-nice_nano@2__zmk-zmk.uf2 {{right}}
  sudo cp firmware/hillside46_left-nice_nano@2__zmk-zmk.uf2 {{left}}
  sync

flash-left mount=default_left:
  sudo cp firmware/hillside46_left-nice_nano@2__zmk-zmk.uf2 {{mount}}
  sync

flash-right mount=default_right:
  sudo cp firmware/hillside46_right-nice_nano@2__zmk-zmk.uf2 {{mount}}
  sync

reset left=default_left right=default_right:
  sudo cp firmware/settings_reset-nice_nano@2__zmk-zmk.uf2 {{right}}
  sudo cp firmware/settings_reset-nice_nano@2__zmk-zmk.uf2 {{left}}
  sync

dl:
  rm -rf firmware/*
  gh run download -n firmware -D firmware

s:
  gh run view $(gh run list --limit 1 --json databaseId -q '.[0].databaseId')
