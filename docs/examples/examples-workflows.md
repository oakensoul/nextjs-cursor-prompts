# Common Workflows Examples

**Real-world usage scenarios demonstrating how to use NextJS Cursor Prompts for typical development tasks.**

## 🎯 **Daily Development Workflows**

### **Morning Standup Preparation**
```bash
# Review yesterday's work and prepare for standup
"Prepare standup update using .cursor/prompts/git/git-prep-commit.mdc

Focus on: completed features, current blockers, and today's priorities"
```

**Expected Output:**
- Summary of completed work with commit messages
- Identification of any incomplete tasks
- Clear priorities for the current day
- Blockers that need team discussion

**Real Example:**
```
✅ Completed:
- User authentication API endpoints (3 commits)
- Login form component with validation
- Unit tests for auth service (87% coverage)

🚧 In Progress:
- OAuth integration (blocked on API keys from DevOps)
- User profile page (UI review needed)

🎯 Today's Focus:
- Complete OAuth setup once keys arrive
- Implement password reset functionality
- Review Sarah's PR on user roles
```

### **Feature Development Start**
```bash
# Beginning a new feature from requirements
"Plan user profile management feature using .cursor/prompts/documentation/documentation-create-architecture.mdc

Requirements: Users need to update profile info, change passwords, manage preferences, and view account history."
```

**Expected Output:**
- Architecture decision record (ADR)
- Component breakdown and relationships
- API endpoint specifications
- Database schema changes needed
- Testing strategy outline

**Real Example:**
```typescript
// Generated architecture plan
interface UserProfileFeature {
  components: {
    ProfileForm: "Edit basic info (name, email, bio)";
    PasswordChange: "Secure password update flow";
    PreferencesPanel: "Theme, notifications, privacy settings";
    AccountHistory: "Login history, security events";
  };
  
  api: {
    "GET /api/user/profile": "Fetch current user data";
    "PUT /api/user/profile": "Update profile information";
    "POST /api/user/change-password": "Secure password change";
    "GET /api/user/preferences": "Get user preferences";
    "PUT /api/user/preferences": "Update preferences";
  };
  
  database: {
    users: "Add bio, preferences columns";
    user_sessions: "Track login history";
    user_preferences: "New table for settings";
  };
}
```

### **Bug Investigation Workflow**
```bash
# Systematic bug investigation and resolution
"Investigate login failure bug using .cursor/prompts/quality/quality-review-code.mdc

Issue: Users report intermittent login failures on mobile devices. Error logs show 'Invalid token' but tokens appear valid in database."
```

**Expected Output:**
- Systematic analysis of potential causes
- Code review focusing on authentication flow
- Specific areas to investigate further
- Recommended debugging steps
- Potential fixes with risk assessment

**Real Example:**
```
🔍 Investigation Results:

Root Cause Analysis:
1. Token validation uses server timestamp
2. Mobile devices may have clock drift
3. 30-second token window too narrow for mobile

Code Issues Found:
- No clock skew tolerance in JWT validation
- Missing mobile-specific error handling
- Insufficient logging for token failures

Recommended Fixes:
1. Add 60-second clock skew tolerance
2. Implement mobile-specific token refresh
3. Enhanced error logging with device info
4. Fallback authentication for clock issues

Risk Assessment: Low - changes are additive and backward compatible
```

## 🚀 **Feature Development Workflows**

### **Complete Feature: User Dashboard**
```bash
# Phase 1: Architecture Planning
"Plan user dashboard architecture using .cursor/prompts/documentation/documentation-create-architecture.mdc

Requirements: Personal dashboard showing recent activity, quick actions, notifications, and key metrics."

# Phase 2: API Development  
"Create dashboard API endpoints using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/database-safe.mdc - ensure efficient queries"

# Phase 3: UI Components
"Create dashboard components using .cursor/prompts/component/component-create-guide.mdc
Apply .cursor/rules/code-change-minimal.mdc - use existing design system"

# Phase 4: Testing
"Create comprehensive dashboard tests using .cursor/prompts/test/test-create-comprehensive.mdc"

# Phase 5: Documentation & Review
"Document dashboard feature using .cursor/prompts/documentation/documentation-create-developer.mdc
Review complete implementation using .cursor/prompts/quality/quality-review-full.mdc"
```

**Real Workflow Timeline:**
```
Day 1: Architecture & Planning (2 hours)
- ✅ ADR created with component breakdown
- ✅ API specifications defined
- ✅ Database queries planned
- ✅ Testing strategy outlined

Day 2: API Development (4 hours)
- ✅ 5 API endpoints implemented
- ✅ Database queries optimized
- ✅ Error handling added
- ✅ API tests written (92% coverage)

Day 3: UI Implementation (6 hours)
- ✅ DashboardLayout component
- ✅ ActivityFeed component
- ✅ QuickActions component
- ✅ NotificationPanel component
- ✅ MetricsCards component

Day 4: Integration & Testing (3 hours)
- ✅ Components integrated
- ✅ End-to-end tests added
- ✅ Accessibility audit passed
- ✅ Performance benchmarks met

Day 5: Documentation & Review (2 hours)
- ✅ Feature documentation complete
- ✅ Code review passed
- ✅ Ready for deployment
```

### **API-First Development**
```bash
# Start with API design and work outward
"Create user management API using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/database-safe.mdc - focus on data integrity"

# Then build UI to consume the API
"Create user management UI using .cursor/prompts/component/component-create-guide.mdc

Use the API endpoints we just created: /api/users, /api/users/[id], /api/users/[id]/roles"

# Add comprehensive testing
"Create API and UI tests using .cursor/prompts/test/test-create-comprehensive.mdc"
```

**Real Example Output:**
```typescript
// Generated API endpoints
export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get('page') || '1');
  const limit = parseInt(searchParams.get('limit') || '10');
  
  const users = await db.user.findMany({
    skip: (page - 1) * limit,
    take: limit,
    include: { roles: true },
    orderBy: { createdAt: 'desc' }
  });
  
  return Response.json({ users, page, limit });
}

// Generated UI component
export function UserManagementTable({ users }: { users: User[] }) {
  const [loading, setLoading] = useState(false);
  const [selectedUsers, setSelectedUsers] = useState<string[]>([]);
  
  // Component implementation with proper error handling,
  // loading states, and accessibility features
}
```

## 🔧 **Code Review & Refactoring Workflows**

### **Pre-Commit Review**
```bash
# Before committing changes
"Review my changes for commit using .cursor/prompts/quality/quality-review-code.mdc

Files changed: src/components/UserProfile.tsx, src/api/users/route.ts, tests/user-profile.test.tsx"
```

**Expected Output:**
- Code quality assessment
- Potential issues identified
- Suggestions for improvement
- Commit readiness checklist

**Real Example:**
```
📋 Pre-Commit Review Results:

Code Quality: ✅ Good
- Follows TypeScript best practices
- Proper error handling implemented
- Consistent with project patterns

Issues Found: ⚠️ 2 Minor
1. UserProfile.tsx:45 - Consider extracting validation logic
2. route.ts:23 - Add input sanitization for user bio

Suggestions:
- Add JSDoc comments for public methods
- Consider memoizing expensive calculations
- Update related tests for new validation

✅ Ready for Commit: Yes (after addressing input sanitization)
```

### **Legacy Code Refactoring**
```bash
# Systematic approach to improving old code
"Refactor legacy user authentication using .cursor/prompts/quality/quality-refactor-legacy.mdc
Apply .cursor/rules/code-change-refactor.mdc - systematic improvement approach

Target: src/auth/legacy-auth.js (class-based, no TypeScript, outdated patterns)"
```

**Expected Output:**
- Migration plan from legacy to modern patterns
- Step-by-step refactoring approach
- Risk assessment and mitigation
- Testing strategy for safe migration

**Real Example:**
```typescript
// Before: legacy-auth.js
class AuthManager {
  constructor() {
    this.users = [];
    this.sessions = {};
  }
  
  login(username, password) {
    // 50 lines of mixed concerns
  }
}

// After: Modern TypeScript approach
interface AuthService {
  authenticate(credentials: LoginCredentials): Promise<AuthResult>;
  validateSession(token: string): Promise<User | null>;
  logout(token: string): Promise<void>;
}

export class AuthServiceImpl implements AuthService {
  // Clean, testable, type-safe implementation
}
```

## 🧪 **Testing Workflows**

### **Test-Driven Development**
```bash
# Start with tests, then implement
"Create user registration tests using .cursor/prompts/test/test-create-comprehensive.mdc
Apply .cursor/rules/test-driven.mdc - write tests first

Feature: User registration with email verification, password strength validation, and duplicate prevention"

# Then implement to make tests pass
"Implement user registration using .cursor/prompts/api/api-create-endpoints.mdc

Make the tests we just created pass. Focus on the specific requirements tested."
```

**Real TDD Cycle:**
```typescript
// Step 1: Write failing tests
describe('User Registration', () => {
  it('should create user with valid data', async () => {
    const userData = { email: 'test@example.com', password: 'SecurePass123!' };
    const result = await registerUser(userData);
    expect(result.success).toBe(true);
    expect(result.user.email).toBe(userData.email);
  });
  
  it('should reject weak passwords', async () => {
    const userData = { email: 'test@example.com', password: '123' };
    const result = await registerUser(userData);
    expect(result.success).toBe(false);
    expect(result.error).toContain('password strength');
  });
});

// Step 2: Implement to make tests pass
export async function registerUser(userData: UserRegistrationData) {
  // Implementation that satisfies the test requirements
}
```

### **Bug Fix Testing**
```bash
# Create regression tests for bug fixes
"Create regression tests for login bug using .cursor/prompts/test/test-create-comprehensive.mdc

Bug: Mobile users experience login failures due to clock skew. Need tests that verify clock tolerance works correctly."
```

**Expected Output:**
```typescript
describe('Clock Skew Tolerance', () => {
  it('should accept tokens with reasonable clock skew', async () => {
    const token = generateToken({ clockSkew: 30 }); // 30 seconds ahead
    const result = await validateToken(token);
    expect(result.valid).toBe(true);
  });
  
  it('should reject tokens with excessive clock skew', async () => {
    const token = generateToken({ clockSkew: 300 }); // 5 minutes ahead
    const result = await validateToken(token);
    expect(result.valid).toBe(false);
    expect(result.reason).toBe('clock_skew_exceeded');
  });
});
```

## 👥 **Team Collaboration Workflows**

### **Code Review Preparation**
```bash
# Prepare comprehensive PR for team review
"Prepare pull request using .cursor/prompts/git/git-prep-commit.mdc

Changes: Complete user profile feature with API, UI, tests, and documentation"
```

**Expected Output:**
- Detailed PR description
- Testing instructions
- Breaking changes documentation
- Review checklist for teammates

**Real Example:**
```markdown
## Pull Request: User Profile Management Feature

### 📋 Summary
Complete implementation of user profile management including:
- Profile editing with validation
- Password change functionality  
- User preferences management
- Account activity history

### 🧪 Testing
```bash
# Run the test suite
npm test src/components/UserProfile
npm test src/api/users

# Manual testing steps
1. Navigate to /profile
2. Update profile information
3. Change password
4. Verify email notifications
```

### 🔄 Changes Made
- **API**: 4 new endpoints with full validation
- **UI**: 3 new components with accessibility
- **Tests**: 95% coverage across all changes
- **Docs**: Updated API documentation

### ⚠️ Breaking Changes
None - all changes are additive

### 📝 Review Checklist
- [ ] Code follows project standards
- [ ] Tests pass and coverage maintained
- [ ] Documentation updated
- [ ] Accessibility requirements met
- [ ] Performance impact assessed
```

### **Feature Handoff**
```bash
# Transitioning work to another team member
"Continue user profile feature using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc

Handoff to: Sarah (frontend specialist)
Current status: API complete, basic UI started, needs advanced UI features and polish"
```

**Expected Output:**
- Complete context transfer
- Clear next steps
- Technical decisions made
- Resources and references needed

## 📊 **Workflow Success Metrics**

### **Efficiency Indicators**
```typescript
interface WorkflowMetrics {
  // Time-based metrics
  featureCompletionTime: "3-5 days for medium features";
  bugResolutionTime: "2-4 hours for typical bugs";
  codeReviewCycles: "1-2 cycles average";
  
  // Quality metrics
  testCoverage: "85%+ maintained";
  bugEscapeRate: "<5% to production";
  documentationCompleteness: "100% for public APIs";
  
  // Team metrics
  handoffEfficiency: "Zero context loss in transitions";
  reviewApprovalRate: "90%+ first-time approval";
  standardsCompliance: "100% automated checks pass";
}
```

### **Common Success Patterns**
```bash
✅ High Success Workflows:
- Start with architecture planning
- Use appropriate safety rules
- Include testing from the beginning
- Document as you go
- Review before committing

❌ Common Failure Patterns:
- Skip planning and jump to implementation
- Ignore existing code patterns
- Add testing as an afterthought
- Assume context without explicit transfer
- Rush through quality gates
```

## 💡 **Workflow Optimization Tips**

### **Prompt Sequencing**
```bash
# Optimal sequence for complex features
1. Architecture/Planning prompts first
2. Implementation prompts with safety rules
3. Testing prompts throughout (not just at end)
4. Quality review prompts before completion
5. Documentation prompts for knowledge transfer
```

### **Context Preservation**
```bash
# Maintain context across workflow steps
"Continue dashboard implementation using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc

Previous context: We've completed the API layer with 5 endpoints and started the UI with DashboardLayout component. Next: implement the ActivityFeed and MetricsCards components."
```

### **Quality Gates**
```bash
# Built-in quality checkpoints
After Implementation: "Review code quality using quality/quality-review-code.mdc"
Before Testing: "Review test strategy using test/test-create-comprehensive.mdc"  
Before Commit: "Final review using quality/quality-review-full.mdc"
```

---

**🎯 These workflows demonstrate real-world usage patterns that lead to consistent, high-quality development outcomes. Adapt the examples to your specific project context and team needs.**

**Next: Explore the [Prompt Catalog Reference](../references/references-prompt-catalog.md) for quick lookup of all available prompts, or review [Complex Scenarios](examples-complex.md) for advanced multi-sprint workflows.** 