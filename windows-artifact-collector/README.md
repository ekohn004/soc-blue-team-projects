# Windows Artifact Collector (PowerShell)

This PowerShell script automates the collection of key artifacts useful in a Windows incident response scenario. It is intended for use by SOC analysts, blue teamers, or responders performing initial triage on a compromised or suspicious host.

---

## What It Collects

- **Windows Event Logs** (`System`, `Security`, `Application`)
- **Running processes** (sorted by CPU usage)
- **Network connections** (`netstat`)
- **Scheduled tasks**
- **Currently logged-in users**
- **Autoruns** (if `autorunsc.exe` is available in PATH)

---

## Output

All artifacts are collected into a time-stamped folder and zipped to your desktop for easy access and transfer.

---

## Requirements

- PowerShell 5.0+
- Optional: [Autoruns from Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns) (place `autorunsc.exe` in system PATH)

---

## Why This Matters

In the early stages of an incident, responders often need to collect volatile and persistent data quickly to:

- Identify signs of persistence or malware
- Investigate unusual logins or process activity
- Preserve logs before potential tampering

This script allows responders to gather evidence with minimal user interaction and system impact.

---

## Author

Created as part of a blue team portfolio by [@ekohn004](https://github.com/ekohn004)
