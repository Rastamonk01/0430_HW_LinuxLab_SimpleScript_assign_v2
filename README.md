# organise_sh_BackupUtility

![Shell](https://img.shields.io/badge/Shell-Bash_Script-green?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Commands-yellow?style=for-the-badge&logo=linux&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-Git_Bash-blue?style=for-the-badge&logo=windows&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

---

## Scenario

Imagine you're a systems administrator responsible for keeping an organised and auditable record of departmental logs. Every day, new log files and report files accumulate in a shared Logs folder. It's your job to build a utility that automatically creates a full backup of that folder, appends a note to the backup report, moves all relevant report files into the backup directory, and then confirms the outcome by printing a summary of what was done, including who ran the script, when it ran, and from where.

---

## What the Script Does

`organise.sh` runs top to bottom in 11 clear steps:

1. Prints a welcome banner to the terminal
2. Defines the source (`BASE_DIR`) and destination (`BACKUP_DIR`) path variables
3. Copies the entire Logs directory into the Logs_backup folder with verbose output
4. Appends a written note to `report.txt` inside the backup directory
5. Moves all `rep*.txt` report files from Logs into the backup directory with verbose output
6. Prints the contents of `report.txt` to the terminal
7. Displays the current date and time
8. Displays the name of the currently logged-in user
9. Displays the current working directory
10. Navigates up one directory level
11. Prints a completion banner to the terminal

---

## File Structure

```
organise_sh_BackupUtility/
├── organise.sh     ← The script (run this)
└── README.md
```

---

## Linux Commands Used

### 1. `echo`
**Definition:** Prints a string of text to standard output. Combined with `>>` it appends a line to a file without overwriting existing content.  
**Why I used it:** Used to print the welcome and completion banners to the terminal, and to append an informational note into `report.txt` inside the backup directory.

---

### 2. `cp -v -a`
**Definition:** Copies files or directories. `-a` (archive) copies recursively while preserving all file attributes including permissions, timestamps, and ownership. `-v` (verbose) prints each file as it is copied.  
**Why I used it:** Creates a complete, attribute-preserving backup of the entire Logs directory into Logs_backup, with visible confirmation of every file copied.

---

### 3. `mv -v`
**Definition:** Moves files or directories from one location to another. When the source and destination share the same directory it renames the file. `-v` (verbose) prints each item as it is moved.  
**Why I used it:** Relocates all report files matching the `rep*.txt` pattern from the Logs source directory into the backup directory, with visible confirmation of each move.

---

### 4. `cat`
**Definition:** Reads and outputs the contents of a file to standard output.  
**Why I used it:** Displays the final contents of `report.txt` directly in the terminal so the operator can immediately verify what was written to the backup report.

---

### 5. `date`
**Definition:** Outputs the current system date and time.  
**Why I used it:** Stamps the terminal output with an exact time so there is a record of precisely when the backup run was executed.

---

### 6. `whoami`
**Definition:** Prints the username of the currently logged-in user.  
**Why I used it:** Records which user account ran the script; useful for accountability and auditing in shared or multi-user environments.

---

### 7. `pwd`
**Definition:** Prints the absolute path of the current working directory.  
**Why I used it:** Confirms the exact location from which the script was executed, which is helpful context for debugging any path-related issues.

---

### 8. `cd ..`
**Definition:** Changes the current working directory to the parent directory (one level up).  
**Why I used it:** Returns the shell session to a higher-level directory after the script completes, leaving the environment in a clean navigational state.

---

## Command Flags Summary

| Flag | Command | Purpose |
|---|---|---|
| `-a` | `cp` | Archive mode - recursive copy preserving all file attributes |
| `-v` | `cp` | Verbose - print each file as it is copied |
| `-v` | `mv` | Verbose - print each file as it is moved |
| `>>` | `echo` | Append output to a file without overwriting |

---

## Wildcard Used

| Pattern | Context | Purpose |
|---|---|---|
| `rep*.txt` | `mv` source | Matches any `.txt` file whose name begins with `rep` - selects all report files in one step without naming them individually |

---

## How to Run

```bash
# Clone the repo
git clone https://github.com/<yourUser>/organise_sh_BackupUtility.git

# Navigate into the directory
cd organise_sh_BackupUtility

# Make the script executable
chmod +x organise.sh

# Run the script
./organise.sh
```

The backup is saved to:
```
/c/Users/kimmo/Documents/TheoWAF/Logs_backup/
```

The run report is saved to:
```
/c/Users/kimmo/Documents/TheoWAF/Logs_backup/report.txt
```

---

## Git Workflow Used

```bash
git status
git add .
git status
git commit -m "Add log backup organiser utility script and README"
git push
```
