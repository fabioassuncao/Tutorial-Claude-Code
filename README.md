# Desenvolvimento com Claude Code

> Este tutorial está em desenvolvimento ativo e nem todos os fluxos foram completamente testados. Alguns comandos, agentes ou configurações podem apresentar comportamentos inesperados.

Tutoriais para usar Claude Code e agentes de IA em desenvolvimento de software com metodologia TDD.

## Tutoriais Especializados

Cada tutorial é **completo e autocontido**, cobrindo desde a configuração do boilerplate até o deploy final:

### **[Web Apps - Next.js + Supabase](tutorials/TUTORIAL-NEXTJS-WEB.md)**
- **Stack**: Next.js 14 + TypeScript + Tailwind + shadcn/ui + Supabase
- **Setup**: `create-next-app` + dependências + `/init`
- **Ideal para**: SPAs, dashboards, landing pages, web apps
- **Testing**: Playwright E2E + Component tests
- **Deploy**: Vercel + Playwright cloud testing

### **[Full-Stack - Laravel + Livewire + Filament](tutorials/TUTORIAL-LARAVEL-FULLSTACK.md)**
- **Stack**: Laravel 11.x + Livewire 3 + Alpine.js 3 + Filament 4
- **Setup**: `composer create-project` + stack completa + `/init`
- **Ideal para**: Sistemas administrativos, e-commerce, CRMs, ERPs
- **Testing**: PestPHP Feature + Unit tests
- **Deploy**: Forge/Vapor + AWS/DigitalOcean

### **[Mobile Apps - Flutter](tutorials/TUTORIAL-FLUTTER-MOBILE.md)**
- **Stack**: Flutter 3.16+ + Dart 3.0+ + Provider/Riverpod + SQLite
- **Setup**: `flutter create` + dependências + clean architecture + `/init`
- **Ideal para**: Apps nativos iOS/Android, cross-platform
- **Testing**: Widget + Integration + Golden file tests  
- **Deploy**: App Store + Google Play

### **[Qualquer Tecnologia](tutorials/TUTORIAL-GERAL.md)**
- **Tecnologias**: Python, Go, Rust, Node.js, Java, .NET, e outras
- **Setup**: Boilerplate específico + dependências + `/init`
- **Ideal para**: APIs, CLI tools, microserviços, libraries
- **Testing**: Framework específico da linguagem + TDD universal
- **Deploy**: Docker + CI/CD + cloud agnóstico

## Metodologia Universal: Boilerplate → TDD → Deploy

Todos os tutoriais seguem o **mesmo fluxo otimizado** em 5 fases:

### **Fase 1: PRD** 
Criar documento de requisitos usando templates específicos.

### **Fase 2: Boilerplate Setup**
- Configurar projeto base com a tecnologia escolhida
- Instalar dependências necessárias
- Executar `/init` para Claude Code reconhecer o projeto

### **Fase 3: Design**
- `/dev:design-app`, `/dev:design-mobile` ou `/dev:design-fullstack`
- Agentes especializados criam arquitetura completa

### **Fase 4: TDD Implementation**
- Ciclo **RED → GREEN → VERIFY**
- Verificação humana obrigatória em cada ciclo
- Testes robustos que sobrevivem mudanças

### **Fase 5: Deploy & Production**
- Deploy automatizado na plataforma apropriada
- Testes cloud com Browserbase (web)
- Monitoramento e observabilidade

## Como Começar

### **Quick Start**
Para começar rapidamente com configuração mínima:

1. **[Next.js Quick Start](tutorials/QUICK-START-NEXTJS.md)** - Setup Next.js + shadcn/ui + TDD
2. **[Laravel Quick Start](tutorials/QUICK-START-LARAVEL.md)** - Setup Laravel + Livewire + PestPHP
3. **[Flutter Quick Start](tutorials/QUICK-START-FLUTTER.md)** - Setup Flutter + Provider + Testes

### **Tutorial Completo**
Para entendimento profundo com exemplos práticos:

1. **Web app moderna?** → [Next.js](tutorials/TUTORIAL-NEXTJS-WEB.md)
2. **Sistema administrativo?** → [Laravel](tutorials/TUTORIAL-LARAVEL-FULLSTACK.md)  
3. **App mobile nativo?** → [Flutter](tutorials/TUTORIAL-FLUTTER-MOBILE.md)
4. **API/CLI/qualquer coisa?** → [Geral](tutorials/TUTORIAL-GERAL.md)

### **Fluxo Padrão**
```bash
# 1. Configurar boilerplate da tecnologia
[seguir tutorial específico]

# 2. Copiar configuração Claude
cp -r claude-tutorial-repo/.claude .

# 3. Executar init para reconhecimento
/init

# 4. Iniciar desenvolvimento
/output-style → "Pragmatic Test Driven Developer"
/design-[tipo] "docs/PRD.md"
```

## Melhores Práticas da Anthropic

### **CLAUDE.md como Fonte Única**
- Cada projeto tem `CLAUDE.md` gerado pelo `/init`
- Documenta comandos, estilo de código e ambiente
- Evita alucinações sobre stacks inexistentes

### **Explore-Plan-Code-Commit Workflow**
- **Explore**: leitura inicial
- **Plan**: análise profunda
- **Code**: implementação guiada
- **Commit**: validação contínua

### **Excelência em TDD**
- Escrever testes primeiro
- Garantir falha inicial
- Implementar até passar
- Validar com subagentes

### **Feedback e Iteração**
- Instruções específicas
- Correção de rumo frequente
- Iterações visuais com screenshots

### **Segurança e Permissões**
- `/permissions` para gerenciar ferramentas
- Flags de permissão por sessão
- Acesso personalizado por projeto

### **Técnicas Avançadas**
- Instâncias paralelas do Claude
- Git Worktrees
- Comandos customizados
- Automação em modo headless

## Sistema de Agentes e Comandos

### **Agentes Especializados** (`.claude/agents/`)
- **Estratégia**: `prd-writer`, `system-architect`, `orchestrator`
- **Design**: `ui-designer`, `shadcn-expert` (web), `flutter-specialist` (mobile)
- **Implementação**: `react-typescript-specialist`, `laravel-specialist`, `livewire-expert`, `python-backend-dev`
- **Testes**: `web-test-expert` (Playwright), `pest-expert` (Laravel), `mobile-test-expert`, `api-backend-tester`, `api-frontend-tester`

### **Comandos Customizados** (`.claude/commands/`)
- `/dev:design-app` - Aplicações web Next.js
- `/dev:design-mobile` - Apps móveis Flutter  
- `/dev:design-fullstack` - Sistemas Laravel
- `/dev:implement-mvp` - TDD Next.js
- `/dev:implement-mobile-mvp` - TDD Flutter
- `/init` - Reconhecimento do projeto

### **Output Styles** (`.claude/output-styles/`)
- **"Pragmatic Test Driven Developer"** - Ciclos TDD (obrigatório)

## Instalação

### **Script Automático (Recomendado)**
```bash
curl -fsSL https://raw.githubusercontent.com/fabioassuncao/Tutorial-Claude-Code/main/setup.sh | bash
# ou
wget -qO- https://raw.githubusercontent.com/fabioassuncao/Tutorial-Claude-Code/main/setup.sh | bash
```
Opções:
- **Local**: instala no projeto atual (`./.claude`)
- **Global**: instala em `~/.claude`

### **Instalação Manual**
```bash
git clone https://github.com/fabioassuncao/Tutorial-Claude-Code.git
cp -r Tutorial-Claude-Code/.claude .
/init
```

## Diferencial: Boilerplate + `/init`
- Reconhece dependências reais
- Evita alucinações
- Otimiza tokens
- TDD mais eficiente
- Implementação precisa baseada no projeto real

## Validação e Troubleshooting

### **Validação Automática**
```bash
# Verificar setup completo automaticamente
/validate-setup
```

Este comando verifica:
- ✅ Estrutura `.claude/` completa (agentes, comandos, estilos)
- ✅ Projeto reconhecido (`CLAUDE.md` existe)
- ✅ Tecnologia detectada corretamente
- ✅ Comandos específicos disponíveis
- ✅ Agentes apropriados para a stack

### **Quick Start Validação**
Para projetos novos, siga esta sequência:

```bash
# 1. Após copiar .claude/
ls -la .claude/agents/*.md | wc -l   # Deve mostrar >=15

# 2. Após executar /init
[ -f CLAUDE.md ] && echo "✅ Reconhecido" || echo "❌ Execute /init"

# 3. Validação completa
/validate-setup
```

### **Problemas Comuns e Soluções**

#### **❌ Setup Não Funciona**
```bash
# Problema: .claude/ não encontrado
git clone https://github.com/fabioassuncao/Tutorial-Claude-Code.git
cp -r Tutorial-Claude-Code/.claude .
/validate-setup

# Problema: Poucos agentes (< 15)
ls -la .claude/agents/*.md | wc -l
# Se < 15, re-copiar .claude/ completo
```

#### **❌ Comandos Não Funcionam**
```bash
# Problema: /dev:design-app não encontrado
ls -la .claude/commands/dev/

# Solução: Verificar arquivo existe
[ -f .claude/commands/dev/design-app.md ] && echo "✅" || echo "❌ Copiar novamente"

# Problema: Sintaxe incorreta nos tutoriais
# ✅ Correto: /dev:design-app
# ❌ Errado: /design-app
```

#### **❌ Projeto Não Reconhecido**
```bash
# Problema: /init não funciona
# 1. Verificar se está na pasta raiz do projeto
ls -la package.json  # Next.js
ls -la composer.json # Laravel  
ls -la pubspec.yaml  # Flutter

# 2. Re-executar /init
/init

# 3. Verificar se CLAUDE.md foi criado
[ -f CLAUDE.md ] && cat CLAUDE.md | head -10
```

#### **❌ TDD Não Funciona**
```bash
# Problema: Output style não está ativo
/output-style
# Selecionar: "Pragmatic Test Driven Developer"

# Problema: Agentes não seguem ciclos RED → GREEN → VERIFY
# Verificar se output style está realmente ativo
# Claude deve perguntar "Please verify before I continue" após cada implementação
```

#### **❌ Agentes Não Respondem**
```bash
# Verificar frontmatter dos agentes
head -10 .claude/agents/react-typescript-specialist.md

# Deve conter:
# ---
# name: react-typescript-specialist
# description: Use this agent when...
# ---

# Se não, re-copiar .claude/
```

### **Troubleshooting por Tecnologia**

#### **Next.js Issues**
```bash
# Dependências não instaladas
npm install
npx shadcn-ui@latest init

# Comando errado nos tutoriais antigos
# ✅ Use: /dev:design-app
# ✅ Use: /dev:implement-mvp
```

#### **Laravel Issues**
```bash
# Composer não instalado
composer install
php artisan key:generate

# Banco não configurado  
php artisan migrate
php artisan db:seed

# Filament não funcionando
php artisan filament:install --panels
```

#### **Flutter Issues**
```bash
# Flutter doctor problems
flutter doctor
flutter doctor --android-licenses

# Dependências pubspec.yaml
flutter pub get
flutter clean
```

### **Conformidade Técnica**

#### **Checklist Completo**
```bash
# Estrutura obrigatória
ls -la .claude/agents/*.md | wc -l      # >=15 agentes
ls -la .claude/commands/dev/*.md | wc -l # >=5 comandos  
ls -la .claude/output-styles/*.md | wc -l # >=1 estilo

# Projeto reconhecido
[ -f CLAUDE.md ] && echo "✅ Projeto reconhecido" || echo "❌ Execute /init"

# Output style TDD ativo (manual)
# Execute /output-style e verifique se "Pragmatic Test Driven Developer" está selecionado
```

#### **Validação de Qualidade**
```bash
# Validação automática completa
/validate-setup

# Deve retornar:
# ✅ PROJETO PRONTO PARA DESENVOLVIMENTO
```

### **Suporte e Ajuda**

#### **Troubleshooting Avançado**
Se problemas persistem após validação:

1. **Reset Completo**:
```bash
rm -rf .claude/
git clone https://github.com/fabioassuncao/Tutorial-Claude-Code.git
cp -r Tutorial-Claude-Code/.claude .
/init
/validate-setup
```

2. **Verificação Manual**:
```bash
# Conferir cada componente individualmente
find .claude -type f -name "*.md" | head -10
grep -r "name:" .claude/agents/ | head -5
```

3. **Logs de Erro**:
- Copie mensagens de erro completas
- Execute `/validate-setup` e compartilhe output
- Indique sistema operacional e versões das ferramentas

#### **Como Reportar Issues**
Ao encontrar problemas, inclua:
- Output do `/validate-setup`
- Sistema operacional
- Tecnologia do projeto (Next.js/Laravel/Flutter)
- Mensagem de erro completa
- Passos para reproduzir