# Quality Review Prompts

**Cross-cutting quality assurance prompts for comprehensive code, API, and security reviews**

## 📁 **Quality Category Overview**

This folder contains specialized review prompts that assess different aspects of application quality. These are cross-cutting concerns that apply across all application layers and components.

## 🎯 **Available Quality Reviews**

### **quality-review-accessibility.mdc**
- **Purpose**: WCAG compliance and accessibility audit
- **Scope**: UI components, navigation, content structure
- **Standards**: WCAG 2.1 AA, Section 508, ADA compliance
- **Deliverables**: Accessibility audit report, remediation plan

### **quality-review-api.mdc** 
- **Purpose**: API endpoint security, performance, and design review
- **Scope**: REST APIs, GraphQL, authentication, data validation
- **Standards**: OpenAPI, REST principles, API security best practices
- **Deliverables**: API quality assessment, security recommendations

### **quality-review-code.mdc**
- **Purpose**: Code quality, maintainability, and best practices audit
- **Scope**: Code structure, patterns, performance, readability
- **Standards**: TypeScript/JavaScript best practices, SOLID principles
- **Deliverables**: Code quality report, refactoring recommendations

### **quality-review-security.mdc**
- **Purpose**: Comprehensive security vulnerability assessment
- **Scope**: Authentication, authorization, data protection, infrastructure
- **Standards**: OWASP Top 10, NIST, GDPR, PCI DSS compliance
- **Deliverables**: Security assessment report, vulnerability remediation plan

### **quality-review-documentation.mdc**
- **Purpose**: Documentation quality, completeness, and user experience review
- **Scope**: Technical docs, API docs, user guides, developer documentation
- **Standards**: Documentation best practices, accessibility, maintainability
- **Deliverables**: Documentation audit report, improvement roadmap

### **quality-review-full.mdc**
- **Purpose**: Comprehensive quality orchestrator combining all review dimensions
- **Scope**: Code, security, accessibility, API, documentation (full-spectrum)
- **Standards**: All applicable standards across quality dimensions
- **Deliverables**: Executive summary, consolidated action plan, resource estimates

## 🔄 **Quality Review Usage Patterns**

### **Single Domain Review**
```bash
# Review specific aspect
Please follow .cursor/prompts/quality/quality-review-security.mdc
Focus on the user authentication system
```

### **Multi-Domain Review**
```bash
# Comprehensive quality audit
Please follow these quality reviews in sequence:
1. .cursor/prompts/quality/quality-review-code.mdc
2. .cursor/prompts/quality/quality-review-security.mdc  
3. .cursor/prompts/quality/quality-review-accessibility.mdc

Provide consolidated report with cross-cutting recommendations
```

### **Full-Spectrum Quality Assessment**
```bash
# Orchestrated comprehensive review
Please follow .cursor/prompts/quality/quality-review-full.mdc
- Execute all quality dimensions systematically
- Generate executive summary with business impact
- Create prioritized improvement roadmap
- Provide resource estimates and timeline
```

### **Documentation-Focused Review**
```bash
# Documentation quality assessment
Please follow .cursor/prompts/quality/quality-review-documentation.mdc
Focus on API documentation and developer onboarding experience
```

### **Integration with Development Workflow**
```bash
# Pre-release quality gate
Following .cursor/prompts/quality/quality-review-code.mdc and .cursor/prompts/quality/quality-review-security.mdc:
- Review all changes in the current PR
- Apply .cursor/rules/code-change-minimal.mdc
- Provide go/no-go recommendation for release
```

## 📊 **Quality Standards**

### **Review Criteria**
- **Completeness**: All applicable areas covered
- **Accuracy**: Findings based on established standards
- **Actionability**: Clear remediation steps provided
- **Prioritization**: Issues ranked by severity/impact
- **Measurability**: Specific metrics and targets included

### **Deliverable Requirements**
- **Executive Summary**: High-level findings and recommendations
- **Detailed Findings**: Specific issues with locations and context
- **Remediation Plan**: Prioritized action items with effort estimates
- **Compliance Assessment**: Alignment with relevant standards
- **Progress Tracking**: Metrics for measuring improvement

## 🎯 **Quality Integration with Rules**

### **Recommended Rule Combinations**
```bash
# For new feature development
Apply .cursor/rules/code-change-minimal.mdc
Follow .cursor/prompts/quality/quality-review-code.mdc

# For security-sensitive changes  
Apply .cursor/rules/code-change-minimal.mdc
Follow .cursor/prompts/quality/quality-review-security.mdc

# For refactoring projects
Apply .cursor/rules/code-change-refactor.mdc  
Follow .cursor/prompts/quality/quality-review-code.mdc
```

---

**These quality review prompts ensure consistent, comprehensive assessment of code quality, security, accessibility, and API design across all project components.** 