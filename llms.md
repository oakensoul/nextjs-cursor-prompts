# NextJS Cursor Prompts - LLM Developer Guide

## Overview

This repository represents a mature, production-ready **AI-assisted development framework** specifically designed for NextJS/TypeScript projects. It provides a comprehensive collection of standardized prompts, rules, and documentation that transforms how LLMs assist with modern web development.

### Core Philosophy
- **Standards-driven development** with comprehensive documentation
- **Intelligent prompt routing** to specialized domain experts
- **Quality-first approach** with built-in testing and accessibility
- **Context preservation** through advanced thread management
- **Minimal change methodology** to preserve existing codebases

## Architecture Overview

### Repository Structure
```
nextjs-cursor-prompts/
├── .cursor/                    # AI assistance infrastructure
│   ├── prompts/               # Task-specific prompts (57 prompts)
│   │   ├── component/         # React component development (15 prompts)
│   │   ├── documentation/     # Documentation creation and maintenance (12 prompts)
│   │   ├── git/               # Git workflow and release management (11 prompts)
│   │   ├── prompt-engineering/ # Meta-prompting and thread management (7 prompts)
│   │   ├── quality/           # Cross-cutting quality reviews (7 prompts)
│   │   └── test/              # Testing strategies and creation (5 prompts)
│   └── rules/                 # Cross-cutting constraints (5 core rules)
│       ├── code-change-minimal.mdc
│       ├── code-change-refactor.mdc
│       ├── test-driven.mdc
│       ├── database-safe.mdc
│       └── project-context.mdc
├── docs/standards/            # Comprehensive development standards
│   ├── standards-coding.md    # TypeScript/React patterns
│   ├── standards-testing.md   # Vitest testing strategies
│   ├── standards-architecture.md # System design principles
│   ├── standards-git.md       # Git workflow and conventions
│   ├── standards-logging.md   # Logging and monitoring
│   └── standards-prompt.md    # Prompt creation standards
├── examples/                  # Real-world usage examples
├── todo/                      # Project management and documentation
├── scripts/                   # Automation and maintenance tools
└── LICENSE                    # MIT License for open source usage
```

## Technology Stack and Standards

### Core Technologies
- **Framework**: Next.js 15 with App Router
- **Language**: TypeScript 5+
- **Runtime**: React 19+
- **Styling**: TailwindCSS 4+
- **Testing**: Vitest 3+ with comprehensive testing strategies
- **Backend Integration**: Strapi CMS
- **Deployment**: Vercel optimized

### Testing Framework
- **Unit Testing**: Vitest + @testing-library/react
- **Accessibility Testing**: vitest-axe + @axe-core/react
- **Integration Testing**: Multi-component workflows
- **E2E Testing**: Complete user journey validation
- **Coverage Target**: 80%+ with WCAG 2.1 AA compliance

## Prompt System Architecture

### Intelligent Routing System
The prompt system uses **intelligent domain routing** to automatically direct developers to specialized prompts:

#### Component Development (15 specialized prompts)
- **Forms**: `component-create-form.mdc` - Data collection and validation
- **UI Elements**: `component-create-ui.mdc` - Reusable interface components
- **Layouts**: `component-create-layout.mdc` - Page structure and organization
- **Cards**: `component-create-card.mdc` - Structured content display
- **Navigation**: `component-create-navigation.mdc` - Menu and navigation systems
- **Marketing**: `component-create-marketing.mdc` - Conversion-focused components
- **Icons**: `component-create-icon.mdc` - SVG-based visual elements

#### Quality Assurance
- **Code Quality**: Comprehensive refactoring and optimization
- **Security**: Vulnerability assessment and compliance
- **Accessibility**: WCAG 2.1 AA compliance validation
- **API Quality**: Endpoint optimization and security

#### Meta-Prompting Capabilities
- **Thread Continuation**: Context preservation across conversation boundaries
- **Context Management**: Automated conversation organization and management
- **Task Extraction**: Automated todo organization and prioritization
- **Prompt Creation**: Self-improving prompt development system

### Rules System
Five core rules provide cross-cutting constraints:

1. **code-change-minimal.mdc** - Surgical changes preserving existing architecture
2. **code-change-refactor.mdc** - Safe incremental refactoring guidelines
3. **test-driven.mdc** - Test-first development for critical business logic
4. **database-safe.mdc** - Safe database operations and migrations
5. **project-context.mdc** - Project-specific context and constraints

## Advanced Features

### Thread Management Infrastructure
- **Context Transfer**: Seamless handoff between conversation threads
- **Context Monitoring**: Conversation flow monitoring and optimization
- **State Preservation**: Comprehensive project state documentation
- **Action Item Extraction**: Automated todo organization and prioritization

### Quality Assurance Integration
- **Comprehensive Testing**: Unit, integration, accessibility, and E2E testing
- **Security First**: Built-in security review and vulnerability assessment
- **Accessibility Compliance**: WCAG 2.1 AA standards enforcement
- **Performance Optimization**: Built-in performance review and optimization

### Documentation Standards
- **Architecture Documentation**: C4 model and ADR standards
- **API Documentation**: OpenAPI standards with accessibility focus
- **Developer Documentation**: Comprehensive technical specifications
- **User Documentation**: Accessibility-focused user guides

## Usage Patterns

### Basic Usage
```bash
# Component creation with intelligent routing
"Create a user registration form"
# → Automatically routes to component-create-form.mdc

# Combined with rules for safety
"Please follow .cursor/prompts/component/component-create-form.mdc
Apply .cursor/rules/code-change-minimal.mdc - preserve existing auth patterns"
```

### Advanced Workflows
```bash
# Complete feature development
1. Branch: .cursor/prompts/git/git-branch-create.mdc
2. Create: .cursor/prompts/component/component-create-guide.mdc
3. Test: .cursor/prompts/test/test-create-comprehensive.mdc
4. Document: .cursor/prompts/documentation/documentation-create-developer.mdc
5. Review: .cursor/prompts/quality/quality-review-full.mdc
6. Ship: .cursor/prompts/git/git-code-shipit.mdc
```

### Thread Management
```bash
# For complex conversations
.cursor/prompts/prompt-engineering/prompt-continue-thread.mdc
.cursor/prompts/prompt-engineering/prompt-thread-extract-todos.mdc
```

## Prompt Quality Standards

### Structure Requirements
- **YAML Frontmatter**: Complete metadata and versioning
- **Clear Objectives**: Specific, measurable outcomes
- **Comprehensive Scope**: All necessary context and requirements
- **Quality Standards**: Explicit deliverables and success criteria
- **Integration Patterns**: Clear combination with other prompts

### Content Standards
- **Step-by-step workflows** with clear decision points
- **Code examples** and implementation patterns
- **Quality gates** and validation checkpoints
- **Error handling** and edge case coverage
- **Documentation requirements** and standards compliance

## Development Standards

### File Organization
```typescript
// Component structure with comprehensive testing
component-name/
├── ComponentName.tsx          # Main component (PascalCase)
├── __tests__/                 # Test directory
│   ├── ComponentName.test.tsx           # Unit tests
│   ├── ComponentName.a11y.test.tsx      # Accessibility tests
│   ├── ComponentName.integration.test.tsx # Integration tests
│   └── ComponentName.e2e.test.tsx       # End-to-end tests
└── README.md                  # Component documentation
```

### TypeScript Standards
- **Interface-first design** for object shapes
- **Explicit return types** for all functions
- **Comprehensive error handling** with Result patterns
- **Type-safe API integration** with proper validation

### Testing Standards
- **Unit Tests**: 80%+ coverage with comprehensive edge cases
- **Accessibility Tests**: WCAG 2.1 AA compliance validation
- **Integration Tests**: Multi-component workflows
- **E2E Tests**: Complete user journey validation

## Evolution and Versioning

### Recent Developments (v2.0.0+)
- **Advanced Context Management**: Enhanced conversation flow and organization
- **Thread Management Infrastructure**: Comprehensive context preservation
- **Documentation Reorganization**: Standardized `/docs/standards/` structure
- **Intelligent Domain Routing**: Automatic prompt specialization

### Continuous Improvement
- **Self-improving system** through meta-prompting
- **Quality review processes** for prompt optimization
- **Real-world validation** across multiple project types
- **Community-driven enhancement** through structured contribution

## Best Practices for LLM Integration

### Prompt Combination Strategies
1. **Start with specialized prompts** for domain-specific tasks
2. **Apply relevant rules** for cross-cutting constraints
3. **Use thread management** for complex multi-step workflows
4. **Validate quality** through built-in review processes

### Context Management
- **Preserve project context** through consistent rule application
- **Document decisions** and rationale for future reference
- **Maintain code quality** through minimal change methodology
- **Ensure accessibility** through comprehensive testing standards

### Quality Assurance Integration
- **Built-in testing requirements** for all code generation
- **Security review processes** for all API and data handling
- **Accessibility validation** for all UI components
- **Performance optimization** for all implementation

## Conclusion

This NextJS Cursor Prompts repository represents a mature approach to AI-assisted development, providing:

- **57 specialized prompts** covering complete development lifecycle
- **5 core rules** for consistent quality and safety
- **Comprehensive documentation standards** for enterprise-grade projects
- **Advanced thread management** for complex project workflows
- **Quality-first methodology** with built-in testing and accessibility
- **Self-improving system** through meta-prompting capabilities

The system is designed to scale from simple component creation to complex enterprise applications while maintaining consistent quality, security, and accessibility standards throughout the development process. 