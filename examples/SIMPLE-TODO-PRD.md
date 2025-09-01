# Simple Todo App - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: App mobile básico para gerenciar tarefas pessoais
- **Tipo**: Mobile App (iOS + Android)
- **Usuários-alvo**: Usuários casuais, estudantes, profissionais básicos

## 2. Funcionalidades Core

### 2.1 Lista de Tarefas
**Como usuário**, eu quero ver minhas tarefas em uma lista para acompanhar o que preciso fazer

**Critérios de aceitação**:
- [ ] Lista vertical de tarefas com scroll
- [ ] Cada item mostra: título, status (completo/pendente)
- [ ] Checkbox para marcar como completo
- [ ] Tarefas completas ficam riscadas
- [ ] Contador de tarefas pendentes no topo

### 2.2 Adicionar Tarefa
**Como usuário**, eu quero adicionar novas tarefas rapidamente

**Critérios de aceitação**:
- [ ] Botão floating action button (+) para adicionar
- [ ] Campo de texto simples para título da tarefa
- [ ] Botão salvar/cancelar
- [ ] Validação: título obrigatório
- [ ] Feedback visual quando tarefa é adicionada

### 2.3 Gerenciar Tarefas
**Como usuário**, eu quero editar e remover tarefas

**Critérios de aceitação**:
- [ ] Swipe para deletar tarefa
- [ ] Confirmação antes de deletar
- [ ] Tap longo para editar título
- [ ] Persiste dados localmente (SQLite)

## 3. Stack Técnica
- **Framework**: Flutter 3.16+
- **Language**: Dart 3.0+
- **Storage**: SQLite (sqflite)
- **State Management**: Provider
- **Design**: Material Design 3
- **Testing**: Widget + Integration tests

## 4. Estrutura de Dados

```dart
// Task Model
class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime? completedAt;
}

// SQLite Table Schema
CREATE TABLE tasks (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  is_completed INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  completed_at TEXT
);
```

## 5. Critérios de Sucesso
- [ ] App inicia em <2 segundos
- [ ] CRUD de tarefas funcionando offline
- [ ] Interface fluida (60fps)
- [ ] Funciona em iOS e Android
- [ ] 3 testes principais passando
- [ ] Build release sem warnings

## 6. Telas Principais

### **Tela Principal**
```
+------------------------+
|    📋 Minhas Tarefas    |
|     (3 pendentes)      |
+------------------------+
| ☑️ Comprar leite        |
| ⬜ Estudar Flutter      |
| ⬜ Fazer exercícios     |
| ✅̶ ̶L̶e̶r̶ ̶l̶i̶v̶r̶o̶         |
+------------------------+
|                    [+] |
+------------------------+
```

### **Adicionar Tarefa**
```
+------------------------+
|   ➕ Nova Tarefa        |
+------------------------+
| Título da tarefa:      |
| [_________________]    |
|                        |
| [Cancelar] [Salvar]    |
+------------------------+
```

## 7. Implementação Sugerida (45 mins por fase)

### **Fase 1: Setup (45 min)**
1. `flutter create` + estrutura de pastas
2. Configurar SQLite + Provider
3. Model e Repository básicos

### **Fase 2: UI Principal (45 min)**
1. Tela principal com lista de tarefas
2. Layout básico com Material Design
3. Estados loading/empty

### **Fase 3: CRUD Completo (45 min)**
1. Adicionar tarefa (FAB + dialog)
2. Toggle complete/incomplete
3. Deletar com swipe

### **Fase 4: Persistência + Polish (45 min)**
1. Integração SQLite completa
2. Animações básicas
3. Testes widget essenciais

**Total estimado: ~3h + testes**

## 8. Testes Essenciais

```dart
// Widget Tests (3 principais)
testWidgets('displays task list correctly');
testWidgets('can add new task');
testWidgets('can toggle task completion');

// Integration Test (1 fluxo completo)
testWidgets('complete task management workflow');
```

## 9. Nice-to-Have (Opcional)
- [ ] Dark mode support
- [ ] Categorias de tarefas
- [ ] Data de vencimento
- [ ] Notificações locais
- [ ] Export/backup de dados

---

**Este PRD é perfeito para:**
✅ Primeiro app mobile com Flutter
✅ Aprender TDD mobile com widgets tests
✅ Testar integração SQLite + Provider
✅ Validar fluxo completo Flutter development
✅ Experiência realista de desenvolvimento mobile