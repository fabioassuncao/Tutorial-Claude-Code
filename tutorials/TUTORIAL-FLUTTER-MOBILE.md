# Tutorial: Desenvolvimento Mobile com Flutter
## Flutter 3.16+ + Dart 3.0+ + Provider/Riverpod + SQLite

### 🎯 Visão Geral

Este tutorial demonstra como usar Claude Code e agentes de IA especializados para desenvolver **aplicações móveis nativas** com Flutter usando metodologia TDD e testes de widget/integração robustos.

**Stack Principal**: Flutter 3.16+ + Dart 3.0+ + Provider/Riverpod + SQLite + Firebase (opcional)

---

## 🚀 Configuração Inicial

### 1.2 Agentes Especializados para Mobile

#### **Estratégia & Arquitetura**
- `prd-writer` - PRDs para aplicações móveis
- `system-architect` - Arquitetura Flutter + padrões mobile
- `orchestrator` - Coordenação multi-agente

#### **Design & Interface**
- `ui-designer` - Wireframes mobile-first

#### **Implementação Mobile**
- `flutter-specialist` - Desenvolvimento Flutter/Dart

#### **Testes & Qualidade**
- `mobile-test-expert` - Widget + Integration + Golden file tests

### 1.3 Output Style TDD Obrigatório

```bash
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

---

## 📝 Fase 1: Criação do PRD Flutter

### 2.1 Exemplo Prático: Task Manager Mobile

Consulte o PRD completo e detalhado: **[Flutter Task Manager](examples/FLUTTER-TASK-APP-PRD.md)**

Este exemplo inclui:
- CRUD local com SQLite
- Notificações push personalizadas  
- Categorização por projetos
- Interface Material Design 3
- Sincronização cloud opcional

### 2.2 Template PRD Básico

Para criar seu próprio PRD, use esta estrutura mínima:

```markdown
# [Seu App] - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: [O que o app resolve]
- **Tipo**: Mobile App (iOS + Android)
- **Usuários-alvo**: [Personas principais]

## 2. Funcionalidades Core
- **Feature 1**: [Descrição e critérios de aceitação]
- **Feature 2**: [Descrição e critérios de aceitação]
- **Feature 3**: [Descrição e critérios de aceitação]

## 3. Stack Técnica
- Flutter 3.16+ + Dart 3.0+
- Provider/Riverpod + SQLite
- Material Design 3

## 4. Critérios de Sucesso
- [ ] Funciona offline
- [ ] Testes >90% cobertura
- [ ] Aprovação nas lojas
```

---

## 🏗️ Fase 2: Design Mobile Application

### 3.1 Comando de Design Flutter

```bash
# Design aplicação Flutter completa
/dev:design-mobile "examples/FLUTTER-TASK-APP-PRD.md"
```

**Agentes ativados automaticamente:**
- `orchestrator` - Coordenação geral
- `ui-designer` - Wireframes mobile-first
- `flutter-specialist` - Arquitetura Flutter
- `mobile-test-expert` - Estratégia de testes mobile

### 3.2 Outputs do Design Mobile

```
.claude/outputs/design/projects/task-manager/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano Flutter
└── agents/
    ├── ui-designer/
    │   ├── mobile-wireframes.md
    │   ├── screen-flows.md
    │   ├── navigation-structure.md
    │   └── responsive-breakpoints.md
    ├── flutter-specialist/
    │   ├── widget-architecture.md
    │   ├── state-management.md
    │   ├── data-layer-design.md
    │   └── performance-strategy.md
    ├── material-design-expert/
    │   ├── component-library.md
    │   ├── theme-system.md
    │   ├── animation-patterns.md
    │   └── accessibility-guide.md
    └── flutter-test-expert/
        ├── widget-test-plan.md
        ├── integration-scenarios.md
        ├── golden-file-strategy.md
        └── performance-benchmarks.md
```

---

## ⚙️ Fase 3: Setup do Projeto Flutter

### 4.1 Configuração do Boilerplate

#### **Passo 1: Criar e Configurar Projeto Base**

```bash
# Verificar Flutter instalado
flutter doctor

# Criar projeto Flutter
flutter create task_manager --platforms ios,android
cd task_manager

# Estrutura recomendada
mkdir -p lib/{core,features,shared}
mkdir -p lib/core/{constants,theme,utils,services}
mkdir -p lib/features/{tasks,projects,settings}
mkdir -p lib/shared/{widgets,constants}
```

#### **Passo 2: Configurar Dependências Flutter**

```yaml
# Editar pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.1.1              # ou riverpod: ^2.4.9
  
  # Local Storage
  sqflite: ^2.3.0
  shared_preferences: ^2.2.2
  path_provider: ^2.1.1
  
  # Network & Serialization
  dio: ^5.3.2
  json_annotation: ^4.8.1
  
  # Navigation
  go_router: ^12.1.1
  
  # UI & Utilities
  intl: ^0.18.1
  uuid: ^4.1.0
  
  # Notifications
  flutter_local_notifications: ^16.1.0
  
  # Permissions
  permission_handler: ^11.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Testing
  integration_test:
    sdk: flutter
  mockito: ^5.4.2
  build_runner: ^2.4.7
  
  # Code Generation
  json_serializable: ^6.7.1
  
  # Linting
  flutter_lints: ^3.0.1
```

```bash
# Instalar dependências
flutter pub get

# Gerar código (se usando json_serializable)
flutter packages pub run build_runner build
```

#### **Passo 3: Configurar Testes Flutter**

```bash
# Criar estrutura de testes
mkdir -p test/{unit,widget,integration}
mkdir -p integration_test
mkdir -p test/fixtures

# Configurar golden file tests
mkdir -p test/goldens
```

#### **Passo 4: Configurar Claude Code no Projeto**

```bash
# IMPORTANTE: Copiar configuração Claude
cp -r /path/to/tutorial-repo/.claude .

# Configurar PRD no projeto
mkdir -p docs
cp /path/to/tutorial-repo/examples/FLUTTER-TASK-APP-PRD.md docs/PRD.md

# EXECUTAR: Comando init do Claude Code
/init
```

**O comando `/init` irá:**
- ✅ Analisar o projeto Flutter existente
- ✅ Detectar dependências instaladas (Provider, SQLite, etc.)
- ✅ Ler o PRD.md disponível
- ✅ Gerar CLAUDE.md otimizado para este projeto específico
- ✅ Configurar agentes apropriados para desenvolvimento mobile

#### **Passo 5: Verificar Configuração**

Após `/init`, verifique se foi criado:
- ✅ `CLAUDE.md` - Orientações específicas do projeto
- ✅ Detecção da estrutura Flutter + dependências
- ✅ Reconhecimento da arquitetura clean + state management
- ✅ Configuração de agentes Flutter especializados

### 4.2 Projeto Pronto para Development

Com o boilerplate configurado e `/init` executado, seu projeto Flutter agora tem:

✅ **Stack móvel** - Flutter + Provider + SQLite + Go Router  
✅ **PRD definido** - Documento de requisitos no projeto  
✅ **Claude Code configurado** - CLAUDE.md gerado automaticamente  
✅ **Agentes ativos** - Especializados para Flutter/Dart detectados  
✅ **Testing setup** - Widget + Integration tests configurados  

**Próximo passo**: Fase 4 - Design da aplicação

---

## 🏗️ Fase 4: Design Mobile Application (com projeto configurado)

### 4.3 Comando de Design Flutter

```bash
# Design aplicação Flutter completa (agora com boilerplate configurado)
/dev:design-mobile "docs/PRD.md"
```

**Vantagem do boilerplate configurado:**
- ✅ Claude Code **reconhece** Flutter + Provider + SQLite instalados
- ✅ **Não alucina** sobre dependências inexistentes
- ✅ **Foca na implementação** das funcionalidades do PRD
- ✅ **Otimiza tokens** usando informações reais do projeto

**Agentes ativados automaticamente:**
- `orchestrator` - Coordenação geral
- `ui-designer` - Wireframes mobile-first
- `flutter-specialist` - Arquitetura Flutter
- `mobile-test-expert` - Estratégia de testes mobile

### 4.4 Outputs do Design Mobile

```
.claude/outputs/design/projects/task-manager/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano Flutter
└── agents/
    ├── ui-designer/
    │   ├── mobile-wireframes.md
    │   ├── screen-flows.md
    │   ├── navigation-structure.md
    │   └── responsive-breakpoints.md
    ├── flutter-specialist/
    │   ├── widget-architecture.md
    │   ├── state-management.md
    │   ├── data-layer-design.md
    │   └── performance-strategy.md
    ├── material-design-expert/
    │   ├── component-library.md
    │   ├── theme-system.md
    │   ├── animation-patterns.md
    │   └── accessibility-guide.md
    └── flutter-test-expert/
        ├── widget-test-plan.md
        ├── integration-scenarios.md
        ├── golden-file-strategy.md
        └── performance-benchmarks.md
```

---

## 🔄 Fase 4: Implementação TDD Flutter

### 4.1 Ativar TDD Estrito

```bash
# OBRIGATÓRIO: Modo TDD
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

### 4.2 Comando de Implementação

```bash
# Implementar MVP Flutter com TDD
/dev:implement-mobile-mvp .claude/outputs/design/projects/task-manager/[timestamp] .
```

### 4.3 Ciclos TDD Flutter - Exemplo Resumido

#### **Ciclo 1: Task Model (RED → GREEN → VERIFY)**
```dart
// test/unit/models/task_test.dart
test('should create and validate task model', () {
  final task = TaskModel(id: '1', title: 'Test', isCompleted: false);
  expect(task.title, 'Test');
  expect(task.isCompleted, false);
});
```

**GREEN**: Implementar `TaskModel` básico com SQLite.

**VERIFY**: Usuário confirma antes de prosseguir.

#### **Ciclo 2: Widget Tests (RED → GREEN → VERIFY)**

```dart
// test/widget/task_list_test.dart
testWidgets('displays and toggles tasks correctly', (tester) async {
  // Arrange
  final taskProvider = TaskProvider();
  taskProvider.setTasks([TaskModel(id: '1', title: 'Test Task')]);
  
  // Act & Assert
  expect(find.text('Test Task'), findsOneWidget);
  await tester.tap(find.byType(Checkbox));
  expect(taskProvider.tasks.first.isCompleted, true);
});
```

**GREEN**: Implementar `TaskListWidget` e `TaskProvider`.

**VERIFY**: Usuário confirma funcionalidade antes de continuar.

#### **Ciclo 3: Integration Tests (RED → GREEN → VERIFY)**

```dart
// integration_test/add_task_flow_test.dart
testWidgets('complete add task workflow', (tester) async {
  // Test full user flow: add task → verify in list → mark complete
});
```

**GREEN**: Implementar tela completa com navegação.

**VERIFY**: Usuário confirma fluxo completo funcionando.

### 4.4 Comandos de Teste Flutter

```bash
# Testes principais
flutter test                    # Unit + Widget tests
flutter test integration_test/  # Integration tests
flutter test --coverage         # Com cobertura
```

---

## 🚀 Fase 5: Deploy Mobile

### 5.1 Build para Produção

#### **Android**
```bash
# Build APK
flutter build apk --release

# Build App Bundle (recomendado para Play Store)
flutter build appbundle --release

# Informações de build
flutter build apk --release --verbose
```

#### **iOS**
```bash
# Build iOS
flutter build ios --release

# Criar arquivo IPA
flutter build ipa --release

# Abrir no Xcode para submissão
open ios/Runner.xcworkspace
```

### 6.2 Configuração de Release

```yaml
# android/app/build.gradle
android {
    signingConfigs {
        release {
            if (project.hasProperty('android.injected.signing.store.file')) {
                storeFile file(project.property('android.injected.signing.store.file'))
                storePassword project.property('android.injected.signing.store.password')
                keyAlias project.property('android.injected.signing.key.alias')
                keyPassword project.property('android.injected.signing.key.password')
            }
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}
```

### 6.3 App Store Submission

#### **Google Play Store**
```bash
# Upload via Console ou Fastlane
bundle exec fastlane android deploy

# Ou manual via Play Console
# 1. Upload .aab file
# 2. Configure store listing
# 3. Set up release management
# 4. Submit for review
```

#### **Apple App Store**
```bash
# Xcode submission
# 1. Archive app in Xcode
# 2. Upload to App Store Connect
# 3. Configure App Store information
# 4. Submit for review

# Or via Transporter app
# Upload .ipa file directly
```

---

## 📊 Recursos Avançados Flutter

### 7.1 Push Notifications

```dart
// lib/core/services/notification_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications = 
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidDetails = 
      AndroidNotificationDetails(
    'task_reminders',
    'Task Reminders',
    description: 'Notifications for task reminders',
    importance: Importance.high,
    priority: Priority.high,
  );

  static const DarwinNotificationDetails _iosDetails = 
      DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  static const NotificationDetails _platformDetails = 
      NotificationDetails(
    android: _androidDetails,
    iOS: _iosDetails,
  );

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings = 
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const DarwinInitializationSettings iosSettings = 
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(settings);
  }

  static Future<void> scheduleTaskReminder(
    String taskId,
    String taskTitle,
    DateTime scheduledTime,
  ) async {
    await _notifications.zonedSchedule(
      taskId.hashCode,
      'Task Reminder',
      'Don\'t forget: $taskTitle',
      scheduledTime.toLocal(),
      _platformDetails,
      uiLocalNotificationDateInterpretation: 
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: taskId,
    );
  }

  static Future<void> cancelNotification(String taskId) async {
    await _notifications.cancel(taskId.hashCode);
  }
}
```

### 7.2 State Management com Riverpod

```dart
// lib/features/tasks/presentation/providers/task_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../data/models/task_model.dart';

final taskRepositoryProvider = Provider<TaskRepositoryImpl>((ref) {
  return TaskRepositoryImpl();
});

final taskListProvider = FutureProvider<List<TaskModel>>((ref) async {
  final repository = ref.read(taskRepositoryProvider);
  return repository.getAllTasks();
});

final taskNotifierProvider = StateNotifierProvider<TaskNotifier, AsyncValue<List<TaskModel>>>(
  (ref) => TaskNotifier(ref.read(taskRepositoryProvider)),
);

class TaskNotifier extends StateNotifier<AsyncValue<List<TaskModel>>> {
  final TaskRepositoryImpl _repository;

  TaskNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = AsyncValue.data(tasks);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addTask(TaskModel task) async {
    await _repository.createTask(task);
    await loadTasks();
  }

  Future<void> toggleTask(String taskId) async {
    final currentTasks = state.value ?? [];
    final taskIndex = currentTasks.indexWhere((task) => task.id == taskId);
    
    if (taskIndex != -1) {
      final updatedTask = currentTasks[taskIndex].copyWith(
        isCompleted: !currentTasks[taskIndex].isCompleted,
        completedAt: !currentTasks[taskIndex].isCompleted 
            ? DateTime.now() 
            : null,
      );
      
      await _repository.updateTask(updatedTask);
      await loadTasks();
    }
  }

  Future<void> deleteTask(String taskId) async {
    await _repository.deleteTask(taskId);
    await loadTasks();
  }
}
```

### 7.3 Performance Optimizations

```dart
// lib/shared/widgets/optimized_list_view.dart
import 'package:flutter/material.dart';

class OptimizedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final Widget? separatorBuilder;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const OptimizedListView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.separatorBuilder,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length,
      separatorBuilder: (context, index) => 
          separatorBuilder ?? const SizedBox.shrink(),
      itemBuilder: (context, index) {
        if (index >= items.length) return const SizedBox.shrink();
        return itemBuilder(context, items[index], index);
      },
    );
  }
}

// Usage with automatic disposal and caching
class CachedImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: width?.round(),
      cacheHeight: height?.round(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: width,
          height: height,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: const Icon(
            Icons.error_outline,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
```

---

## 🎯 Checklist de Projeto Flutter Completo

### **Core App**
- [ ] Clean Architecture implementada
- [ ] State management funcionando (Provider/Riverpod)
- [ ] SQLite storage operacional
- [ ] Navegação com Go Router
- [ ] Theme system consistente

### **Features**
- [ ] CRUD completo para entidades principais
- [ ] Validação de formulários robusta
- [ ] Feedback visual adequado
- [ ] Offline-first functionality
- [ ] Search e filtros funcionando

### **UI/UX**
- [ ] Material Design 3 principles
- [ ] Responsive para tablets
- [ ] Dark mode support
- [ ] Accessibility labels
- [ ] Smooth animations (60fps)

### **Testing**
- [ ] Unit tests >80% coverage
- [ ] Widget tests para componentes críticos
- [ ] Integration tests para fluxos principais
- [ ] Golden file tests para UI consistency
- [ ] Performance benchmarks

### **Performance**
- [ ] App size <50MB
- [ ] Cold start <2s
- [ ] Memory usage <150MB
- [ ] 60fps consistent
- [ ] Battery optimized

### **Production**
- [ ] Code obfuscation enabled
- [ ] Crash reporting configured
- [ ] Analytics integrated
- [ ] App Store compliance verified
- [ ] Release notes prepared

---

## 📚 Comandos de Referência Flutter

### **Development**
```bash
# Run & Debug
flutter run
flutter run --profile
flutter run --release

# Analysis
flutter analyze
flutter test --coverage
dart format lib/

# Build
flutter build apk --release
flutter build ios --release
flutter build web
```

### **Tools**
```bash
# Performance
flutter run --trace-startup
flutter run --profile --trace-startup

# Size Analysis
flutter build apk --analyze-size
flutter build appbundle --analyze-size

# Dependencies
flutter pub get
flutter pub upgrade
flutter pub deps
```

**Esta metodologia Flutter garante aplicações móveis nativas robustas, performantes e testáveis através de TDD rigoroso e arquitetura limpa adaptada para mobile.**