#!/bin/bash
SOURCE="Ivy Audio - Piano in 162 sfz.zip"
SAMPLES="Ivy Audio - Piano in 162 sfz/Piano in 162 Samples"
TARGET="Audio Music Apps/Samples/Piano 162"
if ! test -f "$SOURCE"; then
  echo "Put the '$SOURCE' file next to this script!"
  exit 1
fi
if ! command -v brew &> /dev/null; then
  echo "*** INSTALLING HOMEBREW"
  #$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
fi
brew install p7zip flac
echo "*** EXTRACTING"
if test "$1" = "test"; then
  7za x "$SOURCE" -aos '-i!Ivy Audio - Piano in 162 sfz/Piano in 162 Samples/Ambient/PedalOffAmbient/01*'
  7za x "$SOURCE" -aos '-i!Ivy Audio - Piano in 162 sfz/Piano in 162 Samples/Close/PedalOffClose/01*'
else
  7za x "$SOURCE"
fi
echo "*** REMOVING ROUND ROBINS"
find "$SAMPLES" -name \*2Close.flac -exec rm {} \;
find "$SAMPLES" -name \*2Ambient.flac -exec rm {} \;
echo "*** CONVERTING TO WAV"
find "$SAMPLES" -name \*flac -exec flac -d -f {} \;
echo "*** REMOVING FLAC FILES"
find "$SAMPLES" -name \*.flac -exec rm {} \;
echo "*** MOVING FILES"
mv -f "$SAMPLES/Close" "$TARGET"
mv -f "$SAMPLES/Ambient" "$TARGET"
echo "*** DONE"
echo "Move samples from this folder to the Logic Pro samplers folder"
