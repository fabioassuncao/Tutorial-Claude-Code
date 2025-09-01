# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a tutorial collection repository demonstrating Claude Code development workflows with specialized agents and TDD methodology. The repository contains comprehensive tutorials for web, mobile, and full-stack development using modern technologies.

## Architecture

### Tutorial Structure
- **TUTORIAL-NEXTJS-WEB.md**: Next.js 14 + TypeScript + Tailwind + shadcn/ui + Supabase web applications
- **TUTORIAL-LARAVEL-FULLSTACK.md**: Laravel 11.x + Livewire 3 + Alpine.js 3 + Filament 4 full-stack systems
- **TUTORIAL-FLUTTER-MOBILE.md**: Flutter 3.16+ + Dart 3.0+ + Provider/Riverpod mobile applications
- **TUTORIAL-GERAL.md**: Universal tutorial for any technology stack

### Claude Code Configuration
- **.claude/agents/**: 15 specialized agents for different development phases
- **.claude/commands/**: Custom commands for project design and implementation
- **.claude/output-styles/**: TDD-focused output style configuration
- **examples/**: PRD templates for each tutorial type

## Development Workflow

### Phase-Based Agent System
1. **Strategy**: `prd-writer` - Creates comprehensive PRDs
2. **Design**: `system-architect`, `ui-designer` - System and UI design
3. **Implementation**: Technology-specific specialists (`react-typescript-specialist`, `laravel-specialist`, `flutter-specialist`)
4. **Testing**: Platform-specific test experts (`web-test-expert`, `pest-expert`, `mobile-test-expert`)

### Standard Development Process
1. Configure technology-specific boilerplate
2. Execute `/init` for project recognition
3. Use `/output-style` → "Pragmatic Test Driven Developer"
4. Run `/design-[type]` with PRD for architecture
5. Implement using TDD cycles: RED → GREEN → VERIFY

### Key Commands
- `/init` - Analyzes project and generates CLAUDE.md
- `/dev:design-app` - Web application design (Next.js)
- `/dev:design-mobile` - Mobile application design (Flutter)
- `/dev:design-fullstack` - Full-stack system design (Laravel)
- `/dev:implement-mvp` - TDD implementation for web
- `/dev:implement-mobile-mvp` - TDD implementation for mobile

## TDD Methodology

This repository enforces strict Test-Driven Development with mandatory user verification at each cycle:

1. **RED**: Write failing test
2. **GREEN**: Implement minimal code to pass
3. **VERIFY**: User confirmation before proceeding

The "Pragmatic Test Driven Developer" output style ensures compliance with this methodology.

## Agent Specializations

### Core Technology Agents
- `react-typescript-specialist` - React/TypeScript web development
- `laravel-specialist` - Laravel PHP backend development
- `flutter-specialist` - Flutter mobile development
- `python-backend-dev` - Python API development

### Quality Assurance Agents
- `web-test-expert` - Playwright E2E testing
- `pest-expert` - Laravel PestPHP testing
- `mobile-test-expert` - Flutter widget testing
- `api-backend-tester`, `api-frontend-tester` - API testing specialists

### Design and Planning Agents
- `ui-designer` - Wireframes and visual design
- `shadcn-expert` - shadcn/ui component implementation
- `livewire-expert` - Laravel Livewire components

## Notes

- No package.json, composer.json, or other build files present - this is a documentation/tutorial repository
- All development happens in separate project directories using the tutorials as guides
- The `/init` command should be run in actual project directories after setting up boilerplates
- The `.claude/` directory provides the complete agent system for any new project