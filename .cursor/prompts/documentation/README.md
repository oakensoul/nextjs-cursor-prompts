# Documentation Creation Prompts

**Specialized prompts for creating various types of project documentation with consistent quality and structure**

## 📁 **Documentation Category Overview**

This folder contains prompts specifically designed to create different types of documentation from scratch or improve existing documentation. Each prompt follows established documentation best practices and ensures consistency across all project documentation.

## 📝 **Available Documentation Creators**

### **documentation-create-api.mdc**
- **Purpose**: Generate comprehensive API documentation
- **Scope**: REST APIs, GraphQL, authentication, examples
- **Standards**: OpenAPI 3.0, JSON Schema, API design best practices
- **Deliverables**: API reference docs, integration guides, code examples

### **documentation-create-user-guide.mdc**
- **Purpose**: Create user-facing documentation and tutorials
- **Scope**: End-user guides, tutorials, FAQ, troubleshooting
- **Standards**: Plain language, task-oriented structure, accessibility
- **Deliverables**: User guides, tutorial sequences, help documentation

### **documentation-create-developer.mdc**
- **Purpose**: Generate developer-focused technical documentation
- **Scope**: Setup guides, architecture docs, coding standards, workflows
- **Standards**: Technical writing best practices, code examples, maintainability
- **Deliverables**: Developer guides, technical specs, contribution docs

### **documentation-create-architecture.mdc**
- **Purpose**: Create system architecture and design documentation
- **Scope**: System design, data flow, component relationships, decisions
- **Standards**: Architecture documentation patterns, C4 model, ADRs
- **Deliverables**: Architecture diagrams, design docs, decision records

### **documentation-create-deployment.mdc**
- **Purpose**: Generate deployment and operational documentation
- **Scope**: Installation, configuration, monitoring, troubleshooting
- **Standards**: Operations documentation best practices, runbooks
- **Deliverables**: Deployment guides, configuration docs, runbooks

### **documentation-create-full.mdc** ⭐
- **Purpose**: Orchestrate comprehensive documentation creation across all types
- **Scope**: Complete documentation ecosystem coordination and management
- **Standards**: All documentation best practices, integrated quality assurance
- **Deliverables**: Complete documentation suite, publishing strategy, success metrics

## 🎯 **Documentation Creation Patterns**

### **Single Document Creation**
```bash
# Create specific documentation type
Please follow .cursor/prompts/documentation/documentation-create-api.mdc
Generate comprehensive API documentation for the user authentication system
```

### **Complete Documentation Suite Creation** ⭐
```bash
# Create comprehensive documentation ecosystem
Please follow .cursor/prompts/documentation/documentation-create-full.mdc
Generate complete documentation suite with orchestrated creation, quality assurance, and publishing strategy
```

### **Individual Documentation Suite Creation**
```bash
# Create complete documentation set
Please follow these documentation prompts in sequence:
1. .cursor/prompts/documentation/documentation-create-architecture.mdc
2. .cursor/prompts/documentation/documentation-create-developer.mdc
3. .cursor/prompts/documentation/documentation-create-api.mdc
4. .cursor/prompts/documentation/documentation-create-user-guide.mdc

Create a cohesive documentation suite for new developers
```

### **Documentation Improvement**
```bash
# Enhance existing documentation
Following .cursor/prompts/documentation/documentation-create-user-guide.mdc:
- Review existing user documentation
- Identify gaps and improvement areas
- Create comprehensive user guide with tutorials
```

## 📊 **Documentation Standards**

### **Content Quality Requirements**
- **Accuracy**: All information technically correct and current
- **Completeness**: All necessary topics covered comprehensively
- **Clarity**: Written in clear, accessible language for target audience
- **Consistency**: Uniform style, tone, and structure throughout
- **Maintainability**: Easy to update and keep current

### **Structure Requirements**
- **Logical Organization**: Information organized in logical hierarchy
- **Progressive Disclosure**: Complex topics broken into digestible chunks
- **Cross-references**: Appropriate linking between related topics
- **Navigation**: Clear table of contents and search functionality
- **Examples**: Practical, working examples throughout

### **Accessibility Standards**
- **Plain Language**: Clear, jargon-free explanations
- **Visual Hierarchy**: Proper heading structure and formatting
- **Alternative Formats**: Multiple ways to access information
- **Inclusive Language**: Welcoming and inclusive tone
- **Multi-modal**: Text, diagrams, and examples combined

## 🔄 **Integration with Quality Reviews**

### **Documentation Quality Assurance**
```bash
# Create and validate documentation
1. Follow .cursor/prompts/documentation/documentation-create-api.mdc
2. Apply .cursor/prompts/quality/quality-review-documentation.mdc
3. Implement recommended improvements
```

### **Comprehensive Documentation Process** ⭐
```bash
# Full documentation lifecycle with orchestration
1. Orchestrate: .cursor/prompts/documentation/documentation-create-full.mdc
2. Quality Review: .cursor/prompts/quality/quality-review-documentation.mdc
3. Comprehensive Quality: .cursor/prompts/quality/quality-review-full.mdc
4. Improve: Implement all quality review recommendations
5. Maintain: Establish automated update processes and ownership
```

### **Individual Documentation Process**
```bash
# Single documentation type lifecycle
1. Create: .cursor/prompts/documentation/[specific-type].mdc
2. Review: .cursor/prompts/quality/quality-review-documentation.mdc
3. Improve: Implement quality review recommendations
4. Maintain: Establish update processes and ownership
```

## 🛠️ **Documentation Tooling Integration**

### **Supported Documentation Frameworks**
- **VitePress**: Modern static site generator for documentation
- **Docusaurus**: React-based documentation platform
- **GitBook**: Collaborative documentation platform
- **Markdown**: Universal markdown documentation
- **OpenAPI**: API specification and documentation

### **Automation Integration**
- **CI/CD Integration**: Automated documentation building and deployment
- **Link Checking**: Automated broken link detection
- **Content Validation**: Automated content freshness checking
- **Style Enforcement**: Automated style guide compliance

## 📈 **Documentation Metrics and Success**

### **Quality Metrics**
- **Completeness Score**: Percentage of required topics covered
- **Freshness Score**: How recently documentation was updated
- **User Satisfaction**: Feedback scores from documentation users
- **Usage Analytics**: Most accessed and least accessed content
- **Maintenance Burden**: Time spent updating documentation

### **Success Indicators**
- **Reduced Support Tickets**: Fewer questions about documented topics
- **Faster Onboarding**: Reduced time for new team members to contribute
- **Higher Adoption**: Increased usage of documented features/APIs
- **Better Code Quality**: Improved adherence to documented standards
- **Improved Developer Experience**: Higher developer satisfaction scores

---

**These documentation creation prompts ensure comprehensive, high-quality documentation that serves all stakeholders from end users to developers to system administrators.** 