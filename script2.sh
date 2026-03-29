#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Mohit Pal  | Reg No: 24BEY10122
# Course: Open Source Software | Chosen Software: Python
# Purpose: Checks if a FOSS package is installed, shows its
#          version and license, and prints a philosophy note
# ============================================================

# --- Package to inspect (our chosen software) ---
PACKAGE="python3"

echo "============================================================"
echo "         FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo ""
echo "  Inspecting package: $PACKAGE"
echo ""

# --- Check if the package is installed using dpkg ---
# dpkg -s checks the status of a package; we redirect errors to /dev/null
if dpkg -s $PACKAGE &>/dev/null; then
    echo "  [STATUS] $PACKAGE is INSTALLED on this system."
    echo ""

    # --- Extract version information from dpkg ---
    VERSION=$(dpkg -s $PACKAGE | grep -E '^Version' | awk '{print $2}')
    echo "  Version         : $VERSION"

    # --- Extract license info (Ubuntu stores this in copyright files) ---
    COPYRIGHT_FILE="/usr/share/doc/${PACKAGE}/copyright"
    if [ -f "$COPYRIGHT_FILE" ]; then
        # Grab first line mentioning license from copyright file
        LICENSE_LINE=$(grep -i "license" "$COPYRIGHT_FILE" | head -1)
        echo "  License Info    : $LICENSE_LINE"
    else
        echo "  License         : PSF License (Python Software Foundation)"
    fi

    # --- Show where the binary is installed ---
    BINARY_PATH=$(which python3)
    echo "  Binary Location : $BINARY_PATH"

    # --- Show installed version from python itself ---
    PY_VERSION=$(python3 --version 2>&1)
    echo "  Python Reports  : $PY_VERSION"

else
    echo "  [STATUS] $PACKAGE is NOT installed on this system."
    echo "  To install it, run: sudo apt install python3 -y"
fi

echo ""
echo "------------------------------------------------------------"
echo "  PHILOSOPHY NOTES — FOSS PACKAGES"
echo "------------------------------------------------------------"
echo ""

# --- Case statement: prints a philosophy note for known packages ---
# This demonstrates the case construct in bash scripting
case $PACKAGE in
    python3)
        echo "  Python: A language built by community for community."
        echo "  Guido van Rossum shared it freely in 1991 so that"
        echo "  everyone — not just experts — could write software."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  It powers nearly a third of all websites globally."
        ;;
    mysql-server)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license model is a study in OSS economics."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight for an open, free web."
        echo "  It exists to prove browsers need not be proprietary."
        ;;
    git)
        echo "  Git: Born in frustration when a proprietary tool"
        echo "  failed Linus Torvalds. Now used by every developer."
        ;;
    *)
        echo "  $PACKAGE: An open source tool contributing to the"
        echo "  shared foundation that all software builds upon."
        ;;
esac

echo ""
echo "============================================================"
