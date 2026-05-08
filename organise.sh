#!/bin/bash

# Print a welcome message
echo "===== Backup Script Starting ====="

# Copy all files from Logs into the Logs_backup folder
BASE_DIR="/c/Users/kimmo/Documents/TheoWAF/Logs"
BACKUP_DIR="/c/Users/kimmo/Documents/TheoWAF/Logs_backup"

# Create the backup directory
cp -v -a "$BASE_DIR" "$BACKUP_DIR"

# Copy the text to a report.txt file and file to the backup directory
echo "For the period of time" >> "$BACKUP_DIR"/report.txt

# Move all report files to the backup directory
mv -v "$BASE_DIR"/rep*.txt "$BACKUP_DIR"

# Print the log
cat ~/$BACKUP_DIR/report.txt

# Show current date and time
date

# Show who is logged in
whoami

# Show current working directory
pwd

# Go back to the previous higher level directory
cd ..

# Done message
echo "===== Backup Complete! ====="