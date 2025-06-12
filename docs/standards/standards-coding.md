# Coding Standards

This document outlines the coding standards for NextJS/TypeScript projects using this prompt collection.

## Technology Stack

### Core Technologies
- **Framework**: Next.js 15 with App Router
- **Language**: TypeScript 5+
- **Runtime**: React 19+
- **Styling**: TailwindCSS 4+
- **Backend**: Strapi CMS integration
- **Deployment**: Vercel

### Key Dependencies
- **State Management**: SWR for data fetching
- **UI Components**: Headless UI, Radix UI primitives
- **Animation**: Framer Motion
- **Icons**: Heroicons, React Icons, Radix Icons
- **Authentication**: JWT with jose library
- **Validation**: Zod schemas
- **HTTP Client**: Axios
- **Analytics**: Vercel Analytics & Speed Insights

## Project Structure

```
src/
├── app/                        # Next.js 15 App Router
│   ├── (routes)/              # Route groups
│   ├── api/                   # API routes
│   ├── globals.css           # Global styles
│   ├── layout.tsx            # Root layout
│   └── page.tsx              # Home page
├── components/                # React components
│   ├── client/               # Client components
│   │   ├── ui/              # Reusable UI components
│   │   ├── forms/           # Form components
│   │   ├── navigation/      # Navigation components
│   │   └── layout/          # Layout components
│   └── server/              # Server components
│       ├── marketing/       # Marketing sections
│       ├── cards/          # Display cards
│       └── layout/         # Server layout components
├── lib/                      # Utility libraries
│   ├── utils.ts             # General utilities
│   ├── strapi.ts           # Strapi client
│   ├── auth.ts             # Authentication utilities
│   └── validations.ts      # Zod schemas
├── hooks/                   # Custom React hooks
├── types/                   # TypeScript type definitions
├── data/                    # Static data and configurations
│   ├── changelog.ts        # Version history
│   └── site-config.ts      # Site configuration
└── styles/                  # Additional styles
```

## File Naming Conventions

### Directories
- **kebab-case**: `user-profile`, `api-routes`, `form-components`
- **Descriptive**: Names should clearly indicate purpose
- **Organized by type**: Group similar functionality

### Files
- **PascalCase** for components: `UserProfile.tsx`, `LoginForm.tsx`
- **kebab-case** for utilities: `auth-utils.ts`, `api-client.ts`
- **lowercase** for configuration: `package.json`, `tailwind.config.js`

### Component Structure
```
component-name/
├── ComponentName.tsx          # Main component (PascalCase)
├── __tests__/                 # Test directory
│   ├── ComponentName.test.tsx
│   └── ComponentName.a11y.test.tsx
└── README.md                  # Component documentation (if complex)
```

## TypeScript Standards

### Type Definitions
```typescript
// Use interfaces for object shapes
interface UserProfile {
  id: string;
  name: string;
  email: string;
  avatar?: string;
}

// Use types for unions and computed types
type Theme = 'light' | 'dark' | 'auto';
type UserWithTheme = UserProfile & { theme: Theme };

// Prefer explicit return types for functions
function createUser(data: Partial<UserProfile>): Promise<UserProfile> {
  // Implementation
}
```

### Import/Export Patterns
```typescript
// Prefer named exports
export const UserCard = ({ user }: UserCardProps) => {
  // Implementation
};

// Direct imports (no barrel imports)
import { UserCard } from '@/components/client/ui/UserCard';
import { validateEmail } from '@/lib/validations';

// Type-only imports
import type { UserProfile } from '@/types/user';
```

### Error Handling
```typescript
// Use Result pattern for error handling
type Result<T, E = Error> = 
  | { success: true; data: T }
  | { success: false; error: E };

// Implement comprehensive error boundaries
class ErrorBoundary extends Component<PropsWithChildren> {
  // Implementation with proper logging
}
```

## React Component Standards

### Component Types
```typescript
// Client Components (interactive)
'use client';

interface ButtonProps {
  variant: 'primary' | 'secondary' | 'danger';
  size: 'sm' | 'md' | 'lg';
  loading?: boolean;
  children: React.ReactNode;
  onClick?: () => void;
}

export const Button = ({ variant, size, loading, children, onClick }: ButtonProps) => {
  // Implementation with proper accessibility
};

// Server Components (static)
interface PageProps {
  params: { slug: string };
  searchParams: { [key: string]: string | string[] | undefined };
}

export default async function Page({ params, searchParams }: PageProps) {
  // Server-side data fetching
}
```

### Props and Interfaces
```typescript
// Comprehensive prop documentation
interface UserCardProps {
  /** User data to display */
  user: UserProfile;
  /** Show edit functionality */
  editable?: boolean;
  /** Callback when user data changes */
  onUpdate?: (user: UserProfile) => void;
  /** Additional CSS classes */
  className?: string;
  /** Test identifier */
  'data-testid'?: string;
}
```

### State Management
```typescript
// Use SWR for data fetching
import useSWR from 'swr';

function useUser(id: string) {
  const { data, error, mutate } = useSWR(`/api/users/${id}`, fetcher);
  
  return {
    user: data,
    isLoading: !error && !data,
    isError: error,
    refresh: mutate
  };
}

// Local state with proper typing
const [state, setState] = useState<UserProfile | null>(null);
```

## API Route Standards

### Route Structure
```typescript
// app/api/users/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';

const CreateUserSchema = z.object({
  name: z.string().min(1),
  email: z.string().email(),
});

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const validatedData = CreateUserSchema.parse(body);
    
    // Implementation
    
    return NextResponse.json({ 
      success: true, 
      data: user 
    });
  } catch (error) {
    return NextResponse.json(
      { success: false, error: 'Invalid request' },
      { status: 400 }
    );
  }
}
```

### Response Format
```typescript
// Success Response
interface SuccessResponse<T> {
  success: true;
  data: T;
  message?: string;
}

// Error Response
interface ErrorResponse {
  success: false;
  error: {
    code: string;
    message: string;
    details?: any;
  };
}
```

## Styling Standards

### TailwindCSS Usage
```typescript
// Use cn utility for conditional classes
import { cn } from '@/lib/utils';

const Button = ({ variant, className, ...props }: ButtonProps) => {
  return (
    <button
      className={cn(
        'px-4 py-2 rounded-md font-medium transition-colors',
        {
          'bg-blue-600 text-white hover:bg-blue-700': variant === 'primary',
          'bg-gray-200 text-gray-900 hover:bg-gray-300': variant === 'secondary',
        },
        className
      )}
      {...props}
    />
  );
};
```

### Component Styling Patterns
```typescript
// Consistent spacing and typography
const styles = {
  container: 'max-w-7xl mx-auto px-4 sm:px-6 lg:px-8',
  card: 'bg-white rounded-lg shadow-sm border border-gray-200 p-6',
  heading: 'text-2xl font-bold text-gray-900 mb-4',
  text: 'text-gray-600 leading-relaxed',
};
```

## Authentication & Security

### JWT Implementation
```typescript
import { jwtVerify, SignJWT } from 'jose';

const secret = new TextEncoder().encode(process.env.JWT_SECRET);

export async function createToken(payload: TokenPayload): Promise<string> {
  return new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setExpirationTime('24h')
    .sign(secret);
}

export async function verifyToken(token: string): Promise<TokenPayload> {
  const { payload } = await jwtVerify(token, secret);
  return payload as TokenPayload;
}
```

### Input Validation
```typescript
// Always validate input with Zod
const UserSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8).regex(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)/),
  name: z.string().min(1).max(100),
});

// Sanitize and validate in API routes
export async function POST(request: NextRequest) {
  const body = await request.json();
  const validatedData = UserSchema.parse(body);
  // Safe to use validatedData
}
```

## Performance Standards

### Bundle Optimization
```typescript
// Dynamic imports for code splitting
const DynamicComponent = dynamic(() => import('./HeavyComponent'), {
  loading: () => <Skeleton />,
  ssr: false,
});

// Optimize images
import Image from 'next/image';

<Image
  src="/avatar.jpg"
  alt="User avatar"
  width={40}
  height={40}
  className="rounded-full"
  priority={false}
/>
```

### Data Fetching
```typescript
// Server Components for initial data
async function getServerData() {
  const res = await fetch('https://api.example.com/data', {
    next: { revalidate: 3600 } // Cache for 1 hour
  });
  return res.json();
}

// Client-side SWR for dynamic data
const { data } = useSWR('/api/user', fetcher, {
  refreshInterval: 30000, // Refresh every 30 seconds
  revalidateOnFocus: false,
});
```

## Error Handling Standards

### Client-Side Errors
```typescript
// Error boundaries for client components
export function ClientErrorBoundary({ children }: { children: React.ReactNode }) {
  return (
    <ErrorBoundary
      fallback={<ErrorFallback />}
      onError={(error, errorInfo) => {
        console.error('Client error:', error, errorInfo);
        // Send to monitoring service
      }}
    >
      {children}
    </ErrorBoundary>
  );
}
```

### Server-Side Errors
```typescript
// Consistent error handling in API routes
export async function handleApiError(error: unknown) {
  if (error instanceof z.ZodError) {
    return NextResponse.json(
      { success: false, error: { code: 'VALIDATION_ERROR', message: 'Invalid input', details: error.errors } },
      { status: 400 }
    );
  }
  
  console.error('API Error:', error);
  return NextResponse.json(
    { success: false, error: { code: 'INTERNAL_ERROR', message: 'Internal server error' } },
    { status: 500 }
  );
}
```

## Accessibility Standards

### Semantic HTML
```typescript
// Use semantic elements
<main role="main">
  <article>
    <header>
      <h1>Page Title</h1>
    </header>
    <section>
      <h2>Section Title</h2>
      <p>Content...</p>
    </section>
  </article>
</main>
```

### ARIA Attributes
```typescript
// Proper ARIA implementation
<button
  aria-label="Close dialog"
  aria-expanded={isOpen}
  aria-controls="dialog-content"
  onClick={handleClose}
>
  <XMarkIcon className="h-5 w-5" aria-hidden="true" />
</button>
```

### Focus Management
```typescript
// Keyboard navigation support
const handleKeyDown = (event: KeyboardEvent) => {
  if (event.key === 'Escape') {
    handleClose();
  }
  if (event.key === 'Enter' || event.key === ' ') {
    handleAction();
  }
};
```

## Quality Assurance

### Code Review Checklist
- [ ] TypeScript types are properly defined
- [ ] Components have proper accessibility attributes
- [ ] Error handling is comprehensive
- [ ] Performance considerations are addressed
- [ ] Security best practices are followed
- [ ] Tests cover critical functionality
- [ ] Documentation is up to date

### Automated Checks
```json
{
  "scripts": {
    "tsc": "npx tsc --noEmit",
    "lint": "eslint \"src/**/*.{ts,tsx}\" --quiet",
    "test": "npm run tsc && npm run lint && npm run test:unit",
    "precommit": "npm run test && npm run test:coverage && npm run build"
  }
}
```

This ensures consistent code quality across all projects using these standards. 