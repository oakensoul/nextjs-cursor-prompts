# NextJS Cursor Prompts Repository

A comprehensive collection of standardized prompts for NextJS/Strapi development workflows, designed to be copied into new projects for consistent development practices.

## Repository Purpose

This repository contains battle-tested prompts that enforce:
- **Coding Standards**: TypeScript, React, NextJS 15 App Router patterns
- **Testing Standards**: Vitest, accessibility testing, comprehensive coverage
- **Architecture Standards**: Component organization, API design, file structure
- **Quality Standards**: Code review, git workflow, documentation practices

## Quick Start

1. **Copy the entire `.cursor/prompts` folder** to your new project
2. **Review and customize** the standards documentation for project-specific needs
3. **Update** any project-specific references in the prompts

## Folder Structure

```
├── .cursor/prompts/           # Task-specific prompts organized by category
├── .cursor/rules/             # Cross-cutting rules and constraints
├── docs/                      # Standards documentation
├── templates/                 # Reusable code templates
└── examples/                  # Usage examples and samples
```

## Available Prompts

### 🎨 Component Development (`component/`)
- `component-create-guide.mdc` - Comprehensive component creation with testing

### 🔗 API Development (`api/`)
- `api-review-endpoints.mdc` - API endpoint review and security validation

### 🧪 Testing & Quality (`test/`)
- `test-create-comprehensive.mdc` - Unit, integration, and a11y test creation
- `test-create-manual.mdc` - Manual testing guide generation

### 📋 Code Quality (`code/`)
- `code-review-quality.mdc` - Code quality review and improvements

### 📝 Git & Release Management (`git/`)
- `git-prep-commit.mdc` - Pre-commit preparation and documentation

### ♿ Accessibility (`accessibility/`)
- `accessibility-audit.mdc` - WCAG compliance and accessibility auditing

### 🚀 Deployment (`deploy/`)
- `deploy-prep-production.mdc` - Production deployment readiness verification

## Available Rules

### 🔒 **Cross-Cutting Constraints (`rules/`)**
- `code-change-minimal.mdc` - Enforces minimal, surgical changes that preserve existing code

**Usage Pattern:**
```
[Task Description]
Please follow .cursor/prompts/[category]/[prompt].mdc
Apply .cursor/rules/[rule].mdc - [specific application notes]
```

## Technology Stack

This prompt collection is optimized for:
- **Framework**: NextJS 15 with App Router
- **Backend**: Strapi CMS integration
- **Language**: TypeScript
- **Testing**: Vitest + Testing Library + vitest-axe
- **Styling**: TailwindCSS
- **Deployment**: Vercel

## Documentation

See the `docs/` folder for detailed standards:
- [Prompt Creation Standards](docs/standards/standards-prompt.md)
- [Coding Standards](docs/standards/standards-coding.md)
- [Testing Standards](docs/standards/standards-testing.md)
- [Architecture Guidelines](docs/standards/standards-architecture.md)
- [Git Workflow](docs/standards/standards-git.md)

## Contributing

When adding new prompts:
1. Follow the [Prompt Creation Standards](docs/standards/standards-prompt.md)
2. Test prompts with real scenarios
3. Update this README with new prompt descriptions
4. Add examples to the `examples/` folder

## Version History

See [CHANGELOG.md](CHANGELOG.md) for version history and updates.