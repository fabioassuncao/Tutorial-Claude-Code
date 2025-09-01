---
allowed-tools: Task, Read, Write, TodoWrite
description: Design Laravel full-stack application architecture from PRD with Livewire integration and test specifications
argument-hint: <prd-file-path>
---

# Laravel Full-Stack Application Design Command

Create a comprehensive Laravel full-stack application design with Livewire integration and test-first specifications based on a Product Requirements Document (PRD).

## Usage Examples

Analyze PRD file referenced from `$ARGUMENTS`. It may be passed directly as text, or as a file reference, or with parameters.

```bash
# Design from PRD file
/design-fullstack --prd=docs/projects/ecommerce/prd.md

# Design with specific data sources
/design-fullstack --prd=projects/ecommerce/prd.md --data=.claude/outputs/data/latest

# Design with custom output location
/design-fullstack --prd=specs/crm-system.md --output=designs/crm-system
```

## PRD-Driven Full-Stack Design Philosophy

The command analyzes a Product Requirements Document to create a complete Laravel full-stack application design:

1. **PRD Analysis**: Extract features, user stories, and full-stack requirements
2. **Test-First Design**: Write Feature and Unit tests based on PRD acceptance criteria
3. **Laravel Architecture**: Design specifically for Laravel MVC with Livewire patterns
4. **Database Design**: Plan comprehensive database schema with relationships and migrations

## Full-Stack Design Integration

The **laravel-specialist** agent provides comprehensive full-stack design capabilities:

### Full-Stack Excellence Focus
- **Backend Architecture**: Service layers, repositories, and proper MVC separation
- **Frontend Integration**: Livewire components with real-time features and Alpine.js
- **Database Design**: Eloquent models, relationships, and optimized schema design
- **API Development**: RESTful APIs with proper authentication and resource transformation

### Enhanced Deliverables with Laravel Specifications
The laravel-specialist agent produces **6 output files** with mandatory full-stack values:
1. `backend-architecture.md` - Service layers, repositories, and business logic structure
2. `database-design.md` - Complete schema design with migrations and relationships
3. `livewire-components.md` - Interactive component architecture and real-time features
4. `api-design.md` - RESTful API endpoints with authentication and validation
5. `frontend-integration.md` - Blade templates, Tailwind styling, and JavaScript integration
6. `security-strategy.md` - Authentication, authorization, and security implementations

### Required Full-Stack Deliverables
Each design agent MUST provide:
- Database schema with proper indexing and relationships
- Service layer architecture with dependency injection
- Livewire component structure for interactive features
- API endpoint design with proper resource transformation
- Authentication and authorization strategy
- Performance optimization and caching strategies

Examples showing full-stack considerations:
- E-commerce Platform: Product catalog, shopping cart, payment integration, admin panel
- CRM System: Contact management, lead tracking, reporting dashboard, role-based access
- Content Management: Article publishing, media management, SEO optimization, multi-user
- Project Management: Task tracking, team collaboration, time tracking, resource allocation

## Workflow (Orchestrator-Managed Sequential then Parallel Coordination)

Following orchestrator-initialized workflow with structured full-stack project setup and validation:

### Phase 1: Orchestrator Initialization (Sequential - Project Setup)

**Agent**: `orchestrator`
**Output**: `.claude/outputs/design/projects/[project-name]/[timestamp]/`
**Purpose**:

- Analyze PRD and confirm full-stack application scope
- Generate consistent project name and timestamp
- Create initial MANIFEST.md with full-stack requirements baseline
- Note: Agent outputs go directly to shared `.claude/outputs/design/agents/` location

### Phase 2: Full-Stack UI Design Foundation (Sequential - Foundation Required)

**Agent**: `ui-designer`
**Output**: `.claude/outputs/design/agents/ui-designer/[project-name]-[timestamp]/` (pre-created)
**Purpose**: Read PRD, create web wireframes, admin interfaces, and user workflows

### Phase 3: Parallel Backend & Frontend Design

**Executed Simultaneously** after Phase 2 completion:

You **MUST** execute Phase 3A and Phase 3B in parallel using sub-agents.

#### Phase 3A: Laravel Backend Architecture Design

```bash
- laravel-specialist → backend architecture, database design, API endpoints (uses ui-designer output for full-stack context)
```

#### Phase 3B: Frontend Integration Design

```bash
- livewire-expert → Livewire components, real-time features, frontend integration (uses ui-designer output)
```

### Phase 4: Orchestrator Synthesis & Validation (Sequential - Requires All Inputs)

**Agent**: `orchestrator` (final validation)
**Output**: `.claude/outputs/design/projects/[project-name]/[timestamp]/`

**Purpose**: Synthesize all agent outputs into coherent Laravel full-stack implementation plan
**Input**: All agent outputs from Phases 2-3 + initial MANIFEST from Phase 1
**Validates**:

- ✓ All PRD requirements have corresponding full-stack design outputs
- ✓ Web wireframes cover all user stories and admin interfaces
- ✓ Backend architecture addresses all business logic requirements
- ✓ Database design supports all data relationships and performance needs
- ✓ Livewire components handle all interactive features
- ✓ API endpoints are properly designed for external integrations
- ✓ Authentication and authorization cover all security requirements
- ✓ Test specifications cover all Feature and Unit testing needs

**Output**:
- `MANIFEST.md` - Final registry linking all agent outputs with full-stack requirements traceability
- `IMPLEMENTATION_PLAN.md` - Single source of truth for Laravel implementation
**TodoWrite Integration**: Creates final task list with full-stack requirement coverage validation

## Output Structure

**Phase 1 (Orchestrator Initialization)**:

```
.claude/outputs/design/projects/[project-name]/[timestamp]/
└── MANIFEST.md                   # Initial full-stack requirements baseline and agent registry
```

**Phase 2 (Sequential - Full-Stack UI Foundation)**:

```
.claude/outputs/design/agents/
└── ui-designer/[project-name]-[timestamp]/
    ├── web-wireframes.md
    ├── admin-interfaces.md
    ├── user-workflows.md
    └── responsive-layouts.md
```

**Phase 3 (Parallel Execution)**:

```
.claude/outputs/design/agents/
├── laravel-specialist/[project-name]-[timestamp]/
│   ├── backend-architecture.md
│   ├── database-design.md
│   ├── api-design.md
│   ├── security-strategy.md
│   └── performance-optimization.md
├── livewire-expert/[project-name]-[timestamp]/
│   ├── livewire-components.md
│   ├── real-time-features.md
│   ├── frontend-integration.md
│   └── state-management.md
```

**Phase 4 (Sequential - Final Synthesis)**:

```
.claude/outputs/design/projects/[project-name]/[timestamp]/
├── MANIFEST.md                   # Complete registry of all agent outputs with full-stack requirements traceability
└── IMPLEMENTATION_PLAN.md        # Unified Laravel implementation plan
```

## Task Management & Orchestrator-Managed Execution

The command automatically:

- **Phase 1**: Orchestrator initialization with full-stack project setup and TodoWrite tracking
- **Phase 2**: Sequential web UI design with TodoWrite tracking
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
  # laravel-specialist task
</invoke>
<invoke name="Task">
  # livewire-expert task
</invoke>

# INCORRECT: Sequential Task calls (not parallel)
# Call laravel-specialist first, wait for completion, then call livewire-expert
```

### Execution Strategy

```bash
# Phase 1: Sequential (full-stack project initialization)
orchestrator → PRD analysis, full-stack project setup, folder creation, initial MANIFEST.md

# Phase 2: Sequential (Web UI foundation required)
ui-designer → web wireframes, admin interfaces, user workflows

# Phase 3: Parallel (spawn simultaneously, using ui-designer output)
# CRITICAL: Use TWO Task tool calls in SINGLE message for true parallelism
laravel-specialist (backend + database + API) + livewire-expert (frontend integration + real-time) (simultaneous Task calls)

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
- ✓ **ui-designer**: Web UI requirements & user story mapping (foundation)
- ✓ **laravel-specialist**: Backend architecture, database design & API endpoints (uses UI foundation)
- ✓ **livewire-expert**: Frontend integration & real-time features (uses UI foundation)
- ✓ **orchestrator**: Cross-agent validation & MANIFEST finalization (synthesis)

## Laravel Full-Stack Specific Design

The design is optimized for Laravel full-stack development:

- **MVC Architecture**: Proper separation of concerns with service layers
- **Database Design**: Eloquent models with optimized relationships and indexing
- **Livewire Integration**: Reactive components with real-time capabilities
- **API Development**: RESTful endpoints with proper resource transformation
- **Authentication**: Laravel Sanctum for API and web authentication
- **Testing**: Feature tests for workflows and Unit tests for business logic
- **Performance**: Query optimization, caching strategies, and job queues

## Success Criteria (Orchestrator-Managed Validation)

A complete full-stack design includes outputs from all phases:

- ✓ **Phase 1**: Full-stack project setup & initial MANIFEST (orchestrator initialization)
- ✓ **Phase 2**: Web wireframes & admin interfaces (ui-designer)
- ✓ **Phase 3A**: Backend architecture, database design & API endpoints (laravel-specialist)
- ✓ **Phase 3B**: Livewire components & frontend integration (livewire-expert)
- ✓ **Phase 4**: Complete MANIFEST + unified IMPLEMENTATION_PLAN (orchestrator synthesis)

**Efficiency Gains**: Orchestrator setup enables consistent full-stack project structure and UI foundation enables parallel backend and frontend work

## Integration with Implementation

Output feeds directly into:

- `/implement-fullstack-mvp` for TDD Laravel implementation
- Laravel project scaffolding with proper folder structure
- Database migration and model implementation guidance
- Livewire component and API endpoint implementation
- Full-stack testing and performance optimization