# Quick Start: Flutter Todo App (⏱️ 40 minutos)

**Objetivo**: Criar app mobile completo para aprender desenvolvimento Flutter + TDD

## 🚀 Setup Rápido (8 min)

### 1. Verificar Flutter e criar projeto
```bash
# Verificar Flutter
flutter doctor

# Projeto Flutter
flutter create todo_app --platforms ios,android
cd todo_app

# Estrutura clean architecture
mkdir -p lib/{core,features,shared}
mkdir -p lib/core/{constants,services}
mkdir -p lib/features/{tasks,settings}
mkdir -p lib/shared/widgets

# Copiar configuração Claude Code
cp -r /path/to/Tutorial-Claude-Code/.claude .

# Configurar PRD
mkdir -p docs
cp /path/to/Tutorial-Claude-Code/examples/SIMPLE-TODO-PRD.md docs/PRD.md
```

### 2. Configurar dependências Flutter
```yaml
# Editar pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  sqflite: ^2.3.0
  path_provider: ^2.1.1
  uuid: ^4.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  flutter_lints: ^3.0.1
```

```bash
# Instalar dependências
flutter pub get

# EXECUTAR: Reconhecer projeto
/init
```

## ⚙️ Design da Aplicação (7 min)

### 3. Executar comando de design
```bash
# Ativar TDD primeiro
/output-style
# Selecionar: "Pragmatic Test Driven Developer"

# Design automático mobile
/dev:design-mobile "docs/PRD.md"
```

**O que acontece:**
- `orchestrator` analisa o PRD mobile
- `ui-designer` cria wireframes mobile-first
- `flutter-specialist` define arquitetura widgets
- `mobile-test-expert` planeja testes widget + integration

## 💻 Implementação TDD (20 min)

### 4. Implementar com TDD rigoroso
```bash
# Implementação automática com ciclos RED → GREEN → VERIFY
/dev:implement-mobile-mvp .claude/outputs/design/projects/todo-app/[timestamp] .
```

**Ciclos TDD esperados:**
1. **🔴 RED**: Teste Task model falha
2. **🟢 GREEN**: Implementar Task model + SQLite
3. **✅ VERIFY**: Confirmar dados salvando localmente

4. **🔴 RED**: Widget test TaskList falha
5. **🟢 GREEN**: Implementar TaskListWidget
6. **✅ VERIFY**: Confirmar lista exibindo tarefas

7. **🔴 RED**: Widget test AddTask falha
8. **🟢 GREEN**: Implementar AddTaskDialog
9. **✅ VERIFY**: Confirmar adição de tarefas

10. **🔴 RED**: Integration test workflow falha
11. **🟢 GREEN**: Implementar fluxo completo
12. **✅ VERIFY**: Confirmar CRUD completo funcionando

## 🧪 Testes e Execução (3 min)

### 5. Executar testes e app
```bash
# Testes automatizados
flutter test                    # Unit + Widget tests
flutter test integration_test/  # Integration tests

# Executar app
flutter run
# ou
flutter run -d chrome  # Web
```

## ✅ Resultado Esperado (2 min)

Ao final você terá:
- ✅ **App funcionando** em iOS + Android
- ✅ **CRUD completo** de tarefas offline
- ✅ **SQLite** para persistência local
- ✅ **Provider** para state management
- ✅ **Material Design 3** interface
- ✅ **Widget tests passando** 
- ✅ **Integration tests** end-to-end

## 📱 Preview do Resultado

### **Tela Principal**
```
╔══════════════════════════════════╗
║    📋 Minhas Tarefas             ║
║       (3 pendentes)              ║
╠══════════════════════════════════╣
║ ☑️ Comprar leite                 ║
║ ⬜ Estudar Flutter               ║
║ ⬜ Fazer exercícios              ║
║ ✅ ̶L̶e̶r̶ ̶l̶i̶v̶r̶o̶ ̶d̶e̶ ̶D̶a̶r̶t̶      ║
║ ⬜ Preparar apresentação         ║
╠══════════════════════════════════╣
║                              [+] ║
╚══════════════════════════════════╝
```

### **Dialog Adicionar**
```
╔══════════════════════════════════╗
║   ➕ Nova Tarefa                 ║
╠══════════════════════════════════╣
║ Título da tarefa:                ║
║ [_________________________]     ║
║                                  ║
║ [Cancelar]         [Salvar]      ║
╚══════════════════════════════════╝
```

### **Funcionalidades Móveis**
```
📱 Gestos Mobile:
• Swipe ← para deletar
• Tap para toggle complete
• Tap longo para editar
• FAB para adicionar nova

🔄 Estado Offline:
• Todos dados salvos localmente
• Funciona sem internet
• Performance 60fps
```

## 🎯 O que você aprendeu

### **Claude Code Mobile**
- ✅ Como usar `/dev:design-mobile`
- ✅ Agentes especializados Flutter
- ✅ TDD com widget + integration tests
- ✅ Arquitetura mobile-first

### **Flutter Development**
- ✅ Clean Architecture para apps
- ✅ Provider state management
- ✅ SQLite local persistence
- ✅ Material Design 3 components

### **Mobile TDD**
- ✅ Widget tests para UI components
- ✅ Integration tests para user flows
- ✅ Mock data e test fixtures
- ✅ Performance testing móvel

## 🔧 Features Implementadas

### **Core Funcionalidades**
- ✅ Adicionar nova tarefa
- ✅ Marcar tarefa como completa
- ✅ Editar título da tarefa
- ✅ Deletar tarefa (swipe)
- ✅ Persistência local SQLite

### **UI/UX Mobile**
- ✅ FloatingActionButton para adicionar
- ✅ Checkbox interactions
- ✅ Swipe to delete gestures
- ✅ Material Design theming
- ✅ Responsive layout

### **Arquitetura**
- ✅ Clean folder structure
- ✅ Provider para state management
- ✅ Repository pattern
- ✅ Model-View separation

## 🧪 Estrutura de Testes

### **Widget Tests** (3 principais)
```dart
testWidgets('displays task list correctly');
testWidgets('can add new task');
testWidgets('can toggle task completion');
```

### **Integration Test** (1 fluxo completo)
```dart
testWidgets('complete task management workflow');
```

### **Unit Tests** (modelos e serviços)
```dart
test('Task model creates correctly');
test('TaskRepository saves to database');
```

## 🚀 Próximos Passos

Agora que dominou Flutter básico, experimente:

1. **Tutorial Completo**: [TUTORIAL-FLUTTER-MOBILE.md](TUTORIAL-FLUTTER-MOBILE.md)
2. **App mais complexo**: [FLUTTER-TASK-APP-PRD.md](../examples/FLUTTER-TASK-APP-PRD.md)
3. **Outra tecnologia**: [QUICK-START-NEXTJS.md](QUICK-START-NEXTJS.md)

## 🆘 Troubleshooting Rápido

**❌ Flutter doctor issues**
```bash
# Instalar dependências faltando
flutter doctor --android-licenses
# Para iOS: instalar Xcode Command Line Tools
```

**❌ Erro SQLite**
```bash
# Limpar build e reinstalar
flutter clean
flutter pub get
flutter run
```

**❌ Provider not found**
```bash
# Verificar se Provider está no pubspec.yaml
flutter pub deps
```

**❌ Testes falhando**
```bash
# Executar testes individualmente
flutter test test/widget/task_list_test.dart
flutter test integration_test/
```

## 📱 Comandos Úteis Flutter

### **Desenvolvimento**
```bash
flutter run                     # Run em device conectado
flutter run -d chrome          # Run na web
flutter run --profile          # Performance profiling
flutter run --verbose          # Debug detalhado
```

### **Testing**
```bash
flutter test                    # Todos tests
flutter test --coverage        # Com coverage
flutter test test/widget/       # Só widget tests
flutter test integration_test/  # Só integration tests
```

### **Build**
```bash
flutter build apk              # Android APK
flutter build ios             # iOS build
flutter build web             # Web build
flutter analyze               # Code analysis
```

### **Debug & Analysis**
```bash
flutter inspector             # Widget inspector
flutter screenshot           # Screenshot do app
flutter logs                 # Device logs
dart format lib/             # Format código
```

## 🏗️ Estrutura Final do Projeto

```
todo_app/
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   └── services/
│   │       └── database_service.dart
│   ├── features/
│   │   └── tasks/
│   │       ├── models/
│   │       │   └── task.dart
│   │       ├── providers/
│   │       │   └── task_provider.dart
│   │       ├── repositories/
│   │       │   └── task_repository.dart
│   │       └── widgets/
│   │           ├── task_list.dart
│   │           └── add_task_dialog.dart
│   ├── shared/
│   │   └── widgets/
│   └── main.dart
├── test/
│   ├── unit/
│   ├── widget/
│   └── fixtures/
├── integration_test/
│   └── app_test.dart
└── docs/
    └── PRD.md
```

---

**⏱️ Tempo real: 35-45 minutos**
**✅ Complexidade: Intermediário**
**🎯 Ideal para: Primeira experiência mobile completa**