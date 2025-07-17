# Logon Anomaly Detector (Python)

A lightweight Python script to analyze exported Windows Security event logs (CSV format) and flag suspicious logon patterns for triage and investigation.

---

## 🔍 Detection Logic

- 💻 **RDP Logons (Type 10)**  
- 🌐 **Network Logons (Type 3)** from non-loopback IPs  
- 🕗 **After-hours logons** (outside 08:00–18:00)

---

## 📂 Input Format

This script expects a CSV file exported from Windows Event Viewer, filtered for Event ID 4624 (logon). Example fields:
- `TimeGenerated`
- `TargetUserName`
- `LogonType`
- `IpAddress`

See: `sample_logons.csv` for reference.

---

## 🚀 Usage

```bash
python logon_analyzer.py
