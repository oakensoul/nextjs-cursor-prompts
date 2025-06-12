# Quick Start Guide

**Get up and running with NextJS Cursor Prompts in 5 minutes - from zero to productive AI-assisted development.**

## 🚀 **5-Minute Quick Start**

### **Step 1: Copy the Prompt System (1 minute)**

```bash
# Copy the entire .cursor folder to your NextJS project
cp -r /path/to/nextjs-cursor-prompts/.cursor /your-project/

# Your project now has:
# .cursor/prompts/    - 45+ specialized prompts
# .cursor/rules/      - 5 core constraint rules
```

### **Step 2: Your First Component (2 minutes)**

```
Create a loading spinner component using .cursor/prompts/component/component-create-ui.mdc

I need a loading spinner with three size variants (small, medium, large) and different color options.
```

**What happens:**
- ✅ Complete TypeScript component with proper interfaces
- ✅ TailwindCSS styling with size/color variants  
- ✅ Accessibility attributes (ARIA labels, screen reader support)
- ✅ Comprehensive test suite (unit + accessibility)
- ✅ Documentation and usage examples

### **Step 3: Add Safety Rules (1 minute)**

```
Create a UserCard component using .cursor/prompts/component/component-create-guide.mdc

Apply .cursor/rules/code-change-minimal.mdc - preserve existing component patterns and don't modify working code.
```

**What changes:**
- 🛡️ AI will preserve your existing code structure
- 🛡️ Only creates new files, doesn't modify existing ones
- 🛡️ Uses your established patterns and utilities

### **Step 4: Test Everything (1 minute)**

```
Create comprehensive tests for the UserCard component using .cursor/prompts/test/test-create-comprehensive.mdc
```

**What you get:**
- ✅ Unit tests with Vitest
- ✅ Accessibility tests with vitest-axe
- ✅ Integration tests for component interactions
- ✅ 80%+ code coverage

## 🎯 **Essential Prompts (Know These 5)**

### **1. Component Creation** - `component/component-create-guide.mdc`
```
Create a [component description] using .cursor/prompts/component/component-create-guide.mdc
```
**Use for:** Any React component creation with intelligent routing to specialized prompts

### **2. Testing** - `test/test-create-comprehensive.mdc`
```
Create comprehensive tests for [component/feature] using .cursor/prompts/test/test-create-comprehensive.mdc
```
**Use for:** Complete test coverage (unit, integration, accessibility, e2e)

### **3. Code Quality** - `quality/quality-review-code.mdc`
```
Review code quality for [specific area] using .cursor/prompts/quality/quality-review-code.mdc
```
**Use for:** Code review, refactoring, performance optimization

### **4. API Development** - `api/api-create-endpoints.mdc`
```
Create API endpoints for [feature] using .cursor/prompts/api/api-create-endpoints.mdc
```
**Use for:** NextJS API routes with validation, auth, and error handling

### **5. Git Workflow** - `git/git-prep-commit.mdc`
```
Prepare my changes for commit using .cursor/prompts/git/git-prep-commit.mdc
```
**Use for:** Professional commits with conventional messages and documentation

## 🛡️ **Essential Rules (Apply These)**

### **1. Minimal Changes** - `code-change-minimal.mdc`
```
Apply .cursor/rules/code-change-minimal.mdc - preserve existing code patterns
```
**Use when:** Adding to existing codebase, want surgical changes only

### **2. Test-Driven** - `test-driven.mdc`
```
Apply .cursor/rules/test-driven.mdc - write tests first for critical business logic
```
**Use when:** Building important features, APIs, or complex logic

### **3. Database Safety** - `database-safe.mdc`
```
Apply .cursor/rules/database-safe.mdc - ensure safe database operations
```
**Use when:** Working with data, migrations, or database changes

## 🔄 **Common Workflows**

### **Daily Development Flow**
```bash
# 1. Create feature
"Create user authentication components using component/component-create-guide.mdc"

# 2. Add tests  
"Create tests for auth components using test/test-create-comprehensive.mdc"

# 3. Review quality
"Review auth implementation using quality/quality-review-code.mdc"

# 4. Prepare commit
"Prepare auth feature for commit using git/git-prep-commit.mdc"
```

### **New Feature Development**
```bash
# 1. Plan architecture
"Document user management architecture using documentation/documentation-create-architecture.mdc"

# 2. Create API
"Create user CRUD endpoints using api/api-create-endpoints.mdc"

# 3. Build UI
"Create user management UI using component/component-create-guide.mdc"

# 4. Comprehensive testing
"Create full test suite using test/test-create-comprehensive.mdc"
```

## 🎨 **Intelligent Prompt Routing**

The system automatically routes to specialized prompts:

```
"Create a login form"
# → Routes to component-create-form.mdc

"Create a navigation menu"  
# → Routes to component-create-navigation.mdc

"Create a product card"
# → Routes to component-create-card.mdc

"Create a landing page hero"
# → Routes to component-create-marketing.mdc
```

## 🚨 **Troubleshooting (First 5 Minutes)**

### **Prompt Not Working?**
```
# ✅ Correct format
Create a button component using .cursor/prompts/component/component-create-guide.mdc

# ❌ Incorrect format  
Use the button prompt to make a component
```

### **Too Many Changes?**
```
# Add the minimal change rule
Apply .cursor/rules/code-change-minimal.mdc - only modify what's necessary
```

### **Need Help Choosing?**
```
# Use the general component guide - it will route you
Create a [describe your component] using .cursor/prompts/component/component-create-guide.mdc
```

## 📚 **Next Steps**

### **After Your First Success:**
1. **Explore Categories**: Check `.cursor/prompts/` folders for specialized prompts
2. **Read Standards**: Review `docs/standards/` for project-specific guidelines  
3. **Try Combinations**: Combine multiple prompts for complex workflows
4. **Use Rules**: Apply `.cursor/rules/` for cross-cutting constraints

### **Become an Expert:**
1. **Thread Management**: Learn `prompt-engineering/prompt-continue-thread.mdc`
2. **Quality Orchestration**: Use `quality/quality-review-full.mdc`
3. **Documentation**: Create guides with `documentation/documentation-create-*.mdc`
4. **Custom Prompts**: Follow `prompt-engineering/prompt-create.mdc`

## 🎯 **Success Indicators**

**You're ready to graduate from this guide when:**
- ✅ You can create components with tests in one prompt
- ✅ You naturally apply safety rules to prevent unwanted changes  
- ✅ You know which category to use for different tasks
- ✅ You combine prompts for complete feature development
- ✅ Your code follows the project standards automatically

## 💡 **Pro Tips**

### **Maximize Efficiency:**
```bash
# Combine creation with quality rules
"Create dashboard component using component/component-create-guide.mdc
Apply .cursor/rules/code-change-minimal.mdc - preserve existing layout patterns"
```

### **Complex Projects:**
```bash
# Use thread management for big features
"Continue this feature development using prompt-engineering/prompt-continue-thread.mdc"
```

### **Team Consistency:**
```bash
# Apply project context for team alignment  
"Apply .cursor/rules/project-context.mdc - follow our established patterns"
```

---

**🎉 Congratulations! You're now ready for productive AI-assisted development with NextJS Cursor Prompts. The system will guide you to the right prompts and ensure quality standards automatically.**

**Next: Explore the [Integration Patterns Guide](guides-integration.md) for advanced workflows, or dive into specific [Standards Documentation](../standards/) for detailed requirements.** 