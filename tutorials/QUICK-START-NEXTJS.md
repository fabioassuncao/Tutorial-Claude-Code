# Quick Start: Next.js Dashboard

**Objetivo**: Criar um dashboard simples para aprender o fluxo completo Claude Code + TDD

## 🚀 Setup Rápido (5 min)

### 1. Criar projeto e configurar Claude Code
```bash
# Projeto Next.js
npx create-next-app@latest simple-dashboard --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd simple-dashboard

# Copiar configuração Claude Code
cp -r /path/to/Tutorial-Claude-Code/.claude .

# Configurar PRD
mkdir -p docs
cp /path/to/Tutorial-Claude-Code/examples/SIMPLE-DASHBOARD-PRD.md docs/PRD.md

# Dependências essenciais
npm install @radix-ui/react-icons recharts clsx tailwind-merge
npx shadcn-ui@latest init
npx shadcn-ui@latest add button card

# EXECUTAR: Reconhecer projeto
/init
```

## ⚙️ Design da Aplicação (5 min)

### 2. Executar comando de design
```bash
# Ativar TDD primeiro
/output-style
# Selecionar: "Pragmatic Test Driven Developer"

# Design automático
/dev:design-app "docs/PRD.md"
```

**O que acontece:**
- `orchestrator` analisa o PRD
- `ui-designer` cria wireframes
- `shadcn-expert` seleciona componentes
- `web-test-expert` define estratégia de testes

## 💻 Implementação TDD (15 min)

### 3. Implementar com TDD rigoroso
```bash
# Implementação automática com ciclos RED → GREEN → VERIFY
/dev:implement-mvp .claude/outputs/design/projects/simple-dashboard/[timestamp] .
```

**Ciclos TDD esperados:**
1. **🔴 RED**: Teste de componente Dashboard falha
2. **🟢 GREEN**: Implementar Dashboard básico
3. **✅ VERIFY**: Confirmar funcionamento antes de prosseguir
4. **🔴 RED**: Teste de cards de métricas falha  
5. **🟢 GREEN**: Implementar cards com dados mock
6. **✅ VERIFY**: Confirmar métricas visíveis
7. **🔴 RED**: Teste de gráfico falha
8. **🟢 GREEN**: Implementar gráfico com Recharts
9. **✅ VERIFY**: Confirmar gráfico interativo

## 🧪 Testes e Verificação (3 min)

### 4. Executar testes finais
```bash
# Executar testes
npm run test

# Desenvolvimento local
npm run dev
# Abrir: http://localhost:3000
```

## ✅ Resultado Esperado (2 min)

Ao final você terá:
- ✅ **Dashboard funcionando** com 4 métricas principais
- ✅ **Gráfico interativo** dos últimos 7 dias
- ✅ **Tabela de pedidos** responsiva
- ✅ **Filtros funcionais** (Hoje, Semana, Mês)
- ✅ **Testes E2E passando** via Playwright
- ✅ **Interface responsiva** mobile + desktop

## 📸 Preview do Resultado

```
╔══════════════════════════════════════╗
║        SIMPLE ANALYTICS DASHBOARD         ║
╠══════════════════════════════════════╣
║ [Hoje] [Semana] [Mês]                ║
╠═══════════╦═══════════╦══════════════╣
║ Vendas    ║ Hoje      ║ Pedidos      ║ Ticket
║ R$ 45,678 ║ R$ 1,234  ║ 189          ║ R$ 241
╠═══════════╩═══════════╩══════════════╣
║          📊 Vendas - 7 Dias          ║
║     [Gráfico de linha interativo]    ║
╠══════════════════════════════════════╣
║            Últimos Pedidos           ║
║ ID  │ Cliente     │ Valor   │ Status ║
║ 001 │ João Silva  │ R$ 299  │   ✓    ║
║ 002 │ Maria Santos│ R$ 156  │   ⏳    ║
╚══════════════════════════════════════╝
```

## 🎯 O que você aprendeu

### **Claude Code**
- ✅ Como usar `/init` para reconhecer projeto
- ✅ Fluxo `/dev:design-app` → `/dev:implement-mvp`
- ✅ Uso dos agentes especializados automaticamente
- ✅ Output Style TDD obrigatório

### **TDD Prático**
- ✅ Ciclos RED → GREEN → VERIFY reais
- ✅ Testes Playwright E2E funcionais
- ✅ Verificação humana em cada etapa

### **Next.js + shadcn/ui**
- ✅ Setup moderno com TypeScript
- ✅ Componentes shadcn/ui na prática
- ✅ Integração com Recharts
- ✅ Responsividade com Tailwind

## 🚀 Próximos Passos

Agora que dominou o básico, experimente:

1. **Tutorial Completo**: [TUTORIAL-NEXTJS-WEB.md](TUTORIAL-NEXTJS-WEB.md)
2. **Projeto mais complexo**: [NEXTJS-ANALYTICS-PRD.md](../examples/NEXTJS-ANALYTICS-PRD.md)
3. **Outra tecnologia**: [QUICK-START-LARAVEL.md](QUICK-START-LARAVEL.md)

## 🆘 Troubleshooting Rápido

**❌ `/init` não reconhece projeto**
```bash
# Verificar se está na pasta correta e tem package.json
ls -la package.json .claude/
```

**❌ Comando `/dev:design-app` não encontrado**
```bash
# Verificar se .claude/commands/dev/ existe
ls -la .claude/commands/dev/
```

**❌ Testes falhando**
```bash
# Instalar dependências de teste
npm install -D @playwright/test
npx playwright install
```