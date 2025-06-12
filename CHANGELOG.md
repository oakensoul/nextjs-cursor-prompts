# Changelog

All notable changes to this NextJS Cursor Prompts repository will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Thread Management Infrastructure**
  - Thread continuation prompt (`prompt-continue-thread.mdc`) for seamless context transfer
  - Thread action item extraction prompt (`prompt-thread-extract-todos.mdc`) for automated todo organization
  - Thread management rule (`thread-management.mdc`) for proactive conversation monitoring
  - Comprehensive context preservation and transition workflows

- **Advanced Complexity Detection System**
  - Weighted complexity scoring algorithm with 5 base factors and interaction effects
  - Dynamic threshold adjustments based on conversation type (Technical/Research/Debug/Documentation/Review)
  - Context-aware complexity assessment with multiplicative bonuses for complex interactions
  - Objective complexity scoring replacing subjective complexity indicators
  - Automated decision matrix for thread transition recommendations
  - Real-world complexity assessment examples and practical implementation guide
  - Enhanced thread management capabilities for complex conversations

- **Documentation Reorganization**
  - Restructured documentation to `docs/standards/standards-[domain].md` pattern
  - Updated all cross-references for consistency
  - Improved documentation discoverability and maintainability

- Initial repository setup with comprehensive prompt collection
- Complete documentation framework
- Template files for components and API routes
- Usage examples and best practices

## [1.0.0] - 2024-12-07

### Added
- **Documentation Framework**
  - Prompt creation standards (`docs/standards/standards-prompt.md`)
- Coding standards for NextJS/TypeScript (`docs/standards/standards-coding.md`)
- Comprehensive testing standards (`docs/standards/standards-testing.md`)
- Architecture guidelines (`docs/standards/standards-architecture.md`)
- Git workflow standards (`docs/standards/standards-git.md`)

- **Prompt Collection**
  - Component creation guide (`component-create-guide.mdc`)
  - API endpoint creation (`api-create-endpoints.mdc`)
  - API security review (`api-review-security.mdc`)
  - Comprehensive testing (`test-create-comprehensive.mdc`)
  - Code quality review (`code-review-quality.mdc`)
  - Git commit preparation (`git-prep-commit.mdc`)
  - Git release preparation (`git-prep-release.mdc`)
  - Accessibility audit (`accessibility-audit.mdc`)
  - Documentation updates (`docs-update-standards.mdc`)
  - Maintenance refactoring (`maintenance-refactor.mdc`)

- **Templates**
  - React component template with TypeScript (`templates/component-template.tsx`)
  - Component test template with vitest (`templates/component-test-template.test.tsx`)
  - API route template with NextJS 15 (`templates/api-route-template.ts`)

- **Examples and Usage**
  - Comprehensive usage examples (`examples/usage-examples.md`)
  - Real-world scenarios and expected outcomes
  - Prompt combination strategies

- **Technology Stack Support**
  - NextJS 15 with App Router
  - TypeScript 5+
  - React 19+
  - TailwindCSS 4+
  - Vitest testing framework
  - Strapi CMS integration
  - Vercel deployment

### Documentation
- Repository README with quick start guide
- File naming conventions and folder structure
- Component organization strategy
- API design patterns
- Testing methodology (unit, integration, accessibility, e2e)
- Git workflow and commit conventions
- Security best practices
- Performance optimization guidelines

### Standards Established
- **Prompt Standards**: Consistent frontmatter, structure, and quality criteria
- **Coding Standards**: TypeScript patterns, React component architecture
- **Testing Standards**: vitest configuration, coverage targets, accessibility testing
- **Git Standards**: Conventional commits, branching strategy, release management
- **Architecture Standards**: NextJS patterns, data fetching, error handling

---

## Release Notes Template

### For Future Releases

#### Added
- New prompts
- New templates
- New documentation sections
- New standards or guidelines

#### Changed
- Updated existing prompts
- Modified standards
- Improved documentation
- Enhanced templates

#### Deprecated
- Prompts marked for removal
- Outdated practices
- Legacy templates

#### Removed
- Deleted prompts
- Removed outdated documentation
- Cleaned up deprecated practices

#### Fixed
- Corrected documentation errors
- Fixed template issues
- Resolved inconsistencies

#### Security
- Security-related improvements
- Updated security guidelines
- Fixed security vulnerabilities in templates 