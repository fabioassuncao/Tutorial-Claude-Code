# Tutorial: Desenvolvimento com Qualquer Tecnologia
## Metodologia Universal Claude Code + TDD

### 🎯 Visão Geral

Este tutorial demonstra como usar Claude Code para desenvolver **qualquer tipo de aplicação** usando metodologia TDD, independentemente da tecnologia escolhida. O foco está na **metodologia universal** que se adapta automaticamente à sua stack.

**Filosofia**: Configure uma vez, desenvolva em qualquer linguagem com qualidade consistente.

---

## 🚀 Configuração Universal

### 1.1 Estrutura de Agentes Agnóstica

```bash
# Criar estrutura para qualquer projeto
mkdir -p .claude/agents
mkdir -p .claude/commands/dev
mkdir -p .claude/output-styles
mkdir -p .claude/rules
```

### 1.2 Sistema de Agentes

Claude Code utiliza agentes especializados que se adaptam à sua tecnologia:

#### **Core (Disponíveis)**
- `prd-writer` - PRDs para qualquer sistema
- `system-architect` - Arquitetura agnóstica de tecnologia  
- `orchestrator` - Coordenação multi-agente

#### **Implementação (Disponíveis)**
- `python-backend-dev` - Python/FastAPI/Django
- `react-typescript-specialist` - React/TypeScript/Next.js
- `laravel-specialist` - Laravel/PHP
- `flutter-specialist` - Flutter/Dart mobile

#### **Qualidade (Disponíveis)**
- `web-test-expert` - Testes E2E web (Playwright)
- `pest-expert` - Testes PHP (Pest)
- `mobile-test-expert` - Testes Flutter
- `ui-designer` - Wireframes e design

#### **Especialistas UI (Disponíveis)**
- `shadcn-expert` - Componentes shadcn/ui
- `livewire-expert` - Componentes Laravel Livewire

### 1.3 Output Style TDD Universal

```bash
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

**Este estilo funciona para qualquer linguagem!**

---

## 📝 Fase 1: PRD Universal

### 2.1 Template PRD Agnóstico de Tecnologia

```markdown
# [Sistema/Aplicação] - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: [O que o sistema resolve, independente de como]
- **Tipo**: [API / CLI Tool / Web Service / Desktop App / Library]
- **Usuários-alvo**: [Quem usa o sistema]
- **Escala esperada**: [Volume de dados/usuários/requests]

## 2. Funcionalidades Core

### 2.1 Funcionalidade Principal
- **Como [persona]**, eu quero [ação] para [benefício]
- **Critérios de aceitação**:
  - [ ] Entrada: [formato e validações]
  - [ ] Processamento: [regras de negócio]
  - [ ] Saída: [formato e garantias]
  - [ ] Performance: [SLA específico]
  - [ ] Erros: [como tratar falhas]

### 2.2 Integrações Necessárias
- **External APIs**: [Quais serviços externos]
- **Databases**: [Tipo de dados a persistir]
- **File System**: [Manipulação de arquivos]
- **Network**: [Protocolos necessários]

## 3. Requisitos Técnicos

### 3.1 Características do Sistema
- **Concorrência**: [Threads/Goroutines/Async necessário]
- **Memória**: [Uso esperado e limites]
- **CPU**: [Intensivo ou leve]
- **I/O**: [Network/Disk intensive]
- **Deployment**: [Container/Bare metal/Serverless]

### 3.2 Restrições e Preferências
- **Performance**: [Latência/Throughput requirements]
- **Reliability**: [Uptime/Error rate targets]
- **Security**: [Compliance/Encryption needs]
- **Compatibility**: [OS/Platform requirements]
- **Dependencies**: [External libraries/services]

### 3.3 Escolha de Tecnologia
[Justificar a escolha baseada nos requisitos acima]

#### Para APIs de Alta Performance:
- **Go**: Concorrência nativa, baixo overhead
- **Rust**: Memory safety, zero-cost abstractions
- **Java/C#**: Ecosystem maduro, tooling robusto

#### Para Prototipagem Rápida:
- **Python**: Simplicidade, ecosystem científico
- **Node.js**: JavaScript universal, NPM ecosystem
- **Ruby**: Developer happiness, convention over configuration

#### Para Sistemas Críticos:
- **Rust**: Memory safety, performance predictável
- **Go**: Simplicidade, garbage collector otimizado
- **Java**: JVM madura, monitoramento avançado

## 4. Critérios de Sucesso Universais
- [ ] Funcionalidades implementadas conforme especificação
- [ ] Testes automatizados >90% cobertura
- [ ] Performance dentro dos SLAs
- [ ] Security scan sem vulnerabilidades críticas
- [ ] Deploy automatizado funcionando
- [ ] Documentação completa (API/Usage)
- [ ] Monitoramento e observabilidade configurados
```

### 2.2 Exemplos de PRDs Universais

#### **API REST (Qualquer Linguagem)**
```markdown
# Invoice Processing API - PRD

## Funcionalidades Core
- Upload e parse de PDFs
- Extração de dados estruturados  
- API REST para consulta

## Requisitos Técnicos
- Performance: <2s por documento
- Concorrência: ~100 uploads simultâneos
- Armazenamento: Database + object storage

## Critérios de Sucesso
- [ ] Upload funcional com validação
- [ ] Parsing com >95% precisão
- [ ] API documentada e testada
```

#### **CLI Tool (Qualquer Linguagem)**  
```markdown
# File Deduplicator - PRD

## Funcionalidades Core
- Scan recursivo de diretórios
- Detecção por hash SHA-256
- Remoção com confirmação

## Requisitos Técnicos  
- Performance: >1GB/s scanning
- Memory: Constante independente do tamanho
- Multiplataforma: Linux/Mac/Windows

## Critérios de Sucesso
- [ ] Scan sem falsos positivos
- [ ] Interface intuitiva
- [ ] Operação segura (dry-run)
```

---

## 🏗️ Fase 2: Design Agnóstico

### 3.1 Design Universal

```bash
# O comando se adapta automaticamente ao tipo de projeto
/design "caminho/para/PRD.md"
```

**Claude Code detecta automaticamente:**
- Linguagem/tecnologia pelo contexto do PRD
- Tipo de aplicação (API, CLI, Web, Mobile)  
- Agentes apropriados para a stack

**Agentes ativados automaticamente:**
- `system-architect` - Sempre ativo para arquitetura
- `[tech]-specialist` - Baseado na linguagem detectada
- `[test]-expert` - Especialista em testes da tecnologia
- `ui-designer` - Apenas para aplicações com interface

### 3.2 Outputs de Design Universal

```
.claude/outputs/design/projects/[nome-projeto]/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano específico da tecnologia
└── agents/
    ├── system-architect/
    │   ├── architecture-overview.md
    │   ├── component-design.md
    │   ├── data-flow.md
    │   └── deployment-strategy.md
    ├── api-designer/  (se aplicável)
    │   ├── endpoint-specification.md
    │   ├── data-models.md
    │   ├── error-handling.md
    │   └── api-documentation.md
    ├── [tech]-specialist/
    │   ├── implementation-patterns.md
    │   ├── dependency-management.md
    │   ├── performance-considerations.md
    │   └── testing-approach.md
    └── testing-strategist/
        ├── test-strategy.md
        ├── test-scenarios.md
        └── ci-cd-pipeline.md
```

---

## ⚙️ Fase 3: Setup Universal de Projeto

### 4.1 Metodologia Única para Qualquer Tecnologia

**Processo universal em 3 passos:**

```bash
# 1. Criar projeto na sua tecnologia preferida
mkdir meu-projeto && cd meu-projeto

# 2. Configurar boilerplate básico da tecnologia
# [Comandos específicos da linguagem - ver seção 4.2]

# 3. Configurar Claude Code
cp -r /path/to/tutorial/.claude .
echo "# Meu Projeto - PRD\n[PRD aqui]" > docs/PRD.md
/init  # Claude Code detecta tudo automaticamente
```

### 4.2 Boilerplates por Tecnologia

#### **Python (FastAPI)**
```bash
python -m venv venv && source venv/bin/activate
pip install fastapi uvicorn pytest pytest-cov
mkdir -p {app,tests}
```

#### **Go (Gin)**
```bash
go mod init github.com/user/projeto
go get github.com/gin-gonic/gin github.com/stretchr/testify
mkdir -p {cmd,internal,tests}
```

#### **Rust (CLI)**
```bash
cargo new projeto --bin
cargo add tokio clap serde anyhow
```

#### **Node.js (Express)**
```bash
npm init -y
npm install express && npm install -D jest @types/node
mkdir -p {src,tests}
```

### 4.3 Vantagens do Processo Universal

✅ **Claude Code detecta** tecnologia automaticamente  
✅ **Agentes especializados** ativados conforme a stack  
✅ **CLAUDE.md personalizado** gerado para o projeto  
✅ **Setup único** que funciona para qualquer linguagem  
✅ **Sem configuração manual** de agentes  

---

## 🔄 Fase 4: TDD Universal (com boilerplate configurado)

### 5.1 Ativar TDD Estrito

```bash
# OBRIGATÓRIO para qualquer tecnologia
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

### 5.2 Implementação Universal

```bash
# Claude Code implementa automaticamente na linguagem detectada
/implement design-outputs/
```

**O Claude Code automaticamente:**
- ✅ Detecta a linguagem e frameworks
- ✅ Aplica padrões TDD apropriados  
- ✅ Usa ferramentas de teste da tecnologia
- ✅ Implementa seguindo as melhores práticas

### 5.3 Metodologia TDD Universal

**Claude Code aplica TDD independente da linguagem:**

#### **1. RED Phase**
```bash
# Claude Code escreve teste que falha
# - Para APIs: testa endpoints inexistentes
# - Para CLI: testa comandos não implementados  
# - Para Libraries: testa interfaces não criadas
```

#### **2. GREEN Phase**  
```bash
# Claude Code implementa código mínimo
# - Foca apenas em passar o teste
# - Usa padrões da linguagem detectada
# - Aplica frameworks apropriados
```

#### **3. VERIFY Phase**
```bash  
# OBRIGATÓRIO: Usuário confirma antes de prosseguir
# - Executa testes para verificar
# - Valida se implementação está correta
# - Autoriza próximo ciclo TDD
```

### 5.4 Execução de Testes Universal

**Claude Code usa as ferramentas apropriadas para cada tecnologia:**

#### **Comandos Detectados Automaticamente**
- **Python**: `pytest tests/ -v --cov=app`
- **Go**: `go test ./... -v -race -cover`  
- **Rust**: `cargo test --all-features`
- **Node.js**: `npm test -- --coverage`
- **Java**: `mvn test` ou `./gradlew test`
- **C#/.NET**: `dotnet test`

#### **Execução via Claude Code**
```bash
# Claude Code detecta a tecnologia e executa os testes apropriados
/test

# Testes específicos
/test unit
/test integration  
/test e2e
```

---

## 🚀 Fase 5: Deploy Universal

### 6.1 Containerização Automática

**Claude Code gera Dockerfiles otimizados automaticamente:**

```bash
# Comando universal de containerização
/containerize

# Claude Code detecta a tecnologia e gera:
# - Dockerfile multi-stage otimizado
# - docker-compose.yml se necessário  
# - .dockerignore apropriado
# - Scripts de build e deploy
```

**Padrões aplicados automaticamente:**
- **Multi-stage builds** para reduzir tamanho da imagem
- **Caching** de dependências otimizado por linguagem
- **Security scanning** integrado
- **Health checks** configurados

### 6.2 CI/CD Automático

**Claude Code gera pipelines otimizados:**

```bash
# Comando universal de CI/CD
/cicd github  # ou /cicd gitlab, /cicd azure

# Gerado automaticamente baseado na tecnologia detectada:
# - Workflow de build e teste
# - Security scanning
# - Docker build e push  
# - Deploy staging e produção
# - Rollback automático em falhas
```

**Características universais:**
- **Testing**: Executa suite completa de testes
- **Security**: Dependency scanning automatizado  
- **Quality**: Code analysis e coverage reporting
- **Deploy**: Blue/green ou rolling updates
- **Monitoring**: Health checks e alerting

### 6.3 Observabilidade Universal

**Claude Code configura monitoring automaticamente:**

```bash
# Comando de configuração de monitoring  
/monitoring setup

# Configura automaticamente baseado na tecnologia:
# - Métricas (Prometheus/OpenTelemetry)
# - Logging estruturado  
# - Distributed tracing
# - Health checks
# - Dashboards (Grafana)
```

**Stack de observabilidade padrão:**
- **Métricas**: CPU, memória, latência, throughput
- **Logs**: Estruturados com correlation IDs
- **Traces**: Distributed tracing entre serviços
- **Alertas**: SLA violations e anomalias
- **Dashboards**: Visão operacional em tempo real

---

## 📊 Checklist Universal de Qualidade

### **Arquitetura & Design**
- [ ] Arquitetura apropriada para o domínio do problema
- [ ] Separação clara de responsabilidades
- [ ] Baixo acoplamento, alta coesão
- [ ] Padrões de design aplicados consistentemente
- [ ] Documentação arquitetural atualizada

### **Código & Implementação**
- [ ] Código limpo e legível
- [ ] Convenções da linguagem seguidas
- [ ] Error handling robusto
- [ ] Logging estruturado implementado
- [ ] Configuration management adequado

### **Testes (TDD)**
- [ ] Cobertura >90% para lógica crítica
- [ ] Unit tests isolados e rápidos
- [ ] Integration tests para fluxos principais
- [ ] E2E tests para cenários críticos
- [ ] Tests são mantidos e atualizados

### **Performance**
- [ ] Benchmarks estabelecidos
- [ ] Profiling executado regularmente
- [ ] Memory leaks identificados e corrigidos
- [ ] Concurrency/parallelism otimizados
- [ ] Database queries otimizadas

### **Segurança**
- [ ] Dependency scan sem vulnerabilidades críticas
- [ ] Secrets management implementado
- [ ] Input validation e sanitization
- [ ] Authentication e authorization corretos
- [ ] HTTPS/TLS configurado

### **Deploy & Ops**
- [ ] Containerização funcional
- [ ] CI/CD pipeline robusto
- [ ] Infrastructure as Code implementado
- [ ] Monitoring e alerting configurados
- [ ] Backup e disaster recovery planejados

### **Documentação**
- [ ] README com instruções claras
- [ ] API documentation atualizada
- [ ] Architecture Decision Records (ADRs)
- [ ] Runbooks para operações
- [ ] Developer onboarding guide

---

## 📚 Resumo da Metodologia Universal

### Fluxo Completo Claude Code

```bash
# 1. Setup inicial (uma vez por tecnologia)
mkdir projeto && cd projeto
[comandos de boilerplate da tecnologia]
cp -r /path/to/.claude .

# 2. Desenvolvimento contínuo
echo "PRD do projeto" > docs/PRD.md
/init                    # Detecta tecnologia
/output-style           # "Pragmatic Test Driven Developer"  
/design docs/PRD.md    # Arquitetura automática
/implement             # TDD automático
/test                  # Testes da tecnologia
/containerize          # Docker otimizado
/cicd github          # CI/CD automático
/monitoring setup     # Observabilidade
```

### Vantagens da Abordagem Universal

✅ **Uma metodologia** para qualquer linguagem  
✅ **Detecção automática** da tecnologia e frameworks  
✅ **Agentes especializados** ativados dinamicamente  
✅ **TDD rigoroso** com ferramentas apropriadas  
✅ **Padrões de qualidade** consistentes  
✅ **Deploy e monitoring** automatizados  

**Resultado**: Desenvolvimento profissional de qualidade independente da stack escolhida.