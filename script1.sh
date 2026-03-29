#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Ravi Kumar Pal | Course: Open Source Software
# Purpose: Displays system info as a welcome/identity screen
# ============================================================

# --- Variables ---
STUDENT_NAME="Mohit Pal"    
SOFTWARE_CHOICE="Python"           # Our chosen open source software
LICENSE_NAME="PSF License (Python Software Foundation License)"

# --- Collecting system information using command substitution ---
DISTRO=$(lsb_release -d | cut -f2)          # Get full distro name
KERNEL=$(uname -r)                           # Get Linux kernel version
USER_NAME=$(whoami)                          # Get current logged in user
HOME_DIR=$HOME                               # Get home directory path
UPTIME=$(uptime -p)                          # Get system uptime in readable form
CURRENT_DATE=$(date '+%d %B %Y')             # Get today's date formatted nicely
CURRENT_TIME=$(date '+%H:%M:%S')             # Get current time

# --- Display the system identity report ---
echo "============================================================"
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================"
echo ""
echo "  Student Name    : $STUDENT_NAME"
echo "  Chosen Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Linux Distro    : $DISTRO"
echo "  Kernel Version  : $KERNEL"
echo "  Logged In User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Date            : $CURRENT_DATE"
echo "  Time            : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE LICENSE INFO"
echo "------------------------------------------------------------"
echo "  This OS (Ubuntu) is licensed under:"
echo "  GNU General Public License v2 (GPL v2)"
echo ""
echo "  Our chosen software Python is licensed under:"
echo "  $LICENSE_NAME"
echo ""
echo "  Both licenses guarantee the four freedoms:"
echo "  1. Freedom to run the program"
echo "  2. Freedom to study and modify the source"
echo "  3. Freedom to redistribute copies"
echo "  4. Freedom to distribute modified versions"
echo ""
echo "============================================================"
echo "  Audit prepared by: $STUDENT_NAME"
echo "============================================================"
