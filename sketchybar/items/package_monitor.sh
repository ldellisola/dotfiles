#!/bin/bash

sketchybar    --add item packages right \
              --set packages update_freq=1800 \
              --set packages script="$PLUGIN_DIR/package_monitor.sh" \
              --set packages label=􀐛
