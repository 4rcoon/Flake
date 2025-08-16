#!/usr/bin/env bash

CONFIG_DIR="$HOME/.config/sway"
STATE_FILE="$CONFIG_DIR/layout_state"
NEW_LAYOUT=""


# Lire l'état actuel (par défaut: us)
if [[ -f "$STATE_FILE" ]]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT="us"
fi

if [[ "$CURRENT" == "us" ]]; then
    # Passer en FR
    CURRENT="fr"
else
    # Passer en US
    CURRENT="us"
fi


# Change workspace config
cp $CONFIG_DIR/workspace_$CURRENT.conf $CONFIG_DIR/workspace_selected.conf

# Change state file
echo $CURRENT > "$STATE_FILE"

# Recharger sway pour appliquer les nouveaux bindings
swaymsg reload

# Change layout
swaymsg input "*" xkb_layout $CURRENT

# Message
swaynag -t warning -m "Clavier: $CURRENT"

