---
allowed-tools: Task, Bash, Read, Write, Edit, MultiEdit, TodoWrite
description: Build Flutter mobile MVP from design specifications using test-driven development cycles
argument-hint: <design-folder-output-path> <flutter-project-folder>
---

# Flutter Mobile MVP Implementation from Design Specifications

Build production-ready Flutter mobile MVPs from `/design-mobile` outputs using modern Test-Driven Development (TDD) with Widget and Integration testing.

## Core Philosophy

This command demonstrates modern mobile TDD practices by:

- **Design-First**: All implementation decisions derive from mobile design phase outputs
- **Test-First**: Write widget and integration tests before code (Red → Green → Verify cycles)
- **Mobile-Optimized Testing**: Widget tests for UI components, Integration tests for user workflows
- **No Assumptions**: Implementation follows Flutter design specifications exactly

## Prerequisites

This command requires design outputs from `/design-mobile`:

- `.claude/outputs/design/projects/[project-name]/[timestamp]/IMPLEMENTATION_PLAN.md` - Flutter technical roadmap
- `.claude/outputs/design/projects/[project-name]/[timestamp]/MANIFEST.md` - Requirements registry
- UI designer outputs (mobile wireframes, screen flows, navigation structure)
- flutter-specialist outputs (widget architecture, state management, platform integration)
- mobile-test-expert outputs (widget test specifications, integration test strategies)

## Arguments

Parse `$ARGUMENTS` to extract the path to:

- <design-folder-output-path> the design folder containing the mobile design outputs. The path should point to a folder like `.claude/outputs/design/projects/[project-name]/[timestamp]/`

- <flutter-project-folder> (optional) the folder that the Flutter MVP should be built in.

The command will automatically read:

- `MANIFEST.md` - Registry of all mobile design agent outputs with requirements traceability
- `IMPLEMENTATION_PLAN.md` - Unified Flutter implementation strategy and technical approach
- Reference all related mobile design agent outputs as indexed by the `MANIFEST.md`
- Check if the `flutter-project-folder` is specified. Otherwise, make an intelligent guess where to start building the app. If existing files are there, perform an assessment to know the starting point (likely to be a Flutter project created with `flutter create`)

## Usage Example

```bash
# Implement from mobile design folder path
/implement-mobile-mvp .claude/outputs/design/projects/[project-name]/[timestamp] my_flutter_app
```

## Mobile TDD Implementation Strategy

### Flutter-Specific TDD Approach

Unlike web development, Flutter TDD follows a mobile-optimized cycle:

1. **Widget Test First** → Test UI component behavior and state
2. **Implement Widget** → Create minimal Widget implementation
3. **Integration Test** → Test complete user workflows
4. **Platform Integration** → Add native features with proper testing

### Mobile Testing Hierarchy

**1. Widget Tests (Unit-level)**
- Test individual widget behavior
- Verify state management integration
- Validate UI interactions and animations

**2. Integration Tests (Feature-level)**
- Test complete user workflows across screens
- Verify navigation and data persistence
- Test platform integrations (camera, storage, etc.)

**3. Golden File Tests (Visual)**
- Capture and compare widget appearances
- Test responsive layouts across screen sizes
- Validate theming and accessibility

## Implementation Workflow

### Phase 1: Project Setup and Architecture

**Analyze Design Outputs**:
1. Read `IMPLEMENTATION_PLAN.md` for Flutter architecture decisions
2. Review widget hierarchy from flutter-specialist outputs
3. Understand state management strategy (Provider/Riverpod/BLoC)
4. Identify platform integrations and permissions needed

**Setup Flutter Project Structure**:
```dart
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── services/
├── features/
│   └── [feature_name]/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   └── usecases/
│       └── presentation/
│           ├── pages/
│           ├── widgets/
│           └── providers/
└── shared/
    ├── widgets/
    └── constants/
```

### Phase 2: TDD Implementation Cycles

**For Each Feature from Design Outputs**:

#### Widget Test Cycle (Micro-level)

```bash
# RED: Write failing widget test
```
```dart
testWidgets('TaskItem displays task information correctly', (tester) async {
  const task = Task(id: '1', title: 'Test Task', isCompleted: false);
  
  await tester.pumpWidget(
    MaterialApp(home: TaskItem(task: task))
  );
  
  expect(find.text('Test Task'), findsOneWidget);
  expect(find.byType(Checkbox), findsOneWidget);
});
```

```bash
# GREEN: Implement minimal widget
```
```dart
class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          // TODO: Implement state management
        },
      ),
    );
  }
}
```

```bash
# VERIFY: Run test and confirm it passes
```

#### Integration Test Cycle (Feature-level)

```bash
# RED: Write failing integration test
```
```dart
testWidgets('Can create and complete task', (tester) async {
  app.main();
  await tester.pumpAndSettle();
  
  // Navigate to add task screen
  await tester.tap(find.byIcon(Icons.add));
  await tester.pumpAndSettle();
  
  // Enter task details
  await tester.enterText(find.byKey(Key('task_title')), 'New Task');
  await tester.tap(find.text('Save'));
  await tester.pumpAndSettle();
  
  // Verify task appears in list
  expect(find.text('New Task'), findsOneWidget);
  
  // Complete the task
  await tester.tap(find.byType(Checkbox).first);
  await tester.pumpAndSettle();
  
  // Verify task is marked as completed
  final checkbox = tester.widget<Checkbox>(find.byType(Checkbox).first);
  expect(checkbox.value, true);
});
```

```bash
# GREEN: Implement navigation and state management
```
```dart
class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(String taskId) {
    final index = _tasks.indexWhere((task) => task.id == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        isCompleted: !_tasks[index].isCompleted,
      );
      notifyListeners();
    }
  }
}
```

### Phase 3: Platform Integration with TDD

**Test Native Features**:
```dart
group('Camera Integration', () {
  testWidgets('Can capture and display image', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    
    // Mock camera service
    when(mockCameraService.takePicture())
        .thenAnswer((_) async => 'test_image_path.jpg');
    
    // Trigger camera
    await tester.tap(find.byIcon(Icons.camera_alt));
    await tester.pumpAndSettle();
    
    // Verify image is displayed
    expect(find.byType(Image), findsOneWidget);
  });
});
```

**Implement Platform Integration**:
```dart
class CameraService {
  final ImagePicker _picker = ImagePicker();
  
  Future<String?> takePicture() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
    );
    return photo?.path;
  }
}
```

### Phase 4: Performance and Accessibility Testing

**Golden File Testing**:
```dart
testWidgets('TaskItem golden test', (tester) async {
  const task = Task(id: '1', title: 'Test Task', isCompleted: false);
  
  await tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.lightTheme,
      home: Material(child: TaskItem(task: task)),
    ),
  );
  
  await expectLater(
    find.byType(TaskItem),
    matchesGoldenFile('golden/task_item.png'),
  );
});
```

**Accessibility Testing**:
```dart
testWidgets('TaskItem has proper semantics', (tester) async {
  const task = Task(id: '1', title: 'Test Task', isCompleted: false);
  
  await tester.pumpWidget(
    MaterialApp(home: TaskItem(task: task))
  );
  
  // Verify semantic labels
  expect(
    tester.getSemantics(find.byType(Checkbox)),
    matchesSemantics(
      label: 'Mark task as complete',
      isChecked: false,
    ),
  );
});
```

## Mobile-Specific Implementation Patterns

### State Management Integration

**Provider Pattern**:
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.currentTheme,
            home: TaskListScreen(),
          );
        },
      ),
    );
  }
}
```

**Riverpod Pattern**:
```dart
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl();
});

final tasksProvider = StateNotifierProvider<TasksNotifier, AsyncValue<List<Task>>>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return TasksNotifier(repository);
});

class TasksNotifier extends StateNotifier<AsyncValue<List<Task>>> {
  TasksNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadTasks();
  }
  
  final TaskRepository _repository;
  
  Future<void> loadTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = AsyncValue.data(tasks);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
```

### Local Storage Implementation

**SQLite with Floor**:
```dart
@Database(version: 1, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> findAllTasks();
  
  @insert
  Future<void> insertTask(Task task);
  
  @update
  Future<void> updateTask(Task task);
  
  @delete
  Future<void> deleteTask(Task task);
}
```

### Performance Optimization

**Efficient List Building**:
```dart
class TaskListView extends StatelessWidget {
  const TaskListView({Key? key, required this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          key: ValueKey(tasks[index].id),
          task: tasks[index],
        );
      },
    );
  }
}
```

**Image Caching**:
```dart
class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      memCacheWidth: 300,
      memCacheHeight: 300,
    );
  }
}
```

## Testing Commands

### Flutter Testing Workflow

```bash
# Run all tests
flutter test

# Run widget tests only
flutter test test/widget_test/

# Run integration tests
flutter test integration_test/

# Generate test coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# Run golden file tests
flutter test --update-goldens

# Run tests on specific device
flutter test -d chrome
flutter test -d "iPhone 13"
```

### Performance Testing

```bash
# Profile app performance
flutter run --profile --trace-startup

# Analyze build size
flutter build apk --analyze-size

# Test memory usage
flutter driver --target=test_driver/memory_test.dart
```

## Mobile-Specific Validation

### Pre-deployment Checklist

- [ ] All widget tests pass
- [ ] All integration tests pass
- [ ] Golden file tests updated and passing
- [ ] Performance benchmarks met
- [ ] Accessibility requirements satisfied
- [ ] Platform-specific features working (iOS/Android)
- [ ] App store compliance verified
- [ ] Battery usage optimized

### Platform Considerations

**Android-specific**:
- [ ] Material Design 3 guidelines followed
- [ ] Proper permission handling
- [ ] Back button navigation implemented
- [ ] APK size optimization

**iOS-specific**:
- [ ] Human Interface Guidelines followed
- [ ] Proper App Store Review Guidelines compliance
- [ ] iOS-specific navigation patterns
- [ ] App size optimization

## Integration with Deployment

Output feeds directly into:

- Flutter build processes for app store deployment
- CI/CD pipeline integration with automated testing
- Performance monitoring and crash reporting setup
- App store submission preparation