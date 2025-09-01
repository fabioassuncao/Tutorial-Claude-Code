# Simple Analytics Dashboard - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: Dashboard simples para visualizar métricas básicas de vendas
- **Tipo**: Web Application (SPA) - Single Page Application
- **Usuários-alvo**: Gerentes de vendas, analistas júnior
- **Tempo estimado**: 2-3 horas de implementação

## 2. Funcionalidades Core

### 2.1 Dashboard Principal
**Como usuário**, eu quero ver métricas de vendas em cards visuais para acompanhar performance

**Critérios de aceitação**:
- [ ] 4 cards principais: Vendas Total, Vendas Hoje, Pedidos Total, Ticket Médio
- [ ] 1 gráfico de linha simples: vendas dos últimos 7 dias
- [ ] 1 tabela básica: últimos 5 pedidos
- [ ] Interface responsiva para desktop e mobile
- [ ] Dados mockados (JSON estático)

### 2.2 Filtro de Período
**Como usuário**, eu quero filtrar dados por período para análise temporal

**Critérios de aceitação**:
- [ ] Botões de período: Hoje, Esta Semana, Este Mês
- [ ] Cards e gráfico atualizam conforme filtro selecionado
- [ ] Feedback visual do filtro ativo

## 3. Stack Técnica
- **Frontend**: Next.js 14 + TypeScript
- **Styling**: Tailwind CSS + shadcn/ui
- **Charts**: Recharts (simples)
- **Data**: JSON estático mockado
- **Testing**: Playwright E2E básico

## 4. Dados Mockados (Estrutura)

```json
{
  "metrics": {
    "totalSales": 45678.90,
    "todaySales": 1234.50,
    "totalOrders": 189,
    "averageTicket": 241.68
  },
  "salesChart": [
    {"date": "2024-01-01", "value": 1200},
    {"date": "2024-01-02", "value": 1500},
    {"date": "2024-01-03", "value": 1100}
  ],
  "recentOrders": [
    {"id": "001", "customer": "João Silva", "total": 299.99, "status": "completed"},
    {"id": "002", "customer": "Maria Santos", "total": 156.50, "status": "pending"}
  ]
}
```

## 5. Critérios de Sucesso
- [ ] Dashboard carrega em <2 segundos
- [ ] Interface responsiva funcionando
- [ ] Filtros alterando dados corretamente
- [ ] 2 testes E2E básicos passando
- [ ] Build de produção funcionando

## 6. Wireframe Simplificado

```
+--------------------------------+
|     SIMPLE ANALYTICS DASHBOARD    |
+--------------------------------+
| [Hoje] [Semana] [Mês]          |
+--------------------------------+
| Vendas    | Hoje    | Pedidos  | Ticket  |
| R$ 45,678 | R$ 1,234| 189     | R$ 241  |
+--------------------------------+
|          Vendas - 7 Dias       |
|     📈 [Gráfico de linha]      |
+--------------------------------+
|      Últimos Pedidos           |
| ID  | Cliente    | Valor | Status |
| 001 | João Silva | R$ 299| ✓     |
| 002 | Maria      | R$ 156| ⏳     |
+--------------------------------+
```

## 7. Implementação Sugerida (45 mins por fase)

### **Fase 1: Setup (45 min)**
1. `create-next-app` + configurações
2. Instalar shadcn/ui + componentes básicos
3. Estrutura de pastas + dados mock

### **Fase 2: UI Básica (45 min)**
1. Layout principal + cards de métricas
2. Gráfico simples com Recharts
3. Tabela de pedidos

### **Fase 3: Interatividade (45 min)**
1. Filtros de período funcionais
2. Responsividade mobile
3. Testes E2E básicos

**Total estimado: ~2h30min + deploy**

---

**Este PRD é perfeito para:**
✅ Primeira experiência com Claude Code
✅ Aprender TDD em projeto simples
✅ Testar fluxo completo: PRD → Design → Implementação
✅ Validar setup de agentes e comandos