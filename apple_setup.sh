#!/bin/bash
# key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# remap right option to right control
hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x7000000e6,
      "HIDKeyboardModifierMappingDst":0x7000000e4}]
}'

