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
- Supports both English and Spanish languages.

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
   sudo bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/0x31i/OCWA-Script/main/vulnDebian_Setup.sh)"

   ```

**If you are willing to use root and empty password for the execution of MySQL commands the script must be run as root user.**

**Si vas a usar el usuario root y la contraseña vacia para ejecutar el script tienes que hacerlo como usuario root.**


---

## Usage

Follow the on-screen instructions to install OCWA. The script will guide you through the process, including updating repositories, installing dependencies, and configuring the OCWA database.

Sigue las instrucciones en pantalla para instalar OCWA. El script te guiará a través del proceso, incluyendo la actualización de repositorios, la instalación de dependencias y la configuración de la base de datos de OCWA.

---

## Credentials

After install, use the following credentials:

Después de la instalación, utiliza las siguientes credenciales:

- **Username:** `admin`
- **Password:** `password`
  
---

## Language Support

The script supports both English and Spanish languages. It automatically detects the system language and provides instructions accordingly.

El script admite los idiomas inglés y español. Detecta automáticamente el idioma del sistema y proporciona instrucciones en consecuencia.

---

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvement, please create a pull request or open an issue in the [GitHub repository](https://github.com/0x31i/OCWA-Script).

¡Las contribuciones son bienvenidas! Si encuentras algún problema o tienes sugerencias de mejora, por favor, crea una solicitud de extracción o abre un problema en el [repositorio de GitHub](https://github.com/0x31i/OCWA-Script).

---

## License

This project is licensed under the [MIT License](LICENSE).

Este proyecto está bajo la [Licencia MIT](LICENSE).
