#!/usr/bin/env bash
# ============================================================
#  MouliResult CLI - Script d'installation automatique
#  Auteur : Chamss-dine AGBIZOUNON (DineTech / foundhack)
# ============================================================

set -e

# Couleurs
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
CYAN='\033[96m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${CYAN}${BOLD}"
cat << 'EOF'
  __  __             _ _ ____                 _ _   
 |  \/  | ___  _   _| (_)  _ \ ___  ___ _   _| | |_ 
 | |\/| |/ _ \| | | | | | |_) / _ \/ __| | | | | __|
 | |  | | (_) | |_| | | |  _ <  __/\__ \ |_| | | |_ 
 |_|  |_|\___/ \__,_|_|_|_| \_\___||___/\__,_|_|\__|
                                                    
          MouliResult CLI - Epitech Assistant
EOF
echo -e "${RESET}"

echo -e "${BLUE}[*]${RESET} Vérification de l'environnement..."

# 1. Vérification de Python 3
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[ERREUR]${RESET} Python 3 n'est pas installé sur votre machine."
    echo -e "Installez-le avec : ${YELLOW}sudo dnf install python3${RESET} (Fedora) ou ${YELLOW}sudo apt install python3${RESET} (Ubuntu/Debian)"
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
echo -e "  ${GREEN}✓${RESET} Python ${PYTHON_VERSION} détecté"

# 2. Dossier cible
INSTALL_DIR="$HOME/.local/bin"
TARGET_BIN="$INSTALL_DIR/mouli"
mkdir -p "$INSTALL_DIR"

# 3. Récupération du binaire mouli
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
SOURCE_LOCAL="$SCRIPT_DIR/bin/mouli"

if [ -f "$SOURCE_LOCAL" ]; then
    echo -e "${BLUE}[*]${RESET} Installation depuis les fichiers locaux..."
    cp "$SOURCE_LOCAL" "$TARGET_BIN"
else
    echo -e "${BLUE}[*]${RESET} Téléchargement de la dernière version depuis GitHub..."
    RAW_URL="https://raw.githubusercontent.com/foundhack/mouli/main/bin/mouli"
    if command -v curl &> /dev/null; then
        curl -fsSL "$RAW_URL" -o "$TARGET_BIN"
    elif command -v wget &> /dev/null; then
        wget -qO "$TARGET_BIN" "$RAW_URL"
    else
        echo -e "${RED}[ERREUR]${RESET} 'curl' ou 'wget' est requis pour le téléchargement."
        exit 1
    fi
fi

chmod +x "$TARGET_BIN"
echo -e "  ${GREEN}✓${RESET} Binaire installé dans ${BOLD}$TARGET_BIN${RESET}"

# 4. Configuration du PATH
PATH_UPDATED=0
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo -e "${YELLOW}[!]${RESET} ~/.local/bin n'est pas encore dans votre PATH."

    SHELL_CONFIG=""
    if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ] || [ -f "$HOME/.bashrc" ]; then
        SHELL_CONFIG="$HOME/.bashrc"
    fi

    if [ -n "$SHELL_CONFIG" ]; then
        if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_CONFIG" 2>/dev/null; then
            echo '' >> "$SHELL_CONFIG"
            echo '# MouliResult CLI PATH' >> "$SHELL_CONFIG"
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
            echo -e "  ${GREEN}✓${RESET} PATH ajouté automatiquement à ${BOLD}$SHELL_CONFIG${RESET}"
            PATH_UPDATED=1
        fi
    fi
fi

# 5. Message final
echo ""
echo -e "${GREEN}${BOLD}🎉 Félicitations ! MouliResult CLI est installé avec succès !${RESET}"
echo ""

if [ $PATH_UPDATED -eq 1 ]; then
    echo -e "${YELLOW}👉 Pour activer la commande immédiatement, rechargez votre shell :${RESET}"
    echo -e "   ${CYAN}source ~/.bashrc${RESET}  (ou ${CYAN}source ~/.zshrc${RESET})"
    echo ""
fi

echo -e "👉 ${BOLD}Prochaine étape : connectez votre compte MyEpitech${RESET}"
echo -e "   Lancez la commande : ${CYAN}${BOLD}mouli login${RESET}"
echo ""
echo -e "👉 ${BOLD}Commandes utiles :${RESET}"
echo -e "   ${CYAN}mouli${RESET}          → Affiche le verdict de la dernière moulinette"
echo -e "   ${CYAN}mouli -w${RESET}       → Mode surveillance en direct (idéal en exam / stumper)"
echo -e "   ${CYAN}mouli -l${RESET}       → Historique des notes récentes"
echo -e "   ${CYAN}mouli <projet>${RESET} → Recherche par nom (ex: ${GRAY}mouli corewar${RESET})"
echo ""
