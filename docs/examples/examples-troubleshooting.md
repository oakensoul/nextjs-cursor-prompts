# Troubleshooting Examples

**Problem resolution patterns and solutions for common issues when using NextJS Cursor Prompts.**

## 🚨 **Common Prompt Failures**

### **Problem: Prompt Not Producing Expected Results**

**Symptoms:**
- AI generates generic code that doesn't match project patterns
- Missing required features or functionality
- Code doesn't integrate with existing codebase
- Output quality is inconsistent

**Diagnosis:**
```bash
# Check if you're using the right prompt
❌ Wrong: "Create a button component"
✅ Right: "Create a button component using .cursor/prompts/component/component-create-guide.mdc"

# Check if context is sufficient
❌ Insufficient: "Create user management"
✅ Sufficient: "Create user management API using .cursor/prompts/api/api-create-endpoints.mdc

Requirements: CRUD operations for users, role-based permissions, email validation"
```

**Solutions:**

1. **Add Explicit Context**
```bash
"Create dashboard component using .cursor/prompts/component/component-create-guide.mdc
Apply .cursor/rules/project-context.mdc - follow our established patterns

Project context: Next.js 15, TypeScript, TailwindCSS, using shadcn/ui components
Existing patterns: All components in src/components/, use cn() utility for styling"
```

2. **Use Appropriate Safety Rules**
```bash
"Create user profile form using .cursor/prompts/component/component-create-form.mdc
Apply .cursor/rules/code-change-minimal.mdc - preserve existing form patterns

Existing forms use react-hook-form with zod validation. Follow the same pattern."
```

3. **Break Down Complex Requests**
```bash
# Instead of one complex prompt:
❌ "Create complete user management system with API, UI, tests, and docs"

# Use sequential prompts:
✅ Step 1: "Plan user management architecture using .cursor/prompts/documentation/documentation-create-architecture.mdc"
✅ Step 2: "Create user API endpoints using .cursor/prompts/api/api-create-endpoints.mdc"
✅ Step 3: "Create user management UI using .cursor/prompts/component/component-create-guide.mdc"
```

**Real Example Fix:**
```typescript
// Before: Generic, doesn't match project
interface ButtonProps {
  children: React.ReactNode;
  onClick?: () => void;
}

// After: Matches project patterns with proper context
interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'outline' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  loading?: boolean;
  children: React.ReactNode;
}

export const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = 'primary', size = 'md', loading, ...props }, ref) => {
    return (
      <button
        className={cn(buttonVariants({ variant, size }), className)}
        ref={ref}
        disabled={loading || props.disabled}
        {...props}
      />
    );
  }
);
```

---

### **Problem: Context Preservation Issues**

**Symptoms:**
- AI "forgets" previous decisions in long conversations
- Inconsistent code patterns across related components
- Repeated questions about project setup
- Loss of architectural decisions

**Diagnosis:**
```bash
# Check conversation length
- Message count > 15: Consider thread management
- Multiple context switches: Use thread continuation
- Complex feature spanning days: Implement handoff strategy
```

**Solutions:**

1. **Proactive Thread Management**
```bash
# At message 15 or when complexity increases
"Monitor conversation complexity indicators manually - watch for length, context switching, and performance issues"

# If complexity is medium or high:
"Continue this feature development using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc

Current focus: User authentication system with OAuth integration
Status: API endpoints complete, working on UI components"
```

2. **Explicit Context Reinforcement**
```bash
# Reinforce context in each prompt
"Create login form using .cursor/prompts/component/component-create-form.mdc
Apply .cursor/rules/project-context.mdc

Context reminder: We're building OAuth authentication with NextAuth.js, using shadcn/ui components, and following the existing form patterns in src/components/auth/"
```

3. **Document Key Decisions**
```bash
# Create decision records during development
"Document authentication architecture decisions using .cursor/prompts/documentation/documentation-create-architecture.mdc

Key decisions made:
- Using NextAuth.js for OAuth providers
- JWT tokens stored in httpOnly cookies  
- Role-based access control with middleware
- Session refresh every 24 hours"
```

**Real Example Fix:**
```bash
# Problem: AI keeps asking about styling approach
❌ Repeated context loss: "What styling system should I use?"

# Solution: Create context anchor
✅ "Continue dashboard development using .cursor/prompts/prompt-engineering/prompt-continue-thread.mdc

Established context:
- Styling: TailwindCSS with shadcn/ui components
- State: Zustand for global state, React Query for server state
- Forms: react-hook-form with zod validation
- Testing: Vitest with Testing Library
- Current progress: Layout and navigation complete, working on data tables"
```

---

### **Problem: Quality Gate Failures**

**Symptoms:**
- Code doesn't pass project standards
- Tests fail or have low coverage
- Accessibility issues in components
- Performance problems in generated code
- Security vulnerabilities detected

**Diagnosis:**
```bash
# Check if quality rules are applied
❌ Missing: No quality rules specified
✅ Applied: "Apply .cursor/rules/test-driven.mdc - ensure comprehensive testing"

# Check if appropriate quality prompts used
❌ Skipped: No quality review before commit
✅ Included: "Review code using .cursor/prompts/quality/quality-review-full.mdc"
```

**Solutions:**

1. **Preventive Quality Integration**
```bash
# Apply quality rules during creation
"Create user registration API using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/database-safe.mdc - ensure safe database operations
Apply .cursor/rules/test-driven.mdc - write tests first for critical paths"
```

2. **Multi-Dimensional Quality Review**
```bash
# Comprehensive quality assessment
"Review user authentication system using .cursor/prompts/quality/quality-review-full.mdc

Review dimensions:
- Code quality and maintainability
- Security vulnerabilities and hardening
- Performance and scalability
- Accessibility compliance
- Test coverage and quality"
```

3. **Iterative Quality Improvement**
```bash
# Address specific quality issues
"Fix accessibility issues using .cursor/prompts/quality/quality-review-accessibility.mdc

Issues found: Missing ARIA labels, insufficient color contrast, no keyboard navigation"

# Then validate fixes
"Validate accessibility improvements using .cursor/prompts/test/test-create-comprehensive.mdc
Focus on: ARIA compliance, keyboard navigation, screen reader compatibility"
```

**Real Example Fix:**
```typescript
// Before: Quality issues
export function LoginForm() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  
  const handleSubmit = async () => {
    // No validation, no error handling
    await fetch('/api/auth/login', {
      method: 'POST',
      body: JSON.stringify({ email, password })
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <input 
        type="email" 
        value={email} 
        onChange={(e) => setEmail(e.target.value)} 
      />
      <input 
        type="password" 
        value={password} 
        onChange={(e) => setPassword(e.target.value)} 
      />
      <button type="submit">Login</button>
    </form>
  );
}

// After: Quality improvements applied
export function LoginForm() {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  
  const form = useForm<LoginFormData>({
    resolver: zodResolver(loginSchema),
    defaultValues: { email: '', password: '' }
  });

  const handleSubmit = async (data: LoginFormData) => {
    setIsLoading(true);
    setError(null);
    
    try {
      const result = await signIn('credentials', {
        email: data.email,
        password: data.password,
        redirect: false
      });
      
      if (result?.error) {
        setError('Invalid credentials');
      }
    } catch (error) {
      setError('Login failed. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-4">
      <div>
        <Label htmlFor="email">Email</Label>
        <Input
          id="email"
          type="email"
          {...form.register('email')}
          aria-describedby={form.formState.errors.email ? 'email-error' : undefined}
          aria-invalid={!!form.formState.errors.email}
        />
        {form.formState.errors.email && (
          <p id="email-error" className="text-sm text-red-600" role="alert">
            {form.formState.errors.email.message}
          </p>
        )}
      </div>
      
      <div>
        <Label htmlFor="password">Password</Label>
        <Input
          id="password"
          type="password"
          {...form.register('password')}
          aria-describedby={form.formState.errors.password ? 'password-error' : undefined}
          aria-invalid={!!form.formState.errors.password}
        />
        {form.formState.errors.password && (
          <p id="password-error" className="text-sm text-red-600" role="alert">
            {form.formState.errors.password.message}
          </p>
        )}
      </div>
      
      {error && (
        <Alert variant="destructive">
          <AlertDescription>{error}</AlertDescription>
        </Alert>
      )}
      
      <Button type="submit" disabled={isLoading} className="w-full">
        {isLoading ? 'Signing in...' : 'Sign in'}
      </Button>
    </form>
  );
}
```

---

## 🔄 **Integration Conflicts**

### **Problem: Rule Conflicts**

**Symptoms:**
- Contradictory instructions from multiple rules
- AI seems confused about which approach to take
- Inconsistent code patterns within same feature
- Rules canceling each other out

**Diagnosis:**
```bash
# Check for conflicting rules
❌ Conflict: "Apply .cursor/rules/code-change-minimal.mdc and .cursor/rules/code-change-refactor.mdc"
❌ Conflict: "Apply .cursor/rules/test-driven.mdc" with "Skip testing for now"
```

**Solutions:**

1. **Choose Appropriate Rule for Context**
```bash
# For existing stable codebase
✅ "Apply .cursor/rules/code-change-minimal.mdc - preserve working patterns"

# For systematic improvements
✅ "Apply .cursor/rules/code-change-refactor.mdc - modernize legacy code"

# Never apply both simultaneously
```

2. **Context-Specific Rule Application**
```bash
# New feature in existing codebase
"Create user dashboard using .cursor/prompts/component/component-create-guide.mdc
Apply .cursor/rules/code-change-minimal.mdc - integrate with existing layout system
Apply .cursor/rules/project-context.mdc - follow established component patterns"

# Legacy code modernization
"Refactor authentication system using .cursor/prompts/quality/quality-refactor-legacy.mdc
Apply .cursor/rules/code-change-refactor.mdc - systematic improvement approach
Apply .cursor/rules/test-driven.mdc - add comprehensive tests during refactor"
```

3. **Rule Hierarchy and Precedence**
```bash
# Universal rules (always apply)
project-context.mdc: "Always follow established project patterns"

# Context-specific rules (choose one)
code-change-minimal.mdc OR code-change-refactor.mdc (never both)

# Domain-specific rules (apply when relevant)
database-safe.mdc: "When working with data"
test-driven.mdc: "For critical business logic"
```

**Real Example Fix:**
```bash
# Problem: Conflicting rules causing confusion
❌ "Create user API using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/code-change-minimal.mdc - don't change existing patterns
Apply .cursor/rules/code-change-refactor.mdc - improve code quality"

# Solution: Choose appropriate rule for context
✅ "Create user API using .cursor/prompts/api/api-create-endpoints.mdc
Apply .cursor/rules/code-change-minimal.mdc - integrate with existing API patterns
Apply .cursor/rules/database-safe.mdc - ensure safe database operations
Apply .cursor/rules/project-context.mdc - follow our established API structure"
```

---

### **Problem: Prompt Overloading**

**Symptoms:**
- Single prompt trying to do too much
- Incomplete or rushed implementation
- Missing important details or edge cases
- Poor quality due to scope creep

**Diagnosis:**
```bash
# Check prompt scope
❌ Overloaded: "Create complete e-commerce system with products, cart, checkout, payments, admin panel, and user management"
✅ Focused: "Create product catalog API endpoints using .cursor/prompts/api/api-create-endpoints.mdc"
```

**Solutions:**

1. **Break Into Sequential Workflow**
```bash
# Instead of overloaded prompt
❌ "Create user management with API, UI, tests, docs, and deployment"

# Use proper workflow
✅ Phase 1: "Plan user management architecture using .cursor/prompts/documentation/documentation-create-architecture.mdc"
✅ Phase 2: "Create user API endpoints using .cursor/prompts/api/api-create-endpoints.mdc"
✅ Phase 3: "Create user management UI using .cursor/prompts/component/component-create-guide.mdc"
✅ Phase 4: "Create comprehensive tests using .cursor/prompts/test/test-create-comprehensive.mdc"
✅ Phase 5: "Document user management using .cursor/prompts/documentation/documentation-create-developer.mdc"
```

2. **Use Appropriate Prompt Specialization**
```bash
# Let prompts route to specializations
"Create user registration form using .cursor/prompts/component/component-create-guide.mdc"
# → Routes to component-create-form.mdc automatically

"Create product card component using .cursor/prompts/component/component-create-guide.mdc"  
# → Routes to component-create-card.mdc automatically
```

3. **Scope Boundaries and Success Criteria**
```bash
# Define clear boundaries
"Create user profile API using .cursor/prompts/api/api-create-endpoints.mdc

Scope: 
- GET /api/user/profile (fetch user data)
- PUT /api/user/profile (update profile info)
- POST /api/user/avatar (upload profile picture)

Out of scope:
- Authentication (handled by existing auth system)
- User registration (separate feature)
- Admin user management (different prompt)"
```

---

## 🧪 **Testing and Validation Issues**

### **Problem: Test Failures After Code Generation**

**Symptoms:**
- Generated code doesn't pass existing tests
- New tests fail immediately
- Integration tests break after component changes
- Type errors in test files

**Diagnosis:**
```bash
# Check if tests were considered during generation
❌ Missing: No test context provided
✅ Included: "Apply .cursor/rules/test-driven.mdc - ensure test compatibility"

# Check if existing test patterns were followed
❌ Ignored: Generated tests don't match project patterns
✅ Followed: Tests use established testing utilities and patterns
```

**Solutions:**

1. **Include Test Context in Prompts**
```bash
"Create user profile component using .cursor/prompts/component/component-create-guide.mdc
Apply .cursor/rules/project-context.mdc - follow existing test patterns

Testing context: We use Vitest with Testing Library, custom render utility in test-utils.tsx, MSW for API mocking"
```

2. **Test-First Development**
```bash
# Write tests first, then implement
"Create tests for user registration using .cursor/prompts/test/test-create-comprehensive.mdc
Apply .cursor/rules/test-driven.mdc - write tests before implementation

Requirements: email validation, password strength, duplicate prevention, email verification"

# Then implement to make tests pass
"Implement user registration API using .cursor/prompts/api/api-create-endpoints.mdc

Make the tests we just created pass. Focus on the specific test requirements."
```

3. **Incremental Test Validation**
```bash
# Validate tests at each step
"Create user profile component using .cursor/prompts/component/component-create-guide.mdc"

# Then immediately validate
"Create component tests using .cursor/prompts/test/test-create-component.mdc

Test the UserProfile component we just created. Ensure all props and interactions are covered."
```

**Real Example Fix:**
```typescript
// Problem: Generated component breaks existing tests
// Existing test expects specific prop interface
test('renders user profile with required props', () => {
  render(<UserProfile user={mockUser} onEdit={mockOnEdit} />);
  expect(screen.getByText(mockUser.name)).toBeInTheDocument();
});

// Generated component has different interface
interface UserProfileProps {
  userData: User;  // ❌ Different prop name
  editHandler: () => void;  // ❌ Different prop name
}

// Solution: Provide test context in prompt
"Create user profile component using .cursor/prompts/component/component-create-guide.mdc
Apply .cursor/rules/project-context.mdc - maintain existing test compatibility

Existing test context: Component expects props { user: User, onEdit: () => void }
Must maintain this interface for backward compatibility"

// Result: Compatible component
interface UserProfileProps {
  user: User;  // ✅ Matches existing tests
  onEdit: () => void;  // ✅ Matches existing tests
}
```

---

### **Problem: Performance Issues in Generated Code**

**Symptoms:**
- Slow rendering or excessive re-renders
- Memory leaks in components
- Inefficient database queries
- Large bundle sizes

**Diagnosis:**
```bash
# Check if performance was considered
❌ Missing: No performance requirements specified
✅ Included: "Apply performance optimization patterns"

# Check for common performance anti-patterns
❌ Found: Unnecessary re-renders, missing memoization, inefficient queries
✅ Avoided: Proper optimization techniques applied
```

**Solutions:**

1. **Include Performance Requirements**
```bash
"Create user dashboard using .cursor/prompts/component/component-create-guide.mdc

Performance requirements:
- Initial render < 100ms
- Smooth scrolling for large lists
- Efficient data fetching with caching
- Minimal re-renders on state changes"
```

2. **Use Performance-Focused Quality Review**
```bash
"Review dashboard performance using .cursor/prompts/quality/quality-review-performance.mdc

Focus areas:
- Component rendering efficiency
- Data fetching optimization
- Memory usage patterns
- Bundle size impact"
```

3. **Iterative Performance Optimization**
```bash
# First create functionality
"Create user list component using .cursor/prompts/component/component-create-guide.mdc"

# Then optimize performance
"Optimize user list performance using .cursor/prompts/quality/quality-review-performance.mdc

Current issues: Renders 1000+ items without virtualization, fetches all data at once"
```

**Real Example Fix:**
```typescript
// Before: Performance issues
export function UserList({ users }: { users: User[] }) {
  const [searchTerm, setSearchTerm] = useState('');
  
  // ❌ Filters on every render
  const filteredUsers = users.filter(user => 
    user.name.toLowerCase().includes(searchTerm.toLowerCase())
  );
  
  return (
    <div>
      <input 
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
      />
      {/* ❌ Renders all items without virtualization */}
      {filteredUsers.map(user => (
        <UserCard key={user.id} user={user} />
      ))}
    </div>
  );
}

// After: Performance optimized
export function UserList({ users }: { users: User[] }) {
  const [searchTerm, setSearchTerm] = useState('');
  
  // ✅ Memoized filtering
  const filteredUsers = useMemo(() => 
    users.filter(user => 
      user.name.toLowerCase().includes(searchTerm.toLowerCase())
    ), [users, searchTerm]
  );
  
  // ✅ Debounced search
  const debouncedSearchTerm = useDebounce(searchTerm, 300);
  
  return (
    <div>
      <input 
        value={searchTerm}
        onChange={(e) => setSearchTerm(e.target.value)}
        placeholder="Search users..."
      />
      {/* ✅ Virtualized list for large datasets */}
      <VirtualizedList
        items={filteredUsers}
        itemHeight={80}
        renderItem={({ item }) => <UserCard key={item.id} user={item} />}
      />
    </div>
  );
}
```

---

## 🔧 **Debugging Strategies**

### **Systematic Troubleshooting Approach**

1. **Identify the Problem Category**
```bash
# Prompt execution issues
- Wrong prompt selection
- Insufficient context
- Conflicting requirements

# Quality issues  
- Code doesn't meet standards
- Tests failing
- Performance problems

# Integration issues
- Doesn't work with existing code
- Rule conflicts
- Context preservation problems
```

2. **Gather Diagnostic Information**
```bash
# For prompt issues
- What prompt was used?
- What context was provided?
- What was expected vs actual output?

# For quality issues
- What standards should be met?
- What tests are failing?
- What performance requirements exist?

# For integration issues
- What existing code should integrate with?
- What rules were applied?
- What context was preserved?
```

3. **Apply Targeted Solutions**
```bash
# Prompt fixes
- Use more specific prompts
- Add explicit context
- Break down complex requests

# Quality fixes
- Apply appropriate quality rules
- Use quality review prompts
- Iterate on improvements

# Integration fixes
- Resolve rule conflicts
- Preserve context properly
- Use thread management
```

### **Prevention Strategies**

1. **Proactive Context Management**
```bash
# Always provide sufficient context
"Create [component] using .cursor/prompts/[category]/[prompt].mdc
Apply .cursor/rules/project-context.mdc

Project context: [technology stack, patterns, constraints]
Current work: [what you're building, current status]
Integration needs: [how this fits with existing code]"
```

2. **Quality-First Approach**
```bash
# Include quality considerations from the start
"Create [feature] using .cursor/prompts/[category]/[prompt].mdc
Apply .cursor/rules/[appropriate-safety-rule].mdc

Quality requirements: [performance, security, accessibility]
Testing needs: [coverage requirements, test types]
Standards compliance: [coding standards, best practices]"
```

3. **Iterative Validation**
```bash
# Validate at each step
Step 1: Create feature
Step 2: "Review using .cursor/prompts/quality/quality-review-code.mdc"
Step 3: "Test using .cursor/prompts/test/test-create-comprehensive.mdc"
Step 4: "Final review using .cursor/prompts/quality/quality-review-full.mdc"
```

---

**🎯 Most troubleshooting issues can be prevented by providing sufficient context, using appropriate prompts and rules, and validating results at each step. When problems occur, systematic diagnosis and targeted solutions resolve them efficiently.**

**Next: Review the [Prompt Catalog](../references/references-prompt-catalog.md) for quick prompt selection, or explore [Integration Patterns](../guides/guides-integration.md) for advanced workflow orchestration.** 