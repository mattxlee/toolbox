#!/bin/bash
THEME_DIR=~/Library/Developer/Xcode/UserData/FontAndColorThemes/
[ -d $THEME_DIR ] && rm -rf $THEME_DIR
mkdir -p $THEME_DIR
cp /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/FontAndColorThemes/*.dvtcolortheme $THEME_DIR
cp *.dvtcolortheme $THEME_DIR
chmod -x $THEME_DIR/*
