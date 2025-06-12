# Git Workflow Standards

This document defines the Git workflow, branching strategy, and commit conventions for projects using this prompt collection.

## Branch Strategy

### Main Branch Structure
```
main (production)          # Production-ready code
├── develop                # Integration branch for features
├── feature/user-auth      # Feature development
├── feature/dashboard-ui   # Feature development
├── hotfix/security-patch  # Critical production fixes
└── release/v1.2.0        # Release preparation
```

### Branch Types and Conventions

#### Main Branches
- **`main`**: Production-ready code only
  - Protected branch with required reviews
  - Automatically deploys to production
  - Only accepts merges from `release/*` or `hotfix/*`

- **`develop`**: Integration branch for features
  - Staging environment deployment
  - Target for feature branch merges
  - Base for new feature branches

#### Supporting Branches

#### Feature Branches (`feature/*`)
```bash
# Naming convention
feature/user-authentication
feature/dashboard-redesign
feature/api-endpoints
feature/payment-integration

# Lifecycle
git checkout develop
git pull origin develop
git checkout -b feature/user-authentication
# ... work on feature ...
git push origin feature/user-authentication
# Create PR to develop
```

#### Release Branches (`release/*`)
```bash
# Naming convention
release/v1.2.0
release/v2.0.0-beta

# Lifecycle
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0
# ... bug fixes and version bumps only ...
git push origin release/v1.2.0
# Create PR to main and develop
```

#### Hotfix Branches (`hotfix/*`)
```bash
# Naming convention
hotfix/security-vulnerability
hotfix/critical-bug-fix

# Lifecycle
git checkout main
git pull origin main
git checkout -b hotfix/security-vulnerability
# ... critical fix ...
git push origin hotfix/security-vulnerability
# Create PR to main and develop
```

## Commit Message Conventions

### Conventional Commit Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Commit Types
- **feat**: New feature for the user
- **fix**: Bug fix for the user
- **docs**: Documentation changes
- **style**: Formatting, missing semicolons, etc. (no code change)
- **refactor**: Code refactoring (no functional changes)
- **test**: Adding or updating tests
- **chore**: Build process, dependency updates, etc.
- **perf**: Performance improvements
- **ci**: CI/CD configuration changes
- **build**: Build system changes
- **revert**: Reverting previous commits

### Scope Examples
- **component**: React component changes
- **api**: API route changes
- **auth**: Authentication related
- **ui**: User interface changes
- **db**: Database changes
- **config**: Configuration changes

### Commit Message Examples

#### Good Commit Messages
```bash
feat(auth): add password reset functionality

- Implement forgot password flow with email verification
- Add password strength validation
- Update auth service to handle reset tokens
- Include comprehensive error handling

Closes #123

fix(component): resolve accessibility issues in navigation

- Add missing ARIA labels to menu items
- Improve keyboard navigation focus management
- Update color contrast to meet WCAG AA standards

Fixes #456

docs(readme): update installation instructions

- Add Node.js version requirements
- Include environment variable setup
- Update deployment steps for Vercel

chore(deps): upgrade React to v19.0.0

- Update all React-related dependencies
- Fix breaking changes in component props
- Update test files for new React behavior

BREAKING CHANGE: Component props now require explicit children type
```

#### Bad Commit Messages (Avoid)
```bash
# Too vague
fix bug
update component
changes

# No scope or context
fixed the thing
added new feature
updated styles

# Not descriptive
wip
temp commit
quick fix
```

### Breaking Changes
```bash
feat(api): redesign user authentication endpoints

BREAKING CHANGE: 
- /api/auth/login now returns different response format
- JWT tokens are now stored in httpOnly cookies instead of localStorage
- Session expiration reduced from 7 days to 24 hours

Migration guide:
1. Update client auth calls to handle new response format
2. Remove localStorage token management code
3. Update session refresh logic
```

## Pre-commit Workflow

### Pre-commit Script Requirements
```json
{
  "scripts": {
    "precommit": "npm run update-scripts && npm run test && npm run test:coverage && npm run build"
  }
}
```

### Pre-commit Checklist
- [ ] **Type Check**: `npm run tsc` passes
- [ ] **Linting**: `npm run lint` passes with no errors
- [ ] **Unit Tests**: `npm run test:unit` passes
- [ ] **Integration Tests**: `npm run test:integration` passes
- [ ] **Accessibility Tests**: `npm run test:a11y` passes
- [ ] **Coverage**: Test coverage meets minimum thresholds
- [ ] **Build**: `npm run build` completes successfully
- [ ] **Documentation**: Relevant docs are updated

### Commit Preparation Process

#### 1. Change Assessment
- Review all modified files
- Categorize changes by type and scope
- Identify any breaking changes
- Plan commit strategy (single vs multiple commits)

#### 2. Documentation Updates
- Update changelog with new entries
- Update component documentation if needed
- Update API documentation for endpoint changes
- Update README if setup/usage changed

#### 3. Testing Verification
- Ensure all new code has appropriate tests
- Verify existing tests still pass
- Check accessibility compliance
- Test error scenarios and edge cases

#### 4. Commit Strategy

**Single Commit When:**
- Changes are small and cohesive
- All changes relate to the same feature/fix
- No logical separation points exist
- Changes are interdependent

**Multiple Commits When:**
- Mixing different types of changes
- Large features can be broken into logical steps
- Bug fixes are independent of feature work
- Documentation updates are substantial

## Pull Request Standards

### PR Title Format
```
<type>(<scope>): <description>
```

### PR Description Template
```markdown
## Summary
Brief description of changes and motivation.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Code refactoring

## Changes Made
- [ ] Specific change 1
- [ ] Specific change 2
- [ ] Specific change 3

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Accessibility tests added/updated
- [ ] Manual testing completed
- [ ] All tests pass

## Documentation
- [ ] Code comments updated
- [ ] README updated (if applicable)
- [ ] Changelog updated
- [ ] API documentation updated (if applicable)

## Deployment Notes
Any special deployment considerations or environment variable changes.

## Breaking Changes
List any breaking changes and migration steps.

## Screenshots/Videos
Include if UI changes are involved.

## Related Issues
Closes #123
Fixes #456
Related to #789
```

### PR Review Requirements

#### Automated Checks
- [ ] All CI/CD checks pass
- [ ] Build succeeds
- [ ] Tests pass with adequate coverage
- [ ] Linting passes
- [ ] Type checking passes
- [ ] Security scans pass

#### Manual Review Criteria
- [ ] Code follows project standards
- [ ] Logic is sound and efficient
- [ ] Error handling is comprehensive
- [ ] Accessibility requirements met
- [ ] Security considerations addressed
- [ ] Performance impact evaluated
- [ ] Documentation is adequate

## Release Management

### Version Numbering (Semantic Versioning)
```
MAJOR.MINOR.PATCH

Examples:
1.0.0 - Initial release
1.0.1 - Patch (bug fixes)
1.1.0 - Minor (new features, backwards compatible)
2.0.0 - Major (breaking changes)
```

### Release Process

#### 1. Release Planning
```bash
# Create release branch from develop
git checkout develop
git pull origin develop
git checkout -b release/v1.2.0

# Update version in package.json
npm version minor --no-git-tag-version

# Update changelog
# Add release notes
# Test thoroughly
```

#### 2. Release Preparation
- [ ] Version bumped in `package.json`
- [ ] Changelog updated with all changes
- [ ] Documentation updated
- [ ] All tests pass
- [ ] Security audit completed
- [ ] Performance benchmarks acceptable

#### 3. Release Execution
```bash
# Merge release to main
git checkout main
git pull origin main
git merge --no-ff release/v1.2.0
git tag v1.2.0
git push origin main --tags

# Merge back to develop
git checkout develop
git pull origin develop
git merge --no-ff release/v1.2.0
git push origin develop

# Delete release branch
git branch -d release/v1.2.0
git push origin --delete release/v1.2.0
```

#### 4. Post-Release
- [ ] Deployment to production verified
- [ ] Monitoring alerts configured
- [ ] Release notes published
- [ ] Stakeholders notified
- [ ] Documentation sites updated

### Hotfix Process

#### Emergency Fix Workflow
```bash
# Create hotfix from main
git checkout main
git pull origin main
git checkout -b hotfix/critical-security-fix

# Make minimal fix
# Test thoroughly
# Update version (patch bump)

# Merge to main
git checkout main
git merge --no-ff hotfix/critical-security-fix
git tag v1.2.1
git push origin main --tags

# Merge to develop
git checkout develop
git merge --no-ff hotfix/critical-security-fix
git push origin develop

# Clean up
git branch -d hotfix/critical-security-fix
git push origin --delete hotfix/critical-security-fix
```

## Git Configuration

### Recommended Git Config
```bash
# User information
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Editor and diff tool
git config --global core.editor "code --wait"
git config --global diff.tool vscode

# Line ending handling
git config --global core.autocrlf input  # Linux/Mac
git config --global core.autocrlf true   # Windows

# Default branch
git config --global init.defaultBranch main

# Rebase on pull
git config --global pull.rebase true

# Prune remote branches
git config --global fetch.prune true
```

### Useful Git Aliases
```bash
# Add to ~/.gitconfig
[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    ca = commit --amend
    cp = cherry-pick
    lg = log --oneline --graph --decorate --all
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk
    cleanup = "!git branch --merged | grep -v '\\*\\|main\\|develop' | xargs -n 1 git branch -d"
```

## Security Considerations

### Sensitive Data Protection
- [ ] Never commit API keys, passwords, or secrets
- [ ] Use `.gitignore` for environment files
- [ ] Use environment variables for configuration
- [ ] Audit commits for accidental sensitive data
- [ ] Use tools like `git-secrets` for prevention

### Commit Signing
```bash
# Set up GPG signing
git config --global commit.gpgsign true
git config --global user.signingkey YOUR_GPG_KEY_ID

# Verify signed commits
git log --show-signature
```

This Git workflow ensures code quality, maintainability, and proper collaboration while maintaining a clean and auditable project history. 