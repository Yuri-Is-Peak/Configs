#!/usr/bin/env bash
# kill-hypr-windows.sh
# Kills all Hyprland client windows except classes in the exclusion list.
# Detaches from the terminal (uses setsid or nohup).

set -euo pipefail

# Default classes to exclude (lowercase). Add other compositor/daemon classes here.
DEFAULT_EXCLUDE=(waybar awww hyprpaper swaybg) 

# Optional: set EXCLUDE_CLASSES="class1,class2" in env to add more (comma-separated).
IFS=',' read -r -a USER_EXCLUDE <<< "${EXCLUDE_CLASSES:-}"

EXCLUDE=("${DEFAULT_EXCLUDE[@]}" "${USER_EXCLUDE[@]}")

# Helper: lowercase
_lc() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]'; }

# Fetch clients JSON
if ! clients_json="$(hyprctl -j clients 2>/dev/null)"; then
  printf 'hyprctl: failed to query clients\n' >&2
  exit 1
fi

# Build semicolon-separated batch of dispatch killwindow commands.
CMDS=""
# Parse each client into: address, class, monitor
# Use jq to output address<TAB>class<TAB>monitor for stable parsing.
while IFS=$'\t' read -r addr cls monitor; do
  # skip entries without address or on monitor -1 (special/internal)
  [ -z "$addr" ] && continue
  [ "$monitor" = "-1" ] && continue

  # cls might be null/empty - treat as skip
  [ -z "$cls" ] && continue

  cls_lc="$(_lc "$cls")"
  skip=0
  for ex in "${EXCLUDE[@]}"; do
    [ -z "$ex" ] && continue
    if [ "$cls_lc" = "$(_lc "$ex")" ]; then
      skip=1
      break
    fi
  done
  [ "$skip" -eq 1 ] && continue

  # Append kill command for this unique address
  CMDS+="dispatch killwindow address:$addr; "
done < <(printf '%s' "$clients_json" | jq -r '.[] | "\(.address)\t\(.class // "")\t\(.monitor)"')

# Nothing to do
[ -z "$CMDS" ] && exit 0

# Run the batch of commands detached from the current terminal.
# Use hyprctl --batch for efficiency.
if command -v setsid >/dev/null 2>&1; then
  # expand CMDS before invoking setsid so it's safe even if the calling shell is killed
  setsid sh -c "hyprctl --batch \"$CMDS\"" >/dev/null 2>&1 &
else
  nohup sh -c "hyprctl --batch \"$CMDS\"" >/dev/null 2>&1 &
fi

exit 0
