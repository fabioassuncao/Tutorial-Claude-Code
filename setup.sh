#!/bin/bash

# Claude Code Tutorial Setup Script
# Baixa e instala agentes, comandos e estilos de saída do Claude Code

set -e

# Configurações do repositório
REPO_URL="https://github.com/fabioassuncao/Tutorial-Claude-Code.git"
REPO_NAME="Tutorial-Claude-Code"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCESSO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[AVISO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERRO]${NC} $1"
}

# Função para detectar SO
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    else
        print_error "Sistema operacional não suportado: $OSTYPE"
        exit 1
    fi
}

# Função para obter diretório de Downloads do usuário
get_downloads_dir() {
    local os=$(detect_os)
    if [[ "$os" == "macos" ]]; then
        echo "$HOME/Downloads"
    elif [[ "$os" == "linux" ]]; then
        # Tentar XDG primeiro, depois fallback para Downloads
        if [ -n "$XDG_DOWNLOAD_DIR" ]; then
            echo "$XDG_DOWNLOAD_DIR"
        elif [ -d "$HOME/Downloads" ]; then
            echo "$HOME/Downloads"
        else
            echo "$HOME/Desktop" # Fallback universal
        fi
    fi
}

# Função para baixar repositório
download_repository() {
    local downloads_dir=$(get_downloads_dir)
    local temp_dir="$downloads_dir/$REPO_NAME-$(date +%Y%m%d_%H%M%S)"
    
    print_status "📥 Baixando repositório Tutorial Claude Code..."
    print_status "Destino: $temp_dir"
    
    # Verificar se git está instalado
    if ! command -v git &> /dev/null; then
        print_error "Git não está instalado. Por favor, instale o Git primeiro."
        exit 1
    fi
    
    # Baixar repositório
    if git clone "$REPO_URL" "$temp_dir"; then
        print_success "Repositório baixado com sucesso!"
        echo "$temp_dir"
    else
        print_error "Falha ao baixar repositório. Verifique sua conexão com a internet."
        exit 1
    fi
}

# Função para verificar se o diretório .claude/ existe
check_claude_directory() {
    local repo_dir="$1"
    if [ ! -d "$repo_dir/.claude" ]; then
        print_error "Diretório '.claude/' não encontrado no repositório baixado."
        exit 1
    fi
}

# Função para contar arquivos no diretório claude
count_claude_files() {
    local repo_dir="$1"
    local count=$(find "$repo_dir/.claude" -type f -name "*.md" | wc -l | tr -d ' ')
    echo $count
}

# Função para mostrar o que será instalado
show_installation_preview() {
    local repo_dir="$1"
    local agents_count=$(find "$repo_dir/.claude/agents" -name "*.md" | wc -l | tr -d ' ')
    local commands_count=$(find "$repo_dir/.claude/commands" -name "*.md" | wc -l | tr -d ' ')
    local output_styles_count=$(find "$repo_dir/.claude/output-styles" -name "*.md" | wc -l | tr -d ' ')
    local rules_count=$(find "$repo_dir/.claude/rules" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
    
    echo
    print_status "📦 O que será instalado:"
    echo "   🤖 Agentes especializados: $agents_count arquivos"
    echo "   ⚡ Comandos customizados: $commands_count arquivos"
    echo "   🎨 Estilos de saída: $output_styles_count arquivos"
    if [ $rules_count -gt 0 ]; then
        echo "   📋 Regras: $rules_count arquivos"
    fi
    echo
}

# Função para confirmar limpeza de arquivos
confirm_cleanup() {
    local repo_dir="$1"
    echo
    print_warning "🗑️  O repositório baixado contém outros arquivos além da pasta '.claude/':"
    echo "   📋 Tutoriais (*.md)"
    echo "   📁 Exemplos de PRDs"
    echo "   📖 Documentação adicional"
    echo
    print_status "Localização: $repo_dir"
    echo
    read -p "Deseja apagar estes arquivos desnecessários após a instalação? (s/N): " cleanup_choice
    
    case $cleanup_choice in
        [Ss]|[Ss][Ii][Mm])
            return 0  # True - fazer limpeza
            ;;
        *)
            return 1  # False - manter arquivos
            ;;
    esac
}

# Função para fazer limpeza do repositório
cleanup_repository() {
    local repo_dir="$1"
    print_status "🧹 Removendo arquivos desnecessários..."
    
    # Manter apenas a pasta .claude
    local temp_claude_dir="/tmp/claude-backup-$(date +%Y%m%d_%H%M%S)"
    cp -r "$repo_dir/.claude" "$temp_claude_dir"
    rm -rf "$repo_dir"
    mkdir -p "$repo_dir"
    cp -r "$temp_claude_dir" "$repo_dir/.claude"
    rm -rf "$temp_claude_dir"
    
    print_success "Limpeza concluída. Apenas a pasta '.claude/' foi mantida."
}

# Função para instalar na pasta atual
install_local() {
    local repo_dir="$1"
    print_status "Instalando configuração Claude Code no projeto atual..."
    
    if [ -d ".claude" ]; then
        print_warning "Diretório .claude já existe. Fazendo backup..."
        mv .claude .claude.backup.$(date +%Y%m%d_%H%M%S)
    fi
    
    cp -r "$repo_dir/.claude" .
    print_success "Configuração instalada em $(pwd)/.claude"
    
    # Verificar instalação
    local installed_files=$(find .claude -type f -name "*.md" | wc -l | tr -d ' ')
    print_success "✅ $installed_files arquivos instalados com sucesso"
    
    echo
    print_status "🚀 Próximos passos:"
    echo "   1. Execute '/init' no Claude Code para reconhecer o projeto"
    echo "   2. Use '/output-style' e selecione 'Pragmatic Test Driven Developer'"
    echo "   3. Inicie o desenvolvimento com os comandos /dev:*"
}

# Função para instalar globalmente
install_global() {
    local repo_dir="$1"
    local home_dir="$HOME"
    local claude_dir="$home_dir/.claude"
    
    print_status "Instalando configuração Claude Code globalmente em $claude_dir..."
    
    if [ -d "$claude_dir" ]; then
        print_warning "Diretório $claude_dir já existe. Fazendo backup..."
        mv "$claude_dir" "$claude_dir.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    cp -r "$repo_dir/.claude" "$claude_dir"
    print_success "Configuração instalada em $claude_dir"
    
    # Verificar instalação
    local installed_files=$(find "$claude_dir" -type f -name "*.md" | wc -l | tr -d ' ')
    print_success "✅ $installed_files arquivos instalados com sucesso"
    
    echo
    print_status "🚀 Próximos passos:"
    echo "   1. A configuração estará disponível em todos os projetos"
    echo "   2. Execute '/init' no Claude Code em qualquer projeto para reconhecê-lo"
    echo "   3. Use '/output-style' e selecione 'Pragmatic Test Driven Developer'"
    echo "   4. Inicie o desenvolvimento com os comandos /dev:*"
}

# Função principal
main() {
    clear
    echo
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                  Claude Code Tutorial Setup                  ║"
    echo "║          Configuração de Agentes e Comandos Claude          ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo
    
    # Detectar SO
    local os=$(detect_os)
    print_status "Sistema detectado: $os"
    
    # Baixar repositório
    local repo_dir=$(download_repository)
    
    # Verificar diretório claude no repositório baixado
    check_claude_directory "$repo_dir"
    
    # Mostrar preview da instalação
    show_installation_preview "$repo_dir"
    
    # Perguntar onde instalar
    echo "🎯 Onde você deseja instalar a configuração Claude Code?"
    echo
    echo "1) 📁 Apenas no projeto atual ($repo_dir/.claude → ./.claude)"
    echo "2) 🌍 Globalmente na pasta do usuário (~/.claude)"
    echo
    read -p "Digite sua escolha (1 ou 2): " choice
    
    case $choice in
        1)
            echo
            install_local "$repo_dir"
            ;;
        2)
            echo
            install_global "$repo_dir"
            ;;
        *)
            print_error "Opção inválida. Digite 1 ou 2."
            exit 1
            ;;
    esac
    
    # Perguntar sobre limpeza após instalação bem-sucedida
    if confirm_cleanup "$repo_dir"; then
        cleanup_repository "$repo_dir"
    else
        print_status "Arquivos do repositório mantidos em: $repo_dir"
        print_status "Você pode consultar os tutoriais e exemplos quando precisar."
    fi
    
    echo
    print_success "🎉 Instalação concluída com sucesso!"
    echo
    print_status "📚 Para começar a usar, consulte os tutoriais:"
    echo "   • Web Apps: TUTORIAL-NEXTJS-WEB.md"
    echo "   • Full-Stack: TUTORIAL-LARAVEL-FULLSTACK.md"  
    echo "   • Mobile: TUTORIAL-FLUTTER-MOBILE.md"
    echo "   • Geral: TUTORIAL-GERAL.md"
    echo
}

# Executar apenas se script for chamado diretamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi