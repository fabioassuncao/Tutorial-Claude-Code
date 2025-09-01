# Agent Collection & Workflow Guide

This document outlines the structure and usage patterns for the focused 7-agent team.

## Agent Categories: A Development Lifecycle Model

The 7 core agents are categorized into phases that mirror a typical product development lifecycle.

- **Strategy & Product Definition**: `prd-writer`
- **Architecture & Design**: `system-architect`, `ui-designer`
- **Implementation**: `python-backend-dev`, `react-typescript-specialist`
- **Testing & Quality Assurance**: `api-backend-tester`, `api-frontend-tester`

---

## Practical Workflows & Invocation

### 1. Direct Invocation (Specialist Tasks)

Use for focused tasks where you know which expert you need.

- **Write a PRD**: `prd-writer Create a comprehensive product requirements document for a new user authentication system.`
- **Create a UI Component**: `ui-designer Create a responsive, accessible <DataTable> component using React and Tailwind CSS based on this design spec.`
- **Write a Backend**: `python-backend-dev Write a FastAPI service to handle user authentication with JWT tokens and PostgreSQL storage.`
- **Build Frontend**: `react-typescript-specialist Build a React TypeScript component for user login with form validation and error handling.`
- **Design System**: `system-architect Design the overall architecture for a microservices-based e-commerce platform.`

### 2. Dynamic Delegation (Let Claude Choose)

Use for tasks where the required expertise is clear from the description, but you don't want to specify the agent manually.

- **Trigger**: Describe the task clearly. Claude's auto-selection will invoke the correct agent based on the keywords in its description.
- **Example**: `I need to create wireframes for a new dashboard layout.` → This will automatically trigger the `ui-designer` agent.

### 3. Sequential Workflow (Complex Projects)

For complex projects, use agents in sequence to build complete solutions.

- **Trigger**: You have a high-level, complex goal requiring multiple phases.
- **Example Flow**:
  1. `prd-writer` creates detailed requirements
  2. `system-architect` designs the system architecture
  3. `ui-designer` creates wireframes and design system
  4. `python-backend-dev` and `react-typescript-specialist` implement backend and frontend in parallel

---

## Agent Configuration Guidelines

### Valid Tools

Tools are categorized as follows:

- **Read-only tools**:
  - `Glob`
  - `Grep`
  - `LS`
  - `Read`
  - `NotebookRead`
  - `WebFetch`
  - `WebSearch`
- **Edit tools**:
  - `Edit`
  - `MultiEdit`
  - `Write`
  - `NotebookEdit`
  - `TodoWrite`
- **Execution tools**:
  - `Bash`

**Note:** If the `tools` field is omitted in an agent's frontmatter, it typically implies that the agent has access to all available tools.

### Valid Colors

Colors can be specified using one of the following names:

- `Red`
- `Blue`
- `Green`
- `Yellow`
- `Purple`
- `Orange`
- `Pink`
- `Cyan`

### Agent File Header Format

Each agent file must start with a YAML frontmatter block, enclosed by `---` lines. This block defines the agent's metadata and configuration.

```yaml
---
name: [agent-name] # Unique identifier for the agent (kebab-case)
description: Use this agent when [Concise explanation of when to use this agent and its capabilities]
tools: [Comma-separated list of valid tools, e.g., Read, Write, Bash] # Optional, defaults to all tools if omitted
color: [Valid color name, e.g., Red, Blue] # Optional, for visual identification
model: [sonnet|haiku|opus|inherit] # Optional, specifies the model to use for this agent. Inherits from session if blank.
---
```

### Guidelines for Descriptions

The `description` field in an agent's frontmatter is crucial for determining when the agent should be invoked.

- **Purpose**: Provide a clear and concise explanation of _when_ to use this agent and _what specific capabilities_ it provides.
- **Style**: Descriptions should be action-oriented, focusing on the tasks the agent is designed to handle.
- **Content**:
  - Clearly state the agent's primary function and expertise.
  - Explain the scenarios or types of requests that should trigger this agent's invocation. Descriptions should always start with "Use this agent when...".
  - **Highly Recommended**: Include examples of user prompts and the expected agent response/invocation. Use the following structured format for each example:
    ```
    <example>
    Context: [Brief context for the example]
    user: '[Example user prompt]'
    assistant: '[Expected assistant response or action, e.g., "I'll use the [agent-name] agent to..."]'
    <commentary>
    [Explanation of why this agent is appropriate for the given context/prompt]
    </commentary>
    </example>
    ```
- **Conciseness**: While providing sufficient detail, aim for brevity. The description should quickly convey the agent's purpose.

### Best Practices for Agent Prompts (Body Content)

The main body of the agent file defines its persona, expertise, and operational guidelines. A well-structured prompt ensures consistent and effective agent behavior.

- **Clear Persona Definition**: Start by clearly defining the agent's role and primary expertise (e.g., "You are an expert Quality Assurance Engineer...").
- **Hierarchical Structure**: Use clear, hierarchical headings (e.g., `## Core Responsibilities`, `### Technical Standards`) to organize the agent's knowledge and instructions.
- **Key Sections (Recommended)**:
  - `## Core Responsibilities`: Outline the agent's main duties and areas of focus.
  - `## Methodology` or `## Approach`: Describe the systematic process the agent follows.
  - `## Technical Standards` or `## Guidelines`: Detail specific coding standards, best practices, or quality criteria.
  - `## Output Standards` or `## Deliverables`: Specify the expected format and content of the agent's output.
  - `## Specialized Expertise` or `## Focus Areas`: Elaborate on niche skills or domains.
- **Prescriptive Language**: Use strong, action-oriented language (e.g., "Always...", "Must include...", "You excel at...") to guide the agent's behavior.
- **Clarity and Specificity**: Be as precise as possible about the agent's domain, what it does, and how it operates. Avoid ambiguity.
- **Templates and Examples**: Include markdown templates or code examples directly within the agent's body where relevant (e.g., for output formats, specific commands, or code structures).
- **Decision-Making Principles**: Outline the principles that guide the agent's choices and trade-offs.
- **Quality Assurance**: Describe how the agent ensures the quality of its work or verifies solutions.
