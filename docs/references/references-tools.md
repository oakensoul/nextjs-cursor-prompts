# Tool Integration Reference

**Comprehensive guide to Cursor features, VS Code integration, and productivity optimizations for NextJS Cursor Prompts.**

## 🎯 **Cursor-Specific Features**

### **AI Chat Integration**
**Purpose**: Direct integration with AI models for code generation and assistance  
**Access**: `Cmd/Ctrl + L` or Chat panel  
**Best Practices**:
```bash
# Use explicit prompt references
"Create user component using .cursor/prompts/component/component-create-guide.mdc"

# Include file context
"Review this file using .cursor/prompts/quality/quality-review-code.mdc
@filename.tsx"

# Apply rules consistently
"Apply .cursor/rules/code-change-minimal.mdc - preserve existing patterns"
```

**Advanced Usage**:
```bash
# Multi-file context
"Create user management system using .cursor/prompts/api/api-create-endpoints.mdc
@src/types/user.ts @src/lib/db.ts @src/middleware/auth.ts"

# Codebase-wide analysis
"Review authentication security using .cursor/prompts/quality/quality-review-security.mdc
@src/auth/ @src/api/auth/ @src/middleware/"
```

---

### **Composer Feature**
**Purpose**: Multi-file editing and complex refactoring workflows  
**Access**: `Cmd/Ctrl + I` or Composer panel  
**Best For**: Large-scale changes, feature implementation, refactoring

**Workflow Integration**:
```bash
# Feature development workflow
1. "Plan user dashboard architecture using .cursor/prompts/documentation/documentation-create-architecture.mdc"
2. Use Composer to implement across multiple files
3. "Review implementation using .cursor/prompts/quality/quality-review-full.mdc"
```

**Multi-File Patterns**:
```typescript
// Composer excels at coordinated changes across:
interface FeatureImplementation {
  types: "src/types/user.ts";           // Type definitions
  api: "src/api/users/route.ts";        // API endpoints  
  components: "src/components/UserList.tsx"; // UI components
  tests: "src/__tests__/user.test.ts";  // Test files
  docs: "docs/api/users.md";            // Documentation
}
```

---

### **Inline Edit Mode**
**Purpose**: Quick, contextual code modifications  
**Access**: `Cmd/Ctrl + K` or inline edit trigger  
**Best For**: Small changes, bug fixes, quick improvements

**Prompt Integration**:
```bash
# Quick quality improvements
"Apply .cursor/rules/code-change-minimal.mdc - fix accessibility issues in this component"

# Targeted refactoring
"Apply .cursor/rules/code-change-refactor.mdc - modernize this function to use async/await"

# Performance optimization
"Optimize this component using .cursor/prompts/quality/quality-review-performance.mdc"
```

---

### **Codebase Indexing**
**Purpose**: Intelligent code understanding and context awareness  
**Features**: Automatic indexing, symbol search, intelligent suggestions  
**Optimization**:
```bash
# Ensure proper indexing
- Keep .cursor/ directory in project root
- Use consistent file naming conventions
- Maintain clear project structure
- Regular codebase cleanup

# Leverage indexing for prompts
"Create component following existing patterns using .cursor/prompts/component/component-create-guide.mdc
Reference: @src/components/Button.tsx @src/components/Card.tsx"
```

---

## 🔧 **VS Code Integration**

### **Extension Compatibility**
**Essential Extensions for NextJS Cursor Prompts**:
```json
{
  "recommendations": [
    "bradlc.vscode-tailwindcss",
    "ms-vscode.vscode-typescript-next",
    "esbenp.prettier-vscode",
    "ms-playwright.playwright",
    "vitest.explorer",
    "ms-vscode.vscode-json"
  ]
}
```

**Configuration Optimization**:
```json
// .vscode/settings.json
{
  "typescript.preferences.includePackageJsonAutoImports": "auto",
  "typescript.suggest.autoImports": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true,
    "source.organizeImports": true
  },
  "tailwindCSS.experimental.classRegex": [
    ["cn\\(([^)]*)\\)", "'([^']*)'"],
    ["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"]
  ]
}
```

---

### **Keyboard Shortcuts Optimization**
**Essential Shortcuts for Prompt Workflows**:
```bash
# Core Cursor features
Cmd/Ctrl + L          # Open AI Chat
Cmd/Ctrl + I          # Open Composer  
Cmd/Ctrl + K          # Inline edit
Cmd/Ctrl + Shift + L   # Quick chat

# Enhanced VS Code shortcuts
Cmd/Ctrl + P          # Quick file open
Cmd/Ctrl + Shift + P   # Command palette
Cmd/Ctrl + `          # Terminal toggle
Cmd/Ctrl + B          # Sidebar toggle

# Custom shortcuts for prompt workflows
Cmd/Ctrl + Alt + C     # Copy file path (for @file references)
Cmd/Ctrl + Alt + R     # Run current test file
Cmd/Ctrl + Alt + T     # Open terminal in current directory
```

**Custom Keybindings**:
```json
// keybindings.json
[
  {
    "key": "cmd+alt+c",
    "command": "copyRelativeFilePath"
  },
  {
    "key": "cmd+alt+r", 
    "command": "npm-script.test"
  },
  {
    "key": "cmd+alt+p",
    "command": "workbench.action.quickOpen",
    "args": ".cursor/prompts/"
  }
]
```

---

### **Workspace Configuration**
**Optimized Workspace Settings**:
```json
// .vscode/settings.json
{
  "files.exclude": {
    "**/node_modules": true,
    "**/.next": true,
    "**/dist": true,
    "**/.git": true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/.next": true,
    "**/dist": true
  },
  "typescript.preferences.includePackageJsonAutoImports": "auto",
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "emmet.includeLanguages": {
    "typescript": "html",
    "typescriptreact": "html"
  }
}
```

**Tasks Configuration**:
```json
// .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "dev",
      "type": "npm",
      "script": "dev",
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared"
      }
    },
    {
      "label": "test",
      "type": "npm", 
      "script": "test",
      "group": "test"
    },
    {
      "label": "build",
      "type": "npm",
      "script": "build", 
      "group": "build"
    }
  ]
}
```

---

## 🚀 **Productivity Optimizations**

### **File Navigation Patterns**
**Quick Access to Prompt System**:
```bash
# Use VS Code's Quick Open (Cmd/Ctrl + P)
.cursor/prompts/component/          # Component prompts
.cursor/prompts/api/               # API prompts  
.cursor/prompts/test/              # Testing prompts
.cursor/prompts/quality/           # Quality prompts
.cursor/rules/                     # Rules directory

# Bookmark frequently used prompts
- component-create-guide.mdc
- api-create-endpoints.mdc
- test-create-comprehensive.mdc
- quality-review-full.mdc
```

**Project Structure Navigation**:
```bash
# Efficient project navigation
src/components/                    # UI components
src/app/                          # Next.js app directory
src/lib/                          # Utility functions
src/types/                        # TypeScript types
src/__tests__/                    # Test files
docs/                             # Documentation
.cursor/                          # Prompt system
```

---

### **Snippet Integration**
**Custom Snippets for Prompt Usage**:
```json
// .vscode/snippets/cursor-prompts.json
{
  "Create Component": {
    "prefix": "cursor-component",
    "body": [
      "Create a $1 component using .cursor/prompts/component/component-create-guide.mdc",
      "",
      "Requirements: $2"
    ],
    "description": "Template for component creation prompt"
  },
  "Create API": {
    "prefix": "cursor-api", 
    "body": [
      "Create $1 API endpoints using .cursor/prompts/api/api-create-endpoints.mdc",
      "Apply .cursor/rules/database-safe.mdc - ensure safe database operations",
      "",
      "Resources: $2"
    ],
    "description": "Template for API creation prompt"
  },
  "Quality Review": {
    "prefix": "cursor-review",
    "body": [
      "Review $1 using .cursor/prompts/quality/quality-review-full.mdc",
      "",
      "Focus areas: $2"
    ],
    "description": "Template for quality review prompt"
  }
}
```

---

### **Terminal Integration**
**Optimized Terminal Workflows**:
```bash
# Quick development commands
npm run dev                       # Start development server
npm run test                      # Run test suite
npm run build                     # Production build
npm run lint                      # Code linting
npm run type-check               # TypeScript checking

# Git workflow integration
git add .
git commit -m "feat: add user management"  # Conventional commits
git push origin feature/user-management

# Testing workflows
npm test -- --watch              # Watch mode testing
npm run test:coverage            # Coverage reports
npm run test:e2e                 # End-to-end tests
```

**Terminal Aliases**:
```bash
# Add to .bashrc or .zshrc
alias nrd="npm run dev"
alias nrt="npm run test"
alias nrb="npm run build"
alias nrl="npm run lint"

# Cursor-specific aliases
alias cursor-component="echo 'Create component using .cursor/prompts/component/component-create-guide.mdc'"
alias cursor-api="echo 'Create API using .cursor/prompts/api/api-create-endpoints.mdc'"
alias cursor-test="echo 'Create tests using .cursor/prompts/test/test-create-comprehensive.mdc'"
```

---

### **Multi-Monitor Setup**
**Optimal Layout for Prompt-Driven Development**:
```bash
# Primary Monitor (Main Development)
- Cursor editor with code files
- AI Chat panel (docked right)
- File explorer (docked left)
- Terminal (bottom panel)

# Secondary Monitor (Reference & Testing)
- Browser with application preview
- Documentation (prompt guides, API docs)
- Test runner output
- Database/API tools

# Workflow Benefits
- Context switching minimized
- Prompt references always visible
- Real-time feedback on changes
- Efficient debugging and testing
```

---

## 🔍 **Debugging and Troubleshooting Tools**

### **Cursor Diagnostics**
**Built-in Debugging Features**:
```bash
# AI Chat debugging
- Check conversation history for context loss
- Review prompt formatting and structure
- Validate rule application and conflicts
- Monitor response quality and consistency

# Composer debugging  
- Track multi-file change coordination
- Verify file synchronization
- Check for incomplete edits
- Monitor large-scale refactoring progress

# Inline edit debugging
- Validate small change accuracy
- Check context preservation
- Monitor edit scope and boundaries
- Verify integration with existing code
```

**Performance Monitoring**:
```bash
# Cursor performance indicators
- Response time for AI requests
- Indexing completion status
- Memory usage during large operations
- File processing speed

# Optimization strategies
- Regular codebase cleanup
- Efficient prompt structuring
- Strategic use of file references
- Proper context management
```

---

### **Integration Testing**
**Validate Tool Integration**:
```bash
# Test Cursor features
1. AI Chat responsiveness
2. Composer multi-file coordination
3. Inline edit accuracy
4. Codebase indexing completeness

# Test VS Code integration
1. Extension compatibility
2. Keyboard shortcut functionality
3. Workspace configuration effectiveness
4. Task runner integration

# Test prompt system integration
1. Prompt file accessibility
2. Rule application consistency
3. Context preservation across tools
4. Quality gate integration
```

---

## 📊 **Performance Metrics**

### **Productivity Measurements**
```typescript
interface ProductivityMetrics {
  // Speed metrics
  promptToCode: "< 30 seconds for simple components";
  featureCompletion: "2-3 days for medium features";
  debuggingTime: "< 1 hour for typical issues";
  
  // Quality metrics
  firstTimeSuccess: "> 80% for well-structured prompts";
  codeStandardsCompliance: "> 95% with proper rules";
  testCoverage: "> 85% with test-driven prompts";
  
  // Tool efficiency
  contextSwitching: "< 5 switches per hour";
  keyboardShortcutUsage: "> 70% of navigation";
  automatedTaskExecution: "> 90% of routine tasks";
}
```

### **Optimization Targets**
```bash
# Speed optimizations
- Reduce prompt-to-result time
- Minimize context switching
- Automate repetitive tasks
- Streamline file navigation

# Quality optimizations  
- Improve first-time success rate
- Reduce debugging iterations
- Enhance code consistency
- Strengthen test coverage

# Workflow optimizations
- Better tool integration
- Smoother handoff processes
- More efficient collaboration
- Reduced cognitive overhead
```

---

## 💡 **Advanced Techniques**

### **Custom Tool Integration**
**Extend Cursor with Custom Tools**:
```bash
# Custom scripts for prompt workflows
#!/bin/bash
# scripts/cursor-component.sh
echo "Create $1 component using .cursor/prompts/component/component-create-guide.mdc"
echo "Requirements: $2"

# Integration with external tools
- Figma design import
- Database schema generators  
- API documentation tools
- Testing framework integration
```

### **Automation Workflows**
**Automated Development Pipelines**:
```bash
# Pre-commit automation
1. Run quality review prompts
2. Execute test suites
3. Validate code standards
4. Generate documentation updates

# Deployment automation
1. Build optimization
2. Security scanning
3. Performance testing
4. Documentation deployment
```

### **Team Collaboration Tools**
**Multi-Developer Cursor Usage**:
```bash
# Shared configurations
- Synchronized workspace settings
- Common prompt libraries
- Shared rule definitions
- Consistent tool configurations

# Collaboration patterns
- Prompt sharing and versioning
- Context handoff procedures
- Quality gate coordination
- Knowledge transfer protocols
```

---

**🎯 Optimal tool integration amplifies the effectiveness of NextJS Cursor Prompts by reducing friction, automating routine tasks, and maintaining consistent development workflows across team members.**

**Next: Explore [Common Workflows](../examples/examples-workflows.md) for practical usage patterns, or review [Troubleshooting Examples](../examples/examples-troubleshooting.md) for problem resolution strategies.** 