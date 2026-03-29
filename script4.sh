#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Mohit Pal  | Reg No: 24BEY10122
# Course: Open Source Software | Chosen Software: Python
# Purpose: Reads a log file, counts keyword occurrences,
#          and prints a summary with matching lines
# Usage  : ./script4.sh /path/to/logfile [keyword]
# Example: ./script4.sh /var/log/dpkg.log python
# ============================================================

# --- Accept log file path as first argument ---
# $1 is the first command-line argument passed to the script
LOGFILE=$1

# --- Accept keyword as second argument, default to "error" if not given ---
# ${2:-"error"} means: use $2 if provided, otherwise use "error"
KEYWORD=${2:-"python"}

# --- Counters ---
COUNT=0          # Counts how many lines matched the keyword
LINE_NUM=0       # Tracks current line number for display

# --- Validate that user actually provided a log file argument ---
if [ -z "$LOGFILE" ]; then
    echo "============================================================"
    echo "  ERROR: No log file specified."
    echo "  Usage: ./script4.sh /path/to/logfile [keyword]"
    echo "  Example: ./script4.sh /var/log/dpkg.log python"
    echo "============================================================"
    exit 1
fi

# --- Check if the file exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo "============================================================"
    echo "  ERROR: File '$LOGFILE' not found."
    echo "  Please check the path and try again."
    echo "============================================================"
    exit 1
fi

# --- Check if the file is empty ---
# If empty, show a warning but continue (do-while style retry concept)
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: The file '$LOGFILE' is empty."
    echo "  Trying alternative log: /var/log/dpkg.log"
    echo ""
    # Retry with dpkg.log as fallback
    LOGFILE="/var/log/dpkg.log"
    if [ ! -f "$LOGFILE" ]; then
        echo "  Fallback file also not found. Exiting."
        exit 1
    fi
fi

echo "============================================================"
echo "         LOG FILE ANALYZER"
echo "============================================================"
echo ""
echo "  Log File  : $LOGFILE"
echo "  Keyword   : '$KEYWORD' (case-insensitive search)"
echo ""
echo "------------------------------------------------------------"
echo "  MATCHING LINES"
echo "------------------------------------------------------------"
echo ""

# --- While read loop: reads the log file one line at a time ---
# IFS= prevents trimming of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do
    LINE_NUM=$((LINE_NUM + 1))

    # --- If statement inside loop: check if line contains keyword ---
    # grep -iq = case-insensitive (-i) and quiet mode (-q, no output)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))    # Increment match counter

        # Print only first 10 matches to avoid flooding the screen
        if [ $COUNT -le 10 ]; then
            echo "  Line $LINE_NUM: $LINE"
        fi
    fi

done < "$LOGFILE"    # Redirect file content into the while loop

echo ""

# --- If more than 10 matches, tell the user ---
if [ $COUNT -gt 10 ]; then
    echo "  ... and $((COUNT - 10)) more matching lines (showing first 10 only)"
    echo ""
fi

echo "------------------------------------------------------------"
echo "  LAST 5 MATCHING LINES (using grep + tail)"
echo "------------------------------------------------------------"
echo ""

# --- Use grep piped to tail to show last 5 matches ---
# -i = case insensitive, --color=never = clean output
grep -i --color=never "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r LASTLINE; do
    echo "  >> $LASTLINE"
done

echo ""
echo "------------------------------------------------------------"
echo "  SUMMARY"
echo "------------------------------------------------------------"
echo "  Total lines in file : $LINE_NUM"
echo "  Keyword searched    : '$KEYWORD'"
echo "  Total matches found : $COUNT"
echo ""

# --- Final verdict based on count ---
if [ $COUNT -eq 0 ]; then
    echo "  Result: No occurrences of '$KEYWORD' found in the log."
elif [ $COUNT -lt 5 ]; then
    echo "  Result: Few occurrences found — system looks healthy."
else
    echo "  Result: Multiple occurrences found — worth investigating."
fi

echo "============================================================"
