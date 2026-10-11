#!/usr/bin/env bash
# ============================================================
#  MouliResult CLI - Script de désinstallation
# ============================================================

RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
CYAN='\033[96m'
BOLD='\033[1m'
RESET='\033[0m'

echo -e "${YELLOW}${BOLD}[*] Désinstallation de MouliResult CLI...${RESET}"

TARGET_BIN="$HOME/.local/bin/mouli"
CONFIG_DIR="$HOME/.config/mouli"

if [ -f "$TARGET_BIN" ]; then
    rm -f "$TARGET_BIN"
    echo -e "  ${GREEN}✓${RESET} Binaire supprimé ($TARGET_BIN)"
else
    echo -e "  ${YELLOW}ℹ${RESET} Binaire non trouvé dans $TARGET_BIN"
fi

if [ -d "$CONFIG_DIR" ]; then
    echo -en "${CYAN}?${RESET} Souhaitez-vous aussi supprimer la configuration ($CONFIG_DIR) ? [o/N] "
    read -r response
    if [[ "$response" =~ ^([oO]|[yY])$ ]]; then
        rm -rf "$CONFIG_DIR"
        echo -e "  ${GREEN}✓${RESET} Dossier de configuration supprimé."
    else
        echo -e "  ${YELLOW}ℹ${RESET} Configuration conservée."
    fi
fi

echo -e "${GREEN}${BOLD}Désinstallation terminée.${RESET}"
