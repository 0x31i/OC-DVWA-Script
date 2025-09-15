# OCWA Installer

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Installation](#installation)
  - [Installation Steps](#installation-steps)
- [Usage](#usage)
- [Credentials](#credentials)
- [Language Support](#language-support)
- [Contributing](#contributing)
- [License](#license)

---

## Description

This script automates the installation process for [OCWA (Overclock Web Application)](https://github.com/0x31i/OCWA), a web application intentionally designed to be vulnerable to various attacks. OCWA is a tool for learning and practicing web application security.

## Features

- Automated installation of OCWA with necessary dependencies.

---

## Prep

0. Updating and Dependencies
   ```bash
   sudo apt-get update
   sudo apt-get install openssh-server -y
   sudo apt-get install postgresql -y
   sudo apt-get install mysql-server -y

   ```

## Installation

1. Installation:
   ```bash
   sudo bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/0x31i/OCWA-Script/main/Install-OCWA.sh)"

   ```

2. Automatically make Debian vulnerable, and generate flags:
   ```bash
   sudo bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/0x31i/OCWA-Script/main/Debian-Setup.sh)"

   ```

3. Configure Apache
   ```sh
   sudo sed -i.backup 's|DocumentRoot /var/www/html.*|DocumentRoot /var/www/html/OC|g' /etc/apache2/sites-available/000-default.conf && sudo apache2ctl configtest && sudo service apache2 restart
   ```

**If you are willing to use root and empty password for the execution of MySQL commands the script must be run as root user.**


---

## Usage

Follow the on-screen instructions to install OCWA. The script will guide you through the process, including updating repositories, installing dependencies, and configuring the OCWA database.

---

## Credentials

After install, use the following credentials:

- **Username:** `admin`
- **Password:** `password`
  
---

## License

This project is licensed under the [MIT License](LICENSE).

Este proyecto está bajo la [Licencia MIT](LICENSE).
