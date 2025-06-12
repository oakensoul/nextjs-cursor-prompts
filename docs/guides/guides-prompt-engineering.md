# Prompt Engineering Guide

This guide provides practical approaches to creating and refining effective cursor prompts for development workflows.

## 🎯 **Prompt Engineering Philosophy**

### **Effective Prompts Are:**
- **Specific**: Clear requirements with measurable outcomes
- **Contextual**: Include relevant project and technology context
- **Actionable**: Every instruction can be immediately executed
- **Complete**: No missing steps or undefined dependencies
- **Testable**: Success criteria that can be validated

### **Common Anti-Patterns:**
- **Vague Instructions**: "Make it better" or "optimize performance"
- **Missing Context**: Assuming AI knows your project specifics
- **Over-Complexity**: Trying to solve everything in one prompt
- **Under-Specification**: Leaving critical decisions to assumptions

## 🔧 **Prompt Development Workflow**

### **1. Define the Problem**
```markdown
**Problem Statement**: [What specific issue needs solving?]
**Current State**: [What exists now?]
**Desired State**: [What should exist after?]
**Constraints**: [Technical/business limitations]
**Success Criteria**: [How will you know it worked?]
```

### **2. Structure the Solution**
```markdown
**Pre-conditions**: [What must be true before starting?]
**Dependencies**: [What tools/files/context needed?]
**Process Steps**: [Logical sequence of actions]
**Quality Gates**: [Validation points throughout]
**Deliverables**: [Specific outputs expected]
```

### **3. Iterate and Refine**
- **Test with Real Scenarios**: Use actual project contexts
- **Gather Feedback**: What worked? What was unclear?
- **Measure Effectiveness**: Did it produce expected results?
- **Refine Incrementally**: Small improvements over time

## 📋 **Prompt Templates by Use Case**

### **Code Creation Prompts**
```markdown
# [Component/Feature] Creation

**Context**: [Technology stack, existing patterns, constraints]
**Requirements**: 
- Functional requirements: [What it must do]
- Non-functional requirements: [Performance, security, accessibility]
- Integration requirements: [How it connects to existing code]

**Implementation Approach**:
1. [Planning step]
2. [Implementation step]
3. [Testing step]
4. [Documentation step]

**Quality Checklist**:
- [ ] Follows project coding standards
- [ ] Includes comprehensive testing
- [ ] Handles error cases appropriately
- [ ] Documentation updated
```

### **Code Review Prompts**
```markdown
# [Domain] Code Review

**Review Scope**: [What files/components to review]
**Review Criteria**:
- Code quality and maintainability
- Performance considerations
- Security implications
- Testing coverage
- Documentation completeness

**Review Process**:
1. Analyze code structure and patterns
2. Identify potential issues and improvements
3. Validate against project standards
4. Provide actionable recommendations

**Output Format**:
- Summary of findings
- Categorized recommendations (critical/important/nice-to-have)
- Specific code examples and suggestions
```

### **Debugging/Analysis Prompts**
```markdown
# [Issue Type] Investigation

**Problem Description**: [What's going wrong?]
**Environment Context**: [Technology stack, deployment details]
**Reproduction Steps**: [How to recreate the issue]
**Expected vs Actual**: [What should happen vs what does happen]

**Investigation Approach**:
1. Analyze error messages and logs
2. Review related code and configurations
3. Identify potential root causes
4. Propose and test solutions
5. Implement preventive measures

**Resolution Requirements**:
- Fix the immediate issue
- Prevent recurrence
- Update documentation/tests as needed
```

## 🚀 **Advanced Techniques**

### **Prompt Chaining**
For complex workflows, break into multiple focused prompts:

1. **Analysis Prompt**: Understand the problem space
2. **Design Prompt**: Create the solution architecture
3. **Implementation Prompt**: Build the solution
4. **Testing Prompt**: Validate the implementation
5. **Documentation Prompt**: Complete the deliverable

### **Context Injection**
Provide rich context for better results:

```markdown
**Project Context**:
- Tech stack: [Specific versions and tools]
- Architecture patterns: [How code is organized]
- Coding conventions: [Team-specific standards]
- Existing components: [What's already available]

**Current Session Context**:
- Files modified: [What's been changed recently]
- Active tasks: [What we're working on]
- Immediate goals: [Next steps to accomplish]
```

### **Iterative Refinement**
Start broad, then narrow focus:

```markdown
**Phase 1**: High-level analysis and approach
**Phase 2**: Detailed implementation planning
**Phase 3**: Specific code implementation
**Phase 4**: Testing and validation
**Phase 5**: Documentation and cleanup
```

## 📊 **Measuring Prompt Effectiveness**

### **Quality Metrics**
- **Completion Rate**: How often does the prompt produce the desired outcome?
- **First-Try Success**: Does it work correctly on the first attempt?
- **Context Retention**: Does it maintain awareness of project specifics?
- **Standard Compliance**: Does output follow established patterns?

### **Efficiency Metrics**
- **Time to Completion**: How long does the task take?
- **Iteration Count**: How many refinements are needed?
- **Tool Usage**: How efficiently are available tools used?
- **Context Switching**: How much back-and-forth is required?

### **Improvement Indicators**
- Reduced need for clarification questions
- Consistent output quality across different users
- Fewer manual corrections needed
- Better integration with existing workflows

## 🔄 **Continuous Improvement**

### **Regular Review Process**
- **Monthly Prompt Audit**: Review usage patterns and effectiveness
- **Feedback Collection**: Gather user experiences and pain points
- **Standards Updates**: Align prompts with evolving project standards
- **Tool Integration**: Leverage new cursor capabilities as they become available

### **Version Management**
- Track prompt changes with semantic versioning
- Document breaking changes and migration paths
- Maintain backward compatibility when possible
- Archive deprecated prompts with replacement guidance

---

**This guide should be used alongside the [Prompt Creation Standards](../standards/standards-prompt.md) to create consistent, effective development workflows.** 