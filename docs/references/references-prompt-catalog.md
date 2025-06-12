# Prompt Catalog Reference

**Complete reference guide for all available prompts in the NextJS Cursor Prompts system.**

## 📋 **Quick Reference Index**

### **By Category**
- [Component Prompts](#-component-prompts) - React component creation and management
- [API Prompts](#-api-prompts) - Backend API development and integration
- [Test Prompts](#-test-prompts) - Testing strategies and implementation
- [Quality Prompts](#-quality-prompts) - Code review and quality assurance
- [Git Prompts](#-git-prompts) - Version control and collaboration
- [Documentation Prompts](#-documentation-prompts) - Technical documentation creation
- [Prompt Engineering](#-prompt-engineering) - Meta-prompts for prompt management

### **By Use Case**
- [Daily Development](#daily-development-prompts) - Common everyday tasks
- [Feature Development](#feature-development-prompts) - Complete feature workflows
- [Quality Assurance](#quality-assurance-prompts) - Review and validation
- [Team Collaboration](#team-collaboration-prompts) - Handoffs and communication
- [Maintenance](#maintenance-prompts) - Refactoring and updates

### **By Complexity**
- [Beginner](#beginner-prompts) - Simple, single-purpose prompts
- [Intermediate](#intermediate-prompts) - Multi-step workflows
- [Advanced](#advanced-prompts) - Complex orchestration and integration

---

## 🧩 **Component Prompts**

### **component-create-guide.mdc**
**Purpose**: Intelligent routing for component creation with automatic specialization  
**Best For**: Any React component when you're unsure which specific prompt to use  
**Usage Pattern**: `Create a [component description] using .cursor/prompts/component/component-create-guide.mdc`

**Example:**
```bash
"Create a user profile card component using .cursor/prompts/component/component-create-guide.mdc

Requirements: Display user avatar, name, role, and contact actions"
```

**Routes To**: Automatically selects appropriate specialized prompt based on component type  
**Output**: Complete TypeScript component with props interface, styling, and basic tests  
**Complexity**: ⭐⭐ Intermediate

---

### **component-create-ui.mdc**
**Purpose**: UI-focused components with emphasis on design and user experience  
**Best For**: Visual components, design system elements, interactive widgets  
**Usage Pattern**: Direct creation of polished UI components

**Example:**
```bash
"Create a loading spinner component using .cursor/prompts/component/component-create-ui.mdc

Requirements: Three size variants (sm, md, lg), customizable colors, smooth animations"
```

**Specializes In**: Visual design, animations, responsive behavior, accessibility  
**Output**: Styled component with variants, animations, and accessibility features  
**Complexity**: ⭐⭐⭐ Advanced

---

### **component-create-form.mdc**
**Purpose**: Form components with validation, error handling, and submission logic  
**Best For**: Contact forms, user input, data collection interfaces  
**Usage Pattern**: Forms requiring validation and state management

**Example:**
```bash
"Create a user registration form using .cursor/prompts/component/component-create-form.mdc

Fields: email, password, confirm password, terms acceptance"
```

**Specializes In**: Form validation, error states, submission handling, accessibility  
**Output**: Complete form with validation, error handling, and submission logic  
**Complexity**: ⭐⭐⭐ Advanced

---

### **component-create-navigation.mdc**
**Purpose**: Navigation components including menus, breadcrumbs, and routing  
**Best For**: Site navigation, menu systems, routing components  
**Usage Pattern**: Navigation and routing-related components

**Example:**
```bash
"Create a responsive navigation menu using .cursor/prompts/component/component-create-navigation.mdc

Requirements: Desktop horizontal menu, mobile hamburger, active state indicators"
```

**Specializes In**: Routing integration, responsive behavior, active states  
**Output**: Navigation component with routing, responsive design, and state management  
**Complexity**: ⭐⭐⭐ Advanced

---

### **component-create-card.mdc**
**Purpose**: Card-based layouts for content display and organization  
**Best For**: Product cards, content previews, dashboard widgets  
**Usage Pattern**: Content display in card format

**Example:**
```bash
"Create a product card component using .cursor/prompts/component/component-create-card.mdc

Content: product image, title, price, rating, add to cart button"
```

**Specializes In**: Content layout, hover effects, action buttons  
**Output**: Card component with content layout and interactive elements  
**Complexity**: ⭐⭐ Intermediate

---

### **component-create-marketing.mdc**
**Purpose**: Marketing and landing page components  
**Best For**: Hero sections, feature highlights, call-to-action components  
**Usage Pattern**: Marketing-focused components with conversion optimization

**Example:**
```bash
"Create a hero section using .cursor/prompts/component/component-create-marketing.mdc

Elements: headline, subtext, CTA button, background image, social proof"
```

**Specializes In**: Conversion optimization, visual impact, responsive design  
**Output**: Marketing component optimized for engagement and conversion  
**Complexity**: ⭐⭐⭐ Advanced

---

### **component-create-design.mdc**
**Purpose**: Design system components and reusable UI primitives  
**Best For**: Button systems, typography, color schemes, layout components  
**Usage Pattern**: Building design system foundations

**Example:**
```bash
"Create a button system using .cursor/prompts/component/component-create-design.mdc

Variants: primary, secondary, outline, ghost. Sizes: sm, md, lg, xl"
```

**Specializes In**: Design consistency, variant systems, theming  
**Output**: Design system component with comprehensive variant support  
**Complexity**: ⭐⭐⭐⭐ Expert

---

## 🔌 **API Prompts**

### **api-create-endpoints.mdc**
**Purpose**: RESTful API endpoints with validation, error handling, and documentation  
**Best For**: CRUD operations, data management APIs, business logic endpoints  
**Usage Pattern**: `Create [resource] API endpoints using .cursor/prompts/api/api-create-endpoints.mdc`

**Example:**
```bash
"Create user management API endpoints using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/database-safe.mdc - ensure safe database operations

Resources: users CRUD, user roles, user preferences"
```

**Output**: Complete API routes with validation, error handling, and tests  
**Complexity**: ⭐⭐⭐ Advanced

---

### **api-create-integration.mdc**
**Purpose**: Third-party API integrations and external service connections  
**Best For**: Payment processing, email services, external data sources  
**Usage Pattern**: Integrating with external APIs and services

**Example:**
```bash
"Create Stripe payment integration using .cursor/prompts/api/api-create-integration.mdc

Features: payment processing, webhook handling, subscription management"
```

**Output**: Integration layer with error handling, retry logic, and monitoring  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **api-create-database.mdc**
**Purpose**: Database schema design and data access layer creation  
**Best For**: Database migrations, ORM setup, data modeling  
**Usage Pattern**: Database-focused API development

**Example:**
```bash
"Create user database schema using .cursor/prompts/api/api-create-database.mdc
Apply .cursor/rules/database-safe.mdc - ensure data integrity

Tables: users, user_profiles, user_sessions, user_preferences"
```

**Output**: Database schema, migrations, and data access layer  
**Complexity**: ⭐⭐⭐⭐ Expert

---

## 🧪 **Test Prompts**

### **test-create-comprehensive.mdc**
**Purpose**: Complete test suite creation with multiple testing strategies  
**Best For**: Full feature testing, critical business logic, complex components  
**Usage Pattern**: `Create comprehensive tests for [feature] using .cursor/prompts/test/test-create-comprehensive.mdc`

**Example:**
```bash
"Create comprehensive tests for user authentication using .cursor/prompts/test/test-create-comprehensive.mdc
Apply .cursor/rules/test-driven.mdc - prioritize critical paths

Coverage: unit tests, integration tests, security tests, performance tests"
```

**Output**: Multi-layered test suite with high coverage and quality validation  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **test-create-component.mdc**
**Purpose**: React component testing with user interaction and accessibility  
**Best For**: UI components, user interactions, visual regression testing  
**Usage Pattern**: Component-specific testing strategies

**Example:**
```bash
"Create component tests for UserProfile using .cursor/prompts/test/test-create-component.mdc

Test scenarios: rendering, user interactions, accessibility, error states"
```

**Output**: Component tests with interaction testing and accessibility validation  
**Complexity**: ⭐⭐⭐ Advanced

---

### **test-create-api.mdc**
**Purpose**: API endpoint testing with validation and error scenarios  
**Best For**: REST APIs, GraphQL endpoints, integration testing  
**Usage Pattern**: API-focused testing strategies

**Example:**
```bash
"Create API tests for user endpoints using .cursor/prompts/test/test-create-api.mdc

Endpoints: GET /api/users, POST /api/users, PUT /api/users/[id], DELETE /api/users/[id]"
```

**Output**: API tests with request/response validation and error scenario coverage  
**Complexity**: ⭐⭐⭐ Advanced

---

## 🔍 **Quality Prompts**

### **quality-review-full.mdc**
**Purpose**: Comprehensive quality orchestration across all dimensions  
**Best For**: Pre-deployment reviews, major feature validation, quality gates  
**Usage Pattern**: `Review complete [feature] using .cursor/prompts/quality/quality-review-full.mdc`

**Example:**
```bash
"Review complete user management feature using .cursor/prompts/quality/quality-review-full.mdc

Scope: API endpoints, UI components, tests, documentation, security, performance"
```

**Output**: Multi-dimensional quality assessment with prioritized recommendations  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **quality-review-code.mdc**
**Purpose**: Code quality analysis focusing on maintainability and standards  
**Best For**: Code reviews, refactoring decisions, standards compliance  
**Usage Pattern**: Code-focused quality assessment

**Example:**
```bash
"Review code quality for authentication module using .cursor/prompts/quality/quality-review-code.mdc

Files: src/auth/*.ts, src/components/auth/*.tsx"
```

**Output**: Code quality analysis with specific improvement recommendations  
**Complexity**: ⭐⭐ Intermediate

---

### **quality-review-performance.mdc**
**Purpose**: Performance analysis and optimization recommendations  
**Best For**: Performance bottlenecks, optimization opportunities, scalability  
**Usage Pattern**: Performance-focused quality assessment

**Example:**
```bash
"Review performance for dashboard components using .cursor/prompts/quality/quality-review-performance.mdc

Focus: rendering performance, data fetching, memory usage"
```

**Output**: Performance analysis with optimization strategies and benchmarks  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **quality-review-security.mdc**
**Purpose**: Security vulnerability assessment and hardening recommendations  
**Best For**: Security audits, vulnerability assessment, compliance validation  
**Usage Pattern**: Security-focused quality assessment

**Example:**
```bash
"Review security for user authentication using .cursor/prompts/quality/quality-review-security.mdc

Scope: authentication flow, session management, data validation, access control"
```

**Output**: Security assessment with vulnerability identification and mitigation  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **quality-review-accessibility.mdc**
**Purpose**: Accessibility compliance and inclusive design validation  
**Best For**: WCAG compliance, screen reader compatibility, inclusive design  
**Usage Pattern**: Accessibility-focused quality assessment

**Example:**
```bash
"Review accessibility for user interface using .cursor/prompts/quality/quality-review-accessibility.mdc

Components: navigation, forms, modals, data tables"
```

**Output**: Accessibility audit with WCAG compliance recommendations  
**Complexity**: ⭐⭐⭐ Advanced

---

## 📝 **Git Prompts**

### **git-prep-commit.mdc**
**Purpose**: Prepare professional commits with conventional messages and documentation  
**Best For**: Daily commits, feature completion, code review preparation  
**Usage Pattern**: `Prepare my changes for commit using .cursor/prompts/git/git-prep-commit.mdc`

**Example:**
```bash
"Prepare my changes for commit using .cursor/prompts/git/git-prep-commit.mdc

Changes: Added user profile editing with validation and tests"
```

**Output**: Commit message, change summary, and documentation updates  
**Complexity**: ⭐ Beginner

---

### **git-prep-release.mdc**
**Purpose**: Prepare releases with changelogs, version bumps, and deployment notes  
**Best For**: Version releases, deployment preparation, changelog generation  
**Usage Pattern**: Release preparation and deployment

**Example:**
```bash
"Prepare v2.1.0 release using .cursor/prompts/git/git-prep-release.mdc

Changes: user management features, performance improvements, bug fixes"
```

**Output**: Release notes, version updates, and deployment checklist  
**Complexity**: ⭐⭐⭐ Advanced

---

## 📚 **Documentation Prompts**

### **documentation-create-full.mdc**
**Purpose**: Complete documentation suite creation for features or projects  
**Best For**: New features, API documentation, comprehensive guides  
**Usage Pattern**: `Document [feature] using .cursor/prompts/documentation/documentation-create-full.mdc`

**Example:**
```bash
"Document user management system using .cursor/prompts/documentation/documentation-create-full.mdc

Scope: API documentation, user guides, developer documentation, architecture decisions"
```

**Output**: Multi-document suite with user guides, API docs, and technical documentation  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **documentation-create-architecture.mdc**
**Purpose**: Architecture documentation with ADRs and system design  
**Best For**: System design, architectural decisions, technical planning  
**Usage Pattern**: Architecture-focused documentation

**Example:**
```bash
"Document authentication architecture using .cursor/prompts/documentation/documentation-create-architecture.mdc

System: OAuth integration, session management, role-based access control"
```

**Output**: Architecture documentation with ADRs, diagrams, and design rationale  
**Complexity**: ⭐⭐⭐⭐ Expert

---

### **documentation-create-api.mdc**
**Purpose**: API documentation with OpenAPI specifications and integration guides  
**Best For**: REST APIs, GraphQL schemas, integration documentation  
**Usage Pattern**: API-focused documentation

**Example:**
```bash
"Document user API endpoints using .cursor/prompts/documentation/documentation-create-api.mdc

Endpoints: user CRUD, authentication, preferences, activity history"
```

**Output**: OpenAPI specification, integration guides, and usage examples  
**Complexity**: ⭐⭐⭐ Advanced

---

## 🔧 **Prompt Engineering**

### **prompt-continue-thread.mdc**
**Purpose**: Thread management and context preservation for complex projects  
**Best For**: Complex features, long-running projects, team handoffs  
**Usage Pattern**: `Continue [project] using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc`

**Example:**
```bash
"Continue user dashboard development using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc

Current status: API complete, UI components 60% done, testing in progress"
```

**Output**: Context preservation template and continuation strategy  
**Complexity**: ⭐⭐⭐ Advanced

---

### **prompt-create.mdc**
**Purpose**: Create new prompts following established standards and patterns  
**Best For**: Custom workflow creation, team-specific prompts, specialized tasks  
**Usage Pattern**: Meta-prompt for prompt creation

**Example:**
```bash
"Create a prompt for database migration using .cursor/prompts/prompt-engineering/prompt-create.mdc

Purpose: Safe database schema migrations with rollback capabilities"
```

**Output**: New prompt following project standards and best practices  
**Complexity**: ⭐⭐⭐⭐ Expert

---

## 📊 **Usage Patterns by Scenario**

### **Daily Development Prompts**
```bash
# Morning workflow
git-prep-commit.mdc          # Review yesterday's work
component-create-guide.mdc   # Create new components
test-create-component.mdc    # Add tests for components
quality-review-code.mdc      # Review before commit

# Frequency: Daily
# Complexity: ⭐⭐ Intermediate
```

### **Feature Development Prompts**
```bash
# Complete feature workflow
documentation-create-architecture.mdc  # Plan architecture
api-create-endpoints.mdc               # Build API layer
component-create-guide.mdc             # Create UI components
test-create-comprehensive.mdc          # Full test suite
quality-review-full.mdc                # Complete quality review
documentation-create-full.mdc          # Document feature

# Frequency: Weekly
# Complexity: ⭐⭐⭐⭐ Expert
```

### **Quality Assurance Prompts**
```bash
# Quality gate workflow
quality-review-code.mdc         # Code quality
quality-review-performance.mdc  # Performance analysis
quality-review-security.mdc     # Security assessment
quality-review-accessibility.mdc # Accessibility audit
quality-review-full.mdc         # Orchestrated review

# Frequency: Before releases
# Complexity: ⭐⭐⭐⭐ Expert
```

### **Team Collaboration Prompts**
```bash
# Handoff and collaboration
prompt-continue-thread.mdc      # Context preservation
git-prep-commit.mdc            # Professional commits
documentation-create-full.mdc   # Knowledge transfer
quality-review-full.mdc        # Shared quality standards

# Frequency: During handoffs
# Complexity: ⭐⭐⭐ Advanced
```

## 🎯 **Prompt Selection Guide**

### **By Task Type**
```typescript
interface PromptSelection {
  // Component creation
  "ui-component": "component-create-ui.mdc";
  "form-component": "component-create-form.mdc";
  "navigation": "component-create-navigation.mdc";
  "general-component": "component-create-guide.mdc";
  
  // API development
  "crud-api": "api-create-endpoints.mdc";
  "external-integration": "api-create-integration.mdc";
  "database-design": "api-create-database.mdc";
  
  // Testing
  "comprehensive-testing": "test-create-comprehensive.mdc";
  "component-testing": "test-create-component.mdc";
  "api-testing": "test-create-api.mdc";
  
  // Quality assurance
  "full-review": "quality-review-full.mdc";
  "code-review": "quality-review-code.mdc";
  "performance-review": "quality-review-performance.mdc";
  "security-review": "quality-review-security.mdc";
  
  // Documentation
  "complete-docs": "documentation-create-full.mdc";
  "architecture-docs": "documentation-create-architecture.mdc";
  "api-docs": "documentation-create-api.mdc";
}
```

### **By Experience Level**
```bash
# Beginner (⭐)
git-prep-commit.mdc
quality-review-code.mdc
component-create-card.mdc

# Intermediate (⭐⭐)
component-create-guide.mdc
test-create-component.mdc
documentation-create-api.mdc

# Advanced (⭐⭐⭐)
component-create-form.mdc
api-create-endpoints.mdc
quality-review-full.mdc
prompt-continue-thread.mdc

# Expert (⭐⭐⭐⭐)
component-create-design.mdc
api-create-integration.mdc
test-create-comprehensive.mdc
documentation-create-full.mdc
prompt-create.mdc
```

## 🔄 **Cross-Reference Matrix**

### **Prompt Relationships**
```bash
# Sequential workflows
documentation-create-architecture.mdc → api-create-endpoints.mdc → component-create-guide.mdc

# Parallel workflows  
component-create-guide.mdc + test-create-component.mdc + quality-review-code.mdc

# Validation workflows
[any-creation-prompt] → quality-review-[domain].mdc → quality-review-full.mdc

# Documentation workflows
[feature-complete] → documentation-create-full.mdc → git-prep-release.mdc
```

### **Rule Integration**
```bash
# Safety rules
code-change-minimal.mdc: Use with existing codebase modifications
code-change-refactor.mdc: Use with systematic improvements
database-safe.mdc: Use with all database-related prompts
test-driven.mdc: Use with critical business logic
project-context.mdc: Use for team consistency
```

---

**🎯 This catalog provides comprehensive coverage of all available prompts. Use the quick reference sections to find the right prompt for your specific needs, and follow the complexity guidelines to match prompts with your experience level.**

**Next: Explore [Common Workflows](../examples/examples-workflows.md) for practical usage scenarios, or review [Troubleshooting Examples](../examples/examples-troubleshooting.md) for problem resolution patterns.** 