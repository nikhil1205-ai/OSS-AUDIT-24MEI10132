#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Mohit Pal  | Reg No: 24BEY10122
# Course: Open Source Software | Chosen Software: Python
# Purpose: Loops through key system directories and reports
#          their permissions, ownership, and disk usage
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "============================================================"
echo ""
echo "  Auditing key Linux system directories..."
echo ""
printf "  %-20s %-25s %-10s\n" "DIRECTORY" "PERMISSIONS (type user group)" "SIZE"
echo "  --------------------------------------------------------------------"

# --- For loop: goes through each directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before trying to inspect it
    if [ -d "$DIR" ]; then

        # Extract permissions, owner user, and owner group using awk
        # ls -ld gives a long listing of the directory itself (not its contents)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Get the size of the directory using du (disk usage)
        # -s = summarise, -h = human readable, 2>/dev/null hides permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print in formatted columns
        printf "  %-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        # If directory doesn't exist, report it clearly
        printf "  %-20s %s\n" "$DIR" "[does not exist on this system]"
    fi

done

echo ""
echo "------------------------------------------------------------"
echo "  PYTHON-SPECIFIC DIRECTORY AUDIT"
echo "------------------------------------------------------------"
echo ""

# --- Check Python's specific installation directories ---
# These are the directories Python uses on our Ubuntu system
PYTHON_DIRS=(
    "/usr/bin/python3"
    "/usr/lib/python3"
    "/usr/lib/python3.12"
    "/usr/lib/python3/dist-packages"
)

echo "  Checking Python installation directories..."
echo ""

for PDIR in "${PYTHON_DIRS[@]}"; do

    # Check if it's a file (the binary) or a directory
    if [ -f "$PDIR" ]; then
        # For files, use ls -lh for size and permissions
        PERMS=$(ls -lh "$PDIR" | awk '{print $1, $3, $4}')
        SIZE=$(ls -lh "$PDIR" | awk '{print $5}')
        printf "  %-40s %-25s %-10s\n" "$PDIR" "$PERMS" "$SIZE"

    elif [ -d "$PDIR" ]; then
        PERMS=$(ls -ld "$PDIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$PDIR" 2>/dev/null | cut -f1)
        printf "  %-40s %-25s %-10s\n" "$PDIR" "$PERMS" "$SIZE"

    else
        printf "  %-40s %s\n" "$PDIR" "[not found]"
    fi

done

echo ""
echo "------------------------------------------------------------"
echo "  SECURITY NOTE"
echo "------------------------------------------------------------"
echo "  All Python system files are owned by root."
echo "  Regular users can READ and EXECUTE but cannot MODIFY them."
echo "  This prevents privilege escalation through library poisoning."
echo "============================================================"
