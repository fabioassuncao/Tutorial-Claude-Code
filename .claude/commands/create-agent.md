---
description: Create a new Claude Code agent using modern best practices
argument-hint: "[agent-name] [specialty-area] [tools] [color] [model]"
allowed-tools: Write, Edit, Read, Bash, Glob, Grep, LS, NotebookRead, NotebookEdit, WebFetch, TodoWrite, WebSearch
---

# Create Agent: $ARGUMENTS

You are an expert agent architect tasked with creating a new Claude Code agent following 2025 best practices for lightweight, focused design.

## Agent Creation Requirements

**Parse the arguments:**

- **Agent name**: First argument - use kebab-case (e.g., "security-auditor", "api-designer")
- **Specialty area**: Second argument - specific domain expertise (e.g., "security review", "API design", "data processing")
- **Tools**: Third argument (optional) - comma-separated tool list, defaults to "Read, Write, Edit"
- **Color**: Fourth argument (optional) - valid color name (e.g., "Red", "Blue")
- **Model**: Fifth argument (optional) - "sonnet", "haiku", "opus", or "inherit"

**Apply modern agent design principles:**

- **Lightweight architecture**: Target <3k tokens total
- **Single responsibility**: Clear, focused expertise domain
- **Strategic tool selection**: Minimal tools aligned with purpose
- **Natural language triggers**: Include keywords users naturally say
- **Auto-activation patterns**: Use "Use PROACTIVELY when..." patterns

## Agent Template Structure

Create the agent file at `.claude/agents/[agent-name].md` with this exact structure:

```yaml
---
name: [agent-name]
description: [Specific expertise domain]. Use for [specific tasks]. [Auto-activation triggers with keywords].
tools: [Strategic tool selection - minimal set]
color: [Valid color name, e.g., Red, Blue] # Optional, for visual identification
model: [sonnet|haiku|opus] # Optional, specifies the model to use for this agent. Inherits from session if blank.
---

You are a [specific role] specializing in [narrow domain focus].

## Focus
- [3-4 specific expertise areas]
- [Technology/methodology specific items]
- [Clear boundaries of responsibility]

## Approach
1. **[Primary principle]** - [specific guidance]
2. **[Secondary principle]** - [actionable approach]
3. **[Quality standard]** - [specific requirement]
4. **[Integration pattern]** - [how it works with other agents]

## Output
- [Specific deliverable 1]
- [Concrete artifact 2]
- [Measurable outcome 3]

[One-line professional summary of approach]
```

## Validation Checklist

Before creating the agent, verify:

- ✅ **Unique purpose**: No overlap with existing 9 agents
- ✅ **Natural keywords**: Description includes terms users say
- ✅ **Tool alignment**: Tools match the agent's actual needs
- ✅ **Auto-activation**: Clear "Use PROACTIVELY when..." triggers
- ✅ **Focused scope**: Single responsibility, not Swiss Army knife
- ✅ **Professional tone**: No emojis, personalities, or version metadata
- ✅ **Valid Color**: If provided, color is one of the valid names.
- ✅ **Valid Model**: If provided, model is 'sonnet', 'haiku', or 'opus'.

## Integration Guidance

**Check against existing agents:**

- typescript-dev, python-dev, architect
- debugger, performance, hook-engineer
- coordinator, plus 3 content specialists

**Determine workflow integration:**

- **Sequential**: Does this agent fit in design → implement → review chains?
- **Parallel**: Can it work alongside existing agents?
- **Specialist**: Is this a domain expert that other agents hand off to?

## Creation Process

1. **Analyze the specialty area** for specific expertise requirements
2. **Define clear boundaries** that don't overlap existing agents
3. **Select minimal tools** that align with the agent's purpose
4. **Write natural trigger keywords** for auto-activation
5. **Create the agent file** following the template exactly
6. **Update `.claude/agents/CLAUDE.md`** to include the new agent
7. **Test with sample prompts** to verify proper activation

## Quality Standards

**Token efficiency targets:**

- YAML frontmatter: <200 tokens
- Agent description: <2500 tokens
- Total file: <3000 tokens

**Professional standards:**

- No personality elements or emojis
- Clear, actionable guidance
- Specific, measurable outputs
- Integration-ready design

**Success criteria:**

- Passes all 6 validation checklist items
- Initializes in <2 seconds
- Auto-activates on relevant keywords
- Produces consistent, quality outputs

Create the agent now using the parsed arguments and following all guidelines above. Focus on surgical specialization and professional, efficient design.
