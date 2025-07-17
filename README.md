# SOC Blue Team Projects

This repository contains small but practical security tools, scripts, and playbooks designed to support security operations center (SOC) analysts, blue teamers, and incident responders. These projects demonstrate hands-on familiarity with common detection, triage, and response techniques in a modern enterprise environment.

---

## 🔧 Projects Included

### 📁 `windows-artifact-collector`
A PowerShell script to automate the collection of forensic artifacts from Windows endpoints during incident response.

**Features:**
- Grabs Windows Event Logs (System, Security, Application)
- Captures running processes and network connections
- Collects autoruns, scheduled tasks, and logged-in users
- Packages everything into a zip for easy handoff

[Read more →](windows-artifact-collector/README.md)

---

## 📌 Purpose

This repository was created as a demonstration of hands-on SOC knowledge, incident response mindset, and scripting capability. The tools here are intentionally lightweight and focused on solving real-world triage problems, not simulating large enterprise deployments.

---

## 👤 Author

[@ekohn004](https://github.com/ekohn004)  
SOC analyst with a focus on detection engineering, triage workflows, and defensive automation.

---

## 📬 Contributions

This is a personal learning and demonstration repository. If you'd like to suggest improvements or ideas for new tools, feel free to open an issue.
