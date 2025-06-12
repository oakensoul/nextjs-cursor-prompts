# Architecture Standards

This document defines the architectural guidelines for NextJS/TypeScript projects using this prompt collection.

## Project Architecture Overview

### NextJS 15 App Router Architecture
```
src/
├── app/                        # Next.js 15 App Router
│   ├── (marketing)/           # Public-facing route group
│   │   ├── page.tsx          # Home page
│   │   ├── world/            # World information
│   │   └── events/           # Public events
│   ├── (dashboard)/          # Protected dashboard routes
│   │   ├── profile/          # Profile management
│   │   ├── characters/       # Character management
│   │   └── events/           # Event registration
│   ├── auth/                 # Authentication flows
│   │   ├── login/
│   │   ├── register/
│   │   └── reset/
│   ├── support/              # Support pages
│   │   ├── safety/
│   │   ├── faq/
│   │   └── contact/
│   ├── company/              # Company information
│   │   ├── about/
│   │   ├── contact/
│   │   └── team/
│   ├── legal/                # Legal documents
│   │   ├── privacy/
│   │   ├── terms/
│   │   └── cookies/
│   ├── api/                  # API routes
│   │   ├── auth/
│   │   ├── users/
│   │   └── webhook/
│   ├── globals.css           # Global styles
│   ├── layout.tsx            # Root layout
│   ├── loading.tsx           # Global loading UI
│   ├── error.tsx             # Global error UI
│   ├── not-found.tsx         # 404 page
│   └── page.tsx              # Home page
├── components/               # React components
├── actions/                  # Server actions
├── services/                 # API services and business logic
├── config/                   # Configuration management
├── lib/                      # Utility libraries
├── hooks/                    # Custom React hooks
├── types/                    # TypeScript definitions
├── data/                     # Static data
└── styles/                   # Additional styles
```

## Component Architecture

### Component Organization Strategy
```
components/
├── catalyst/                 # Third-party Catalyst UI components (EXTEND ONLY)
│   ├── ui/                  # Core UI components from Catalyst
│   │   ├── button.tsx
│   │   ├── input.tsx
│   │   ├── select.tsx
│   │   └── ...
│   ├── layout/              # Layout components from Catalyst
│   │   ├── sidebar.tsx
│   │   ├── navbar.tsx
│   │   └── ...
│   ├── icons/               # Icon components from Catalyst
│   ├── README.md            # Catalyst documentation
│   └── CHANGELOG.md         # Catalyst version history
│
├── client/                  # Client-side components
│   ├── ui/                 # Interactive UI components
│   │   ├── button/
│   │   │   ├── Button.tsx
│   │   │   └── __tests__/
│   │   │       └── Button.test.tsx
│   │   ├── input/
│   │   │   ├── Input.tsx
│   │   │   └── __tests__/
│   │   │       └── Input.test.tsx
│   │   └── modal/
│   │       ├── Modal.tsx
│   │       └── __tests__/
│   │           └── Modal.test.tsx
│   ├── forms/              # Form components
│   │   ├── login-form/
│   │   │   ├── LoginForm.tsx
│   │   │   └── __tests__/
│   │   │       └── LoginForm.test.tsx
│   │   └── register-form/
│   │       ├── RegisterForm.tsx
│   │       └── __tests__/
│   │           └── RegisterForm.test.tsx
│   └── navigation/         # Interactive navigation
│       ├── user-menu/
│       │   ├── UserMenu.tsx
│       │   └── __tests__/
│       │       └── UserMenu.test.tsx
│       └── dropdown/
│           ├── Dropdown.tsx
│           └── __tests__/
│               └── Dropdown.test.tsx
│
└── server/                 # Server-side and shared components
    ├── layout/             # Layout components
    │   ├── header/
    │   │   ├── Header.tsx
    │   │   └── __tests__/
    │   │       └── Header.test.tsx
    │   └── footer/
    │       ├── Footer.tsx
    │       └── __tests__/
    │           └── Footer.test.tsx
    ├── cards/              # Static card components
    │   ├── character-card/
    │   │   ├── CharacterCard.tsx
    │   │   └── __tests__/
    │   │       └── CharacterCard.test.tsx
    │   └── event-card/
    │       ├── EventCard.tsx
    │       └── __tests__/
    │           └── EventCard.test.tsx
    ├── marketing/          # Marketing components
    │   ├── hero/
    │   │   ├── Hero.tsx
    │   │   └── __tests__/
    │   │       └── Hero.test.tsx
    │   └── features/
    │       ├── Features.tsx
    │       └── __tests__/
    │           └── Features.test.tsx
    ├── icons/              # Shared icon components
    │   ├── social-icons/
    │   │   ├── SocialIcons.tsx
    │   │   └── __tests__/
    │   │       └── SocialIcons.test.tsx
    │   └── user-icon/
    │       ├── UserIcon.tsx
    │       └── __tests__/
    │           └── UserIcon.test.tsx
    └── utils/              # Shared utility components
        ├── app-link/
        │   ├── AppLink.tsx
        │   └── __tests__/
        │       └── AppLink.test.tsx
        └── back-header/
            ├── BackHeader.tsx
            └── __tests__/
                └── BackHeader.test.tsx
```

### Component Decision Matrix

| Component Type | Location | Characteristics | Use Cases |
|----------------|----------|-----------------|-----------|
| **Catalyst Components** | `components/catalyst/` | Third-party, extend only | Base UI system, proven components |
| **Client Components** | `components/client/` | Interactive, hooks, browser APIs | Forms, modals, interactive UI |
| **Server Components** | `components/server/` | Static, data fetching, SEO-focused | Marketing pages, data display |
| **UI Primitives** | `components/client/ui/` | Reusable, design system | Buttons, inputs, cards |
| **Layout Components** | `components/*/layout/` | Page structure, wrapping | Headers, sidebars, page layouts |

### Component Naming and Structure Standards

1. **File Naming:**
   - PascalCase for component files (e.g., `Button.tsx`, `UserProfile.tsx`)
   - PascalCase for component names (e.g., `Button`, `UserProfile`)
   - Each component should have its own directory with kebab-case name
   - Test files should match component name with `.test.tsx` or `.a11y.test.tsx` suffix

2. **Directory Structure:**
   - Components organized by type (client/server) and third-party (catalyst)
   - Use kebab-case for directory names
   - Each component directory should contain:
     ```
     component-name/
     ├── ComponentName.tsx        # Main component (PascalCase)
     ├── __tests__/              # Test directory
     │   ├── ComponentName.test.tsx
     │   └── ComponentName.a11y.test.tsx
     ├── components/             # Child components (if needed)
     └── hooks/                  # Component-specific hooks (if needed)
     ```

3. **Catalyst Component Guidelines:**
   - **EXTEND ONLY**: Never modify files in `components/catalyst/`
   - Create wrapper components in appropriate `client/` or `server/` directories
   - Use Catalyst components as base for custom implementations
   - Maintain ability to fallback to original Catalyst behavior
   - Example:
     ```typescript
     // ✅ Good - Extend Catalyst component
     import { Button as CatalystButton } from '@/components/catalyst/ui/button'
     
     export function CustomButton(props) {
       return <CatalystButton className="custom-styles" {...props} />
     }
     
     // ❌ Bad - Modify Catalyst component directly
     // Never edit files in components/catalyst/
     ```

4. **Import/Export Standards:**
   - Use named exports for components
   - Import paths should use kebab-case for directories
   - Example: `import { Button } from '@/components/client/ui/button/Button'`
   - **No Barrel Files**: Import directly from specific files for better tree-shaking

5. **Testing Requirements:**
   - All tests co-located in `__tests__/` subdirectories
   - Unit tests: `*.test.tsx`
   - Accessibility tests: `*.a11y.test.tsx`
   - Use centralized mocks from test utilities

## Server Actions Architecture

### Server Actions Organization
```
src/actions/
├── auth/                    # Authentication actions
│   ├── login.ts            # Login form submission
│   ├── register.ts         # Registration form submission
│   └── reset-password.ts   # Password reset action
├── characters/             # Character management actions
│   ├── create.ts          # Character creation
│   ├── update.ts          # Character updates
│   └── delete.ts          # Character deletion
├── events/                 # Event management actions
│   ├── register.ts        # Event registration
│   ├── unregister.ts      # Event unregistration
│   └── update.ts          # Event updates
└── profile/                # Profile management actions
    ├── update.ts          # Profile updates
    ├── update-settings.ts # Settings updates
    └── update-preferences.ts # Preferences updates
```

### Server Action Implementation Pattern
```typescript
// actions/auth/login.ts
'use server'

import { z } from 'zod'
import { redirect } from 'next/navigation'
import { createSession } from '@/services/auth'

const LoginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
})

export async function loginAction(formData: FormData) {
  const validatedFields = LoginSchema.safeParse({
    email: formData.get('email'),
    password: formData.get('password'),
  })

  if (!validatedFields.success) {
    return {
      errors: validatedFields.error.flatten().fieldErrors,
    }
  }

  const { email, password } = validatedFields.data

  try {
    const user = await authenticateUser(email, password)
    await createSession(user.id)
    redirect('/dashboard')
  } catch (error) {
    return {
      message: 'Invalid credentials'
    }
  }
}
```

## Data Management Architecture

### Services Organization
```
src/services/
├── api/
│   └── strapi/
│       ├── base/
│       │   └── StrapiBaseClient.ts      # Base client with common functionality
│       ├── auth/
│       │   └── StrapiAuthServiceClient.ts  # Authentication operations
│       ├── public/
│       │   └── StrapiPublicClient.ts    # No-auth client for public access
│       └── types/
│           ├── auth.ts                  # Auth-related types
│           ├── entities.ts              # Entity types
│           ├── requests.ts              # Request types
│           └── responses.ts             # Response types
├── auth/
│   ├── token.ts            # JWT token management
│   └── session.ts          # Session management
├── characters/
│   ├── characters.ts       # Character business logic
│   └── validation.ts       # Character validation schemas
├── events/
│   ├── events.ts          # Event business logic
│   └── registration.ts    # Event registration logic
└── profile/
    ├── profile.ts         # Profile business logic
    └── settings.ts        # Settings management
```

### Multi-Client Strapi Architecture

#### Base Client (`StrapiBaseClient`)
```typescript
// services/api/strapi/base/StrapiBaseClient.ts
export abstract class StrapiBaseClient {
  protected baseURL: string
  protected headers: Record<string, string>

  constructor() {
    this.baseURL = process.env.STRAPI_URL || 'http://localhost:1337'
    this.headers = {
      'Content-Type': 'application/json',
    }
  }

  protected async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
    // Common request handling, error management, logging
  }

  protected validateResponse<T>(data: unknown): T {
    // Response validation and transformation
  }
}
```

#### Authentication Client (`StrapiAuthServiceClient`)
```typescript
// services/api/strapi/auth/StrapiAuthServiceClient.ts
export class StrapiAuthServiceClient extends StrapiBaseClient {
  async login(identifier: string, password: string) {
    return this.request('/auth/local', {
      method: 'POST',
      body: JSON.stringify({ identifier, password }),
    })
  }

  async register(userData: RegisterData) {
    return this.request('/auth/local/register', {
      method: 'POST',
      body: JSON.stringify(userData),
    })
  }

  async forgotPassword(email: string) {
    return this.request('/auth/forgot-password', {
      method: 'POST',
      body: JSON.stringify({ email }),
    })
  }
}
```

#### Public Client (`StrapiPublicClient`)
```typescript
// services/api/strapi/public/StrapiPublicClient.ts
export class StrapiPublicClient extends StrapiBaseClient {
  async find<T>(path: string, query?: Record<string, any>): Promise<T> {
    const searchParams = query ? `?${new URLSearchParams(query)}` : ''
    return this.request(`/api${path}${searchParams}`)
  }

  async findOne<T>(path: string, id: number): Promise<T> {
    return this.request(`/api${path}/${id}`)
  }
}
```

#### Authenticated Client (`StrapiClient`)
```typescript
// services/api/strapi/StrapiClient.ts
export class StrapiClient extends StrapiBaseClient {
  constructor(private token: string) {
    super()
    this.headers.Authorization = `Bearer ${token}`
  }

  async create<T>(path: string, data: any): Promise<T> {
    return this.request(`/api${path}`, {
      method: 'POST',
      body: JSON.stringify({ data }),
    })
  }

  async update<T>(path: string, id: number, data: any): Promise<T> {
    return this.request(`/api${path}/${id}`, {
      method: 'PUT',
      body: JSON.stringify({ data }),
    })
  }

  async delete(path: string, id: number): Promise<void> {
    return this.request(`/api${path}/${id}`, {
      method: 'DELETE',
    })
  }
}
```

## Configuration Management Architecture

### Configuration Organization
```
src/config/
├── auth.ts              # Application auth configuration
├── api.ts               # Application API configuration
├── theme.ts             # Application theme configuration
├── routes.ts            # Application route configuration
├── constants.ts         # Application constants
└── logging/             # Service-specific configs
    ├── development.json # Development logging config
    ├── production.json  # Production logging config
    └── test.json        # Test logging config
```

### Configuration Standards

1. **Application Configs (.ts files):**
   - Core application configuration files go in `src/config/`
   - Handle application-level settings like auth, API, theme, etc.
   - TypeScript files for type safety and better IDE support

2. **Service Configs (.json files):**
   - Service-specific configurations in `src/config/[service]/`
   - Environment-specific JSON files for static configurations
   - Better environment-specific configuration management

3. **Configuration Implementation:**
```typescript
// config/auth.ts
export const authConfig = {
  jwtSecret: process.env.JWT_SECRET!,
  sessionDuration: 24 * 60 * 60, // 24 hours
  cookieName: 'session',
  secureCookie: process.env.NODE_ENV === 'production',
} as const

// config/api.ts
export const apiConfig = {
  strapi: {
    url: process.env.STRAPI_URL!,
    token: process.env.STRAPI_API_TOKEN!,
  },
  rateLimit: {
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100, // limit each IP to 100 requests per windowMs
  },
} as const
```

## Data Flow Architecture

### State Management Strategy
```typescript
// Global State (Minimal)
- Authentication state (JWT tokens)
- Theme preferences
- User preferences

// Server State (SWR)
- API data fetching via Strapi clients
- Cache management
- Background revalidation

// Server Actions
- Form submissions
- Data mutations
- Authentication flows

// Local State (useState/useReducer)
- Form data
- UI state (modals, dropdowns)
- Component-specific state
```

### Data Fetching Patterns

#### Server Components with Strapi Public Client
```typescript
// app/dashboard/page.tsx
import { strapiPublic } from '@/services/api/strapi'

export default async function DashboardPage() {
  const events = await strapiPublic.find('/events', {
    populate: '*',
    filters: { published: true }
  })
  
  return (
    <DashboardLayout>
      <EventList initialData={events} />
    </DashboardLayout>
  )
}
```

#### Client Components with SWR and Authenticated Client
```typescript
// components/client/EventList.tsx
'use client'

import useSWR from 'swr'
import { strapiClient } from '@/services/api/strapi'

export function EventList({ initialData }: { initialData: Event[] }) {
  const { data: events, mutate } = useSWR(
    '/events',
    (path) => strapiClient.find(path),
    { fallbackData: initialData }
  )
  
  return (
    <div>
      {events.map(event => (
        <EventCard key={event.id} event={event} onUpdate={mutate} />
      ))}
    </div>
  )
}
```

#### Form Handling with Server Actions
```typescript
// components/client/forms/LoginForm.tsx
'use client'

import { useFormState } from 'react-dom'
import { loginAction } from '@/actions/auth/login'

export function LoginForm() {
  const [state, formAction] = useFormState(loginAction, undefined)

  return (
    <form action={formAction}>
      <input name="email" type="email" required />
      <input name="password" type="password" required />
      {state?.errors?.email && <p>{state.errors.email}</p>}
      <button type="submit">Login</button>
    </form>
  )
}
```

## Testing Architecture

### Testing Strategy - Co-located Only
All tests are co-located with their components in `__tests__/` subdirectories. This approach provides:
- Better discoverability
- Easier maintenance
- Clear component-test relationships
- Simplified refactoring

### Test Organization Pattern
```
component-name/
├── ComponentName.tsx
└── __tests__/
    ├── ComponentName.test.tsx       # Unit tests
    ├── ComponentName.a11y.test.tsx  # Accessibility tests
    ├── ComponentName.int.test.tsx   # Integration tests (if needed)
    └── __mocks__/                   # Component-specific reusable mocks
        └── child-components.ts
```

### Mock Organization Strategy

Following the Vitest-first approach outlined in [Testing Standards](./standards-testing.md#mocking-strategy), our mocking strategy prioritizes **co-location by default** with strategic exceptions for global dependencies.

#### Mock Location Guidelines

```
src/
├── __mocks__/                      # Global mocks only
│   ├── next/
│   │   └── navigation.ts          # Next.js router mocking
│   └── window.ts                   # Global browser APIs
├── components/
│   ├── client/
│   │   └── ui/
│   │       └── button/
│   │           ├── Button.tsx
│   │           └── __tests__/
│   │               ├── Button.test.tsx     # Inline mocks preferred
│   │               ├── Button.a11y.test.tsx
│   │               └── __mocks__/          # Component-specific reusable mocks
│   │                   └── child-components.ts
│   └── server/
│       └── layout/
│           └── header/
│               ├── Header.tsx
│               └── __tests__/
│                   ├── Header.test.tsx
│                   └── Header.a11y.test.tsx
└── test/
    ├── utils/
    │   ├── test-utils.tsx          # Custom render functions
    │   └── msw-handlers.ts         # MSW request handlers
    └── setup.ts                    # Global test setup
```

#### Mock Decision Matrix

| Mock Type | Location | Use Case | Examples |
|-----------|----------|----------|----------|
| **Inline Mocks** | Individual test files | Component-specific, one-time use | `vi.mock('../Avatar')` in component test |
| **Component Mocks** | `__tests__/__mocks__/` | Reusable across component test files | Chart libraries, complex child components |
| **Global Mocks** | `src/__mocks__/` | App-wide dependencies | Next.js router, browser APIs |
| **MSW Handlers** | `test/utils/` | API integration testing | HTTP request/response simulation |

#### Implementation Examples

**Inline Mocks (Preferred):**
```typescript
// components/client/ui/button/__tests__/Button.test.tsx
import { vi } from 'vitest';

vi.mock('../Icon', () => ({
  Icon: ({ name }: { name: string }) => <span data-testid={`icon-${name}`} />
}));
```

**Component-Specific Reusable Mocks:**
```typescript
// components/client/forms/complex-form/__tests__/__mocks__/chart-components.ts
export const mockChartComponents = {
  LineChart: ({ data }: any) => <div data-testid="line-chart" />,
  BarChart: ({ data }: any) => <div data-testid="bar-chart" />
};
```

**Global Mocks:**
```typescript
// src/__mocks__/next/navigation.ts
import { vi } from 'vitest';

export const useRouter = vi.fn(() => ({
  push: vi.fn(),
  replace: vi.fn(),
  back: vi.fn()
}));
```

### Testing Requirements
- **Unit Tests**: Mandatory for all components
- **Accessibility Tests**: Mandatory for UI components  
- **Integration Tests**: Required for complex workflows
- **Coverage Target**: 80%+ for all components
- **Test Framework**: Vitest with React Testing Library

### Test Implementation Standards
```typescript
// __tests__/Button.test.tsx
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { describe, it, expect, vi } from 'vitest'
import { Button } from '../Button'

describe('Button', () => {
  it('should render with correct text', () => {
    render(<Button>Click me</Button>)
    expect(screen.getByRole('button', { name: 'Click me' })).toBeInTheDocument()
  })

  it('should call onClick when clicked', async () => {
    const handleClick = vi.fn()
    const user = userEvent.setup()
    
    render(<Button onClick={handleClick}>Click me</Button>)
    await user.click(screen.getByRole('button', { name: 'Click me' }))
    
    expect(handleClick).toHaveBeenCalledOnce()
  })
})
```

```typescript
// __tests__/Button.a11y.test.tsx
import { render } from '@testing-library/react'
import { describe, it } from 'vitest'
import { expectNoA11yViolations } from '@/test/utils'
import { Button } from '../Button'

describe('Button Accessibility', () => {
  it('should have no accessibility violations', async () => {
    const { container } = render(<Button>Click me</Button>)
    await expectNoA11yViolations(container)
  })
})
```

For detailed mocking strategies, patterns, and best practices, refer to the [Testing Standards - Mocking Strategy](./standards-testing.md#mocking-strategy) section.

This architecture ensures scalable, maintainable, and performant applications while following NextJS 15 best practices and modern React patterns. 