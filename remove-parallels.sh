#!/usr/bin/env bash

set -e

# used different forum posts/guides to figure this out like:
# The uninstall script is located at /Library/Parallels/Parallels Service.app/Contents/Resources
# https://github.com/danijeljw/remparallels/blob/master/remprls.sh
# https://kb.parallels.com/122461
# sudo find / -iname "*parallels*"
# sudo find / -iname "*prl*"


#before uninstalling deactivate your licencse - this won't be possible after uninstall
prlsrvctl deactivate-license || true
#sudo rm -rf /Library/Preferences/Parallels/licenses.xml
#prlsrvctl activate-license-online

# killing running processes
for pid in $(ps aux | grep "Parallels*" | grep -v grep | awk '{print $2}'); do sudo kill -HUP $pid; done
for kext in $(kextstat | grep parallels | grep -v grep | awk '{print $6}'); do sudo kextunload $kext; done

# after appcleaner does his magic, do this
sudo rm -rf "/Library/Preferences/Parallels" 
sudo rm -rf "/Library/StagedExtensions/Applications/Parallels Desktop.app"
sudo rm -rf "/Library/Parallels"
sudo rm -rf "/Library/SystemMigration/History/Migration-19876876-8E63-4214-9A73-14A7C10A5A84/QuarantineRoot/Library/StagedExtensions/Applications/Parallels Desktop.app"
sudo rm -rf "/Library/Logs/parallels.log"
sudo rm -rf "/private/var/.Parallels_swap"
sudo rm -rf "/private/var/root/Library/Preferences/com.parallels.desktop.plist"
sudo rm -rf "/private/var/db/Parallels"
sudo rm -rf "/private/var/db/Parallels/Stats/ParallelsDesktop.15.1.3-47255"

sudo rm -rf "/Users/$USER/Library/Saved Application State/com.parallels.desktop.console.savedState"
sudo rm -rf "/Users/$USER/Library/Preferences/Parallels"
sudo rm -rf "/Users/$USER/Library/Preferences/com.parallels.Parallels.plist"
sudo rm -rf "/Users/$USER/Library/Parallels"
sudo rm -rf "/Users/$USER/Library/Logs/parallels.log"
sudo rm -rf "/Users/$USER/Library/Caches/Parallels Software"
sudo rm -rf "/Users/$USER/Parallels"

sudo rm -rf "/Library/Extensions/Parallel\ Desktop.app"
sudo kextcache -invalidate /
sudo kextcache --clear-staging


sudo rm -rf /private/var/db/parallels/stats/*
sudo rm -rf /private/var/db/Parallels/stats/*
sudo rm -rf /private/var/db/parallels/stats
sudo rm -rf /private/var/db/Parallels/stats
sudo rm -rf /private/var/db/parallels
sudo rm -rf /private/var/.parallels_swap
sudo rm -rf /private/var/.Parallels_swap
sudo rm -rf /private/var/db/receipts/'com.parallels*'
sudo rm -rf /private/var/root/library/preferences/com.parallels.desktop.plist
sudo rm -rf /private/tmp/qtsingleapp-*-lockfile
sudo rm -rf /private/tmp/com.apple.installer*/*
sudo rm -rf /private/tmp/com.apple.installer*
sudo rm -rf /System/Library/Extensions/prl*
echo
echo "Parallels Desktop has been removed from your system."
echo
