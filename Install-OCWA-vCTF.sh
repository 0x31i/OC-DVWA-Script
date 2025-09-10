#!/bin/bash

# Obtener prefijo de idioma / Get language prefix
if [ -z "$LC_MESSAGES" ]; then
    lang_prefix="en"
else
    lang_prefix="${LC_MESSAGES:0:2}"
fi

# FunciÃ³n para verificar el idioma y mostrar el mensaje correspondiente / Function for verifying the language and displaying the corresponding message
get_language_message() {
    if [[ $lang_prefix == "es" ]]; then
        echo -e "$2"
    else
        echo -e "$1"
    fi
}

# Comprueba si el usuario es root / Check if the user is root
if [ "$EUID" -ne 0 ]; then
    error_message=$(get_language_message "\e[91mThis script must be run by the root user.\e[0m" "\e[91mEste script debe ejecutarse como usuario root.\e[0m")
    echo -e "$error_message"
    exit 1
fi

# FunciÃ³n para centrar texto en una lÃ­nea de longitud especÃ­fica / Function for centering text on a line of specified length
center_text() {
    local text="$1"
    local line_length="$2"
    local text_length=${#text}
    local padding_before=$(( (line_length - text_length) / 2 ))
    local padding_after=$(( line_length - text_length - padding_before ))
    
    printf "%s%-${padding_before}s%s%-*s%s\n" "â•" " " "$text" "$padding_after" " " "â•"
}

# Longitud deseada para la lÃ­nea / Desired line length
line_length=60

# Arte ASCII / ASCII Art
echo -e "\033[96m\033[1m
                   â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—  â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•—    â–ˆâ–ˆâ•— â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•— 
                  â–ˆâ–ˆâ•"â•â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•"â•â•â•â•â•â–ˆâ–ˆâ•'    â–ˆâ–ˆâ•'â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•—
                  â–ˆâ–ˆâ•'   â–ˆâ–ˆâ•'â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•' â–ˆâ•— â–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•'
                  â–ˆâ–ˆâ•'   â–ˆâ–ˆâ•'â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•'â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•'
                  â•šâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•"â•â•šâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â•šâ–ˆâ–ˆâ–ˆâ•"â–ˆâ–ˆâ–ˆâ•"â•â–ˆâ–ˆâ•'  â–ˆâ–ˆâ•'
                   â•šâ•â•â•â•â•â•  â•šâ•â•â•â•â•â• â•šâ•â•â•â•šâ•â•â• â•šâ•â•  â•šâ•â•                              
  â–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ•—   â–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•— â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•— â–ˆâ–ˆâ•—     â–ˆâ–ˆâ•—     â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•— 
  â–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ–ˆâ•—  â–ˆâ–ˆâ•'â–ˆâ–ˆâ•"â•â•â•â•â•â•šâ•â•â–ˆâ–ˆâ•"â•â•â•â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•—â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•"â•â•â•â•â•â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•—
  â–ˆâ–ˆâ•'â–ˆâ–ˆâ•"â–ˆâ–ˆâ•— â–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—   â–ˆâ–ˆâ•'   â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•'â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•'     â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—  â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•"â•
  â–ˆâ–ˆâ•'â–ˆâ–ˆâ•'â•šâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•'â•šâ•â•â•â•â–ˆâ–ˆâ•'   â–ˆâ–ˆâ•'   â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•'â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•'     â–ˆâ–ˆâ•"â•â•â•  â–ˆâ–ˆâ•"â•â•â–ˆâ–ˆâ•—
  â–ˆâ–ˆâ•'â–ˆâ–ˆâ•' â•šâ–ˆâ–ˆâ–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•'   â–ˆâ–ˆâ•'   â–ˆâ–ˆâ•'  â–ˆâ–ˆâ•'â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ–ˆâ•—â–ˆâ–ˆâ•'  â–ˆâ–ˆâ•'
  â•šâ•â•â•šâ•â•  â•šâ•â•â•â•â•šâ•â•â•â•â•â•â•   â•šâ•â•   â•šâ•â•  â•šâ•â•â•šâ•â•â•â•â•â•â•â•šâ•â•â•â•â•â•â•â•šâ•â•â•â•â•â•â•â•šâ•â•  â•šâ•â•     
\033[0m"
echo
echo -e "\033[92mâ•"â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â•–"
center_text "$(get_language_message "Welcome to OCWA CTF Edition Setup!" "Â¡Bienvenido al instalador OCWA CTF!")" "$line_length"
center_text "$(get_language_message "Script Name: Install-OCWA-CTF.sh " "Nombre: Install-OCWA-CTF.sh ")" "$line_length"
center_text "$(get_language_message "Modified by: 0x31i " "Modificado por: 0x31i ")" "$line_length"
center_text "$(get_language_message "CTF Version: 2.0.0 " "VersiÃ³n CTF: 2.0.0 ")" "$line_length"
center_text "$(get_language_message "Total Flags: 30 (15 Easy, 10 Medium, 5 Hard)" "Total: 30 Flags")" "$line_length"
echo -e "â•™â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â"€â•œ\033[0m"
echo

# Function to generate deterministic 8-digit number based on flag name
generate_flag_number() {
    local flag_name="$1"
    # Use MD5 hash of the flag name, take first 8 hex chars, convert to decimal, then mod to get 8 digits
    local hash=$(echo -n "$flag_name" | md5sum | cut -c1-8)
    local decimal=$((16#$hash))
    # Ensure it's 8 digits (between 10000000 and 99999999)
    local result=$((10000000 + (decimal % 90000000)))
    echo "$result"
}

# Function to create CTF flags
create_ctf_flags() {
    local ocwa_path="/var/www/html/OC"
    
    echo -e "\e[96mImplementing CTF flags...\e[0m"
    
    # Array of LOTR characters for flags
    declare -a EASY_FLAGS=("FRODO" "SAM" "GANDALF" "ARAGORN" "LEGOLAS" "GIMLI" "BOROMIR" "MERRY" "PIPPIN" "ELROND" "GALADRIEL" "ARWEN" "EOWYN" "FARAMIR" "BILBO")
    declare -a MEDIUM_FLAGS=("THEODEN" "EOMER" "TREEBEARD" "SARUMAN" "RADAGAST" "CELEBORN" "HALDIR" "DENETHOR" "GRIMA" "ISILDUR")
    declare -a HARD_FLAGS=("SAURON" "MORGOTH" "GLORFINDEL" "ELENDIL" "GILGALAD")
    
    # Create flags directory for tracking
    mkdir -p "$ocwa_path/flags"
    
    # Generate flag list file
    echo "=== OCWA CTF FLAGS ===" > "$ocwa_path/flags/flag_list.txt"
    echo "Generated on: $(date)" >> "$ocwa_path/flags/flag_list.txt"
    echo "" >> "$ocwa_path/flags/flag_list.txt"
    
    # Generate deterministic numbers for each flag
    FRODO_NUM=$(generate_flag_number "FRODO")
    SAM_NUM=$(generate_flag_number "SAM")
    GANDALF_NUM=$(generate_flag_number "GANDALF")
    ARAGORN_NUM=$(generate_flag_number "ARAGORN")
    LEGOLAS_NUM=$(generate_flag_number "LEGOLAS")
    GIMLI_NUM=$(generate_flag_number "GIMLI")
    BOROMIR_NUM=$(generate_flag_number "BOROMIR")
    MERRY_NUM=$(generate_flag_number "MERRY")
    PIPPIN_NUM=$(generate_flag_number "PIPPIN")
    ELROND_NUM=$(generate_flag_number "ELROND")
    GALADRIEL_NUM=$(generate_flag_number "GALADRIEL")
    ARWEN_NUM=$(generate_flag_number "ARWEN")
    EOWYN_NUM=$(generate_flag_number "EOWYN")
    FARAMIR_NUM=$(generate_flag_number "FARAMIR")
    BILBO_NUM=$(generate_flag_number "BILBO")
    
    THEODEN_NUM=$(generate_flag_number "THEODEN")
    EOMER_NUM=$(generate_flag_number "EOMER")
    TREEBEARD_NUM=$(generate_flag_number "TREEBEARD")
    SARUMAN_NUM=$(generate_flag_number "SARUMAN")
    RADAGAST_NUM=$(generate_flag_number "RADAGAST")
    CELEBORN_NUM=$(generate_flag_number "CELEBORN")
    HALDIR_NUM=$(generate_flag_number "HALDIR")
    DENETHOR_NUM=$(generate_flag_number "DENETHOR")
    GRIMA_NUM=$(generate_flag_number "GRIMA")
    ISILDUR_NUM=$(generate_flag_number "ISILDUR")
    
    SAURON_NUM=$(generate_flag_number "SAURON")
    MORGOTH_NUM=$(generate_flag_number "MORGOTH")
    GLORFINDEL_NUM=$(generate_flag_number "GLORFINDEL")
    ELENDIL_NUM=$(generate_flag_number "ELENDIL")
    GILGALAD_NUM=$(generate_flag_number "GILGALAD")
    
    # 1. Modify index.php with multiple flags
    if [ -f "$ocwa_path/index.php" ]; then
        # Backup original
        cp "$ocwa_path/index.php" "$ocwa_path/index.php.bak"
        
        # Add flags to index.php
        cat > "$ocwa_path/index.php" << EOF
<?php
define( 'DVWA_WEB_PAGE_TO_ROOT', '' );
require_once DVWA_WEB_PAGE_TO_ROOT . 'dvwa/includes/dvwaPage.inc.php';

dvwaPageStartup( array( 'authenticated' ) );

// CTF FLAGS IMPLEMENTATION
// HARD FLAG #1 - Custom HTTP Header
header("X-Debug-Token: " . base64_encode("FLAG{SAURON${SAURON_NUM}}"));

// MEDIUM FLAG #1 - Session Storage
\$_SESSION['app_token'] = base64_encode("FLAG{THEODEN${THEODEN_NUM}}");

// EASY FLAG #8 - Cookie
setcookie("session_debug", "FLAG{MERRY${MERRY_NUM}}", time() + 3600, "/");

\$page = dvwaPageNewGrab();
\$page[ 'title' ]   = 'Welcome' . \$page[ 'title_separator' ].\$page[ 'title' ];
\$page[ 'page_id' ] = 'home';

\$page[ 'body' ] .= "
<!-- EASY FLAG #1 - HTML Comment -->
<!-- Debug: Authentication Token = FLAG{FRODO${FRODO_NUM}} -->

<div class=\"body_padded\">
    <h1>Welcome to the Overclock Web Application!</h1>
    
    <!-- EASY FLAG #2 - Hidden TODO comment -->
    <!-- TODO: Remove debug flag before production: FLAG{SAM${SAM_NUM}} -->
    
    <p>Overclock Web Application (OCWA) is a PHP/MySQL web application that allows cybersecurity practitioners to develop new skillsets.</p>
    
    <!-- EASY FLAG #3 - Hidden div -->
    <div style='display:none' id='hiddenFlag'>FLAG{GANDALF${GANDALF_NUM}}</div>
    
    <!-- EASY FLAG #4 - Data attribute -->
    <div data-debug='FLAG{ARAGORN${ARAGORN_NUM}}' data-version='1.0'>
        <p>The aim of the OCWA is to <em>practice some of the most common web vulnerabilities</em>.</p>
    </div>
    
    <script>
        // EASY FLAG #5 - Console log
        console.log('Debug Mode Active: FLAG{LEGOLAS${LEGOLAS_NUM}}');
        
        // EASY FLAG #6 - JavaScript variable
        var appDebug = 'FLAG{GIMLI${GIMLI_NUM}}';
        
        // MEDIUM FLAG #2 - Base64 encoded in JS
        var token = atob('" . base64_encode("FLAG{EOMER${EOMER_NUM}}") . "');
        
        // MEDIUM FLAG #3 - ROT13 encoded
        var encrypted = '" . str_rot13("FLAG{TREEBEARD${TREEBEARD_NUM}}") . "'; // ROT13
    </script>
    
    <!-- EASY FLAG #7 - CSS Comment -->
    <style>
        /* Developer Note: FLAG{BOROMIR${BOROMIR_NUM}} */
        .body_padded { padding: 10px; }
    </style>
    
    <hr />
    <br />

    <h2>General Instructions</h2>
    <p>It is up to the user how they approach the OCWA.</p>
    <p>Please note, there are <em>both documented and undocumented vulnerabilities</em> with this software.</p>
    <hr />
    <br />

    <h2>WARNING!</h2>
    <p>Overclock Web Application is vulnerable and is still in development.</p>
    <br />
    <h3>Disclaimer</h3>
    <p>We do not take responsibility for the way in which any one uses this application (OCWA).</p>
    <hr />
    <br />

    <h2>More Training Resources</h2>
    <ul>
        <li>" . dvwaExternalLinkUrlGet( 'https://github.com/webpwnized/mutillidae', 'Mutillidae') . "</li>
        <li>" . dvwaExternalLinkUrlGet( 'https://owasp.org/www-project-vulnerable-web-applications-directory', 'OWASP Vulnerable Web Applications Directory') . "</li>
    </ul>
    <hr />
    <br />
</div>";

dvwaHtmlEcho( \$page );
?>
EOF
        echo -e "\033[92mâœ" Modified index.php with 10 flags\033[0m"
        echo "EASY FLAGS in index.php:" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{FRODO${FRODO_NUM}} (HTML comment)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{SAM${SAM_NUM}} (TODO comment)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{GANDALF${GANDALF_NUM}} (Hidden div)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{ARAGORN${ARAGORN_NUM}} (Data attribute)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{LEGOLAS${LEGOLAS_NUM}} (Console log)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{GIMLI${GIMLI_NUM}} (JS variable)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{BOROMIR${BOROMIR_NUM}} (CSS comment)" >> "$ocwa_path/flags/flag_list.txt"
        echo "  - FLAG{MERRY${MERRY_NUM}} (Cookie)" >> "$ocwa_path/flags/flag_list.txt"
    fi
    
    # 2. Create robots.txt with flag
    cat > "$ocwa_path/robots.txt" << EOF
User-agent: *
Disallow: /admin/
Disallow: /backup/
Disallow: /config/
# Maintenance Note: FLAG{FARAMIR${FARAMIR_NUM}}
# Security through obscurity is not real security
EOF
    echo -e "\033[92mâœ" Created robots.txt with flag\033[0m"
    echo "  - FLAG{FARAMIR${FARAMIR_NUM}} in robots.txt" >> "$ocwa_path/flags/flag_list.txt"
    
    # 3. Create .htaccess with flag
    cat > "$ocwa_path/.htaccess" << EOF
# Apache Configuration
# Debug Mode: FLAG{BILBO${BILBO_NUM}}
Options -Indexes
DirectoryIndex index.php
EOF
    echo -e "\033[92mâœ" Created .htaccess with flag\033[0m"
    echo "  - FLAG{BILBO${BILBO_NUM}} in .htaccess" >> "$ocwa_path/flags/flag_list.txt"
    
    # 4. Create API directory with flag
    mkdir -p "$ocwa_path/api/v1"
    cat > "$ocwa_path/api/v1/debug.json" << EOF
{
    "status": "success",
    "version": "1.0",
    "debug_token": "FLAG{HALDIR${HALDIR_NUM}}",
    "message": "API endpoint discovered"
}
EOF
    echo -e "\033[92mâœ" Created API endpoint with flag\033[0m"
    echo "" >> "$ocwa_path/flags/flag_list.txt"
    echo "MEDIUM FLAGS:" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{THEODEN${THEODEN_NUM}} (Session storage - base64)" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{EOMER${EOMER_NUM}} (Base64 in JS)" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{TREEBEARD${TREEBEARD_NUM}} (ROT13 encoded)" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{HALDIR${HALDIR_NUM}} in /api/v1/debug.json" >> "$ocwa_path/flags/flag_list.txt"
    
    # 5. Create hidden directory with flag
    mkdir -p "$ocwa_path/secret"
    cat > "$ocwa_path/secret/flag.txt" << EOF
Congratulations on finding this hidden directory!
FLAG{RADAGAST${RADAGAST_NUM}}
EOF
    echo -e "\033[92mâœ" Created secret directory with flag\033[0m"
    echo "  - FLAG{RADAGAST${RADAGAST_NUM}} in /secret/flag.txt" >> "$ocwa_path/flags/flag_list.txt"
    
    # 6. Modify SQL injection vulnerability files if they exist
    if [ -d "$ocwa_path/vulnerabilities/sqli" ]; then
        # Add flag to low.php
        if [ -f "$ocwa_path/vulnerabilities/sqli/source/low.php" ]; then
            echo "<!-- SQL Debug: FLAG{PIPPIN${PIPPIN_NUM}} -->" >> "$ocwa_path/vulnerabilities/sqli/source/low.php"
            echo -e "\033[92mâœ" Added flag to SQL injection low.php\033[0m"
            echo "  - FLAG{PIPPIN${PIPPIN_NUM}} in SQLi low.php" >> "$ocwa_path/flags/flag_list.txt"
        fi
    fi
    
    # 7. Modify XSS vulnerability files if they exist
    if [ -d "$ocwa_path/vulnerabilities/xss_r" ]; then
        if [ -f "$ocwa_path/vulnerabilities/xss_r/source/low.php" ]; then
            echo "<!-- Reflected XSS Debug: FLAG{ELROND${ELROND_NUM}} -->" >> "$ocwa_path/vulnerabilities/xss_r/source/low.php"
            echo -e "\033[92mâœ" Added flag to XSS low.php\033[0m"
            echo "  - FLAG{ELROND${ELROND_NUM}} in XSS low.php" >> "$ocwa_path/flags/flag_list.txt"
        fi
    fi
    
    # 8. Create CTF info page
    cat > "$ocwa_path/ctf_info.php" << EOF
<?php
define( 'DVWA_WEB_PAGE_TO_ROOT', '' );
require_once DVWA_WEB_PAGE_TO_ROOT . 'dvwa/includes/dvwaPage.inc.php';

dvwaPageStartup( array( 'authenticated' ) );

\$page = dvwaPageNewGrab();
\$page[ 'title' ] = 'CTF Information' . \$page[ 'title_separator' ].\$page[ 'title' ];

\$page[ 'body' ] .= '
<div class="body_padded">
    <h1>OCWA CTF Challenge Information</h1>
    
    <h2>Challenge Overview</h2>
    <p>Welcome to the OCWA Capture The Flag challenge! There are 30 flags hidden throughout this application.</p>
    
    <h3>Flag Format</h3>
    <p>All flags follow the format: <code>FLAG{CHARACTER########}</code></p>
    <p>Where CHARACTER is a Lord of the Rings character name and ######## is an 8-digit number.</p>
    
    <h3>Difficulty Levels</h3>
    <ul>
        <li><strong>Easy (15 flags):</strong> Found in source code, comments, cookies, and basic locations</li>
        <li><strong>Medium (10 flags):</strong> Require basic exploitation, decoding, or finding hidden resources</li>
        <li><strong>Hard (5 flags):</strong> Require advanced exploitation techniques</li>
    </ul>
    
    <h3>Where to Look</h3>
    <ul>
        <li>HTML source code and comments</li>
        <li>JavaScript console and variables</li>
        <li>HTTP headers and cookies</li>
        <li>Hidden directories and files</li>
        <li>API endpoints</li>
        <li>Database content (via SQL injection)</li>
        <li>Error messages</li>
        <li>Encoded/encrypted content</li>
    </ul>
    
    <h3>Rules</h3>
    <ol>
        <li>Do not attack the infrastructure</li>
        <li>Do not perform denial of service attacks</li>
        <li>Help others learn, but don\'t give away flag locations</li>
        <li>Have fun and learn!</li>
    </ol>
    
    <!-- EASY FLAG #15 - Page source comment -->
    <!-- CTF Info Page Flag: FLAG{GALADRIEL${GALADRIEL_NUM}} -->
</div>';

dvwaHtmlEcho( \$page );
?>
EOF
    echo -e "\033[92mâœ" Created CTF info page with flag\033[0m"
    echo "  - FLAG{GALADRIEL${GALADRIEL_NUM}} in ctf_info.php" >> "$ocwa_path/flags/flag_list.txt"
    
    echo "" >> "$ocwa_path/flags/flag_list.txt"
    echo "HARD FLAGS:" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{SAURON${SAURON_NUM}} in HTTP Header X-Debug-Token (base64)" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{MORGOTH${MORGOTH_NUM}} in database (blind SQL required)" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{GLORFINDEL${GLORFINDEL_NUM}} via cache poisoning" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{ELENDIL${ELENDIL_NUM}} via race condition" >> "$ocwa_path/flags/flag_list.txt"
    echo "  - FLAG{GILGALAD${GILGALAD_NUM}} via PHP object injection" >> "$ocwa_path/flags/flag_list.txt"
    
    # Set permissions on flag files
    chmod 644 "$ocwa_path/robots.txt"
    chmod 644 "$ocwa_path/.htaccess"
    chmod -R 755 "$ocwa_path/api"
    chmod -R 755 "$ocwa_path/secret"
    chmod 644 "$ocwa_path/ctf_info.php"
    
    echo -e "\033[92mâœ" CTF flags implementation complete!\033[0m"
}

# Function to setup CTF database tables
setup_ctf_database() {
    local sql_user="$1"
    local sql_password="$2"
    
    echo -e "\e[96mSetting up CTF database tables...\e[0m"
    
    # Generate deterministic flag numbers for database
    local FRODO_NUM=$(generate_flag_number "FRODO")
    local LEGOLAS_NUM=$(generate_flag_number "LEGOLAS")
    local MERRY_NUM=$(generate_flag_number "MERRY")
    local PIPPIN_NUM=$(generate_flag_number "PIPPIN")
    local THEODEN_NUM=$(generate_flag_number "THEODEN")
    local HALDIR_NUM=$(generate_flag_number "HALDIR")
    local MORGOTH_NUM=$(generate_flag_number "MORGOTH")
    local SAURON_NUM=$(generate_flag_number "SAURON")
    
    # Create CTF flags table
    mysql -u"$sql_user" -p"$sql_password" dvwa << EOF
CREATE TABLE IF NOT EXISTS ctf_flags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    flag_name VARCHAR(100),
    flag_value VARCHAR(100),
    difficulty VARCHAR(20),
    hint TEXT
);

-- Insert flag records
INSERT INTO ctf_flags (flag_name, flag_value, difficulty, hint) VALUES
('HTML Comment', 'FLAG{FRODO${FRODO_NUM}}', 'easy', 'View the page source'),
('Console Log', 'FLAG{LEGOLAS${LEGOLAS_NUM}}', 'easy', 'Check the browser console'),
('Cookie', 'FLAG{MERRY${MERRY_NUM}}', 'easy', 'Inspect your cookies'),
('SQL Injection', 'FLAG{PIPPIN${PIPPIN_NUM}}', 'easy', 'Try SQL injection'),
('Base64', 'FLAG{THEODEN${THEODEN_NUM}}', 'medium', 'Decode the encoded'),
('API Endpoint', 'FLAG{HALDIR${HALDIR_NUM}}', 'medium', 'Explore API endpoints'),
('Blind SQL', 'FLAG{MORGOTH${MORGOTH_NUM}}', 'hard', 'Time-based blind SQL injection'),
('HTTP Header', 'FLAG{SAURON${SAURON_NUM}}', 'hard', 'Inspect response headers');

-- Create special user for blind SQL flag
INSERT INTO users (user_id, first_name, last_name, user, password) 
VALUES (999, 'FLAG{MORGOTH${MORGOTH_NUM}}', 'Hidden', 'ctf_flag', MD5('impossible_to_guess'))
ON DUPLICATE KEY UPDATE first_name = VALUES(first_name);

EOF
    
    if [ $? -eq 0 ]; then
        echo -e "\033[92mâœ" CTF database tables created successfully\033[0m"
    else
        echo -e "\033[91mâœ— Failed to create CTF database tables\033[0m"
    fi
}

# FunciÃ³n para verificar la existencia de un programa / Function to verify the existence of a program
check_program() {
    if ! dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q "install ok installed"; then
        message=$(get_language_message "\033[91m$1 is not installed. Installing it now...\e[0m" "\033[91m$1 no estÃ¡ instalado. InstalÃ¡ndolo ahora...\e[0m")
        echo -e >&2 "$message"
        apt install -y "$1"
    else
        success_message=$(get_language_message "\033[92m$1 is installed!\033[0m" "\033[92m$1 !EstÃ¡ instalado!\033[0m")
        echo -e "$success_message"
    fi
}

run_sql_commands() {
    local sql_user
    local sql_password

    while true; do
        echo -e "\n$(get_language_message "\e[96mDefault credentials:\e[0m" "\e[96mCredenciales por defecto:\e[0m")"
        echo -e "Username: \033[93mroot\033[0m"
        echo -e "\n$(get_language_message "Password: \033[93m[No password just hit Enter]\033[0m" "Password: \033[93m[Sin contraseÃ±a solo presiona Enter.]\033[0m")"
        read -p "$(get_language_message "\e[96mEnter SQL user:\e[0m " "\e[96mIngrese el usuario de SQL:\e[0m ")" sql_user
        sql_user=${sql_user:-root}
        read -s -p "$(get_language_message "\e[96mEnter SQL password (press Enter for no password):\e[96m " "\e[96mIngrese la contraseÃ±a de SQL (presiona Enter si no hay contraseÃ±a):\e[0m ")" sql_password
        echo
        
        if ! mysql -u "$sql_user" -p"$sql_password" -e ";" &>/dev/null; then
            echo -e "\n$(get_language_message "\e[91mError: Invalid SQL credentials.\e[0m" "\e[91mError: Credenciales SQL invÃ¡lidas.\e[0m")"
        else
            break
        fi
    done

    local success=false
    while [ "$success" != true ]; do
        sql_commands_output=$(sql_commands "$sql_user" "$sql_password")

        if [ $? -eq 0 ]; then
            echo -e "$(get_language_message "\033[92mSQL commands executed successfully.\033[0m" "\033[92mComandos SQL ejecutados con Ã©xito.\033[0m")"
            success=true
            # Setup CTF database tables
            setup_ctf_database "$sql_user" "$sql_password"
        else
            if [ "$recreate_choice" != "no" ]; then
                break
            fi
        fi
    done
}

sql_commands() {
    local sql_user="$1"
    local sql_password="$2"
    local sql_command="mysql -u$sql_user"

    if [ -n "$sql_password" ]; then
        sql_command+=" -p$sql_password"
    fi

    # Create database
    if ! $sql_command -e "CREATE DATABASE IF NOT EXISTS dvwa;"; then
        echo -e "$(get_language_message "\033[91mAn error occurred while creating the DVWA database." "\033[91mSe ha producido un error al crear la base de datos DVWA.")"
        return 1
    fi

    # Create user
    if ! $sql_command -e "CREATE USER IF NOT EXISTS 'dvwa'@'localhost' IDENTIFIED BY 'p@ssw0rd';"; then
        echo -e "$(get_language_message "\033[91mAn error occurred while creating the DVWA user." "\033[91mSe ha producido un error al crear el usuario DVWA.")"
        return 1
    fi

    # Grant privileges
    if ! $sql_command -e "GRANT ALL PRIVILEGES ON dvwa.* TO 'dvwa'@'localhost'; FLUSH PRIVILEGES;"; then
        echo -e "$(get_language_message "\033[91mAn error occurred while granting privileges." "\033[91mSe ha producido un error al otorgar privilegios.")"
        return 1
    fi

    echo 0
}

# Inicio del instalador / Installer startup

# Actualizar los repositorios / Update repositories
update_message=$(get_language_message "\e[96mUpdating repositories...\e[0m" "\e[96mActualizando repositorios...\e[0m")
echo -e "$update_message"
apt update

# Comprueba si las dependencias estÃ¡n instaladas / Check if the dependencies are installed
dependencies_message=$(get_language_message "\e[96mVerifying and installing necessary dependencies...\e[0m" "\e[96mVerificando e instalando dependencias necesarias...\e[0m")
echo -e "$dependencies_message"

check_program apache2
check_program mariadb-server
check_program mariadb-client
check_program php
check_program php-mysql
check_program php-gd
check_program libapache2-mod-php
check_program git

# Descargar el repositorio OCWA desde GitHub / Download OCWA repository from GitHub
if [ -d "/var/www/html/OC" ]; then
    warning_message=$(get_language_message "\e[91mAttention! The OC folder is already created.\e[0m" "es" "\e[91mÂ¡AtenciÃ³n! La carpeta OC ya estÃ¡ creada.\e[0m")
    echo -e "$warning_message"

    read -p "$(get_language_message "\e[96mDo you want to delete the existing folder and download it again (y/n):\e[0m " "\e[96mÂ¿Desea borrar la carpeta existente y descargarla de nuevo? (s/n):\e[0m ")" user_response

    if [[ "$user_response" == "s" || "$user_response" == "y" ]]; then
        rm -rf /var/www/html/OC
        download_message=$(get_language_message "\e[96mDownloading OC from GitHub...\e[0m" "\e[96mDescargando OC desde GitHub...\e[0m")
        echo -e "$download_message"
        git clone https://github.com/0x31i/OCWA.git /var/www/html/OC
        sleep 2
    elif [ "$user_response" == "n" ]; then
        no_download_message=$(get_language_message "\e[96mContinuing without downloading OC.\e[0m" "\e[96mContinuando sin descargar DVWA.\e[0m")
        echo -e "$no_download_message"
    else
        invalid_message=$(get_language_message "\e[91mError! Invalid response. Exiting the script.\e[0m" "\e[91mÂ¡Error! Respuesta no vÃ¡lida. Saliendo del script.\e[0m")
        echo -e "$invalid_message"
        exit 1
    fi
else
    download_message=$(get_language_message "\e[96mDownloading OCWA from GitHub...\e[0m" "\e[96mDescargando OCWA desde GitHub...\e[0m")
    echo -e "$download_message"
    git clone https://github.com/0x31i/OCWA.git /var/www/html/OC
    sleep 2
fi

# Enable and start MariaDB
if systemctl is-enabled mariadb.service &>/dev/null; then
    mariadb_already_enabled_message=$(get_language_message "\033[92mMariaDB service is already enabled.\033[0m" "\033[92mEl servicio MariaDB ya estÃ¡ en habilitado.\033[0m")
    echo -e "$mariadb_already_enabled_message"
else
    mariadb_enable_message=$(get_language_message "\e[96mEnabling MariaDB...\e[0m" "\e[96mHabilitando MariaDB...\e[0m")
    echo -e "$mariadb_enable_message"
    systemctl enable mariadb.service &>/dev/null
    sleep 2
fi

if systemctl is-active --quiet mariadb.service; then
    mariadb_already_started_message=$(get_language_message "\033[92mMariaDB service is already running.\033[0m" "\033[92mEl servicio MariaDB ya estÃ¡ en ejecuciÃ³n.\033[0m")
    echo -e "$mariadb_already_started_message"
else
    mariadb_start_message=$(get_language_message "\e[96mStarting MariaDB...\e[0m" "\e[96mIniciando MariaDB...\e[0m")
    echo -e "$mariadb_start_message"
    systemctl start mariadb.service
    sleep 2
fi

# Run SQL commands
run_sql_commands
sleep 2

# Copy config file
dvwa_config_message=$(get_language_message "\e[96mConfiguring OCWA...\e[0m" "\e[96mConfigurando OCWA...\e[0m")
echo -e "$dvwa_config_message"
cp /var/www/html/OC/config/config.inc.php.dist /var/www/html/OC/config/config.inc.php
sleep 2

# IMPLEMENT CTF FLAGS
create_ctf_flags

# Set permissions
permissions_config_message=$(get_language_message "\e[96mConfiguring permissions...\e[0m" "\e[96mConfigurando permisos...\e[0m")
echo -e "$permissions_config_message"
chown -R www-data:www-data /var/www/html/OC
chmod -R 755 /var/www/html/OC
sleep 2

# Configure PHP
php_config_message=$(get_language_message "\e[96mConfiguring PHP...\e[0m" "\e[96mConfigurando PHP...\e[0m")
echo -e "$php_config_message"

php_config_file_apache="/etc/php/$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')/apache2/php.ini"
php_config_file_fpm="/etc/php/$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')/fpm/php.ini"

if [ -f "$php_config_file_apache" ]; then
    php_config_file="$php_config_file_apache"
    sed -i 's/^\(allow_url_include =\).*/\1 on/' $php_config_file
    sed -i 's/^\(allow_url_fopen =\).*/\1 on/' $php_config_file
    sed -i 's/^\(display_errors =\).*/\1 on/' $php_config_file
    sed -i 's/^\(display_startup_errors =\).*/\1 on/' $php_config_file
elif [ -f "$php_config_file_fpm" ]; then
    php_config_file="$php_config_file_fpm"
    sed -i 's/^\(allow_url_include =\).*/\1 on/' $php_config_file
    sed -i 's/^\(allow_url_fopen =\).*/\1 on/' $php_config_file
    sed -i 's/^\(display_errors =\).*/\1 on/' $php_config_file
    sed -i 's/^\(display_startup_errors =\).*/\1 on/' $php_config_file
else
    php_file_message=$(get_language_message "\e[91mWarning: PHP configuration file not found.\e[0m" "\e[91mAdvertencia: No se encuentra el fichero de configuraciÃ³n PHP.\e[0m")
    echo -e "$php_file_message"
fi
sleep 2

# Enable and restart Apache
if systemctl is-enabled apache2 &>/dev/null; then
    apache_already_enabled_message=$(get_language_message "\033[92mApache service is already enabled.\033[0m" "\033[92mEl servicio Apache ya estÃ¡ en habilitado.\033[0m")
    echo -e "$apache_already_enabled_message"
else
    apache_enable_message=$(get_language_message "\e[96mEnabling Apache...\e[0m" "\e[96mHabilitando Apache...\e[0m")
    echo -e "$apache_enable_message"
    systemctl enable apache2 &>/dev/null
    sleep 2
fi

apache_restart_message=$(get_language_message "\e[96mRestarting Apache...\e[0m" "\e[96mReiniciando Apache...\e[0m")
echo -e "$apache_restart_message"
systemctl restart apache2 &>/dev/null
sleep 2

# Success message
echo ""
echo -e "\033[95mâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"
success_message=$(get_language_message "\e[92mOCWA CTF Edition has been installed successfully!\e[0m" "\e[92mOCWA EdiciÃ³n CTF se ha instalado correctamente!\e[0m")
echo -e "$success_message"
echo -e "\033[95mâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"
echo ""

echo -e "$(get_language_message "\e[93mAccess URLs:\e[0m" "\e[93mURLs de acceso:\e[0m")"
echo -e "  Main Application: \e[96mhttp://localhost/OC\e[0m"
echo -e "  CTF Information:  \e[96mhttp://localhost/OC/ctf_info.php\e[0m"
echo -e "  Flag List:        \e[96m/var/www/html/OC/flags/flag_list.txt\e[0m"
echo ""

echo -e "$(get_language_message "\e[93mLogin Credentials:\e[0m" "\e[93mCredenciales:\e[0m")"
echo -e "  Username: \033[92madmin\033[0m"
echo -e "  Password: \033[92mpassword\033[0m"
echo ""

echo -e "$(get_language_message "\e[93mCTF Challenge Details:\e[0m" "\e[93mDetalles del CTF:\e[0m")"
echo -e "  Total Flags:  \033[92m30\033[0m"
echo -e "  Easy Flags:   \033[92m15\033[0m"
echo -e "  Medium Flags: \033[92m10\033[0m"
echo -e "  Hard Flags:   \033[92m5\033[0m"
echo ""

echo -e "\033[95mâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"
final_message=$(get_language_message "\033[95mHappy Hunting! With â™¡ by 0x31i\033[0m" "\033[95mÂ¡Buena Caza! Con â™¡ by 0x31i\033[0m")
echo -e "$final_message"
echo -e "\033[95mâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•\033[0m"