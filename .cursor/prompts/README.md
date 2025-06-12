# Cursor Prompts Collection

This folder contains shared Cursor/Claude prompts organized by category for easy discovery and management.

> **📚 Documentation & Standards:** For detailed documentation, contribution guidelines, and prompt creation standards, visit the main repository: [nextjs-cursor-prompts](https://github.com/oakensoul/nextjs-cursor-prompts)

## Folder Structure

The prompts are organized by functional categories for easy discovery and optimal workflow integration:

```
.cursor/prompts/
├── component/            # React component creation and enhancement
├── documentation/        # Documentation creation and maintenance  
├── git/                  # Git workflow, commits, and release management
├── prompt-engineering/   # Meta-prompting, thread management, and prompt optimization
├── quality/              # Cross-cutting quality reviews (code, security, API, accessibility)
└── test/                 # Testing strategy, creation, and coverage
```

## Naming Convention

All prompts follow the pattern: `[category]-[action]-[target].mdc`

- **category**: The domain/category (matches folder name)
- **action**: What the prompt does (create, review, audit, prep, etc.)
- **target**: The specific focus area (guide, security, minimal, etc.)

## Usage

### Referencing Prompts
Reference prompts using their full path:
```
Please follow the complete guidelines in .cursor/prompts/component/component-create-guide.mdc
```

### Combining with Rules
Apply cross-cutting rules alongside prompts:
```
[Task Description]
Please follow the complete guidelines in .cursor/prompts/component/component-create-guide.mdc

Apply .cursor/rules/code-change-minimal.mdc - preserve existing component patterns and utilities.
```

### Intelligent Prompt Routing
Many prompts include intelligent routing to specialized sub-prompts:
```
Please follow .cursor/prompts/component/component-create-guide.mdc
Create a user registration form

# The guide will analyze the request and route to component-create-form.mdc
# for specialized form creation patterns and best practices
```

## Categories Overview

### 🎨 **component/**
React component development, creation, and enhancement prompts with intelligent domain routing.
- Component creation with specialized prompts for forms, UI elements, layouts, cards, navigation, marketing, and icons
- Component enhancement and update prompts with backward compatibility
- Comprehensive testing integration and quality assurance

### 🧪 **test/**
Testing strategy, test creation, and coverage analysis prompts for comprehensive quality assurance.
- Unit testing with Jest and React Testing Library
- Integration testing for component interactions and workflows
- Accessibility testing with WCAG 2.1 AA compliance
- Manual testing scenarios and user acceptance testing
- Comprehensive testing orchestration across all test types

### 🎯 **quality/**
Cross-cutting quality assurance reviews for code, security, accessibility, API, and documentation assessment.
- Code quality reviews with refactoring recommendations
- Security vulnerability assessments and compliance
- Accessibility auditing with WCAG compliance
- API quality assessment and optimization
- Documentation quality and user experience reviews
- Full-spectrum quality orchestration with executive reporting

### 📝 **git/**
Git workflow, commit preparation, and release management prompts for professional development practices.
- Daily development workflow with conventional commits
- Branch creation and management with proper naming
- Conflict resolution and merge strategies
- Emergency hotfix procedures and deployment
- Release preparation and production deployment
- Quality gates and CI/CD integration

### 📚 **documentation/**
Documentation creation, maintenance, and standards prompts for comprehensive project documentation.
- API documentation with OpenAPI standards
- User guides and tutorials with accessibility focus
- Developer documentation and technical specifications
- Architecture documentation with C4 model and ADRs
- Deployment and operational documentation
- Complete documentation ecosystem orchestration

### 🎯 **prompt-engineering/**
Meta-prompting, thread management, context transfer, and prompt optimization prompts for AI collaboration.
- Prompt creation and optimization with structured methodology
- Thread continuation with context preservation
- Task extraction and complexity assessment
- Rule creation and workspace standards management
- Quality review and improvement processes
- Advanced prompt composition and routing strategies

## Adding New Prompts

### Creating New Prompts
1. Use `.cursor/prompts/prompt-engineering/prompt-create.mdc` for guidance
2. Follow the naming convention: `[category]-[action]-[target].mdc`
3. Include proper YAML frontmatter with metadata
4. Place in the appropriate category folder
5. Update the category README.md to include the new prompt

### Improving Existing Prompts
1. Use `.cursor/prompts/prompt-engineering/prompt-update.mdc` for enhancement
2. Apply quality review with `.cursor/prompts/prompt-engineering/prompt-review-quality.mdc`
3. Test improvements across different scenarios
4. Update version numbers and documentation

### Best Practices
- **Clear Objectives**: Define specific, measurable outcomes
- **Comprehensive Scope**: Include all necessary context and requirements
- **Quality Standards**: Specify deliverables and success criteria
- **Integration Patterns**: Show how to combine with other prompts
- **Usage Examples**: Provide concrete use cases and scenarios

## Category-Specific Guidelines

Each category folder contains its own README with detailed information about available prompts, usage patterns, and integration strategies:

- **[component/README.md](./component/README.md)** - React component development with intelligent domain routing
- **[test/README.md](./test/README.md)** - Comprehensive testing strategies and test creation
- **[quality/README.md](./quality/README.md)** - Quality assurance and cross-cutting reviews  
- **[git/README.md](./git/README.md)** - Git workflow and release management
- **[documentation/README.md](./documentation/README.md)** - Documentation creation and maintenance
- **[prompt-engineering/README.md](./prompt-engineering/README.md)** - Meta-prompting and thread management

## Integration Patterns

### Cross-Category Workflows
Many workflows benefit from combining prompts across categories:

```bash
# Complete feature development workflow
1. Branch: .cursor/prompts/git/git-branch-create.mdc
2. Create: .cursor/prompts/component/component-create-guide.mdc
3. Test: .cursor/prompts/test/test-create-comprehensive.mdc
4. Document: .cursor/prompts/documentation/documentation-create-developer.mdc
5. Review: .cursor/prompts/quality/quality-review-full.mdc
6. Ship: .cursor/prompts/git/git-code-shipit.mdc
```

### Thread Management
For complex projects, use thread management prompts to maintain context:

```bash
# When conversations become complex
.cursor/prompts/prompt-engineering/prompt-continue-thread.mdc
.cursor/prompts/prompt-engineering/prompt-thread-extract-todos.mdc
```

For detailed documentation and standards, refer to the [main repository](https://github.com/oakensoul/nextjs-cursor-prompts). 