#!/usr/bin/env bash

set -e
echo
if [[ -z $1 ]]; then
    echo "macos codename expected as first argument (e.g. Sonoma) Exiting."
    exit 1
fi

CODENAME=$1


echo "This script will create a bootable iso disk image from the macOS installer."
echo
echo "You can then use this image to create a bootable USB drive."
echo
echo "Creating disk image..."
echo
hdiutil create -o "/tmp/$CODENAME" -size 30720m -volname "$CODENAME" -layout SPUD -fs HFS+J
echo
echo "Mounting disk image..."
echo
hdiutil attach "/tmp/$CODENAME.dmg" -noverify -mountpoint "/Volumes/$CODENAME"
echo
echo "Creating bootable installer..."
echo
sudo 
"/Applications/Install macOS $CODENAME.app/Contents/Resources/createinstallmedia" --volume "/Volumes/$CODENAME" --nointeraction
echo
echo "Unmounting disk image..."
echo
hdiutil detach "/volumes/Install macOS $CODENAME"
echo
echo "Converting disk image to ISO..."
echo
hdiutil convert "/tmp/$CODENAME.dmg" -format UDTO -o "$HOME/Desktop/$CODENAME.cdr"
echo
echo "Renaming ISO..."
echo
mv "$HOME/Desktop/$CODENAME.cdr" "$HOME/Desktop/$CODENAME.iso"
echo "Deleting disk image..."
echo
rm "/tmp/$CODENAME.dmg"
echo "Done! Your ISO is located at $HOME/Desktop/$CODENAME.iso"
