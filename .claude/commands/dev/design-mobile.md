---
allowed-tools: Task, Read, Write, TodoWrite
description: Design Flutter mobile application architecture from PRD with test-first specifications
argument-hint: <prd-file-path>
---

# Flutter Mobile Application Design Command

Create a comprehensive Flutter mobile app design with test-first specifications based on a Product Requirements Document (PRD).

## Usage Examples

Analyze PRD file referenced from `$ARGUMENTS`. It may be passed directly as text, or as a file reference, or with parameters.

```bash
# Design from PRD file
/design-mobile --prd=docs/projects/task-app/prd.md

# Design with specific data sources
/design-mobile --prd=projects/task-app/prd.md --data=.claude/outputs/data/latest

# Design with custom output location
/design-mobile --prd=specs/fitness-app.md --output=designs/fitness-app
```

## PRD-Driven Mobile Design Philosophy

The command analyzes a Product Requirements Document to create a complete Flutter mobile app design:

1. **PRD Analysis**: Extract features, user stories, and mobile-specific requirements
2. **Test-First Design**: Write widget and integration tests based on PRD user stories
3. **Flutter Architecture**: Design specifically for Flutter/Dart patterns and mobile UX
4. **Native Integration Planning**: Plan platform-specific features and permissions

## Mobile-First Design Integration

The **flutter-specialist** agent provides comprehensive mobile design capabilities:

### Mobile Excellence Focus
- **Native UX Patterns**: Design following Material Design 3 and iOS Human Interface Guidelines
- **Performance Optimization**: Efficient widget trees, memory management, and battery optimization
- **Platform Integration**: Camera, GPS, push notifications, and device-specific features
- **Responsive Design**: Adapt to different screen sizes, orientations, and accessibility needs

### Enhanced Deliverables with Flutter Specifications
The flutter-specialist agent produces **5 output files** with mandatory mobile-specific values:
1. `widget-architecture.md` - Widget tree structure and component hierarchy
2. `state-management-strategy.md` - Provider/Riverpod/BLoC implementation plan
3. `platform-integration-plan.md` - Native features, permissions, and platform channels
4. `performance-optimization.md` - Lazy loading, caching, and memory management strategies
5. `testing-strategy.md` - Widget tests, integration tests, and golden file testing

### Required Mobile-Specific Deliverables
Each design agent MUST provide:
- Widget tree structures with performance considerations
- State management patterns appropriate for app complexity
- Platform permission requirements and native integrations
- Screen size and orientation handling strategies
- Accessibility implementations (semantics, screen readers)

Examples showing mobile-specific considerations:
- Task Management App: Local SQLite storage with offline-first approach
- E-commerce App: Image caching, payment integrations, push notifications
- Fitness App: GPS tracking, health kit integration, background processing
- Social App: Camera integration, real-time messaging, media handling

## Workflow (Orchestrator-Managed Sequential then Parallel Coordination)

Following orchestrator-initialized workflow with structured mobile project setup and validation:

### Phase 1: Orchestrator Initialization (Sequential - Project Setup)

**Agent**: `orchestrator`
**Output**: `.claude/outputs/design/projects/[project-name]/[timestamp]/`
**Purpose**:

- Analyze PRD and confirm mobile app scope
- Generate consistent project name and timestamp
- Create initial MANIFEST.md with mobile requirements baseline
- Note: Agent outputs go directly to shared `.claude/outputs/design/agents/` location

### Phase 2: Mobile UI Design Foundation (Sequential - Foundation Required)

**Agent**: `ui-designer`
**Output**: `.claude/outputs/design/agents/ui-designer/[project-name]-[timestamp]/` (pre-created)
**Purpose**: Read PRD, create mobile wireframes, screen flows, and navigation patterns

### Phase 3: Parallel Flutter & Testing Design

**Executed Simultaneously** after Phase 2 completion:

You **MUST** execute Phase 3A and Phase 3B in parallel using sub-agents.

#### Phase 3A: Flutter Architecture Design

```bash
- flutter-specialist → widget architecture, state management, platform integration (uses ui-designer output for mobile design context)
```

#### Phase 3B: Mobile Test Specification Design

```bash
- mobile-test-expert → Widget and integration test specifications (uses ui-designer output)
```

### Phase 4: Orchestrator Synthesis & Validation (Sequential - Requires All Inputs)

**Agent**: `orchestrator` (final validation)
**Output**: `.claude/outputs/design/projects/[project-name]/[timestamp]/`

**Purpose**: Synthesize all agent outputs into coherent Flutter implementation plan
**Input**: All agent outputs from Phases 2-3 + initial MANIFEST from Phase 1
**Validates**:

- ✓ All PRD requirements have corresponding mobile design outputs
- ✓ Mobile wireframes cover all user stories and screen flows
- ✓ Widget architecture addresses all UI requirements
- ✓ State management strategy is appropriate for app complexity
- ✓ Platform integrations are properly planned with permissions
- ✓ Test specifications cover all mobile interaction patterns
- ✓ Performance considerations are addressed
- ✓ Accessibility features are planned

**Output**:
- `MANIFEST.md` - Final registry linking all agent outputs with mobile requirements traceability
- `IMPLEMENTATION_PLAN.md` - Single source of truth for Flutter implementation
**TodoWrite Integration**: Creates final task list with mobile requirement coverage validation

## Output Structure

**Phase 1 (Orchestrator Initialization)**:

```
.claude/outputs/design/projects/[project-name]/[timestamp]/
└── MANIFEST.md                   # Initial mobile requirements baseline and agent registry
```

**Phase 2 (Sequential - Mobile UI Foundation)**:

```
.claude/outputs/design/agents/
└── ui-designer/[project-name]-[timestamp]/
    ├── mobile-wireframes.md
    ├── screen-flows.md
    ├── navigation-structure.md
    └── responsive-design.md
```

**Phase 3 (Parallel Execution)**:

```
.claude/outputs/design/agents/
├── flutter-specialist/[project-name]-[timestamp]/
│   ├── widget-architecture.md
│   ├── state-management-strategy.md
│   ├── platform-integration-plan.md
│   ├── performance-optimization.md
│   └── dependency-management.md
├── mobile-test-expert/[project-name]-[timestamp]/
│   ├── widget-test-plan.md
│   ├── integration-test-strategy.md
│   ├── golden-file-testing.md
│   └── performance-testing.md
```

**Phase 4 (Sequential - Final Synthesis)**:

```
.claude/outputs/design/projects/[project-name]/[timestamp]/
├── MANIFEST.md                   # Complete registry of all agent outputs with mobile requirements traceability
└── IMPLEMENTATION_PLAN.md        # Unified Flutter implementation plan
```

## Task Management & Orchestrator-Managed Execution

The command automatically:

- **Phase 1**: Orchestrator initialization with mobile project setup and TodoWrite tracking
- **Phase 2**: Sequential mobile UI design with TodoWrite tracking
- **Phase 3**: Parallel agent spawning with concurrent TodoWrite management
- **Phase 4**: Final orchestrator synthesis with validation against all outputs
- **Agent Coordination**: Uses **multiple Task tool calls in single message** to spawn agents simultaneously
- **Progress Tracking**: Individual TodoWrite entries for each agent's progress
- **Dependency Management**: Ensures Phase 4 waits for all Phase 3 agents to complete

### Critical Implementation Pattern for Phase 3

**Parallel Execution Requirements:**

```bash
# CORRECT: Two Task tool calls in single message for parallel execution
<invoke name="Task">
  # flutter-specialist task
</invoke>
<invoke name="Task">
  # mobile-test-expert task
</invoke>

# INCORRECT: Sequential Task calls (not parallel)
# Call flutter-specialist first, wait for completion, then call mobile-test-expert
```

### Execution Strategy

```bash
# Phase 1: Sequential (mobile project initialization)
orchestrator → PRD analysis, mobile project setup, folder creation, initial MANIFEST.md

# Phase 2: Sequential (Mobile UI foundation required)
ui-designer → mobile wireframes, screen flows, navigation patterns

# Phase 3: Parallel (spawn simultaneously, using ui-designer output)
# CRITICAL: Use TWO Task tool calls in SINGLE message for true parallelism
flutter-specialist (mobile architecture + widgets) + mobile-test-expert (mobile testing) (simultaneous Task calls)

# Phase 4: Sequential (requires all inputs)
orchestrator → synthesis, validation, finalize MANIFEST.md
```

## Input Parameters

- `--prd`: Path to PRD file (required)
- `--data`: Path to existing data specifications (optional)
- `--output`: Custom output directory (optional)

## PRD Requirements Coverage (Orchestrator-Managed Validation)

The design process ensures 100% PRD coverage across all agents:

- ✓ **orchestrator**: Initial PRD analysis & MANIFEST creation (initialization)
- ✓ **ui-designer**: Mobile UI requirements & user story mapping (foundation)
- ✓ **flutter-specialist**: Widget architecture, state management & platform integration (uses UI foundation)
- ✓ **mobile-test-expert**: Mobile testing strategies & automation (uses UI foundation)
- ✓ **orchestrator**: Cross-agent validation & MANIFEST finalization (synthesis)

## Flutter Specific Design

The design is optimized for Flutter mobile development:

- **Widget Structure**: Proper widget tree hierarchy and composition
- **State Management**: Provider/Riverpod/BLoC patterns based on complexity
- **Navigation**: Navigator 2.0 with proper route management
- **Platform Integration**: Method channels for native features
- **Performance**: Efficient scrolling, image handling, and memory management
- **Testing**: Widget tests, integration tests, and golden file testing

## Success Criteria (Orchestrator-Managed Validation)

A complete mobile design includes outputs from all phases:

- ✓ **Phase 1**: Mobile project setup & initial MANIFEST (orchestrator initialization)
- ✓ **Phase 2**: Mobile wireframes & screen flows (ui-designer)
- ✓ **Phase 3A**: Flutter widget architecture, state management & platform integration (flutter-specialist)
- ✓ **Phase 3B**: Mobile test specifications covering all user interactions (mobile-test-expert)
- ✓ **Phase 4**: Complete MANIFEST + unified IMPLEMENTATION_PLAN (orchestrator synthesis)

**Efficiency Gains**: Orchestrator setup enables consistent mobile project structure and UI foundation enables parallel Flutter architecture and testing work

## Integration with Implementation

Output feeds directly into:

- `/implement-mobile-mvp` for TDD Flutter implementation
- Flutter project scaffolding with proper package structure
- Widget and platform integration implementation guidance
- Mobile-specific testing and performance optimization