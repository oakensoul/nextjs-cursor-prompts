# Testing Standards

This document outlines the comprehensive testing standards for NextJS/TypeScript projects using vitest and modern testing practices.

## Testing Framework Stack

### Core Testing Tools
- **Test Runner**: Vitest 3+ (fast Vite-native testing)
- **DOM Testing**: @testing-library/react + @testing-library/dom
- **Accessibility Testing**: vitest-axe + @axe-core/react
- **User Interactions**: @testing-library/user-event
- **Assertions**: Vitest built-in assertions + @testing-library/jest-dom
- **Coverage**: @vitest/coverage-v8
- **Environment**: jsdom for browser simulation

### Test Configuration Structure
```json
{
  "scripts": {
    "test": "npm run tsc && npm run lint && npm run test:unit && npm run test:a11y && npm run test:integration",
    "test:unit": "vitest run --config vitest.config.mjs --exclude=\"**/*.a11y.test.{ts,tsx}\" --exclude=\"**/*.integration.test.{ts,tsx}\" --exclude=\"**/*.e2e.test.{ts,tsx}\"",
    "test:a11y": "vitest run --config vitest.a11y.config.mjs",
    "test:integration": "vitest run --config vitest.integration.config.mjs",
    "test:e2e": "vitest run --config vitest.config.mjs \"**/*.e2e.test.{ts,tsx}\"",
    "test:watch": "vitest watch --config vitest.config.mjs",
    "test:coverage": "vitest run --config vitest.config.mjs --coverage"
  }
}
```

## Test File Organization

### File Naming Conventions
```
component-name/
├── ComponentName.tsx
└── __tests__/
    ├── ComponentName.test.tsx           # Unit tests
    ├── ComponentName.a11y.test.tsx      # Accessibility tests
    ├── ComponentName.integration.test.tsx # Integration tests
    └── ComponentName.e2e.test.tsx       # End-to-end tests
```

### Test Categories

#### Unit Tests (`.test.tsx`)
- **Purpose**: Test individual component behavior in isolation
- **Scope**: Single component, hook, or utility function
- **Dependencies**: Mock external dependencies
- **Coverage Target**: 80%+ line coverage

#### Accessibility Tests (`.a11y.test.tsx`)
- **Purpose**: Ensure WCAG compliance and screen reader compatibility
- **Scope**: UI components and user interactions
- **Tools**: vitest-axe, keyboard navigation testing
- **Coverage Target**: All interactive components

#### Integration Tests (`.integration.test.tsx`)
- **Purpose**: Test component interactions and data flow
- **Scope**: Multiple components working together
- **Dependencies**: Real API calls or service integration
- **Coverage Target**: Critical user paths

#### End-to-End Tests (`.e2e.test.tsx`)
- **Purpose**: Test complete user workflows
- **Scope**: Full application features from user perspective
- **Dependencies**: Real browser environment
- **Coverage Target**: Core business functionality

## Unit Testing Standards

### Basic Component Test Structure
```typescript
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { describe, it, expect, vi } from 'vitest';
import { Button } from '../Button';

describe('Button Component', () => {
  it('renders with correct text', () => {
    render(<Button>Click me</Button>);
    expect(screen.getByRole('button', { name: 'Click me' })).toBeInTheDocument();
  });

  it('calls onClick handler when clicked', async () => {
    const handleClick = vi.fn();
    const user = userEvent.setup();
    
    render(<Button onClick={handleClick}>Click me</Button>);
    
    await user.click(screen.getByRole('button'));
    
    expect(handleClick).toHaveBeenCalledOnce();
  });

  it('shows loading state correctly', () => {
    render(<Button loading>Submit</Button>);
    
    expect(screen.getByRole('button')).toBeDisabled();
    expect(screen.getByText('Loading...')).toBeInTheDocument();
  });
});
```

### Testing Hooks
```typescript
import { renderHook, act } from '@testing-library/react';
import { describe, it, expect, vi } from 'vitest';
import { useCounter } from '../useCounter';

describe('useCounter Hook', () => {
  it('initializes with default value', () => {
    const { result } = renderHook(() => useCounter());
    expect(result.current.count).toBe(0);
  });

  it('increments count correctly', () => {
    const { result } = renderHook(() => useCounter());
    
    act(() => {
      result.current.increment();
    });
    
    expect(result.current.count).toBe(1);
  });
});
```

### Testing Forms
```typescript
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { describe, it, expect, vi } from 'vitest';
import { LoginForm } from '../LoginForm';

describe('LoginForm Component', () => {
  it('submits form with valid data', async () => {
    const handleSubmit = vi.fn();
    const user = userEvent.setup();
    
    render(<LoginForm onSubmit={handleSubmit} />);
    
    await user.type(screen.getByLabelText(/email/i), 'user@example.com');
    await user.type(screen.getByLabelText(/password/i), 'password123');
    await user.click(screen.getByRole('button', { name: /sign in/i }));
    
    expect(handleSubmit).toHaveBeenCalledWith({
      email: 'user@example.com',
      password: 'password123'
    });
  });

  it('shows validation errors for invalid input', async () => {
    const user = userEvent.setup();
    
    render(<LoginForm onSubmit={vi.fn()} />);
    
    await user.click(screen.getByRole('button', { name: /sign in/i }));
    
    expect(screen.getByText(/email is required/i)).toBeInTheDocument();
    expect(screen.getByText(/password is required/i)).toBeInTheDocument();
  });
});
```

## Accessibility Testing Standards

### Basic A11y Test Structure
```typescript
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { describe, it, expect } from 'vitest';
import { expectNoA11yViolations } from 'vitest-axe';
import { Modal } from '../Modal';

describe('Modal Accessibility', () => {
  it('has no accessibility violations', async () => {
    const { container } = render(
      <Modal isOpen title="Test Modal">
        <p>Modal content</p>
      </Modal>
    );
    
    await expectNoA11yViolations(container);
  });

  it('traps focus within modal', async () => {
    const user = userEvent.setup();
    
    render(
      <Modal isOpen title="Test Modal">
        <input placeholder="First input" />
        <input placeholder="Second input" />
        <button>Close</button>
      </Modal>
    );
    
    const firstInput = screen.getByPlaceholderText('First input');
    const closeButton = screen.getByRole('button', { name: 'Close' });
    
    // Tab through all focusable elements
    await user.tab();
    expect(firstInput).toHaveFocus();
    
    await user.tab();
    await user.tab();
    expect(closeButton).toHaveFocus();
    
    // Should wrap to first element
    await user.tab();
    expect(firstInput).toHaveFocus();
  });

  it('handles keyboard navigation correctly', async () => {
    const handleClose = vi.fn();
    const user = userEvent.setup();
    
    render(
      <Modal isOpen onClose={handleClose} title="Test Modal">
        <p>Content</p>
      </Modal>
    );
    
    await user.keyboard('{Escape}');
    expect(handleClose).toHaveBeenCalled();
  });
});
```

### Screen Reader Testing
```typescript
describe('Screen Reader Compatibility', () => {
  it('announces dynamic content changes', async () => {
    const user = userEvent.setup();
    
    render(<SearchResults />);
    
    await user.type(screen.getByRole('searchbox'), 'typescript');
    
    // Wait for results to load
    await screen.findByText(/3 results found/i);
    
    // Check that status is announced to screen readers
    expect(screen.getByRole('status')).toHaveTextContent('3 results found');
  });

  it('provides proper form labeling', () => {
    render(<ContactForm />);
    
    expect(screen.getByLabelText(/full name/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/email address/i)).toBeInTheDocument();
    expect(screen.getByLabelText(/message/i)).toBeInTheDocument();
  });
});
```

## Integration Testing Standards

### API Integration Tests
```typescript
import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { describe, it, expect, beforeEach, vi } from 'vitest';
import { rest } from 'msw';
import { setupServer } from 'msw/node';
import { UserProfile } from '../UserProfile';

const server = setupServer(
  rest.get('/api/user/123', (req, res, ctx) => {
    return res(ctx.json({
      id: '123',
      name: 'John Doe',
      email: 'john@example.com'
    }));
  }),
  
  rest.put('/api/user/123', (req, res, ctx) => {
    return res(ctx.json({ success: true }));
  })
);

beforeEach(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());

describe('UserProfile Integration', () => {
  it('loads and displays user data', async () => {
    render(<UserProfile userId="123" />);
    
    await waitFor(() => {
      expect(screen.getByText('John Doe')).toBeInTheDocument();
      expect(screen.getByText('john@example.com')).toBeInTheDocument();
    });
  });

  it('updates user profile successfully', async () => {
    const user = userEvent.setup();
    
    render(<UserProfile userId="123" editable />);
    
    // Wait for data to load
    await waitFor(() => {
      expect(screen.getByDisplayValue('John Doe')).toBeInTheDocument();
    });
    
    // Edit the name
    await user.clear(screen.getByDisplayValue('John Doe'));
    await user.type(screen.getByDisplayValue(''), 'Jane Doe');
    await user.click(screen.getByRole('button', { name: /save/i }));
    
    await waitFor(() => {
      expect(screen.getByText(/profile updated successfully/i)).toBeInTheDocument();
    });
  });
});
```

### Multi-Component Workflow Tests
```typescript
describe('Authentication Workflow', () => {
  it('completes full login flow', async () => {
    const user = userEvent.setup();
    
    render(<App />);
    
    // Navigate to login
    await user.click(screen.getByRole('link', { name: /sign in/i }));
    
    // Fill login form
    await user.type(screen.getByLabelText(/email/i), 'user@example.com');
    await user.type(screen.getByLabelText(/password/i), 'password123');
    await user.click(screen.getByRole('button', { name: /sign in/i }));
    
    // Verify successful login
    await waitFor(() => {
      expect(screen.getByText(/welcome back/i)).toBeInTheDocument();
      expect(screen.getByRole('button', { name: /sign out/i })).toBeInTheDocument();
    });
  });
});
```

## Mocking Strategy

### Vitest Mocking Philosophy

**Co-located by default** with strategic exceptions for global dependencies. Vitest's native ES module support and improved HMR make co-located mocks cleaner and more maintainable than traditional centralized approaches.

### Mock Organization Structure

```
src/
├── __mocks__/                      # Global mocks only
│   ├── next/
│   │   └── navigation.ts          # Next.js router mocking
│   └── window.ts                   # Global browser APIs
├── components/
│   ├── Button/
│   │   ├── Button.tsx
│   │   └── __tests__/
│   │       ├── Button.test.tsx     # Inline mocks for this component
│   │       └── Button.a11y.test.tsx
│   └── ComplexForm/
│       ├── ComplexForm.tsx
│       └── __tests__/
│           ├── ComplexForm.test.tsx
│           ├── __mocks__/          # Component-specific reusable mocks
│           │   └── child-components.ts
│           └── ComplexForm.a11y.test.tsx
└── test/
    ├── utils/
    │   ├── test-utils.tsx          # Custom render functions
    │   └── msw-handlers.ts         # MSW request handlers
    └── setup.ts                    # Global test setup
```

### 1. Inline Mocks (Preferred for Most Cases)

Use `vi.mock()` directly in test files for component-specific mocking:

```typescript
// components/UserProfile/__tests__/UserProfile.test.tsx
import { vi } from 'vitest';
import { render, screen } from '@testing-library/react';
import { UserProfile } from '../UserProfile';

// Mock child component inline
vi.mock('../components/Avatar', () => ({
  Avatar: ({ src, alt }: { src: string; alt: string }) => (
    <img data-testid="mocked-avatar" src={src} alt={alt} />
  )
}));

// Mock API utility inline
vi.mock('@/lib/api', () => ({
  fetchUser: vi.fn(() => Promise.resolve({
    id: '123',
    name: 'Test User',
    email: 'test@example.com'
  }))
}));

describe('UserProfile', () => {
  it('renders user information correctly', async () => {
    render(<UserProfile userId="123" />);
    
    expect(await screen.findByText('Test User')).toBeInTheDocument();
    expect(screen.getByTestId('mocked-avatar')).toBeInTheDocument();
  });
});
```

### 2. Hoisted Mocks for Module-Level Dependencies

Use `vi.hoisted()` for mocks that need to be available before other imports:

```typescript
// components/LoginForm/__tests__/LoginForm.test.tsx
import { vi } from 'vitest';

const mockPush = vi.fn();
const mockReplace = vi.fn();

vi.hoisted(() => {
  vi.mock('next/navigation', () => ({
    useRouter: () => ({
      push: mockPush,
      replace: mockReplace,
      back: vi.fn(),
      forward: vi.fn(),
      refresh: vi.fn(),
    }),
    usePathname: () => '/login',
    useSearchParams: () => new URLSearchParams(),
  }));
});

import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { LoginForm } from '../LoginForm';

describe('LoginForm', () => {
  beforeEach(() => {
    mockPush.mockClear();
    mockReplace.mockClear();
  });

  it('redirects to dashboard after successful login', async () => {
    const user = userEvent.setup();
    
    render(<LoginForm />);
    
    await user.type(screen.getByLabelText(/email/i), 'test@example.com');
    await user.type(screen.getByLabelText(/password/i), 'password123');
    await user.click(screen.getByRole('button', { name: /sign in/i }));
    
    expect(mockPush).toHaveBeenCalledWith('/dashboard');
  });
});
```

### 3. Component-Specific Mock Files

For complex components that need reusable mocks across multiple test files:

```typescript
// components/Dashboard/__tests__/__mocks__/chart-components.ts
import { vi } from 'vitest';

export const mockChartComponents = {
  LineChart: ({ data }: { data: any[] }) => (
    <div data-testid="line-chart" data-points={data.length}>
      Line Chart Mock
    </div>
  ),
  BarChart: ({ data }: { data: any[] }) => (
    <div data-testid="bar-chart" data-points={data.length}>
      Bar Chart Mock
    </div>
  ),
  PieChart: ({ data }: { data: any[] }) => (
    <div data-testid="pie-chart" data-points={data.length}>
      Pie Chart Mock
    </div>
  ),
};

// Usage in test files
// components/Dashboard/__tests__/Dashboard.test.tsx
import { vi } from 'vitest';
import { mockChartComponents } from './__mocks__/chart-components';

vi.mock('recharts', () => mockChartComponents);

// Test implementation...
```

### 4. MSW for API Mocking

Use Mock Service Worker for realistic API testing:

```typescript
// test/utils/msw-handlers.ts
import { http, HttpResponse } from 'msw';

export const handlers = [
  // Auth endpoints
  http.post('/api/auth/login', ({ request }) => {
    return HttpResponse.json({
      success: true,
      user: { id: '123', name: 'Test User' },
      token: 'mock-jwt-token'
    });
  }),

  // User endpoints
  http.get('/api/users/:id', ({ params }) => {
    return HttpResponse.json({
      id: params.id,
      name: 'Test User',
      email: 'test@example.com'
    });
  }),

  // Error simulation
  http.get('/api/users/error', () => {
    return HttpResponse.json(
      { error: 'User not found' },
      { status: 404 }
    );
  }),
];

// Usage in integration tests
// components/UserList/__tests__/UserList.integration.test.tsx
import { setupServer } from 'msw/node';
import { handlers } from '@/test/utils/msw-handlers';

const server = setupServer(...handlers);

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());

describe('UserList Integration', () => {
  it('loads and displays users from API', async () => {
    render(<UserList />);
    
    expect(await screen.findByText('Test User')).toBeInTheDocument();
  });
});
```

### 5. Global Mocks (Minimal Use)

Only for APIs used across the entire application:

```typescript
// __mocks__/next/navigation.ts
import { vi } from 'vitest';

const mockRouter = {
  push: vi.fn(),
  replace: vi.fn(),
  back: vi.fn(),
  forward: vi.fn(),
  refresh: vi.fn(),
};

export const useRouter = vi.fn(() => mockRouter);
export const usePathname = vi.fn(() => '/');
export const useSearchParams = vi.fn(() => new URLSearchParams());

// __mocks__/window.ts
import { vi } from 'vitest';

Object.defineProperty(window, 'matchMedia', {
  writable: true,
  value: vi.fn().mockImplementation(query => ({
    matches: false,
    media: query,
    onchange: null,
    addListener: vi.fn(),
    removeListener: vi.fn(),
    addEventListener: vi.fn(),
    removeEventListener: vi.fn(),
    dispatchEvent: vi.fn(),
  })),
});

Object.defineProperty(window, 'localStorage', {
  value: {
    getItem: vi.fn(),
    setItem: vi.fn(),
    removeItem: vi.fn(),
    clear: vi.fn(),
  },
  writable: true,
});
```

### Mocking Best Practices

#### DO: Mock at Abstraction Boundaries
```typescript
// ✅ Good - Mock at the service boundary
vi.mock('@/services/api/users', () => ({
  fetchUser: vi.fn(() => Promise.resolve({ id: '123', name: 'Test' })),
  updateUser: vi.fn(() => Promise.resolve({ success: true }))
}));
```

#### DON'T: Mock Implementation Details
```typescript
// ❌ Bad - Mocking internal React hooks
vi.mock('react', () => ({
  ...vi.importActual('react'),
  useState: vi.fn()
}));
```

#### DO: Use Targeted Mocks
```typescript
// ✅ Good - Mock specific functions
vi.mock('axios', async () => {
  const actual = await vi.importActual('axios');
  return {
    ...actual,
    get: vi.fn(() => Promise.resolve({ data: { message: 'success' } })),
    post: vi.fn(() => Promise.resolve({ data: { id: 123 } }))
  };
});
```

#### DON'T: Mock Entire Modules Unnecessarily
```typescript
// ❌ Bad - Over-mocking entire module
vi.mock('lodash', () => ({
  debounce: vi.fn((fn) => fn),
  throttle: vi.fn((fn) => fn),
  // ... mocking functions you don't need
}));
```

#### DO: Clean Up Mocks Between Tests
```typescript
// ✅ Good - Proper cleanup
describe('Component', () => {
  const mockFetch = vi.fn();
  
  beforeEach(() => {
    mockFetch.mockClear();
    vi.clearAllMocks();
  });
  
  afterEach(() => {
    vi.restoreAllMocks();
  });
});
```

#### DO: Use Scoped Blocks for Isolated Setup
```typescript
// ✅ Good - Scoped mock setup
describe('UserProfile', () => {
  it('handles loading state', () => {
    {
      // Scoped block for loading test
      const mockFetch = vi.fn(() => new Promise(() => {})); // Never resolves
      vi.mocked(apiClient.fetchUser).mockImplementation(mockFetch);
      
      render(<UserProfile userId="123" />);
      expect(screen.getByText('Loading...')).toBeInTheDocument();
    }
  });

  it('handles success state', () => {
    {
      // Scoped block for success test  
      const mockData = { id: '123', name: 'John Doe' };
      vi.mocked(apiClient.fetchUser).mockResolvedValue(mockData);
      
      render(<UserProfile userId="123" />);
      expect(screen.getByText('John Doe')).toBeInTheDocument();
    }
  });
});
```

### Mock Organization Decision Matrix

| Mock Type | Location | Use Case | Example |
|-----------|----------|----------|---------|
| **Inline Mocks** | Test file | Component-specific, one-time use | Mock child component for unit test |
| **Hoisted Mocks** | Test file | Module dependencies | Next.js router, environment variables |
| **Component Mocks** | `__tests__/__mocks__/` | Reusable across test files | Complex chart libraries, heavy components |
| **MSW Handlers** | `test/utils/` | API integration testing | HTTP request/response simulation |
| **Global Mocks** | `__mocks__/` | App-wide dependencies | Browser APIs, framework utilities |

This strategy leverages Vitest's strengths while maintaining clear test isolation and avoiding the pitfalls of over-mocking common in Jest-based projects.

## Test Utilities and Setup

### Custom Test Utilities
```typescript
// test-utils.tsx
import React from 'react';
import { render, RenderOptions } from '@testing-library/react';
import { ThemeProvider } from 'next-themes';
import { SWRConfig } from 'swr';

interface CustomRenderOptions extends Omit<RenderOptions, 'wrapper'> {
  theme?: 'light' | 'dark';
  swrConfig?: any;
}

function customRender(
  ui: React.ReactElement,
  options: CustomRenderOptions = {}
) {
  const { theme = 'light', swrConfig = {}, ...renderOptions } = options;

  function Wrapper({ children }: { children: React.ReactNode }) {
    return (
      <ThemeProvider attribute="class" defaultTheme={theme}>
        <SWRConfig value={{ dedupingInterval: 0, ...swrConfig }}>
          {children}
        </SWRConfig>
      </ThemeProvider>
    );
  }

  return render(ui, { wrapper: Wrapper, ...renderOptions });
}

export * from '@testing-library/react';
export { customRender as render };
```

### Mock Factories
```typescript
// test-factories.ts
export const createMockUser = (overrides: Partial<User> = {}): User => ({
  id: '123',
  name: 'Test User',
  email: 'test@example.com',
  role: 'user',
  createdAt: new Date().toISOString(),
  ...overrides
});

export const createMockApiResponse = <T>(data: T, success = true) => ({
  success,
  data: success ? data : undefined,
  error: success ? undefined : { code: 'ERROR', message: 'Test error' }
});
```

### Setup Files
```typescript
// vitest.setup.ts
import '@testing-library/jest-dom';
import { expect, afterEach } from 'vitest';
import { cleanup } from '@testing-library/react';
import { expectNoA11yViolations } from 'vitest-axe';

// Extend vitest expectations
expect.extend({
  expectNoA11yViolations
});

// Cleanup after each test
afterEach(() => {
  cleanup();
});

// Mock Next.js router
vi.mock('next/navigation', () => ({
  useRouter: () => ({
    push: vi.fn(),
    replace: vi.fn(),
    back: vi.fn(),
    forward: vi.fn(),
    refresh: vi.fn(),
  }),
  usePathname: () => '/',
  useSearchParams: () => new URLSearchParams(),
}));
```

## Coverage Standards

### Coverage Targets
- **Unit Tests**: 80%+ line coverage
- **Integration Tests**: 100% of critical user paths
- **Accessibility Tests**: 100% of interactive components
- **E2E Tests**: 100% of core business functionality

### Coverage Configuration
```typescript
// vitest.config.mjs
export default defineConfig({
  test: {
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      exclude: [
        'node_modules/',
        'src/test/',
        '**/*.d.ts',
        '**/*.config.*',
        'coverage/**'
      ],
      thresholds: {
        global: {
          branches: 80,
          functions: 80,
          lines: 80,
          statements: 80
        }
      }
    }
  }
});
```

## Testing Best Practices

### What to Test
- [ ] Component renders without crashing
- [ ] Props are handled correctly
- [ ] User interactions work as expected
- [ ] Error states are handled properly
- [ ] Loading states display correctly
- [ ] Accessibility requirements are met
- [ ] Form validation works correctly
- [ ] API integrations function properly

### What NOT to Test
- [ ] Implementation details (internal state)
- [ ] Third-party library internals
- [ ] CSS styling (unless functionally relevant)
- [ ] Browser-specific APIs (mock them instead)

### Testing Anti-Patterns to Avoid
- [ ] Testing implementation details instead of behavior
- [ ] Over-mocking (mock only what you need)
- [ ] Writing tests that duplicate functionality
- [ ] Ignoring accessibility in tests
- [ ] Not testing error conditions
- [ ] Skipping integration between components

## Continuous Integration

### Pre-commit Hooks
```json
{
  "scripts": {
    "precommit": "npm run update-scripts && npm run test && npm run test:coverage && npm run build"
  }
}
```

### CI Pipeline Requirements
1. **Type Checking**: `npm run tsc`
2. **Linting**: `npm run lint`
3. **Unit Tests**: `npm run test:unit`
4. **Accessibility Tests**: `npm run test:a11y`
5. **Integration Tests**: `npm run test:integration`
6. **Coverage Check**: `npm run test:coverage`
7. **Build Verification**: `npm run build`

This comprehensive testing strategy ensures code quality, accessibility compliance, and user experience reliability across all projects. 