#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Mohit Pal  | Reg No: 24BEY10122
# Course: Open Source Software | Chosen Software: Python
# Purpose: Asks the user 3 questions interactively and
#          generates a personalised open source manifesto,
#          then saves it to a .txt file
# ============================================================

# --- Alias concept demonstrated (as comment per task requirement) ---
# In a real shell session you could set: alias today='date +%d\ %B\ %Y'
# We use the date command directly below instead

# --- Get current date for the manifesto ---
DATE=$(date '+%d %B %Y')

# --- Define output filename using the current user's name ---
OUTPUT="manifesto_$(whoami).txt"

echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "============================================================"
echo ""
echo "  This script will create a personalised open source"
echo "  philosophy statement based on your answers."
echo ""
echo "  Answer three short questions below."
echo "  Type your answer and press Enter."
echo ""
echo "------------------------------------------------------------"

# --- read command: gets input from the user interactively ---
# -p flag allows us to print a prompt before reading input
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validate that user didn't leave any answer blank ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  ERROR: All three questions must be answered."
    echo "  Please run the script again and fill in all fields."
    exit 1
fi

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Build the manifesto using string concatenation ---
# We write each line to the output file using >> (append)
# First, clear/create the file fresh using >

# Line 1: Title and date
echo "============================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "  By: $(whoami)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Line 2: Opening statement using their tool
echo "  Every day, I rely on $TOOL — a piece of software that" >> "$OUTPUT"
echo "  someone built, tested, and shared with the world at no" >> "$OUTPUT"
echo "  cost and with no restrictions. That act of sharing is" >> "$OUTPUT"
echo "  not just generosity. It is a statement about how" >> "$OUTPUT"
echo "  knowledge should move through the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Line 3: Freedom paragraph using their word
echo "  To me, freedom means $FREEDOM. In the context of software," >> "$OUTPUT"
echo "  that freedom is not abstract. It means I can read the" >> "$OUTPUT"
echo "  code that powers my tools. I can understand it, question" >> "$OUTPUT"
echo "  it, and change it. A program I cannot read is a program" >> "$OUTPUT"
echo "  I have not truly been given — I have only been lent it," >> "$OUTPUT"
echo "  on terms I did not set and cannot change." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Line 4: Their build idea — commitment to share
echo "  I commit that when I build $BUILD, I will share it." >> "$OUTPUT"
echo "  Not because I am required to. Not because it earns me" >> "$OUTPUT"
echo "  credit. But because the tools I used to build it were" >> "$OUTPUT"
echo "  shared with me by people I will never meet, and the" >> "$OUTPUT"
echo "  only honest response to that gift is to pass it forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Line 5: Closing
echo "  Open source is not a license. It is a philosophy." >> "$OUTPUT"
echo "  It says that what we build together is stronger than" >> "$OUTPUT"
echo "  what any one of us could build alone — and that the" >> "$OUTPUT"
echo "  measure of a tool is not what it costs, but what it" >> "$OUTPUT"
echo "  enables others to do." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "  Chosen Software for OSS Audit: Python (PSF License)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm file was saved ---
echo "  Your manifesto has been saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  HERE IS YOUR MANIFESTO:"
echo "------------------------------------------------------------"
echo ""

# --- Display the saved file using cat ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  Done. File saved as: $OUTPUT"
echo "============================================================"


