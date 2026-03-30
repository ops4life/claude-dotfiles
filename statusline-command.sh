#!/bin/sh
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# Build a 10-character progress bar from a percentage value
make_bar() {
  pct="$1"
  filled=$(awk "BEGIN { x = int($pct / 10 + 0.5); if (x > 10) x = 10; print x }")
  empty=$((10 - filled))
  bar=""
  i=0
  while [ "$i" -lt "$filled" ]; do bar="${bar}▓"; i=$((i + 1)); done
  while [ "$i" -lt 10 ]; do bar="${bar}░"; i=$((i + 1)); done
  printf "%s" "$bar"
}

# 5-hour session limit usage
if [ -n "$five" ]; then
  five_pct=$(printf "%.0f" "$five")
  five_display="5h:$(make_bar "$five") ${five_pct}%"
else
  five_display=""
fi

# Weekly rate limit usage
if [ -n "$week" ]; then
  week_pct=$(printf "%.0f" "$week")
  week_display="7d:$(make_bar "$week") ${week_pct}%"
else
  week_display=""
fi

# Combine parts
parts="$model"
[ -n "$five_display" ] && parts="$parts | $five_display"
[ -n "$week_display" ] && parts="$parts  $week_display"

printf "%s" "$parts"
