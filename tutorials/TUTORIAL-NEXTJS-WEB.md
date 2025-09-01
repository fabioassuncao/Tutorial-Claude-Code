# Tutorial: Desenvolvimento Web com Next.js
## Next.js 14 + TypeScript + Tailwind + shadcn/ui + Supabase

### 🎯 Visão Geral

Este tutorial demonstra como usar Claude Code e agentes de IA especializados para desenvolver **aplicações web modernas** com Next.js usando metodologia TDD e testes Playwright robustos.

**Stack Principal**: Next.js 14 + TypeScript + Tailwind CSS + shadcn/ui + Supabase + Vercel

---

## 🚀 Configuração Inicial

### 1.1 Agentes Especializados para Web

#### **Estratégia & Arquitetura**
- `prd-writer` - PRDs para aplicações web
- `system-architect` - Arquitetura Next.js + Supabase
- `orchestrator` - Coordenação multi-agente

#### **Design & Interface**
- `ui-designer` - Wireframes e fluxos web
- `shadcn-expert` - Componentes shadcn/ui otimizados

#### **Implementação Web**
- `react-typescript-specialist` - Next.js + React + TypeScript

#### **Testes & Qualidade**
- `web-test-expert` - Testes Playwright E2E robustos

### 1.2 Output Style TDD Obrigatório

```bash
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

---

## 📝 Fase 1: Criação do PRD Next.js

### 2.1 Exemplo Prático: Analytics Dashboard

Consulte o PRD completo e detalhado: **[Analytics Dashboard](examples/NEXTJS-ANALYTICS-PRD.md)**

Dashboard avançado com:
- Visualizações D3.js interativas
- Real-time data updates
- Filtros dinâmicos complexos
- Export de relatórios
- ML-powered insights

### 2.2 Template PRD Básico

Para criar seu próprio PRD, use esta estrutura mínima:

```markdown
# [Seu App] - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: [O que a aplicação resolve]
- **Tipo**: Web Application (SPA/SSR)
- **Usuários-alvo**: [Personas principais]

## 2. Funcionalidades Core
- **Feature 1**: [Descrição e critérios de aceitação]
- **Feature 2**: [Descrição e critérios de aceitação]
- **Feature 3**: [Descrição e critérios de aceitação]

## 3. Stack Técnica
- Next.js 14 + TypeScript 5+
- Tailwind + shadcn/ui + Supabase
- Playwright E2E testing

## 4. Critérios de Sucesso
- [ ] Lighthouse score >95
- [ ] Testes E2E >95%
- [ ] Zero vulnerabilidades críticas
```

---

## 🏗️ Fase 2: Setup do Projeto Next.js

### 3.1 Configuração do Boilerplate

#### **Passo 1: Criar e Configurar Projeto Base**

```bash
# Criar projeto Next.js com configurações otimizadas
npx create-next-app@latest analytics-dashboard \
  --typescript --tailwind --eslint --app \
  --src-dir --import-alias "@/*"

cd analytics-dashboard

# Configurar ambiente
cp .env.example .env.local

# Supabase configuration
echo "NEXT_PUBLIC_SUPABASE_URL=your-project-url" >> .env.local
echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key" >> .env.local
echo "SUPABASE_SERVICE_ROLE_KEY=your-service-role-key" >> .env.local
```

#### **Passo 2: Instalar Stack Completa**

```bash
# shadcn/ui setup
npx shadcn-ui@latest init
npx shadcn-ui@latest add button input label card dialog sheet

# Supabase
npm install @supabase/supabase-js @supabase/auth-helpers-nextjs

# State Management
npm install zustand @tanstack/react-query @tanstack/react-query-devtools

# Forms & Validation
npm install react-hook-form @hookform/resolvers zod

# UI & Visualization
npm install @radix-ui/react-icons lucide-react
npm install recharts d3 @types/d3
npm install framer-motion

# Utils
npm install clsx tailwind-merge date-fns
npm install @next/bundle-analyzer
```

#### **Passo 3: Configurar Testes**

```bash
# Playwright E2E
npm install -D @playwright/test

# Testing utilities
npm install -D @testing-library/react @testing-library/jest-dom
npm install -D vitest @vitejs/plugin-react jsdom

# Playwright setup
npx playwright install
npx playwright install-deps
```

#### **Passo 4: Configurar Claude Code no Projeto**

```bash
# IMPORTANTE: Copiar configuração Claude
cp -r /path/to/tutorial-repo/.claude .

# Configurar PRD no projeto
mkdir -p docs
cp /path/to/tutorial-repo/examples/NEXTJS-ANALYTICS-PRD.md docs/PRD.md

# EXECUTAR: Comando init do Claude Code
/init
```

**O comando `/init` irá:**
- ✅ Analisar o projeto Next.js existente
- ✅ Detectar dependências instaladas (shadcn/ui, Supabase, etc.)
- ✅ Ler o PRD.md disponível
- ✅ Gerar CLAUDE.md otimizado para este projeto específico
- ✅ Configurar agentes apropriados para desenvolvimento web

#### **Passo 5: Verificar Configuração**

Após `/init`, verifique se foi criado:
- ✅ `CLAUDE.md` - Orientações específicas do projeto
- ✅ Detecção do Next.js App Router + TypeScript
- ✅ Reconhecimento do shadcn/ui + Tailwind setup
- ✅ Configuração de agentes React especializados

### 3.2 Projeto Pronto para Development

Com o boilerplate configurado e `/init` executado, seu projeto Next.js agora tem:

✅ **Stack moderna** - Next.js + TypeScript + shadcn/ui + Supabase  
✅ **PRD definido** - Documento de requisitos no projeto  
✅ **Claude Code configurado** - CLAUDE.md gerado automaticamente  
✅ **Agentes ativos** - Especializados para React/Next.js detectados  
✅ **Testing setup** - Playwright E2E configurado  

---

## 🏗️ Fase 3: Design Web Application

### 4.1 Comando de Design Next.js

```bash
# Design aplicação Next.js completa (com boilerplate configurado)
/dev:design-app "docs/PRD.md"
```

**Vantagem do boilerplate configurado:**
- ✅ Claude Code **reconhece** Next.js + shadcn/ui + Supabase instalados
- ✅ **Não alucina** sobre dependências inexistentes
- ✅ **Foca na implementação** das funcionalidades do PRD
- ✅ **Otimiza tokens** usando informações reais do projeto

**Agentes ativados automaticamente:**
- `orchestrator` - Coordenação geral
- `ui-designer` - Wireframes responsivos
- `shadcn-expert` - Componentes shadcn/ui
- `react-typescript-specialist` - Arquitetura React
- `web-test-expert` - Estratégia de testes E2E

### 4.2 Outputs do Design

```
.claude/outputs/design/projects/analytics-dashboard/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano Next.js
└── agents/
    ├── ui-designer/
    │   ├── wireframes.md
    │   ├── component-hierarchy.md
    │   ├── user-flows.md
    │   └── responsive-breakpoints.md
    ├── shadcn-expert/
    │   ├── component-selection.md
    │   ├── theme-customization.md
    │   ├── layout-system.md
    │   └── accessibility-patterns.md
    ├── react-typescript-specialist/
    │   ├── architecture-patterns.md
    │   ├── state-management.md
    │   ├── api-integration.md
    │   └── performance-optimization.md
    └── web-test-expert/
        ├── test-scenarios.md
        ├── user-workflows.md
        └── automation-strategy.md
```

---

## 🔄 Fase 4: Implementação TDD Next.js

### 5.1 Ativar TDD Estrito

```bash
# OBRIGATÓRIO: Modo TDD
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

### 5.2 Comando de Implementação

```bash
# Implementar MVP Next.js com TDD (com boilerplate configurado)
/dev:implement-mvp .claude/outputs/design/projects/analytics-dashboard/[timestamp] .
```

**Vantagem do projeto configurado:**
- ✅ Claude Code trabalha com **dependências reais** instaladas
- ✅ **Não desperdiça tokens** descobrindo configurações
- ✅ **Implementação focada** apenas nas funcionalidades do PRD
- ✅ **Ciclos TDD** mais eficientes e precisos

### 5.3 Ciclos TDD Next.js - Exemplo Completo

#### **Metodologia TDD com Claude Code**

O desenvolvimento segue rigorosamente os ciclos **RED → GREEN → VERIFY**:

**🔴 RED:** Escrever teste que falha
**🟢 GREEN:** Implementar código mínimo para passar
**✅ VERIFY:** Verificar com usuário antes de prosseguir

#### **Exemplo de Ciclo Completo: Supabase Auth**

```bash
# RED: Teste E2E que falha
```
```typescript
// tests/e2e/auth.spec.ts
test('user can signup and login', async ({ page }) => {
  // Signup flow
  await page.goto('/auth/signup');
  await expect(page.locator('[data-testid="signup-form"]')).toBeVisible();
  
  // Login flow  
  await page.goto('/auth/login');
  await expect(page.locator('[data-testid="dashboard"]')).toBeVisible();
});
```

```bash
# GREEN: Implementação mínima que passa no teste
```
```typescript
// app/auth/signup/page.tsx - implementação básica
export default function SignUpPage() {
  return (
    <form data-testid="signup-form">
      <Input data-testid="email-input" />
      <Button data-testid="signup-button">Sign Up</Button>
    </form>
  );
}
```

```bash
# VERIFY: ✅ Usuário confirma funcionalidade antes de próximo ciclo
```

#### **Ciclos de Desenvolvimento Típicos**

1. **Auth Setup** - Supabase auth + formulários básicos
2. **Dashboard Base** - Layout + navegação + componentes shadcn/ui
3. **Data Integration** - Conexão com banco + queries básicas
4. **Interatividade** - Filtros, charts interativos, real-time
5. **Performance** - Otimizações + testes de carga

**Cada ciclo segue RED → GREEN → VERIFY obrigatoriamente.**

### 5.4 Comandos de Teste Next.js

```bash
# Testes Playwright E2E
npx playwright test

# Interface visual dos testes
npx playwright test --ui

# Desenvolvimento com hot reload
npm run dev
```

---

## 🚀 Fase 5: Deploy e Performance

### 6.1 Deploy no Vercel

```bash
# Deploy automático via GitHub integration
git push origin main

# Configurar variáveis de ambiente
vercel env add NEXT_PUBLIC_SUPABASE_URL
vercel env add NEXT_PUBLIC_SUPABASE_ANON_KEY
```

### 6.2 Performance Essencial

```typescript
// next.config.js - configurações básicas de performance
const nextConfig = {
  experimental: { appDir: true },
  images: { domains: ['your-supabase-project.supabase.co'] },
};

module.exports = nextConfig;
```

---

## 🎯 Checklist de Projeto Next.js Completo

### **Frontend (Next.js + React)**
- [ ] App Router estruturado corretamente
- [ ] Server/Client Components balanceados
- [ ] TypeScript configurado sem erros
- [ ] Tailwind + shadcn/ui implementados
- [ ] Responsive design funcionando
- [ ] SEO otimizado (meta tags, sitemap)

### **Backend (Supabase)**
- [ ] Database schema definido
- [ ] Row Level Security configurado
- [ ] Auth providers funcionando
- [ ] Real-time subscriptions ativas
- [ ] Storage para arquivos configurado

### **Performance**
- [ ] Core Web Vitals otimizados
- [ ] Bundle size analisado
- [ ] Images otimizadas com Next/Image
- [ ] Static generation onde apropriado
- [ ] Edge functions utilizadas

### **Testes**
- [ ] Playwright E2E tests cobrindo fluxos principais
- [ ] Unit tests para utils e hooks
- [ ] Integration tests para API routes
- [ ] Visual regression tests
- [ ] Performance tests executando

### **Deploy**
- [ ] Vercel deployment configurado
- [ ] Environment variables seguras
- [ ] Domain customizado configurado
- [ ] Analytics/monitoring ativo
- [ ] Error tracking implementado

---

## 📚 Comandos de Referência Next.js

### **Development**
```bash
# Desenvolvimento
npm run dev
npm run build
npm run start

# Análise
npm run analyze
npm run type-check
npm run lint

# Testes
npm run test
npx playwright test
npx playwright test --ui
```

### **Deployment**
```bash
# Vercel
npx vercel
npx vercel --prod

# Build estático
npm run build
npm run export

# Performance
npm run audit
```

**Esta metodologia Next.js garante aplicações web modernas, performantes e escaláveis através de TDD rigoroso com testes Playwright robustos e arquitetura otimizada.**