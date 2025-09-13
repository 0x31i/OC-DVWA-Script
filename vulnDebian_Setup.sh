#!/bin/bash

# ===============================================
# Vulnerable Debian v13.1 OC Setup Script
# Purpose: Educational Penetration Testing Lab
# Author: Security Lab Setup
# Version: 2.0 - Modified
# ===============================================

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root${NC}"
    exit 1
fi

echo -e "${BLUE}===============================================${NC}"
echo -e "${BLUE}    Vulnerable Debian OC Setup Script${NC}"
echo -e "${BLUE}    Educational Purpose Only - v2.0${NC}"
echo -e "${BLUE}===============================================${NC}"

# Create directory structure
echo -e "${GREEN}[+] Creating OC directory structure...${NC}"
mkdir -p /opt/oc/{flags,scripts,exploits,configs}
mkdir -p /var/oc/{backup,logs,data}
mkdir -p /home/user1/{documents,downloads,scripts}
mkdir -p /opt/secrets
mkdir -p /opt/scripts
mkdir -p /var/backups/system
mkdir -p /tmp/.hidden

# Generate deterministic "random" numbers for flags
echo -e "${GREEN}[+] Generating OC flags...${NC}"

# Function to generate consistent 8-digit numbers
gen_flag_id() {
    local seed="$1"
    local salt="OC2024LabV2"
    echo -n "${seed}${salt}" | md5sum | cut -c1-8 | tr 'a-f' '0-5'
}

# Generate flag IDs (obfuscated)
declare -A FLAG_IDS
FLAG_IDS["H1"]=$(gen_flag_id "wizard1")
FLAG_IDS["H2"]=$(gen_flag_id "genius2")
FLAG_IDS["R1"]=$(gen_flag_id "keeper3")
FLAG_IDS["D1"]=$(gen_flag_id "phoenix4")
FLAG_IDS["H3"]=$(gen_flag_id "giant5")
FLAG_IDS["N1"]=$(gen_flag_id "brave6")
FLAG_IDS["L1"]=$(gen_flag_id "moon7")
FLAG_IDS["G1"]=$(gen_flag_id "seeker8")
FLAG_IDS["F1"]=$(gen_flag_id "twin9")
FLAG_IDS["G2"]=$(gen_flag_id "joker10")
FLAG_IDS["S1"]=$(gen_flag_id "prince11")
FLAG_IDS["S2"]=$(gen_flag_id "dog12")
FLAG_IDS["L2"]=$(gen_flag_id "wolf13")
FLAG_IDS["T1"]=$(gen_flag_id "morph14")
FLAG_IDS["M1"]=$(gen_flag_id "eye15")
FLAG_IDS["M2"]=$(gen_flag_id "cat16")
FLAG_IDS["D2"]=$(gen_flag_id "dragon17")
FLAG_IDS["V1"]=$(gen_flag_id "dark18")
FLAG_IDS["B1"]=$(gen_flag_id "curse19")
FLAG_IDS["G3"]=$(gen_flag_id "elder20")
FLAG_IDS["N2"]=$(gen_flag_id "snake21")
FLAG_IDS["H4"]=$(gen_flag_id "soul22")

# Map to actual names (obfuscated storage)
declare -A FLAG_NAMES
FLAG_NAMES["H1"]="HARRY"
FLAG_NAMES["H2"]="HERMIONE"
FLAG_NAMES["R1"]="RON"
FLAG_NAMES["D1"]="DUMBLEDORE"
FLAG_NAMES["H3"]="HAGRID"
FLAG_NAMES["N1"]="NEVILLE"
FLAG_NAMES["L1"]="LUNA"
FLAG_NAMES["G1"]="GINNY"
FLAG_NAMES["F1"]="FRED"
FLAG_NAMES["G2"]="GEORGE"
FLAG_NAMES["S1"]="SNAPE"
FLAG_NAMES["S2"]="SIRIUS"
FLAG_NAMES["L2"]="LUPIN"
FLAG_NAMES["T1"]="TONKS"
FLAG_NAMES["M1"]="MOODY"
FLAG_NAMES["M2"]="MCGONAGALL"
FLAG_NAMES["D2"]="DRACO"
FLAG_NAMES["V1"]="VOLDEMORT"
FLAG_NAMES["B1"]="BELLATRIX"
FLAG_NAMES["G3"]="GRINDELWALD"
FLAG_NAMES["N2"]="NAGINI"
FLAG_NAMES["H4"]="HORCRUX"

# Build flags dynamically
build_flag() {
    local key="$1"
    echo "FLAG{${FLAG_NAMES[$key]}${FLAG_IDS[$key]}}"
}

# ===============================================
# VULNERABILITY 1: Weak User Accounts
# ===============================================
echo -e "${YELLOW}[*] Setting up weak user accounts...${NC}"

# Create vulnerable users with weak passwords
useradd -m -s /bin/bash user1 2>/dev/null || true
echo "user1:password123" | chpasswd

useradd -m -s /bin/bash developer 2>/dev/null || true
echo "developer:dev123" | chpasswd

useradd -m -s /bin/bash admin_backup 2>/dev/null || true
echo "admin_backup:admin" | chpasswd

# Plant EASY flag in user description
usermod -c "$(build_flag 'H1')" user1

# ===============================================
# VULNERABILITY 2: Credential Leakage (NEW)
# ===============================================
echo -e "${YELLOW}[*] Creating credential leakage files...${NC}"

# Create network credentials file with EASY flag
cat > /opt/secrets/network_credentials.txt << EOF
========================================
INTERNAL NETWORK CREDENTIALS
========================================
Generated: 2024-01-15
Last Updated: 2024-09-01

** Windows Server 2019 Server Credentials **
Host: 192.168.148.101
Domain: OVERCLOCK.LOCAL
Username: user1
Password: Password123!
Notes: Primary DC, handles authentication

** Windows 10 Workstation Credentials #1 **
Host: 192.168.148.102
Username: jsmith
Password: Welcome1
Notes: Finance department workstation

** Windows 10 Workstation Credentials #2 **
Host: 192.168.148.102
Username: mjones
Password: Password1
Notes: HR department workstation

$(build_flag 'H2')

[WARNING: This file should be encrypted!]
========================================
EOF
chmod 644 /opt/secrets/network_credentials.txt

# Create another credentials file in backup location
cat > /var/backups/system/old_passwords.txt << EOF
Legacy System Passwords (Before Migration)
==========================================
MySQL root: admin123
PostgreSQL: postgres/postgres
Redis: nopassword
MongoDB: admin/admin
FTP: ftpuser/ftppass

$(build_flag 'R1')
EOF
chmod 644 /var/backups/system/old_passwords.txt

# ===============================================
# VULNERABILITY 3: SUID Binaries
# ===============================================
echo -e "${YELLOW}[*] Setting up vulnerable SUID binaries...${NC}"

# Create vulnerable SUID script with MEDIUM flag
cat > /usr/local/bin/backup_tool << EOF
#!/bin/bash
echo "Backup Tool v1.0"
echo "$(build_flag 'S1')"
echo "Enter file to backup:"
read file
cat "\$file" 2>/dev/null || echo "File not found"
EOF
chmod +s /usr/local/bin/backup_tool
chmod 755 /usr/local/bin/backup_tool

# Make find SUID (classic privesc)
chmod u+s /usr/bin/find 2>/dev/null || true

# ===============================================
# VULNERABILITY 4: Sudo Misconfigurations
# ===============================================
echo -e "${YELLOW}[*] Setting up sudo misconfigurations...${NC}"

# Add vulnerable sudoers entries
echo "user1 ALL=(ALL) NOPASSWD: /usr/bin/vim" >> /etc/sudoers
echo "developer ALL=(ALL) NOPASSWD: /usr/bin/python3" >> /etc/sudoers
echo "admin_backup ALL=(ALL) NOPASSWD: /bin/less" >> /etc/sudoers

# Create sudoers.d file with MEDIUM flag
echo "# $(build_flag 'S2')" > /etc/sudoers.d/oc_flag
chmod 440 /etc/sudoers.d/oc_flag

# ===============================================
# VULNERABILITY 5: Cron Jobs
# ===============================================
echo -e "${YELLOW}[*] Setting up vulnerable cron jobs...${NC}"

# Create world-writable cron script
cat > /opt/scripts/cleanup.sh << EOF
#!/bin/bash
# System cleanup script
echo "Cleaning temporary files..."
rm -rf /tmp/*.tmp 2>/dev/null
echo "$(build_flag 'L2')"
EOF
chmod 777 /opt/scripts/cleanup.sh

# Add cron job
echo "*/5 * * * * root /opt/scripts/cleanup.sh > /var/log/cleanup.log 2>&1" >> /etc/crontab

# ===============================================
# VULNERABILITY 6: SSH Misconfigurations
# ===============================================
echo -e "${YELLOW}[*] Configuring SSH vulnerabilities...${NC}"

# Enable password authentication
sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# Add SSH banner with EASY flag
echo "$(build_flag 'D1')" > /etc/ssh/banner
echo "Welcome to OC Server" >> /etc/ssh/banner
sed -i 's/^#Banner.*/Banner \/etc\/ssh\/banner/' /etc/ssh/sshd_config

# Create SSH key with MEDIUM flag
mkdir -p /home/developer/.ssh
echo "$(build_flag 'T1')" > /home/developer/.ssh/authorized_keys.backup
chmod 644 /home/developer/.ssh/authorized_keys.backup
chown -R developer:developer /home/developer/.ssh

# ===============================================
# VULNERABILITY 7: Hidden Files in System
# ===============================================
echo -e "${YELLOW}[*] Creating hidden files with flags...${NC}"

# Create hidden files in various system directories
echo "$(build_flag 'H3')" > /opt/oc/.secret
chmod 644 /opt/oc/.secret

# Hidden file in home directory
echo "$(build_flag 'M1')" > /home/user1/.hidden_flag
chmod 644 /home/user1/.hidden_flag
chown user1:user1 /home/user1/.hidden_flag

# Hidden directory with flag
mkdir -p /tmp/.hidden
echo "$(build_flag 'N1')" > /tmp/.hidden/secret.txt
chmod 755 /tmp/.hidden
chmod 644 /tmp/.hidden/secret.txt

# ===============================================
# VULNERABILITY 8: Services and Processes
# ===============================================
echo -e "${YELLOW}[*] Setting up vulnerable services...${NC}"

# Create vulnerable service with HARD flag
cat > /etc/systemd/system/oc-monitor.service << EOF
[Unit]
Description=OC Monitoring Service
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/opt/oc
ExecStart=/opt/oc/monitor.sh
Restart=always
Environment="FLAG=$(build_flag 'V1')"

[Install]
WantedBy=multi-user.target
EOF

cat > /opt/oc/monitor.sh << 'EOF'
#!/bin/bash
while true; do
    echo "Monitoring system..." > /tmp/monitor.log
    sleep 60
done
EOF
chmod 755 /opt/oc/monitor.sh

# ===============================================
# VULNERABILITY 9: Database Configurations
# ===============================================
echo -e "${YELLOW}[*] Setting up database vulnerabilities...${NC}"

# Create MySQL configuration with weak credentials
mkdir -p /etc/mysql/conf.d
cat > /etc/mysql/conf.d/oc.cnf << EOF
# OC MySQL Configuration
# $(build_flag 'M2')
[client]
user=oc_user
password=weakpass123
EOF
chmod 644 /etc/mysql/conf.d/oc.cnf 2>/dev/null || true

# Create PostgreSQL password file
cat > /var/lib/postgresql/.pgpass << EOF
localhost:5432:*:postgres:postgres123
# $(build_flag 'L1')
EOF
chmod 600 /var/lib/postgresql/.pgpass 2>/dev/null || true

# ===============================================
# VULNERABILITY 10: Kernel and System Files
# ===============================================
echo -e "${YELLOW}[*] Setting up kernel/system vulnerabilities...${NC}"

# Create kernel module loading configuration
echo "# $(build_flag 'B1')" > /etc/modprobe.d/oc.conf
echo "options dummy numdummies=2" >> /etc/modprobe.d/oc.conf
chmod 644 /etc/modprobe.d/oc.conf

# ===============================================
# VULNERABILITY 11: Docker Misconfigurations
# ===============================================
echo -e "${YELLOW}[*] Setting up Docker vulnerabilities...${NC}"

# Add users to docker group (if Docker is installed)
if command -v docker &> /dev/null; then
    usermod -aG docker user1 2>/dev/null || true
    usermod -aG docker developer 2>/dev/null || true
    
    # Create Docker configuration with flag
    mkdir -p /etc/docker
    echo "{\"debug\": true, \"comment\": \"$(build_flag 'G3')\"}" > /etc/docker/daemon.json
    chmod 644 /etc/docker/daemon.json
fi

# ===============================================
# VULNERABILITY 12: Application Configuration Files
# ===============================================
echo -e "${YELLOW}[*] Setting up application configuration vulnerabilities...${NC}"

# Create application config in /opt
mkdir -p /opt/webapp/config
cat > /opt/webapp/config/database.yml << EOF
production:
  adapter: mysql2
  encoding: utf8
  database: webapp_prod
  username: webapp_user
  password: SecretPass123
  host: localhost
  # $(build_flag 'G1')
EOF
chmod 644 /opt/webapp/config/database.yml

# ===============================================
# VULNERABILITY 13: Log Files
# ===============================================
echo -e "${YELLOW}[*] Setting up log file vulnerabilities...${NC}"

# Create world-readable log with sensitive info
echo "System initialized at $(date)" > /var/log/oc.log
echo "Admin password changed to: P@ssw0rd123" >> /var/log/oc.log
echo "$(build_flag 'F1')" >> /var/log/oc.log
chmod 644 /var/log/oc.log

# Create application log
mkdir -p /var/log/webapp
echo "[$(date)] Database connection established" > /var/log/webapp/app.log
echo "[$(date)] User 'admin' logged in successfully" >> /var/log/webapp/app.log
echo "[$(date)] DEBUG: $(build_flag 'G2')" >> /var/log/webapp/app.log
chmod 644 /var/log/webapp/app.log

# ===============================================
# VULNERABILITY 14: Environment Variables
# ===============================================
echo -e "${YELLOW}[*] Setting up environment variable vulnerabilities...${NC}"

# Add flag to environment
echo "export SECRET_FLAG='$(build_flag 'D2')'" >> /etc/profile.d/oc.sh
echo "export API_KEY='sk-1234567890abcdef'" >> /etc/profile.d/oc.sh
chmod 644 /etc/profile.d/oc.sh

# ===============================================
# VULNERABILITY 15: Binary Exploitation
# ===============================================
echo -e "${YELLOW}[*] Creating vulnerable binaries...${NC}"

# Create vulnerable C program with HARD flag
cat > /tmp/vuln.c << EOF
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void secret_function() {
    system("echo '$(build_flag 'N2')'");
}

void vulnerable_function(char *input) {
    char buffer[64];
    strcpy(buffer, input);
    printf("You entered: %s\n", buffer);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input>\n", argv[0]);
        return 1;
    }
    vulnerable_function(argv[1]);
    return 0;
}
EOF

gcc -o /opt/oc/vulnerable_binary /tmp/vuln.c -fno-stack-protector -no-pie 2>/dev/null || true
chmod +s /opt/oc/vulnerable_binary 2>/dev/null || true
rm /tmp/vuln.c

# ===============================================
# VULNERABILITY 16: Archive Files
# ===============================================
echo -e "${YELLOW}[*] Creating archive files with flags...${NC}"

# Create archive with credentials and flag
mkdir -p /tmp/archive_tmp
cat > /tmp/archive_tmp/notes.txt << EOF
Project Notes
=============
Remember to update the firewall rules
Server migration scheduled for next month

Old VPN credentials (deprecated):
vpnuser:vpnpass123

Development server: 10.0.0.50
Test server: 10.0.0.51

$(build_flag 'T1')
EOF

tar -czf /var/backups/old_project.tar.gz -C /tmp/archive_tmp notes.txt
rm -rf /tmp/archive_tmp
chmod 644 /var/backups/old_project.tar.gz

# ===============================================
# VULNERABILITY 17: Git Repositories
# ===============================================
echo -e "${YELLOW}[*] Setting up Git repository vulnerabilities...${NC}"

# Create Git repository in /opt
mkdir -p /opt/development/project
cd /opt/development/project
git init 2>/dev/null || true
echo "$(build_flag 'L2')" > .env
echo "DATABASE_URL=mysql://root:password@localhost/db" >> .env
git add .env
git config user.email "dev@local.com" 2>/dev/null || true
git config user.name "Developer" 2>/dev/null || true
git commit -m "Initial commit - added environment file" 2>/dev/null || true
chmod -R 755 /opt/development

# ===============================================
# VULNERABILITY 18: Cryptographic Weaknesses
# ===============================================
echo -e "${YELLOW}[*] Setting up cryptographic vulnerabilities...${NC}"

# Create weakly encrypted file with HARD flag
echo "$(build_flag 'H4')" | openssl enc -aes-128-cbc -pass pass:password123 -out /opt/oc/encrypted_flag.enc 2>/dev/null || true
echo "Hint: Weak encryption password used (common password)" > /opt/oc/encrypted_flag.hint
chmod 644 /opt/oc/encrypted_flag.enc /opt/oc/encrypted_flag.hint

# Create base64 encoded "secret"
echo "$(build_flag 'S2')" | base64 > /var/oc/data/encoded_secret.b64
chmod 644 /var/oc/data/encoded_secret.b64

# ===============================================
# VULNERABILITY 19: Process Information
# ===============================================
echo -e "${YELLOW}[*] Creating process-based vulnerabilities...${NC}"

# Create script that runs with credentials in command line
cat > /opt/oc/scripts/db_backup.sh << 'EOF'
#!/bin/bash
while true; do
    mysqldump -u backup_user -p'BackupPass123!' webapp_db > /dev/null 2>&1
    sleep 300
done
EOF
chmod 755 /opt/oc/scripts/db_backup.sh

# ===============================================
# VULNERABILITY 20: Scheduled Tasks
# ===============================================
echo -e "${YELLOW}[*] Setting up scheduled task vulnerabilities...${NC}"

# Create at job script
cat > /var/spool/cron/atjobs/backup_job << EOF
#!/bin/bash
# Scheduled backup job
# $(build_flag 'M2')
tar -czf /backup/system_$(date +%Y%m%d).tar.gz /etc/
EOF
chmod 644 /var/spool/cron/atjobs/backup_job 2>/dev/null || true

# ===============================================
# Generate Flag Report
# ===============================================
echo -e "${GREEN}[+] Generating flag report...${NC}"

# Generate report with actual flag values
REPORT_DATE=$(date '+%Y-%m-%d %H:%M:%S')
REPORT_FILE="/root/OC_FLAGS_REPORT_$(date +%Y%m%d_%H%M%S).html"

cat > "$REPORT_FILE" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>OC Flag Report - Debian v13.1 Webserver Lab v2.0</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f0f0f0; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; }
        h1 { color: #333; border-bottom: 3px solid #9b59b6; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background: #9b59b6; color: white; padding: 12px; text-align: left; }
        td { padding: 10px; border-bottom: 1px solid #ddd; }
        tr:hover { background: #f5f5f5; }
        .easy { color: green; font-weight: bold; }
        .medium { color: orange; font-weight: bold; }
        .hard { color: red; font-weight: bold; }
        .stats { background: #e8daef; padding: 15px; border-radius: 5px; margin: 20px 0; }
        .flag-code { font-family: 'Courier New'; background: #f0f0f0; padding: 2px 5px; border-radius: 3px; }
        .hp-theme { background: linear-gradient(135deg, #9b59b6 0%, #3498db 100%); color: white; padding: 10px; border-radius: 5px; margin-bottom: 20px; }
        .creds-section { background: #ffeaa7; padding: 15px; border-left: 5px solid #fdcb6e; margin: 20px 0; }
    </style>
</head>
<body>
    <div class="container">
        <div class="hp-theme">
            <h1 style="color: white; border: none;">⚡ Harry Potter OC Flag Report - Debian v13.1 ⚡</h1>
            <h2 style="color: white;">Educational Penetration Testing Lab v2.0</h2>
        </div>
        
        <div class="creds-section">
            <h3>Network Credentials Discovered</h3>
            <p><strong>Windows Server 2019:</strong> user1:Password123!</p>
            <p><strong>Windows 10 Workstation #1:</strong> jsmith:Welcome1</p>
            <p><strong>Windows 10 Workstation #2:</strong> mjones:Password1</p>
            <p><em>These credentials are found in /opt/secrets/network_credentials.txt</em></p>
        </div>
        
        <div class="stats">
            <h2>Statistics</h2>
            <p><strong>Total Flags:</strong> 22</p>
            <p><strong>Easy Flags:</strong> 10</p>
            <p><strong>Medium Flags:</strong> 7</p>
            <p><strong>Hard Flags:</strong> 5</p>
            <p><strong>Report Generated:</strong> $REPORT_DATE</p>
        </div>
        
        <h2>Flag Details</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Flag</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Difficulty</th>
                    <th>Technique</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td class="flag-code">$(build_flag 'H1')</td>
                    <td>User Description</td>
                    <td>Hidden in 'user1' user description</td>
                    <td class="easy">Easy</td>
                    <td>User enumeration</td>
                </tr>
                <tr>
                    <td>002</td>
                    <td class="flag-code">$(build_flag 'H2')</td>
                    <td>/opt/secrets/network_credentials.txt</td>
                    <td>Network credentials file (includes Windows creds)</td>
                    <td class="easy">Easy</td>
                    <td>File discovery</td>
                </tr>
                <tr>
                    <td>003</td>
                    <td class="flag-code">$(build_flag 'R1')</td>
                    <td>/var/backups/system/old_passwords.txt</td>
                    <td>Legacy password file</td>
                    <td class="easy">Easy</td>
                    <td>Backup enumeration</td>
                </tr>
                <tr>
                    <td>004</td>
                    <td class="flag-code">$(build_flag 'D1')</td>
                    <td>SSH Banner</td>
                    <td>SSH server banner</td>
                    <td class="easy">Easy</td>
                    <td>Service enumeration</td>
                </tr>
                <tr>
                    <td>005</td>
                    <td class="flag-code">$(build_flag 'H3')</td>
                    <td>/opt/oc/.secret</td>
                    <td>Hidden file in OC directory</td>
                    <td class="easy">Easy</td>
                    <td>Hidden file discovery</td>
                </tr>
                <tr>
                    <td>006</td>
                    <td class="flag-code">$(build_flag 'N1')</td>
                    <td>/tmp/.hidden/secret.txt</td>
                    <td>Hidden directory in /tmp</td>
                    <td class="easy">Easy</td>
                    <td>Directory traversal</td>
                </tr>
                <tr>
                    <td>007</td>
                    <td class="flag-code">$(build_flag 'L1')</td>
                    <td>/var/lib/postgresql/.pgpass</td>
                    <td>PostgreSQL password file</td>
                    <td class="easy">Easy</td>
                    <td>Database enumeration</td>
                </tr>
                <tr>
                    <td>008</td>
                    <td class="flag-code">$(build_flag 'G1')</td>
                    <td>/opt/webapp/config/database.yml</td>
                    <td>Application config file</td>
                    <td class="easy">Easy</td>
                    <td>Config file analysis</td>
                </tr>
                <tr>
                    <td>009</td>
                    <td class="flag-code">$(build_flag 'F1')</td>
                    <td>/var/log/oc.log</td>
                    <td>World-readable log file</td>
                    <td class="easy">Easy</td>
                    <td>Log file analysis</td>
                </tr>
                <tr>
                    <td>010</td>
                    <td class="flag-code">$(build_flag 'G2')</td>
                    <td>/var/log/webapp/app.log</td>
                    <td>Application debug log</td>
                    <td class="easy">Easy</td>
                    <td>Log enumeration</td>
                </tr>
                <tr>
                    <td>011</td>
                    <td class="flag-code">$(build_flag 'S1')</td>
                    <td>/usr/local/bin/backup_tool</td>
                    <td>SUID binary exploitation</td>
                    <td class="medium">Medium</td>
                    <td>SUID exploitation</td>
                </tr>
                <tr>
                    <td>012</td>
                    <td class="flag-code">$(build_flag 'S2')</td>
                    <td>/etc/sudoers.d/oc_flag</td>
                    <td>Sudoers configuration file</td>
                    <td class="medium">Medium</td>
                    <td>Sudo enumeration</td>
                </tr>
                <tr>
                    <td>013</td>
                    <td class="flag-code">$(build_flag 'L2')</td>
                    <td>/opt/scripts/cleanup.sh</td>
                    <td>Cron job script exploitation</td>
                    <td class="medium">Medium</td>
                    <td>Cron job hijacking</td>
                </tr>
                <tr>
                    <td>014</td>
                    <td class="flag-code">$(build_flag 'T1')</td>
                    <td>/var/backups/old_project.tar.gz</td>
                    <td>Archive file extraction</td>
                    <td class="medium">Medium</td>
                    <td>Archive analysis</td>
                </tr>
                <tr>
                    <td>015</td>
                    <td class="flag-code">$(build_flag 'M1')</td>
                    <td>/home/user1/.hidden_flag</td>
                    <td>Hidden file in home directory</td>
                    <td class="medium">Medium</td>
                    <td>User enumeration</td>
                </tr>
                <tr>
                    <td>016</td>
                    <td class="flag-code">$(build_flag 'M2')</td>
                    <td>/etc/mysql/conf.d/oc.cnf</td>
                    <td>MySQL configuration file</td>
                    <td class="medium">Medium</td>
                    <td>Database enumeration</td>
                </tr>
                <tr>
                    <td>017</td>
                    <td class="flag-code">$(build_flag 'D2')</td>
                    <td>/etc/profile.d/oc.sh</td>
                    <td>Environment variable</td>
                    <td class="medium">Medium</td>
                    <td>Environment analysis</td>
                </tr>
                <tr>
                    <td>018</td>
                    <td class="flag-code">$(build_flag 'V1')</td>
                    <td>oc-monitor.service</td>
                    <td>Service environment variable</td>
                    <td class="hard">Hard</td>
                    <td>Service exploitation</td>
                </tr>
                <tr>
                    <td>019</td>
                    <td class="flag-code">$(build_flag 'B1')</td>
                    <td>/etc/modprobe.d/oc.conf</td>
                    <td>Kernel module configuration</td>
                    <td class="hard">Hard</td>
                    <td>Kernel enumeration</td>
                </tr>
                <tr>
                    <td>020</td>
                    <td class="flag-code">$(build_flag 'G3')</td>
                    <td>/etc/docker/daemon.json</td>
                    <td>Docker configuration file</td>
                    <td class="hard">Hard</td>
                    <td>Container escape</td>
                </tr>
                <tr>
                    <td>021</td>
                    <td class="flag-code">$(build_flag 'N2')</td>
                    <td>/opt/oc/vulnerable_binary</td>
                    <td>Binary exploitation (buffer overflow)</td>
                    <td class="hard">Hard</td>
                    <td>Binary exploitation</td>
                </tr>
                <tr>
                    <td>022</td>
                    <td class="flag-code">$(build_flag 'H4')</td>
                    <td>/opt/oc/encrypted_flag.enc</td>
                    <td>Weak cryptography</td>
                    <td class="hard">Hard</td>
                    <td>Cryptanalysis</td>
                </tr>
            </tbody>
        </table>
        
        <h2>Exploitation Guide</h2>
        <h3>Privilege Escalation Paths:</h3>
        <ul>
            <li><strong>SUID Binaries:</strong> find, backup_tool</li>
            <li><strong>Sudo Misconfigurations:</strong> vim, python3, less (for user1, developer, admin_backup)</li>
            <li><strong>Cron Jobs:</strong> World-writable scripts in /opt/scripts</li>
            <li><strong>Docker:</strong> Group membership exploitation (if installed)</li>
            <li><strong>Credential Reuse:</strong> Check Windows credentials on Linux system</li>
        </ul>
        
        <h3>Enumeration Commands:</h3>
        <pre>
# Find SUID binaries
find / -perm -u=s -type f 2>/dev/null

# Check sudo privileges
sudo -l

# Enumerate users
cat /etc/passwd | grep -v nologin

# Find world-writable files
find / -perm -222 -type f 2>/dev/null

# Check for credentials
find / -name "*.txt" -o -name "*.yml" -o -name "*.conf" 2>/dev/null | xargs grep -l "password\|FLAG"

# Check running services
systemctl list-units --type=service --state=running

# Find hidden files and directories
find / -type f -name ".*" 2>/dev/null
find / -type d -name ".*" 2>/dev/null
        </pre>
        
        <h2>Important Notes</h2>
        <ul>
            <li><strong>Network Credentials:</strong> The discovered Windows credentials can be used for lateral movement</li>
            <li><strong>Main User:</strong> 'user1' is the primary OC user account</li>
            <li><strong>No Web Flags:</strong> All flags are in system directories, not in /var/www/html</li>
            <li><strong>Archive Files:</strong> Multiple archives contain flags and credentials</li>
        </ul>
        
        <h2>Recommended Tools</h2>
        <ul>
            <li><strong>LinPEAS:</strong> Linux privilege escalation scanner</li>
            <li><strong>LinEnum:</strong> Scripted local enumeration</li>
            <li><strong>pspy:</strong> Process monitoring without root</li>
            <li><strong>GTFOBins:</strong> Unix binary exploitation reference</li>
            <li><strong>strings/file:</strong> Analyze binaries and files</li>
        </ul>
    </div>
</body>
</html>
EOF

# ===============================================
# Final Setup Steps
# ===============================================
echo -e "${GREEN}[+] Performing final setup steps...${NC}"

# Set proper permissions
chmod 755 /opt/oc
chmod 755 /var/oc
chmod 755 /opt/secrets

# Restart services
systemctl restart ssh 2>/dev/null || true
systemctl daemon-reload 2>/dev/null || true

# Create setup completion marker
touch /opt/oc/.setup_complete
date > /opt/oc/.setup_complete

# ===============================================
# Summary
# ===============================================
echo -e "${GREEN}===============================================${NC}"
echo -e "${GREEN}    OC Setup Complete!${NC}"
echo -e "${GREEN}===============================================${NC}"
echo -e "${BLUE}Total Flags Planted:${NC}"
echo -e "  Easy:   10 flags"
echo -e "  Medium: 7 flags"
echo -e "  Hard:   5 flags"
echo -e ""
echo -e "${YELLOW}Network Credentials Location:${NC}"
echo -e "  /opt/secrets/network_credentials.txt"
echo -e "  - Windows Server 2019: user1:Password123!"
echo -e "  - Windows 10 #1: jsmith:Welcome1"
echo -e "  - Windows 10 #2: mjones:Password1"
echo -e ""
echo -e "${YELLOW}Flag Report Location:${NC}"
echo -e "  /root/OC_FLAGS_REPORT_*.html"
echo -e ""
echo -e "${YELLOW}Important Users Created:${NC}"
echo -e "  user1:password123 (main OC user)"
echo -e "  developer:dev123"
echo -e "  admin_backup:admin"
echo -e ""
echo -e "${RED}WARNING:${NC} This system is now intentionally vulnerable!"
echo -e "Use only in isolated, educational environments."
echo -e "${GREEN}===============================================${NC}"
