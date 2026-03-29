# OSS Audit — Python
**Repository:** `OSS-Audit-24MEI10132`

---

## Student Details

| Field | Details |
|-------|---------|
| **Student Name** | Nikhil dangi |
| **Registration Number** | 24MEI10132 |
| **Course** | Open Source Software (OSS NGMC) |
| **Chosen Software** | Python |
| **License** | Python Software Foundation (PSF) License |

---

## About This Project

This repository is part of the Open Source Audit Capstone Project for the OSS NGMC course. The project involves a structured audit of Python — one of the most widely used open source programming languages in the world — covering its origin story, license freedoms, ethics, Linux footprint, FOSS ecosystem, and a comparison with its closest proprietary alternative (MATLAB). Five shell scripts are included to demonstrate practical Linux and bash scripting skills.

---

## Chosen Software — Python

| Field | Details |
|-------|---------|
| **Version Tested** | Python 3.12.3 |
| **License** | PSF License (Python Software Foundation License) |
| **Official Site** | https://www.python.org |
| **Source Code** | https://github.com/python/cpython |

---

## Repository Structure

```
oss-audit-[rollnumber]/
│
├── script1.sh        # System Identity Report
├── script2.sh        # FOSS Package Inspector
├── script3.sh        # Disk and Permission Auditor
├── script4.sh        # Log File Analyzer
├── script5.sh        # Open Source Manifesto Generator
└── README.md         # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report (`script1.sh`)

Displays a formatted welcome screen that introduces the Linux system. It shows the Linux distribution name, kernel version, currently logged-in user, home directory path, system uptime, current date and time, the open source license covering the OS (GPL v2 for Ubuntu/Linux), and the license covering our chosen software Python (PSF License).

**Concepts used:** variables, `echo`, command substitution `$()`, `lsb_release`, `uname -r`, `whoami`, `uptime -p`, `date`, basic output formatting.

---

### Script 2 — FOSS Package Inspector (`script2.sh`)

Checks whether Python (`python3`) is installed on the system using `dpkg -s`. If installed, it extracts and displays the version number, license information from the copyright file, and binary location using `which`. A `case` statement then prints a one-line open source philosophy note for `python3` and four other well-known FOSS packages (apache2, mysql-server, firefox, git).

**Concepts used:** `if-then-else`, `case` statement, `dpkg`, pipe with `grep`, `awk`, `which`.

---

### Script 3 — Disk and Permission Auditor (`script3.sh`)

Loops through an array of six important Linux system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`) and reports the permission string, owner, group, and disk usage of each. A second loop then audits four Python-specific installation directories and ends with a security note about root ownership.

**Concepts used:** `for` loop, bash arrays, `ls -ld`, `du -sh`, `awk`, `cut`, `printf` for formatted output.

---

### Script 4 — Log File Analyzer (`script4.sh`)

Accepts a log file path as `$1` and a search keyword as `$2` (defaults to `python` if not provided). Reads the file line by line using a `while IFS= read -r` loop. An `if-then` inside the loop uses `grep -iq` for case-insensitive matching and increments a counter. Prints the first 10 matching lines, then uses `grep` piped to `tail` to show the last 5 matches, followed by a full summary.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments `$1` and `$2`, `grep`, `tail`, input validation.

---

### Script 5 — Open Source Manifesto Generator (`script5.sh`)

Asks three interactive questions using `read -p`, then composes a personalised open source philosophy paragraph using the answers and writes it to a `.txt` file named `manifesto_<username>.txt` using `>` and `>>`. The alias concept is demonstrated in a comment. The saved file is displayed using `cat`.

**Concepts used:** `read` for user input, string concatenation, writing to file with `>` and `>>`, `date` command, aliases concept (shown as comment), `cat`.

---

## How to Run the Scripts

### Step 1 — Install Python 3 (if not already installed)

```bash
sudo apt update
sudo apt install python3 -y
python3 --version
```

### Step 2 — Clone This Repository

```bash
git clone https://github.com/[YOUR_GITHUB_USERNAME]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]
```

### Step 3 — Give Execute Permission to All Scripts

```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

### Step 4 — Run Each Script

**Script 1 — System Identity Report**
```bash
./script1.sh
```
Expected output: formatted display of distro, kernel, user, uptime, date, and license info.

---

**Script 2 — FOSS Package Inspector**
```bash
./script2.sh
```
Expected output: python3 installation status, version, license, binary path, and philosophy note.

---

**Script 3 — Disk and Permission Auditor**
```bash
./script3.sh
```
Expected output: table of system directories with permissions, ownership, and disk usage, followed by Python-specific directory audit.

---

**Script 4 — Log File Analyzer**
```bash
./script4.sh /var/log/dpkg.log python
```
Expected output: first 10 matching lines, last 5 matching lines, and a summary of total lines and match count.

> The keyword defaults to `python` if not provided:
> ```bash
> ./script4.sh /var/log/dpkg.log
> ```

---

**Script 5 — Open Source Manifesto Generator**
```bash
./script5.sh
```
Expected output: three interactive prompts, then a personalised manifesto saved to `manifesto_<username>.txt` and displayed on screen.

---

## Dependencies

| Dependency | Purpose | Install Command |
|------------|---------|-----------------|
| `bash` | Shell interpreter for all scripts | Pre-installed on Ubuntu |
| `python3` | Chosen software being audited | `sudo apt install python3 -y` |
| `dpkg` | Package inspection in Script 2 | Pre-installed on Ubuntu |
| `lsb-release` | Distro name in Script 1 | `sudo apt install lsb-release` |
| `coreutils` | `du`, `ls`, `cut`, `awk`, `date` in Scripts 1 and 3 | Pre-installed on Ubuntu |

---

## System Tested On

| Field | Details |
|-------|---------|
| OS | Ubuntu 24.04.4 LTS (WSL2 on Windows) |
| Kernel | 6.6.87.2-microsoft-standard-WSL2 |
| Python Version | 3.12.3 |
| pip Version | 24.0 |
| Shell | Bash 5.x |

---

## License

These shell scripts are written as part of an academic capstone project submitted under the terms of the OSS NGMC course. The subject of the audit — Python — is licensed under the Python Software Foundation (PSF) License. See [python.org/psf/license](https://www.python.org/psf/license/) for full details.
