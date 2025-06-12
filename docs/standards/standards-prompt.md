# Prompt Creation Standards

This document defines the standards for creating new prompts in this repository to ensure consistency, quality, and effectiveness.

## Naming Convention

Follow the pattern: `[domain]-[action]-[target].mdc`

### Examples:
- `component-create-guide.mdc`
- `api-review-security.mdc`
- `test-create-comprehensive.mdc`
- `git-prep-commit.mdc`

### Domain Categories:
- `component` - React component development
- `api` - API route development
- `test` - Testing and quality assurance
- `git` - Git workflow and version control
- `docs` - Documentation management
- `code` - Code quality and refactoring
- `deploy` - Deployment and DevOps
- `seo` - SEO and performance optimization
- `security` - Security audits and improvements
- `data` - Database and data management

### Action Verbs:
- `create` - Building new functionality
- `review` - Auditing existing code
- `refactor` - Improving existing code
- `prep` - Preparation tasks
- `audit` - Comprehensive analysis
- `optimize` - Performance improvements
- `fix` - Bug fixes and corrections
- `update` - Updating existing functionality

### Target Specifications:
- `guide` - Comprehensive instructions
- `security` - Security-focused tasks
- `accessibility` - A11y compliance
- `performance` - Speed/efficiency focused
- `comprehensive` - Full-scope coverage
- `minimal` - Small, focused changes

## File Structure

### Frontmatter (Required)
Every prompt must include YAML frontmatter:

```yaml
---
title: Human-Readable Title
description: Brief explanation of prompt purpose and scope
tags: [domain, action, technology, scope]
version: 1.0.0
lastUpdated: YYYY-MM-DD
usage: When and how to use this prompt
audience: [claude, ai-assistants]
scope: [specific, areas, covered]
---
```

### Content Structure

1. **Title Section**
   - Clear H1 title matching frontmatter
   - Brief introductory paragraph

2. **Objective Statement**
   - What will be accomplished
   - Expected outcomes

3. **Requirements Sections**
   - Organized by logical groupings
   - Numbered subsections for clarity
   - Specific, actionable items

4. **Standards Compliance**
   - Reference to relevant standards documents
   - Specific requirements for this domain

5. **Deliverables Checklist**
   - Checkbox list of expected outputs
   - Clear success criteria

6. **Usage Examples**
   - 2-3 concrete usage examples
   - Show how to invoke the prompt

## Content Guidelines

### Language and Tone
- **Imperative voice**: Use direct commands ("Create", "Implement", "Ensure")
- **Specific requirements**: Avoid vague terms like "good" or "appropriate"
- **Technical precision**: Use exact technical terms and specifications
- **Actionable items**: Every requirement should be something you can do

### Structure Best Practices
- **Logical progression**: Build from planning to implementation to testing
- **Chunked information**: Use subsections to break up complex topics
- **Clear hierarchies**: Use consistent heading levels (H2, H3, H4)
- **Visual separation**: Use code blocks, lists, and spacing effectively

### Technical Requirements
- **Specific technologies**: Reference exact versions and tools
- **File paths**: Use consistent path conventions
- **Code examples**: Include realistic code snippets
- **Command examples**: Show exact commands with flags

## Quality Standards

### Completeness Criteria
- [ ] Covers all aspects of the domain/action
- [ ] Includes error handling guidance
- [ ] Addresses edge cases and considerations
- [ ] Provides clear success criteria
- [ ] Includes testing requirements

### Clarity Requirements
- [ ] No ambiguous language or requirements
- [ ] Technical terms are used consistently
- [ ] Examples clarify complex concepts
- [ ] Decision points are clearly marked
- [ ] Dependencies are explicitly stated

### Maintainability Features
- [ ] Version tracking in frontmatter
- [ ] Clear update procedures
- [ ] Modular sections that can be updated independently
- [ ] References to standards documents
- [ ] Change history considerations

## Integration Requirements

### Standards Alignment
Every prompt must align with:
- [Coding Standards](coding-standards.md)
- [Testing Standards](testing-standards.md)
- [Architecture Guidelines](architecture-standards.md)
- [Git Workflow](git-standards.md)

### Cross-Reference Requirements
- Reference other prompts when workflows connect
- Link to relevant documentation
- Specify when to use multiple prompts in sequence
- Avoid duplicating content from other prompts

## Testing and Validation

### Before Publishing
1. **Test with real scenarios**: Use the prompt for actual development tasks
2. **Validate outputs**: Ensure prompt produces expected results
3. **Check completeness**: Verify all requirements are covered
4. **Review examples**: Ensure examples are realistic and helpful

### Quality Checklist
- [ ] Frontmatter is complete and accurate
- [ ] All sections follow the structure guidelines
- [ ] Language is clear and actionable
- [ ] Technical requirements are specific
- [ ] Examples demonstrate real usage
- [ ] Deliverables are well-defined
- [ ] Standards alignment is verified

## Version Management

### Version Numbering
- **Major (X.0.0)**: Breaking changes to prompt structure or requirements
- **Minor (1.X.0)**: New sections or significant content additions
- **Patch (1.0.X)**: Bug fixes, clarifications, minor improvements

### Update Procedures
1. Update version number in frontmatter
2. Update `lastUpdated` date
3. Document significant changes in commit message
4. Update related documentation if needed
5. Test prompt with updated requirements

### Deprecation Process
1. Mark prompt as deprecated in frontmatter
2. Add deprecation notice to content
3. Provide migration path to new prompt
4. Maintain for at least one major version
5. Remove after migration period

## Examples and Templates

### Minimal Prompt Template
```markdown
---
title: [Domain] [Action] [Target]
description: [Brief purpose statement]
tags: [domain, action, target, technology]
version: 1.0.0
lastUpdated: YYYY-MM-DD
usage: Use when [specific scenario]
audience: [claude, ai-assistants]
scope: [areas, covered]
---

# [Title]

[Brief introduction and purpose]

## Requirements

### 1. [Main Category]
- [Specific requirement]
- [Another requirement]

### 2. [Second Category]
- [Requirement with context]

## Standards Compliance
- Follow [relevant standards document]
- Use [specific tools/technologies]

## Deliverables

- [ ] [Expected output 1]
- [ ] [Expected output 2]

## Usage Examples

```
[Example usage scenario]
Apply the [prompt name].
```
```

This template ensures consistency across all prompts while maintaining the flexibility needed for different domains and use cases. 