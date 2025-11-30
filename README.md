

# Scheduled Netcat Listener

**Team Theta** | COSC/ITAP 3411

A Bash script that creates scheduled netcat listeners with three operational modes: immediate, delayed, and continuous.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Installation Steps](#installation-steps)
- [Running the Code](#running-the-code)
- [References / Citations](#references--citations)

---

## Project Overview

This project implements a scheduled netcat listener tool for the COSC/ITAP 3411 Bash Shell Scripting course. The script provides three scheduling options:

1. Immediate Mode - Start listening instantly
2. Delayed Mode - Start after a countdown timer
3. Continuous Mode - Auto-restart after connections close

**Key Features:**

- Port validation (1024-65535)
- User input validation with error handling
- CASE statement for menu selection
- FOR loops for validation and countdown
- Netcat integration for network connections

---

## Prerequisites

**System Requirements:**

- Linux operating system (Ubuntu, Kali, Debian)
- Bash 4.0 or higher
- Netcat (nc) installed

**Check if netcat is installed:**

```bash
which nc
```

**Install netcat if needed:**

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install netcat

# Kali Linux
sudo apt-get install netcat-traditional
```

---

## Installation Steps

**Step 1: Clone the Repository**

```bash
git clone https://github.com/riyamnawaf/ITAP-COSC-3411-Theta.git && cd ITAP-COSC-3411-Theta/
```

**Step 2: Make Script Executable**

```bash
chmod +x scheduled_listener.sh
```

**Step 3: Verify Installation**

```bash
bash -n scheduled_listener.sh
```

---

## Running the Code

**Basic Execution:**

```bash
./scheduled_listener.sh
```

**Usage Flow:**

1. Enter port number when prompted (recommended: 1024-65535)
2. Select scheduling mode (1, 2, or 3)
3. Follow additional prompts based on selected mode
4. Connect from another machine using: `nc <target_ip> <port>`
5. Press CTRL+C to stop the listener

**Example - Immediate Mode:**

```bash
$ ./scheduled_listener.sh
Enter port number (1024-65535): 4444
✓ Port 4444 is valid

Select Scheduling Option:
1) Start listener immediately
2) Start listener after a delay
3) Continuous listener (auto-restart)

Enter choice (1-3): 1

Starting listener immediately...
==========================================
Listener Status: ACTIVE
Port: 4444
==========================================
```

**Example - Delayed Mode:**

```bash
Enter choice (1-3): 2
Enter delay in seconds: 10

Scheduled start in 10 seconds
Starting in 10 seconds...
Starting in 9 seconds...
[Countdown continues until listener starts]
```

**Example - Continuous Mode:**

```bash
Enter choice (1-3): 3
Enter restart interval in seconds: 30

==========================================
CONTINUOUS MODE
Port: 4444 | Interval: 30 sec
==========================================

--- Attempt #1 ---
Listening on port 4444...
[Automatically restarts after each connection]
```

---

## References / Citations

**Course Materials:**

- Course: COSC/ITAP 3411
- Project: Scheduled Listener using Netcat

**Technical Documentation:**

- Netcat Manual: `man nc`
- Bash Scripting Guide: https://tldp.org/LDP/abs/html/
- GNU Bash Manual: https://www.gnu.org/software/bash/manual/

**Tools:**

- Netcat (nc) - Network utility for TCP/UDP connections
- Bash - GNU Bourne-Again Shell
- seq - Sequence generation command

**Development:**

- Testing: Kali Linux, Ubuntu
- Version Control: Git, GitHub

---

## Team Information

**Team Name:** Theta

**Team Members:**

- Riyam Alshammari
- Sadeem Alzahrani
- Lujan Almehthel
- Muneera Alharbi

---

## Security Notice

This tool is for educational purposes only in controlled lab environments. Only use on systems you own or have explicit permission to test. The authors are not responsible for misuse.

---

## License

Academic coursework for COSC/ITAP 3411. Not for commercial distribution.

