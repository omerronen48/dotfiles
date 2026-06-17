#!/usr/bin/env bash
# Picker over ALL panes running `claude`, across every tmux session — not just
# the dedicated claude-* sessions the tmux-claude-session-manager plugin creates.
# Bound to prefix+u in tmux.conf (after `run tpm`, so it overrides the plugin).
set -uo pipefail

# fields: pane_id | target(sess:win.pane) | "sess winname" | pane_title
rows() {
  tmux list-panes -a -F \
    '#{pane_current_command}|#{pane_id}|#{session_name}:#{window_index}.#{pane_index}|#{session_name} #{window_name}|#{pane_title}' \
    | awk -F'|' '$1=="claude"{ printf "%s\t%s\t%s\t%s\n", $2, $3, $4, $5 }'
}

command -v fzf >/dev/null 2>&1 || { tmux display-message "claude-panes: fzf required"; exit 0; }

sel=$(rows | fzf --ansi --delimiter='\t' --with-nth=3,4 \
  --reverse --cycle --header='Claude panes · enter: jump' \
  --preview='tmux capture-pane -ept {1}' --preview-window='right,62%,wrap')
[ -z "$sel" ] && exit 0

target=$(printf '%s' "$sel" | cut -f2)   # sess:win.pane
tmux switch-client -t "${target%.*}"     # sess:win
tmux select-pane -t "$target"
