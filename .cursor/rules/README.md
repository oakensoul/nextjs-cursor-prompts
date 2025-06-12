# Cursor Rules Collection

This folder contains shared cross-cutting rules and constraints that can be applied alongside any prompt to modify behavior and ensure consistent practices.

> **📚 Documentation & Standards:** For detailed documentation, contribution guidelines, and rule creation standards, visit the main repository: [nextjs-cursor-prompts](https://github.com/oakensoul/nextjs-cursor-prompts)

## Shared vs Project-Specific Rules

- **`/shared/`** - Rules copied from the main repository (updated via script)
- **`/project/`** - Project-specific rules tailored to your codebase and team practices
- **`/experimental/`** - Testing new rule ideas before adoption

## What Are Rules?

Rules are **constraints and methodologies** that apply across different types of development work. Unlike prompts that define what to do, rules define **how to do it** or **what not to do**.

## How to Use Rules

Apply rules alongside prompts using this pattern:

```
[Primary Task Description]

Please follow the complete guidelines in .cursor/prompts/[category]/[prompt-name].mdc

Apply the constraints in .cursor/rules/shared/[rule-name].mdc - [specific rule application notes]
```

## Available Rules

### 🔒 **code-change-minimal.mdc**
Enforces minimal, surgical changes that respect existing codebase architecture.

**When to use:**
- Adding features to existing systems
- Bug fixes in working code
- Incremental improvements
- Any task where preserving existing code is important

**Application examples:**
```
Create tests for the auth system using .cursor/prompts/test/test-create-comprehensive.mdc

Apply .cursor/rules/shared/code-change-minimal.mdc - preserve existing test structure and don't modify working auth components.
```

### 🔄 **code-change-refactor.mdc**
Guidelines for safe, incremental refactoring that improves code quality while maintaining functionality.

**When to use:**
- Improving existing code structure
- Adopting new patterns across the codebase
- Consolidating duplicate code
- Enhancing error handling or validation
- Upgrading to current project standards

**Application examples:**
```
Refactor the user components to use our new UserCard component using .cursor/prompts/component/component-refactor-guide.mdc

Apply .cursor/rules/shared/code-change-refactor.mdc - maintain existing user functionality while consolidating profile display logic.
```

### 🧪 **test-driven.mdc**
Enforces test-first development methodology for critical business logic and APIs.

**When to use:**
- Building critical business logic functions
- Creating API endpoints with complex validation
- Implementing algorithms or data processing utilities
- Any code that requires high confidence and clear specification

**Application examples:**
```
Implement order calculation with taxes and discounts using .cursor/prompts/api/api-create-endpoints.mdc

Apply .cursor/rules/shared/test-driven.mdc - write tests for basic calculation, tax rules, discount logic, and edge cases before implementing the calculation functions.
```

### 🗄️ **database-safe.mdc**
Enforces safe practices for database operations, schema changes, and data migrations.

**When to use:**
- Creating or modifying database schema
- Writing data migrations or cleanup operations
- Building database utilities or ORM interactions
- Any operation that could affect data integrity

**Application examples:**
```
Add user preferences table and migrate existing settings using .cursor/prompts/api/api-create-endpoints.mdc

Apply .cursor/rules/shared/database-safe.mdc - create reversible migration, test with production data volume, backup strategy, ensure foreign key constraints.
```

## Rule Categories

### **Code Safety Rules**
Rules that prevent breaking existing functionality or introducing risk.

### **Architecture Rules**
Rules that enforce consistent patterns and architectural decisions.

### **Quality Rules**
Rules that ensure code meets quality standards and best practices.

### **Performance Rules**
Rules that prevent performance regressions and ensure optimization.

## Creating New Rules

### Strategic Rule Creation

**Before creating any rule, use `.cursor/prompts/shared/prompt-engineering/rule-create.mdc`** for comprehensive guidance on strategic rule composition.

**Key principle:** Create **fewer, well-composed rules** rather than many small ones. Agents tend to ignore or inconsistently apply rules when there are too many.

### When to Create a Rule vs. Prompt

**Create a Rule when:**
- The guideline applies across multiple types of tasks
- It's a constraint or methodology rather than a specific task
- It modifies HOW to do something rather than WHAT to do
- It can be combined with different prompts
- **It can be composed with related constraints** into a single, cohesive rule

**Create a Prompt when:**
- It defines a specific task or deliverable
- It's domain-specific functionality
- It stands alone as a complete workflow

### Rule Structure

```yaml
---
title: Rule Name
description: Brief description of what the rule enforces
tags: [rule, category, constraints]
version: 1.0.0
lastUpdated: YYYY-MM-DD
usage: How to apply this rule alongside prompts
audience: [claude, ai-assistants]
scope: [areas, where, rule, applies]
---

# Rule Name

Brief description of the rule's purpose.

## 🚫 **FORBIDDEN ACTIONS:**
- List of things not to do

## ✅ **REQUIRED ACTIONS:**
- List of things that must be done

## 📋 **PROCESS:**
- Steps to follow when applying this rule

## 🎯 **SCOPE:**
- What the rule applies to
- What it doesn't apply to

## 💡 **APPLICATION EXAMPLES:**
- How to combine with different prompts

## 🔧 **OVERRIDE PROTOCOL:**
- When and how to request exceptions
```

## Rule Application Best Practices

### **1. Combine Thoughtfully**
```
✅ Good: Apply rules that work together
❌ Bad: Apply conflicting rules simultaneously
```

### **2. Be Specific**
```
✅ Good: "Apply shared/code-change-minimal.mdc - preserve existing auth patterns"
❌ Bad: "Apply shared/code-change-minimal.mdc"
```

### **3. Explain Context**
```
✅ Good: "Apply shared/security-first.mdc - this handles sensitive user data"
❌ Bad: "Apply shared/security-first.mdc"
```

### **4. Stack Rules When Appropriate**
```
Create API endpoints using .cursor/prompts/api/api-create-endpoints.mdc

Apply .cursor/rules/shared/code-change-minimal.mdc - preserve existing auth patterns
Apply .cursor/rules/shared/security-first.mdc - this handles user authentication data
```

## Updating Shared Content

To get the latest shared rules:
```bash
./scripts/update-shared-prompts.sh
```

This script will:
- Download the latest rules from the main repository
- Show you what has changed before updating
- Set up the complete directory structure if missing

## Creating Project-Specific Rules

### Project Rules (`/project/`)
Add rules specific to your codebase and team practices:
1. Create rules in `.cursor/rules/project/`
2. Use `.cursor/prompts/shared/prompt-engineering/rule-create.mdc` for strategic guidance
3. Use `.cursor/prompts/shared/prompt-engineering/rule-update.mdc` when updating existing rules
4. Follow the [rule structure guidelines](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/docs/standards/standards-rule.md)
5. Focus on project-specific constraints and methodologies
6. **Remember:** Compose larger, cohesive rules rather than many small ones

### Experimental Rules (`/experimental/`)
Test new rule ideas before adoption:
1. Create experimental rules in `.cursor/rules/experimental/`
2. Use `.cursor/prompts/shared/prompt-engineering/rule-create.mdc` for strategic guidance
3. Use `.cursor/prompts/shared/prompt-engineering/rule-update.mdc` when refining experimental rules
4. Apply them to specific features or components
5. Evaluate their effectiveness
6. Graduate successful rules to `/project/` or contribute back

## Contributing Back

If you create a useful rule that could benefit other projects:
1. **Generalize it** - Remove project-specific details
2. **Test across contexts** - Ensure it works for different types of projects
3. **Follow contribution guidelines** - See the [main repository](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/CONTRIBUTING.md)
4. **Submit a pull request** - Help the community benefit from your insights

## Additional Resources

- **Latest Documentation:** [Main Repository](https://github.com/oakensoul/nextjs-cursor-prompts)
- **Rule Creation Standards:** [Standards Guide](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/docs/standards/standards-rule.md)
- **Contribution Guidelines:** [Contributing Guide](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/CONTRIBUTING.md)

This rules system creates a flexible, composable approach to enforcing development standards across different types of work. 