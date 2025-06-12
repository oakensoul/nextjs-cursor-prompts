# Git Workflow Prompts

**Comprehensive git workflow management prompts for development, release, and emergency processes**

## 📁 **Git Category Overview**

This folder contains specialized git workflow prompts that cover the complete software development lifecycle from daily development to emergency hotfixes and release management.

## 🎯 **Available Git Workflow Prompts**

### **git-code-prep.mdc**
- **Purpose**: Pre-commit code preparation and change analysis
- **Scope**: Code review, documentation updates, commit planning
- **Usage**: Before making commits to analyze and prepare changes
- **Deliverables**: Change analysis, documentation updates, commit strategy

### **git-code-commit.mdc**
- **Purpose**: Final validation and commit execution with conventional commits
- **Scope**: Commit message formatting, final testing, commit execution
- **Usage**: After code preparation to create properly formatted commits
- **Deliverables**: Conventional commit messages, final validation

### **git-code-push.mdc**
- **Purpose**: Quality gates and GitHub push validation
- **Scope**: Pre-push validation, CI/CD checks, remote synchronization
- **Usage**: Before pushing to remote repositories
- **Deliverables**: Push validation, CI/CD readiness confirmation

### **git-code-shipit.mdc**
- **Purpose**: Complete "Ship It" orchestration from prep to push
- **Scope**: Full workflow automation with comprehensive reporting
- **Usage**: For complete development workflow execution
- **Deliverables**: Full workflow report with checkpoints and status

### **git-fix-conflicts.mdc**
- **Purpose**: Systematic conflict resolution and merge fix strategies
- **Scope**: Merge conflicts, branch integration, conflict documentation
- **Usage**: When encountering git merge conflicts
- **Deliverables**: Conflict resolution, merge validation, team communication

### **git-create-hotfix.mdc**
- **Purpose**: Emergency hotfix creation and deployment
- **Scope**: Critical production issues, hotfix branching, emergency deployment
- **Usage**: For critical production issues requiring immediate fixes
- **Deliverables**: Hotfix branch, emergency deployment, incident documentation

### **git-prep-release.mdc**
- **Purpose**: Release preparation and version management
- **Scope**: Version bumping, changelog generation, release coordination
- **Usage**: When preparing major, minor, or patch releases
- **Deliverables**: Release documentation, version tags, deployment plan

### **git-branch-create.mdc**
- **Purpose**: Systematic branch creation with proper naming and setup
- **Scope**: Branch type classification, naming validation, base branch selection
- **Usage**: When creating new feature, bugfix, docs, or refactor branches
- **Deliverables**: Properly named branch, development environment, team communication

### **git-branch-release.mdc**
- **Purpose**: Release branch execution and production deployment
- **Scope**: Release branch creation, version finalization, production deployment
- **Usage**: After release preparation to execute the actual release workflow
- **Deliverables**: Production deployment, release tags, post-release cleanup

## 🔄 **Git Workflow Usage Patterns**

### **Daily Development Workflow**
```bash
# Complete development workflow
Following .cursor/prompts/git/git-code-shipit.mdc:
- Analyze changes and update documentation
- Create conventional commit with proper formatting
- Validate quality gates before push
- Push with comprehensive validation
```

### **Step-by-Step Development**
```bash
# 1. Prepare changes
Following .cursor/prompts/git/git-code-prep.mdc

# 2. Create commit
Following .cursor/prompts/git/git-code-commit.mdc

# 3. Push to remote
Following .cursor/prompts/git/git-code-push.mdc
```

### **Conflict Resolution**
```bash
# When merge conflicts occur
Following .cursor/prompts/git/git-fix-conflicts.mdc:
- Analyze conflict context and stakeholders
- Apply systematic resolution strategies
- Validate resolution and document decisions
```

### **Emergency Response**
```bash
# Critical production issue
Following .cursor/prompts/git/git-create-hotfix.mdc:
- Assess severity and justify hotfix
- Create proper hotfix branch from production
- Implement minimal fix with focused testing
- Deploy through emergency procedures
```

### **Branch Creation**
```bash
# Creating new development branches
Following .cursor/prompts/git/git-branch-create.mdc:
- Determine branch type and naming conventions
- Select appropriate base branch
- Set up development environment
- Establish team communication
```

### **Release Management**
```bash
# Preparing software releases
Following .cursor/prompts/git/git-prep-release.mdc:
- Plan release scope and version strategy
- Generate comprehensive changelog
- Coordinate testing across environments
- Prepare deployment with rollback plans

# Executing software releases
Following .cursor/prompts/git/git-branch-release.mdc:
- Create release branch and finalize versions
- Deploy to production with validation
- Complete release lifecycle with cleanup
```

## 📊 **Git Workflow Standards**

### **Branching Strategy**
- **main/master**: Production-ready code
- **develop**: Integration branch for features
- **feature/[name]**: Feature development branches
- **hotfix/[id]-[description]**: Emergency production fixes
- **release/v[version]**: Release preparation branches

### **Commit Convention**
```
type(scope): description

feat(auth): add OAuth2 integration with Google
fix(api): resolve payment gateway timeout issue
docs(readme): update installation instructions
test(user): add comprehensive user registration tests
```

### **Version Management**
- **Semantic Versioning**: MAJOR.MINOR.PATCH (e.g., 2.1.3)
- **Major**: Breaking changes or major new features
- **Minor**: New features that are backward compatible
- **Patch**: Bug fixes and small improvements

### **Quality Gates**
- All tests must pass before commit
- Code coverage maintained at target levels
- Linting and formatting compliance
- Documentation updated for changes
- Security scanning for dependencies

## 🎯 **Integration with Rules System**

### **Recommended Rule Combinations**
```bash
# For new features
Apply .cursor/rules/code-change-minimal.mdc
Follow .cursor/prompts/git/git-code-shipit.mdc

# For major refactoring
Apply .cursor/rules/code-change-refactor.mdc
Follow .cursor/prompts/git/git-code-prep.mdc
Follow .cursor/prompts/git/git-code-commit.mdc

# For hotfixes
Apply .cursor/rules/code-change-minimal.mdc
Follow .cursor/prompts/git/git-create-hotfix.mdc

# For releases
Apply appropriate rules based on release content
Follow .cursor/prompts/git/git-prep-release.mdc
```

## 🚨 **Emergency Procedures**

### **Hotfix Priority Levels**
- **CRITICAL**: Production down, data loss, security breach
- **HIGH**: Performance issues, feature malfunctions
- **MEDIUM**: UI issues, minor bugs (use regular workflow)

### **Escalation Process**
- **Security Issues**: Immediate security team notification
- **Data Issues**: Database team and stakeholder consultation
- **Business Logic**: Product owner involvement required
- **Infrastructure**: DevOps and platform team coordination

## 💡 **Workflow Examples**

### **Example 1: Feature Development**
```
Develop new user authentication feature

Following .cursor/prompts/git/git-code-shipit.mdc:
- Apply .cursor/rules/code-change-minimal.mdc
- Focus on authentication component development
- Ensure comprehensive testing and documentation
- Follow conventional commit standards
```

### **Example 2: Bug Fix**
```
Fix payment processing timeout issue

Following .cursor/prompts/git/git-code-prep.mdc and git-code-commit.mdc:
- Apply .cursor/rules/code-change-minimal.mdc
- Analyze root cause and implement minimal fix
- Update tests and documentation as needed
- Use "fix(payment): resolve timeout issue" commit format
```

### **Example 3: Emergency Hotfix**
```
Critical security vulnerability in user input validation

Following .cursor/prompts/git/git-create-hotfix.mdc:
- Classify as CRITICAL security issue
- Create hotfix/SEC-123-input-validation branch
- Implement input sanitization with minimal scope
- Deploy immediately after security review
```

### **Example 4: Release Preparation**
```
Prepare v2.1.0 release with new dashboard features

Following .cursor/prompts/git/git-prep-release.mdc:
- Document new dashboard functionality
- Generate comprehensive changelog
- Coordinate UAT with product team
- Plan staged deployment with monitoring
```

## 🔧 **Git Configuration Recommendations**

### **Useful Git Aliases**
```bash
# Add to ~/.gitconfig
[alias]
    co = checkout
    br = branch
    ci = commit
    st = status
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk
    conflicts = diff --name-only --diff-filter=U
    hotfix = flow hotfix start
    release = flow release start
```

### **Git Hooks Integration**
- **pre-commit**: Run linting and formatting
- **commit-msg**: Validate conventional commit format
- **pre-push**: Run test suite and security checks
- **post-commit**: Update documentation if needed

---

**These git workflow prompts ensure consistent, safe, and well-documented development practices from daily commits to emergency deployments and release management.** 