#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞 \
                          update-freq=30 \
                          script="$PLUGIN_DIR/calendar.sh" 

