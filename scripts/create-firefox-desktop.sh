#!/bin/bash

# A script to create additional firefox desktop entry for specific profiles

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root or with sudo"
   exit 1
fi

# Check if the correct number of arguments is passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <UserName> <ProfileName>"
    exit 1
fi

USER_NAME=$1
PROFILE_NAME=$2
USER_HOME=/home/$USER_NAME
NEW_FILE_NAME=firefox-$PROFILE_NAME.desktop

# Check if a valid home directory was obtained
if [ -z "$USER_HOME" ] || [ ! -d "$USER_HOME" ]; then
    echo "Error: The specified username does not exist or the home directory is inaccessible."
    exit 1
fi

# Define source and target paths
SOURCE_FILE=/usr/share/applications/firefox.desktop
TARGET_DIR=$USER_HOME/.local/share/applications
TARGET_FILE=$TARGET_DIR/$NEW_FILE_NAME

# Copy the original desktop file to the local applications directory
cp $SOURCE_FILE $TARGET_FILE

# Check if copy was successful
if [ ! -f "$TARGET_FILE" ]; then
    echo "Failed to copy the desktop file. Make sure the source file exists."
    exit 1
fi

# Modify the Name line to include the profile name
sed -i "s|^Name=Firefox Web Browser|Name=Firefox Web Browser - ${PROFILE_NAME^}|g" $TARGET_FILE

# Modify the Exec lines to use the specific profile
sed -i "s|^Exec=/usr/lib/firefox/firefox %u|Exec=/usr/lib/firefox/firefox -P $PROFILE_NAME --no-remote %u|g" $TARGET_FILE
sed -i "s|^Exec=/usr/lib/firefox/firefox --new-window %u|Exec=/usr/lib/firefox/firefox -P $PROFILE_NAME --no-remote --new-window %u|g" $TARGET_FILE
sed -i "s|^Exec=/usr/lib/firefox/firefox --private-window %u|Exec=/usr/lib/firefox/firefox -P $PROFILE_NAME --no-remote --private-window %u|g" $TARGET_FILE
sed -i "s|^Exec=/usr/lib/firefox/firefox --ProfileManager|Exec=/usr/lib/firefox/firefox -P $PROFILE_NAME --no-remote --ProfileManager|g" $TARGET_FILE


echo "Desktop file created for profile '$PROFILE_NAME' as '$TARGET_FILE'"
