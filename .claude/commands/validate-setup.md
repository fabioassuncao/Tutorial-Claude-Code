---
allowed-tools: Read, Bash, Glob
description: Valida se a configuração Claude Code está correta e o projeto está pronto para desenvolvimento
---

# Validação do Setup Claude Code

Executa verificações completas para garantir que o projeto está configurado corretamente para desenvolvimento com Claude Code e agentes especializados.

## Verificações Realizadas

### 1. **Estrutura Claude Code**
- ✅ Verifica se `.claude/` existe e está completa
- ✅ Conta agentes, comandos e output styles
- ✅ Verifica arquivos de configuração essenciais

### 2. **Reconhecimento do Projeto**
- ✅ Valida se `CLAUDE.md` foi gerado pelo `/init`
- ✅ Verifica se tecnologias foram detectadas corretamente
- ✅ Confirma dependências principais identificadas

### 3. **Comandos Disponíveis**
- ✅ Lista comandos `/dev:*` disponíveis
- ✅ Verifica se comandos específicos da tecnologia estão presentes
- ✅ Valida sintaxe dos arquivos de comando

### 4. **Agentes Especializados**
- ✅ Confirma agentes necessários para a tecnologia detectada
- ✅ Verifica frontmatter dos agentes
- ✅ Valida ferramentas permitidas

## Execução da Validação

O comando executa automaticamente todas as verificações e gera relatório detalhado:

```bash
# Executar validação completa
/validate-setup
```

## Relatório de Validação

### ✅ **Configuração Válida**
```
╔══════════════════════════════════════════════════════════╗
║                 CLAUDE CODE - SETUP VÁLIDO              ║
╠══════════════════════════════════════════════════════════╣
║ 📁 Estrutura:                                           ║
║    ✅ .claude/agents/         (17 arquivos)             ║
║    ✅ .claude/commands/dev/    (5 arquivos)             ║
║    ✅ .claude/output-styles/   (2 arquivos)             ║
║                                                          ║
║ 🤖 Projeto Reconhecido:                                 ║
║    ✅ CLAUDE.md gerado                                   ║
║    ✅ Tecnologia: Next.js + TypeScript                  ║
║    ✅ Dependências detectadas: shadcn/ui, Supabase      ║
║                                                          ║
║ ⚡ Comandos Disponíveis:                                ║
║    ✅ /dev:design-app         (Next.js design)          ║
║    ✅ /dev:implement-mvp      (TDD implementation)      ║
║                                                          ║
║ 🧠 Agentes Ativos:                                      ║
║    ✅ react-typescript-specialist                       ║
║    ✅ shadcn-expert                                      ║
║    ✅ web-test-expert                                    ║
║                                                          ║
║ 🚀 PROJETO PRONTO PARA DESENVOLVIMENTO                  ║
╚══════════════════════════════════════════════════════════╝
```

### ❌ **Problemas Detectados**
```
╔══════════════════════════════════════════════════════════╗
║              CLAUDE CODE - PROBLEMAS DETECTADOS         ║
╠══════════════════════════════════════════════════════════╣
║ ❌ Estrutura Incompleta:                                ║
║    • .claude/agents/ não encontrado                     ║
║    • Apenas 3 agentes (mínimo: 15)                      ║
║                                                          ║
║ ❌ Projeto Não Reconhecido:                             ║
║    • CLAUDE.md não existe - Execute /init               ║
║    • Tecnologia não identificada                        ║
║                                                          ║
║ ❌ Comandos Faltando:                                    ║
║    • /dev:design-app não disponível                     ║
║    • Comandos específicos da tecnologia ausentes        ║
║                                                          ║
║ 🔧 AÇÕES NECESSÁRIAS:                                   ║
║    1. Copiar .claude/ do repositório tutorial           ║
║    2. Executar /init no projeto                         ║
║    3. Verificar dependências instaladas                 ║
╚══════════════════════════════════════════════════════════╝
```

## Implementação das Verificações

### **Verificação 1: Estrutura Base**
```bash
# Verificar .claude/ e subdiretórios
echo "🔍 Verificando estrutura Claude Code..."

if [ ! -d ".claude" ]; then
    echo "❌ Diretório .claude/ não encontrado"
    exit 1
fi

AGENTS_COUNT=$(find .claude/agents -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
COMMANDS_COUNT=$(find .claude/commands -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
OUTPUT_STYLES_COUNT=$(find .claude/output-styles -name "*.md" 2>/dev/null | wc -l | tr -d ' ')

echo "📁 Agentes encontrados: $AGENTS_COUNT"
echo "⚡ Comandos encontrados: $COMMANDS_COUNT" 
echo "🎨 Output styles encontrados: $OUTPUT_STYLES_COUNT"

if [ $AGENTS_COUNT -lt 15 ]; then
    echo "⚠️  Poucos agentes detectados (mínimo: 15)"
fi
```

### **Verificação 2: Reconhecimento do Projeto**
```bash
# Verificar CLAUDE.md e detecção de tecnologia
echo "🤖 Verificando reconhecimento do projeto..."

if [ ! -f "CLAUDE.md" ]; then
    echo "❌ CLAUDE.md não encontrado - Execute /init"
    exit 1
fi

echo "✅ CLAUDE.md presente"

# Detectar tecnologia baseado em arquivos de projeto
if [ -f "package.json" ]; then
    if grep -q "next" package.json; then
        TECH="Next.js"
    elif grep -q "react" package.json; then
        TECH="React"
    else
        TECH="Node.js"
    fi
elif [ -f "composer.json" ]; then
    TECH="Laravel/PHP"
elif [ -f "pubspec.yaml" ]; then
    TECH="Flutter/Dart"
elif [ -f "Cargo.toml" ]; then
    TECH="Rust"
elif [ -f "go.mod" ]; then
    TECH="Go"
else
    TECH="Unknown"
fi

echo "🔧 Tecnologia detectada: $TECH"
```

### **Verificação 3: Comandos Específicos**
```bash
# Verificar comandos disponíveis para a tecnologia
echo "⚡ Verificando comandos disponíveis..."

case $TECH in
    "Next.js"|"React")
        if [ -f ".claude/commands/dev/design-app.md" ]; then
            echo "✅ /dev:design-app disponível"
        else
            echo "❌ /dev:design-app não encontrado"
        fi
        if [ -f ".claude/commands/dev/implement-mvp.md" ]; then
            echo "✅ /dev:implement-mvp disponível"
        else
            echo "❌ /dev:implement-mvp não encontrado"
        fi
        ;;
    "Laravel/PHP")
        if [ -f ".claude/commands/dev/design-fullstack.md" ]; then
            echo "✅ /dev:design-fullstack disponível"
        else
            echo "❌ /dev:design-fullstack não encontrado"
        fi
        ;;
    "Flutter/Dart")
        if [ -f ".claude/commands/dev/design-mobile.md" ]; then
            echo "✅ /dev:design-mobile disponível"
        else
            echo "❌ /dev:design-mobile não encontrado"
        fi
        if [ -f ".claude/commands/dev/implement-mobile-mvp.md" ]; then
            echo "✅ /dev:implement-mobile-mvp disponível"
        else
            echo "❌ /dev:implement-mobile-mvp não encontrado"
        fi
        ;;
esac
```

### **Verificação 4: Agentes Especializados**
```bash
# Verificar agentes necessários por tecnologia
echo "🧠 Verificando agentes especializados..."

REQUIRED_AGENTS=""
case $TECH in
    "Next.js"|"React")
        REQUIRED_AGENTS="react-typescript-specialist shadcn-expert web-test-expert"
        ;;
    "Laravel/PHP")
        REQUIRED_AGENTS="laravel-specialist livewire-expert pest-expert"
        ;;
    "Flutter/Dart")
        REQUIRED_AGENTS="flutter-specialist mobile-test-expert"
        ;;
esac

for agent in $REQUIRED_AGENTS; do
    if [ -f ".claude/agents/$agent.md" ]; then
        echo "✅ $agent disponível"
    else
        echo "❌ $agent não encontrado"
    fi
done

# Verificar se tecnologias não suportadas têm agentes apropriados
case $TECH in
    "Rust")
        if [ ! -f ".claude/agents/rust-specialist.md" ]; then
            echo "⚠️  Rust detectado mas agente específico não disponível - use tutorial geral"
        fi
        ;;
    "Go")
        if [ ! -f ".claude/agents/go-specialist.md" ]; then
            echo "⚠️  Go detectado mas agente específico não disponível - use tutorial geral"
        fi
        ;;
esac
```

## Correções Automáticas

### **Setup Inicial Rápido**
Se problemas críticos forem detectados, o comando pode sugerir correções:

```bash
echo "🔧 CORREÇÕES SUGERIDAS:"
echo ""
echo "1. Configuração Claude Code:"
echo "   git clone https://github.com/fabioassuncao/Tutorial-Claude-Code.git"
echo "   cp -r Tutorial-Claude-Code/.claude ."
echo ""
echo "2. Reconhecimento do Projeto:"
echo "   /init"
echo ""
echo "3. Configurar TDD:"
echo "   /output-style"
echo "   # Selecionar: 'Pragmatic Test Driven Developer'"
```

## Uso em Diferentes Cenários

### **Projeto Novo (Primeira Verificação)**
- Valida se `.claude/` foi copiado corretamente
- Confirma se `/init` precisa ser executado
- Lista próximos passos para começar

### **Projeto em Desenvolvimento**
- Verifica se agentes estão funcionando
- Confirma comandos específicos disponíveis
- Valida configurações TDD

### **Troubleshooting**
- Diagnostica problemas comuns
- Sugere correções específicas
- Valida se correções resolveram issues

## Integração com Tutoriais

O comando de validação está integrado com os tutoriais:
- **Quick Start**: Validação após setup inicial
- **Tutoriais Completos**: Checkpoints durante desenvolvimento
- **Troubleshooting**: Diagnóstico de problemas

---

**Este comando garante que o setup Claude Code está correto antes de iniciar o desenvolvimento, evitando problemas comuns e otimizando a experiência do desenvolvedor.**