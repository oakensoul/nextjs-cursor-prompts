# Testing & Quality Assurance Prompts

**Comprehensive testing strategy and test creation prompts for robust software quality assurance**

## 📁 **Test Category Overview**

This folder contains specialized prompts for creating various types of tests and establishing comprehensive testing strategies. These prompts ensure high-quality test coverage across unit, integration, accessibility, and manual testing scenarios.

## 🎯 **Available Testing Prompts**

### **Test Creation Prompts**

#### **test-create-unit.mdc**
- **Purpose**: Create focused unit tests for individual components and functions
- **Scope**: Component testing, function testing, isolated unit behavior
- **Standards**: Jest, React Testing Library, test isolation, mocking best practices
- **Deliverables**: Comprehensive unit test suites with edge case coverage

#### **test-create-integration.mdc**
- **Purpose**: Create integration tests for component interactions and workflows
- **Scope**: Component integration, API integration, user workflow testing
- **Standards**: End-to-end scenarios, realistic data, cross-component validation
- **Deliverables**: Integration test suites covering critical user paths

#### **test-create-a11y.mdc**
- **Purpose**: Create accessibility tests ensuring WCAG compliance
- **Scope**: Screen reader testing, keyboard navigation, color contrast, ARIA compliance
- **Standards**: WCAG 2.1 AA, Section 508, automated and manual a11y testing
- **Deliverables**: Comprehensive accessibility test coverage with compliance validation

#### **test-create-comprehensive.mdc** ⭐
- **Purpose**: Orchestrate complete testing strategy across all test types
- **Scope**: Unit, integration, accessibility, performance, security testing coordination
- **Standards**: Complete test coverage, quality gates, CI/CD integration
- **Deliverables**: Full testing ecosystem with coordinated test execution

#### **test-create-manual.mdc**
- **Purpose**: Create manual testing scenarios and user acceptance tests
- **Scope**: User experience testing, exploratory testing, UAT scenarios
- **Standards**: User-centered testing, realistic scenarios, documentation standards
- **Deliverables**: Manual testing guides, UAT checklists, user experience validation

## 🎯 **Testing Strategy Patterns**

### **Comprehensive Testing Workflow** ⭐
```bash
# Complete testing ecosystem creation
Please follow .cursor/prompts/test/test-create-comprehensive.mdc
Create complete testing strategy for the user authentication system

# This will:
# 1. Analyze testing requirements across all dimensions
# 2. Create coordinated unit, integration, and accessibility tests
# 3. Establish quality gates and coverage requirements
# 4. Integrate with CI/CD pipeline for automated testing
```

### **Individual Test Type Creation**
```bash
# Create specific test types
Please follow .cursor/prompts/test/test-create-unit.mdc
Create unit tests for the PaymentForm component with validation edge cases

# Create integration tests
Please follow .cursor/prompts/test/test-create-integration.mdc
Create integration tests for the checkout workflow from cart to payment completion

# Create accessibility tests
Please follow .cursor/prompts/test/test-create-a11y.mdc
Create accessibility tests for the navigation menu with full keyboard support
```

### **Manual Testing Development**
```bash
# Create manual testing procedures
Please follow .cursor/prompts/test/test-create-manual.mdc
Create manual testing scenarios for the admin dashboard user management features
```

### **Testing Integration with Development**
```bash
# Component development with comprehensive testing
1. Create: .cursor/prompts/component/component-create-form.mdc
2. Test: .cursor/prompts/test/test-create-comprehensive.mdc
3. Quality: .cursor/prompts/quality/quality-review-code.mdc
4. Ship: .cursor/prompts/git/git-code-shipit.mdc
```

## 📊 **Testing Standards & Requirements**

### **Test Quality Requirements**
- **Coverage**: Minimum 90% code coverage for unit tests
- **Isolation**: Tests run independently without side effects
- **Repeatability**: Consistent results across multiple runs
- **Speed**: Fast execution for continuous integration
- **Clarity**: Self-documenting test names and clear assertions

### **Unit Testing Standards**
```typescript
// Test file structure
describe('ComponentName', () => {
  // Setup and teardown
  beforeEach(() => {
    // Test setup
  });

  // Happy path tests
  describe('when used correctly', () => {
    it('should render with default props', () => {
      // Test implementation
    });
  });

  // Edge cases
  describe('edge cases', () => {
    it('should handle empty data gracefully', () => {
      // Edge case testing
    });
  });

  // Error scenarios
  describe('error handling', () => {
    it('should display error message on failure', () => {
      // Error scenario testing
    });
  });
});
```

### **Integration Testing Standards**
- **Realistic Data**: Use production-like test data
- **End-to-End Flows**: Test complete user workflows
- **API Integration**: Mock external APIs with realistic responses
- **State Management**: Validate state changes across components
- **Performance**: Monitor performance impact during integration

### **Accessibility Testing Standards**
- **Automated Testing**: Use axe-core for automated accessibility testing
- **Keyboard Navigation**: Test all interactive elements with keyboard only
- **Screen Reader**: Validate screen reader compatibility
- **Color Contrast**: Ensure WCAG AA color contrast compliance
- **Focus Management**: Validate focus order and visibility

## 🔄 **Integration with Other Categories**

### **Component Testing Integration**
```bash
# Component creation with comprehensive testing
1. Create: .cursor/prompts/component/component-create-ui.mdc
2. Unit Test: .cursor/prompts/test/test-create-unit.mdc
3. A11y Test: .cursor/prompts/test/test-create-a11y.mdc
4. Integration Test: .cursor/prompts/test/test-create-integration.mdc
```

### **Quality Assurance Integration**
```bash
# Testing with quality review
1. Create Tests: .cursor/prompts/test/test-create-comprehensive.mdc
2. Code Review: .cursor/prompts/quality/quality-review-code.mdc
3. Full Review: .cursor/prompts/quality/quality-review-full.mdc
```

### **Documentation Integration**
```bash
# Testing documentation workflow
1. Create: .cursor/prompts/test/test-create-comprehensive.mdc
2. Document: .cursor/prompts/documentation/documentation-create-developer.mdc
3. Review: .cursor/prompts/quality/quality-review-documentation.mdc
```

## 🎯 **Testing Framework Integration**

### **Supported Testing Tools**
- **Jest**: Primary testing framework for unit and integration tests
- **React Testing Library**: Component testing with user-centric approach
- **axe-core**: Automated accessibility testing
- **Playwright**: End-to-end browser testing
- **Storybook**: Component testing and visual regression
- **Cypress**: Alternative E2E testing framework

### **CI/CD Integration**
```yaml
# Example GitHub Actions workflow
test:
  runs-on: ubuntu-latest
  steps:
    - name: Run Unit Tests
      run: npm run test:unit
    - name: Run Integration Tests
      run: npm run test:integration
    - name: Run A11y Tests
      run: npm run test:a11y
    - name: Coverage Report
      uses: codecov/codecov-action@v1
```

## 🎯 **Test Type Reference Guide**

### **When to Use Each Testing Prompt**

| Test Type | Purpose | Examples | Use Prompt |
|-----------|---------|----------|------------|
| **Unit Tests** | Test individual components/functions in isolation | Component rendering, function logic, edge cases | `test-create-unit.mdc` |
| **Integration Tests** | Test component interactions and workflows | User workflows, API integration, state changes | `test-create-integration.mdc` |
| **Accessibility Tests** | Ensure WCAG compliance and inclusive design | Screen reader support, keyboard navigation | `test-create-a11y.mdc` |
| **Manual Tests** | Human-centered testing and UAT | User experience, exploratory testing | `test-create-manual.mdc` |
| **Comprehensive** | Coordinated testing across all dimensions | Complete feature testing, release validation | `test-create-comprehensive.mdc` |

### **Testing Priority Matrix**

| Component Risk | Unit Tests | Integration Tests | A11y Tests | Manual Tests |
|----------------|------------|-------------------|------------|--------------|
| **Critical Path** | ✅ Required | ✅ Required | ✅ Required | ✅ Required |
| **High Traffic** | ✅ Required | ✅ Required | ✅ Required | ⚠️ Recommended |
| **Standard** | ✅ Required | ⚠️ Recommended | ✅ Required | ⚠️ As Needed |
| **Low Risk** | ✅ Required | ❌ Optional | ⚠️ Recommended | ❌ Optional |

## 🚀 **Advanced Testing Strategies**

### **Test-Driven Development (TDD)**
```bash
# TDD workflow with prompts
1. Create Tests: .cursor/prompts/test/test-create-unit.mdc (for failing tests)
2. Create Code: .cursor/prompts/component/component-create-[type].mdc
3. Refactor: .cursor/prompts/quality/quality-review-code.mdc
4. Repeat cycle with additional test coverage
```

### **Behavior-Driven Development (BDD)**
```bash
# BDD workflow with user scenarios
1. Manual Scenarios: .cursor/prompts/test/test-create-manual.mdc
2. Integration Tests: .cursor/prompts/test/test-create-integration.mdc
3. Unit Tests: .cursor/prompts/test/test-create-unit.mdc
4. Implementation: .cursor/prompts/component/component-create-[type].mdc
```

### **Risk-Based Testing**
```bash
# Focus testing on high-risk areas
Following .cursor/prompts/test/test-create-comprehensive.mdc:
- Identify critical user paths and business logic
- Prioritize testing effort based on risk assessment
- Create comprehensive coverage for high-risk components
- Apply lighter testing for low-risk areas
```

## 💡 **Testing Best Practices**

### **Test Development Lifecycle**
1. **Analysis**: Understand testing requirements and risk assessment
2. **Strategy**: Define testing approach and coverage goals
3. **Creation**: Implement tests following established patterns
4. **Execution**: Run tests and validate coverage
5. **Maintenance**: Update tests as code evolves
6. **Optimization**: Improve test performance and reliability

### **Test Organization Principles**
- **Arrange-Act-Assert**: Clear test structure for readability
- **Single Responsibility**: Each test validates one specific behavior
- **Independent Tests**: Tests don't depend on each other
- **Descriptive Names**: Test names clearly describe what they validate
- **Realistic Data**: Use production-like test data and scenarios

### **Quality Assurance Standards**
- **Code Coverage**: Maintain high coverage with meaningful tests
- **Performance Impact**: Monitor test execution time and resource usage
- **Reliability**: Eliminate flaky tests and intermittent failures
- **Maintainability**: Keep tests simple and easy to update
- **Documentation**: Document complex test scenarios and edge cases

### **Accessibility Testing Focus**
- **Keyboard Navigation**: All interactive elements accessible via keyboard
- **Screen Reader Support**: Proper ARIA labels and semantic markup
- **Color Independence**: Information not conveyed through color alone
- **Focus Management**: Clear focus indicators and logical tab order
- **Content Structure**: Proper heading hierarchy and landmark usage

---

**These testing prompts provide comprehensive coverage across all testing dimensions, ensuring robust software quality through systematic test creation and validation strategies.** 