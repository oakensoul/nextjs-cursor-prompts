# Usage Examples

This document provides real-world examples of how to use the prompts in this repository for various development scenarios.

## Component Development Examples

### Example 1: Creating a New Button Component
```
I need to create a new Button component with variants (primary, secondary, danger) and loading states.

Please follow the complete guidelines in .cursor/prompts/component/component-create-guide.mdc
```

**Expected Outcome:**
- Button component with proper TypeScript interfaces
- Variant handling with TailwindCSS classes
- Loading state implementation
- Accessibility attributes (ARIA labels, keyboard support)
- Comprehensive test suite (unit + accessibility)
- JSDoc documentation

### Example 2: Building a User Profile Card
```
Create a UserCard component that displays user information with avatar, name, email, and an optional edit button.

Please follow the complete guidelines in .cursor/prompts/component/component-create-guide.mdc
```

**Expected Outcome:**
- Responsive card layout
- Image optimization for avatars
- Conditional edit functionality
- WCAG-compliant color contrast
- Screen reader friendly structure

## API Development Examples

### Example 3: User Management Endpoints
```
Create a complete set of API endpoints for user management including CRUD operations, authentication, and role-based permissions.

Please follow the complete guidelines in .cursor/prompts/api/api-create-endpoints.mdc
```

**Expected Outcome:**
- RESTful endpoints (GET, POST, PUT, DELETE)
- Zod validation schemas
- JWT authentication middleware
- Role-based authorization
- Comprehensive error handling
- API documentation

### Example 4: Authentication API Review
```
Review the existing authentication API routes in /app/api/auth/ for security vulnerabilities and best practices compliance.

Please follow the complete guidelines in .cursor/prompts/api/api-review-security.mdc
```

**Expected Outcome:**
- Security vulnerability assessment
- Input validation improvements
- Rate limiting recommendations
- Error handling enhancements
- Test coverage analysis

## Testing Scenarios

### Example 5: Component Test Suite Creation
```
Create comprehensive test coverage for all components in /src/components/client/ui/ including unit tests, accessibility tests, and integration tests.

Please follow the complete guidelines in .cursor/prompts/test/test-create-comprehensive.mdc
```

**Expected Outcome:**
- Unit tests for each component
- Accessibility tests using vitest-axe
- Integration tests for component interactions
- Mock data and test utilities
- 80%+ code coverage

### Example 6: Form Validation Testing
```
Create thorough test coverage for the LoginForm component, focusing on validation logic, error states, and user interactions.

Please follow the complete guidelines in .cursor/prompts/test/test-create-comprehensive.mdc
```

**Expected Outcome:**
- Input validation testing
- Error message verification
- Success flow testing
- Accessibility compliance tests
- Edge case handling

## Code Quality Examples

### Example 7: Legacy Component Refactoring
```
Refactor the legacy UserDashboard component to use modern React patterns, improve performance, and enhance accessibility.

Please follow the complete guidelines in .cursor/prompts/code/code-review-quality.mdc
```

**Expected Outcome:**
- Modern React hooks implementation
- Performance optimizations
- Accessibility improvements
- TypeScript type safety
- Test coverage additions

### Example 8: Performance Optimization Review
```
Review the dashboard page components for performance bottlenecks and suggest optimizations for bundle size and runtime performance.

Please follow the complete guidelines in .cursor/prompts/code/code-review-quality.mdc
```

**Expected Outcome:**
- Bundle analysis
- Lazy loading recommendations
- Memoization strategies
- Database query optimizations
- Monitoring setup

## Git Workflow Examples

### Example 9: Feature Branch Preparation
```
I've completed the new user authentication feature with password reset functionality. Prepare this for commit and merge.

Please follow the complete guidelines in .cursor/prompts/git/git-prep-commit.mdc
```

**Expected Outcome:**
- Conventional commit messages
- Changelog updates
- Documentation updates
- Test verification
- Breaking change assessment

### Example 10: Release Preparation
```
Prepare version 2.1.0 release with the new dashboard features, API improvements, and security updates.

Please follow the complete guidelines in .cursor/prompts/git/git-prep-release.mdc
```

**Expected Outcome:**
- Version bump planning
- Release notes compilation
- Migration guide creation
- Deployment checklist
- Rollback plan

## Accessibility Examples

### Example 11: Navigation Accessibility Audit
```
Audit the main navigation components for WCAG 2.1 AA compliance and implement necessary improvements.

Please follow the complete guidelines in .cursor/prompts/accessibility/accessibility-audit.mdc
```

**Expected Outcome:**
- WCAG compliance assessment
- Keyboard navigation fixes
- Screen reader improvements
- Color contrast adjustments
- Focus management enhancements

### Example 12: Form Accessibility Review
```
Review all form components for accessibility compliance, focusing on label associations, error announcements, and keyboard navigation.

Please follow the complete guidelines in .cursor/prompts/accessibility/accessibility-audit.mdc
```

**Expected Outcome:**
- Label association verification
- Error message accessibility
- Keyboard flow optimization
- ARIA attribute implementation
- Screen reader testing

## Complex Workflow Examples

### Example 13: Full Feature Development
```
Create a complete project management feature including:
1. Project creation/editing components
2. API endpoints for CRUD operations
3. Comprehensive test coverage
4. Documentation updates

Start with: Please follow the complete guidelines in .cursor/prompts/component/component-create-guide.mdc

Then for API: Please follow the complete guidelines in .cursor/prompts/api/api-create-endpoints.mdc

Then for tests: Please follow the complete guidelines in .cursor/prompts/test/test-create-comprehensive.mdc

Finally: Please follow the complete guidelines in .cursor/prompts/git/git-prep-commit.mdc
```

### Example 14: Security Review and Hardening
```
Perform a comprehensive security review of the entire application including:
1. API endpoint security analysis
2. Component security assessment
3. Authentication flow review
4. Input validation verification

Please follow the complete guidelines in .cursor/prompts/api/api-review-security.mdc

Then: Please follow the complete guidelines in .cursor/prompts/code/code-review-quality.mdc

Focus on security aspects throughout.
```

## Maintenance Examples

### Example 15: Dependency Update Review
```
After updating React to v19 and NextJS to v15, review the entire codebase for compatibility issues and necessary updates.

Please follow the complete guidelines in .cursor/prompts/code/code-review-quality.mdc
```

### Example 16: Performance Monitoring Setup
```
Implement comprehensive performance monitoring for the production application including error tracking, performance metrics, and user experience monitoring.

Please follow the complete guidelines in .cursor/prompts/code/code-review-quality.mdc

Focus on monitoring and observability aspects.
```

## Rules + Prompts Examples

### Example 17: Creating Tests with Minimal Changes
```
Create comprehensive test coverage for /src/components/auth/ using .cursor/prompts/test/test-create-comprehensive.mdc

Apply .cursor/rules/code-change-minimal.mdc - preserve existing test structure, reuse existing test utilities, don't modify working auth components.
```

**Expected Outcome:**
- Comprehensive test coverage
- Existing test patterns preserved
- No modifications to working auth components
- Reuse of existing test utilities and mocks

### Example 18: Adding Component with Constraints
```
Create a new NotificationBanner component using .cursor/prompts/component/component-create-guide.mdc

Apply .cursor/rules/code-change-minimal.mdc - use existing design tokens and component patterns, don't modify existing notification system.
```

**Expected Outcome:**
- New component following established patterns
- Integration with existing design system
- No changes to existing notification components
- Consistent with current architecture

## Prompt Combination Strategies

### Sequential Prompting
Use multiple prompts in sequence for complex tasks:
1. Component creation first
2. Testing second
3. Documentation third
4. Git preparation last

### Focused Prompting
Use specific prompts for targeted improvements:
- Security-focused API review
- Performance-focused code review
- Accessibility-focused component audit

### Comprehensive Prompting
Use full workflow prompts for major features:
- Complete feature development
- Full release preparation
- Comprehensive security audit

## Tips for Effective Prompt Usage

1. **Be Specific**: Provide clear context about what you're working on
2. **Set Scope**: Define the boundaries of what should be reviewed/created
3. **Chain Prompts**: Use multiple prompts in logical sequence for complex tasks
4. **Customize Requirements**: Add specific project requirements to prompt requests
5. **Iterate**: Use prompts multiple times to refine and improve code quality 