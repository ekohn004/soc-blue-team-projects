import csv
from datetime import datetime

# Define normal working hours (24h format)
WORK_HOURS_START = 8
WORK_HOURS_END = 18

def is_after_hours(timestamp):
    hour = timestamp.hour
    return hour < WORK_HOURS_START or hour >= WORK_HOURS_END

def analyze_logons(file_path):
    print(f"\n Analyzing logons from: {file_path}\n")
    with open(file_path, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            try:
                logon_type = row['LogonType']
                username = row['TargetUserName']
                timestamp = datetime.strptime(row['TimeGenerated'], "%Y-%m-%d %H:%M:%S")
                ip_address = row.get('IpAddress', '')

                flags = []

                if is_after_hours(timestamp):
                    flags.append("After-hours logon")

                if logon_type == "10":
                    flags.append("RDP logon (Type 10)")

                if logon_type == "3" and ip_address not in ("-", "127.0.0.1"):
                    flags.append("Network logon (Type 3)")

                if flags:
                    print(f"[!] {timestamp} | {username} | IP: {ip_address} | Type: {logon_type}")
                    for flag in flags:
                        print(f"    - {flag}")

            except Exception as e:
                print(f"Error processing row: {e}")

if __name__ == "__main__":
    analyze_logons("sample_logons.csv")
