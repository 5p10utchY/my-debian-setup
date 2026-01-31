#!/bin/bash

# Debian Setup Script
# Installe les paquets essentiels et applique les configurations personnalisées
# Usage: bash install.sh

set -euo pipefail

# Couleurs pour l'output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS_DIR="${SCRIPT_DIR}/configs"
LOG_FILE="${SCRIPT_DIR}/install.log"

# Fonctions utilitaires
log() {
    echo -e "${BLUE}[INFO]${NC} $*" | tee -a "$LOG_FILE"
}

log_success() {
    echo -e "${GREEN}[OK]${NC} $*" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $*" | tee -a "$LOG_FILE"
}

# Vérifier si exécuté en tant que root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        log_error "Ce script doit être exécuté en tant que root"
        exit 1
    fi
}

# Mettre à jour les sources
update_system() {
    log "Mise à jour des sources..."
    apt-get update
    log_success "Sources mises à jour"
}

# Installer les paquets essentiels
install_essential_packages() {
    log "Installation des paquets essentiels..."
    
    local packages=(
        # Utilitaires de base
        "curl"
        "wget"
        "sudo"
        "build-essential"
        "ca-certificates"
        
        # Éditeurs
        "vim"
        
        # Outils système
        "htop"
        "tmux"
        "screen"
        "net-tools"
        "dnsutils"
        "whois"
        "traceroute"
        
        # Compression
        "zip"
        "unzip"
        "tar"
        "gzip"
        
        # Développement
        "git"
        "python3"
        "python3-pip"
        "nodejs"
    )
    
    apt-get install -y "${packages[@]}" 2>&1 | tee -a "$LOG_FILE"
    log_success "Paquets essentiels installés"
}

# Appliquer les configurations personnalisées
apply_configs() {
    log "Application des configurations personnalisées..."
    
    if [[ ! -d "$CONFIGS_DIR" ]]; then
        log_warning "Répertoire configs non trouvé: $CONFIGS_DIR"
        return 0
    fi
    
    # Appliquer les fichiers de configuration
    if [[ -f "$CONFIGS_DIR/bashrc" ]]; then
        log "Application de bashrc..."
        cat "$CONFIGS_DIR/bashrc" >> ~/.bashrc
        log_success "bashrc configuré"
    fi
    
    if [[ -f "$CONFIGS_DIR/vimrc" ]]; then
        log "Application de vimrc..."
        cp "$CONFIGS_DIR/vimrc" ~/.vimrc
        log_success "vimrc configuré"
    fi
    
    if [[ -f "$CONFIGS_DIR/tmux.conf" ]]; then
        log "Application de tmux.conf..."
        cp "$CONFIGS_DIR/tmux.conf" ~/.tmux.conf
        log_success "tmux.conf configuré"
    fi
    
    log_success "Configurations appliquées"
}

# Nettoyer après installation
cleanup() {
    log "Nettoyage..."
    apt-get autoremove -y
    apt-get autoclean -y
    log_success "Nettoyage terminé"
}

# Afficher le résumé
print_summary() {
    echo ""
    echo -e "${GREEN}=== Installation terminée ===${NC}"
    echo "Logs disponibles dans: $LOG_FILE"
    echo ""
}

# Main
main() {
    log "Début de l'installation Debian"
    echo "Démarrage à: $(date)" > "$LOG_FILE"
    
    check_root
    update_system
    install_essential_packages
    apply_configs
    cleanup
    
    print_summary
    log_success "Installation complète!"
}

# Exécuter main
main "$@"
