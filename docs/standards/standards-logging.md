# Logging Standards

This document outlines the logging standards for NextJS/TypeScript projects using this prompt collection. It defines what to log, when to log it, and appropriate logging levels for both development and production environments.

## Logging Levels

Use appropriate log levels for different types of messages:

- **`none`**: Completely disables logging for a context
- **`error`**: For errors and exceptions that require immediate attention
- **`warn`**: For warning messages about potential issues or deprecated usage
- **`info`**: For general information about application flow
- **`debug`**: For detailed debugging information during development
- **`verbose`**: For very detailed debugging with comprehensive context
- **`force`**: Forces a log message regardless of configured level (use sparingly)

## Context-Based Logging Architecture

### Logger Context Strategy
Use context-based loggers to organize logs by component, service, or module:

```typescript
// Create context-specific loggers
const userServiceLogger = createLogger('UserService');
const paymentLogger = createLogger('PaymentService');
const apiLogger = createLogger('ApiRoutes');

// Each context can have its own log level
const config = {
  level: 'info',           // Global default
  contexts: {
    'UserService': 'debug',    // More verbose for user operations
    'PaymentService': 'warn',  // Only warnings and errors for payments
    'ApiRoutes': 'info'        // Standard info level for API routes
  }
};
```

### Benefits of Context-Based Logging
- **Targeted debugging**: Enable detailed logs only where needed
- **Performance optimization**: Reduce log noise in production
- **Better organization**: Group related logs together
- **Flexible configuration**: Different log levels per component

## Logger Implementation Standards

### Core Logger Architecture
```typescript
const LOG_LEVELS = {
    none: 0,
    error: 1,
    warn: 2,
    info: 3,
    debug: 4,
    verbose: 5
} as const;

type LogLevel = keyof typeof LOG_LEVELS;

export class Logger {
    protected config: LogConfig;
    protected context: string;

    constructor(context: string) {
        this.context = context;
        this.config = getLogConfig();
    }

    protected shouldLog(level: LogLevel): boolean {
        // Environment-based restrictions
        if (process.env.NODE_ENV === 'production') {
            const isClient = typeof window !== 'undefined';
            if (isClient && level !== 'error') return false;
            if (!isClient && !['error', 'warn', 'info'].includes(level)) return false;
        }
        
        const contextLevel = this.config.contexts[this.context] || this.config.level;
        return LOG_LEVELS[level] <= LOG_LEVELS[contextLevel as LogLevel];
    }

    protected sanitizeForLogging(data: unknown): unknown {
        if (typeof data !== 'object' || data === null) {
            return data;
        }

        const sensitive = ['password', 'token', 'secret', 'key', 'ssn', 'creditCard', 'authorization'];
        const sanitized = { ...data as Record<string, unknown> };

        for (const key in sanitized) {
            const keyLower = key.toLowerCase();
            if (sensitive.some(s => keyLower.includes(s))) {
                sanitized[key] = '[REDACTED]';
            }
        }

        return sanitized;
    }

    protected formatMessage(level: LogLevel | 'force', message: string, args: unknown[]): string {
        const timestamp = new Date().toISOString();
        let formattedArgs = '';

        if (args.length === 1 && typeof args[0] === 'object') {
            formattedArgs = '\n' + JSON.stringify(this.sanitizeForLogging(args[0]), null, 2);
        } else if (args.length > 0) {
            formattedArgs = args.map(arg =>
                typeof arg === 'object' ? '\n' + JSON.stringify(this.sanitizeForLogging(arg), null, 2) : String(arg)
            ).join(' ');
        }

        return `[${timestamp}] [${level.toUpperCase()}] [${this.context}] ${message}${formattedArgs}`.trim();
    }

    public force(message: string, ...args: unknown[]): void {
        console.log(this.formatMessage('force', message, args));
    }

    // ... other log methods
}
```

### Logger Factory with Caching
```typescript
// Cache for logger instances to improve performance
const loggerCache = new Map<string, Logger>();

export function createLogger(context: string): Logger {
    // Return cached instance if available
    const cachedLogger = loggerCache.get(context);
    if (cachedLogger) {
        return cachedLogger;
    }

    // Create and cache new logger instance
    const logger = new Logger(context);
    loggerCache.set(context, logger);

    // Validate context in development
    if (process.env.NODE_ENV === 'development') {
        validateContext(context, logger);
    }

    return logger;
}

function validateContext(context: string, logger: Logger): void {
    try {
        const config = getLogConfig();
        const knownContexts = Object.keys(config.contexts);

        if (!knownContexts.includes(context) && typeof window === 'undefined') {
            const stack = new Error().stack;
            const callerLocation = stack?.split('\n')[2]?.trim() || 'unknown location';
            
            console.warn(
                `[Logger] Unknown context "${context}" used at ${callerLocation}. ` +
                `Known contexts are: ${knownContexts.join(', ')}`
            );
        }
    } catch {
        // Silently fail if config isn't available
    }
}
```

### Configuration Management

#### Configuration File Structure
Organize logging configuration using environment-specific JSON files:

```
/config/logging/
├── development.json    # Verbose logging for development
├── production.json     # Minimal logging for production
├── test.json          # Test-specific configuration
└── README.md          # Configuration documentation
```

#### Configuration Interface
```typescript
export type LoggingLevel = 'none' | 'error' | 'warn' | 'info' | 'debug' | 'verbose';

export interface LogConfig {
    level: LoggingLevel;
    contexts: Record<string, LoggingLevel>;
}
```

#### Configuration Service Implementation
```typescript
// config/LogConfig.ts
import developmentConfig from '@/config/logging/development.json';
import productionConfig from '@/config/logging/production.json';
import testConfig from '@/config/logging/test.json';

const configCache: Record<string, LogConfig> = {
    development: developmentConfig as LogConfig,
    production: productionConfig as LogConfig,
    test: testConfig as LogConfig
};

const defaultConfig: LogConfig = {
    level: 'info',
    contexts: {
        default: 'info'
    }
};

let currentConfig: LogConfig = defaultConfig;
let configLoaded = false;

function getConfigName(): string {
    // Allow runtime override for debugging
    if (process.env.LOGGER_CONFIG_OVERRIDE) {
        return process.env.LOGGER_CONFIG_OVERRIDE;
    }
    return process.env.NODE_ENV || 'production';
}

export function getLogConfig(): LogConfig {
    if (!configLoaded) {
        try {
            const configName = getConfigName();
            const config = configCache[configName];

            if (!config) {
                console.warn(`Log config '${configName}' not found, falling back to production config`);
                currentConfig = configCache.production;
            } else {
                currentConfig = config;
            }

            configLoaded = true;
        } catch (error) {
            console.error('[LogConfig] Failed to load configuration, using default config:', error);
            currentConfig = defaultConfig;
            configLoaded = true;
        }
    }

    return currentConfig;
}
```

#### Configuration Fallback Strategy
The configuration system implements a robust fallback chain:

1. **Override**: `LOGGER_CONFIG_OVERRIDE` environment variable
2. **Environment**: `NODE_ENV` based configuration
3. **Production**: Fallback to production config if environment config missing
4. **Default**: Hardcoded safe defaults if all else fails
```

## When to Log

### Server-Side Logging

#### Error Level
```typescript
const logger = createLogger('ApiRoutes');

// System errors and exceptions
logger.error('Database connection failed', { 
  error: error.message, 
  stack: error.stack,
  connectionString: process.env.DB_HOST,
  timestamp: new Date().toISOString()
});

// API route errors with correlation
const correlatedLogger = logger.withCorrelation(requestId, sessionId);
correlatedLogger.error('User authentication failed', {
  userId: req.body.userId,
  endpoint: req.url,
  method: req.method,
  userAgent: req.headers['user-agent']
});
```

#### Warning Level
```typescript
const performanceLogger = createLogger('Performance');

// Performance concerns
performanceLogger.warn('Slow database query detected', {
  query: sanitizedQuery,
  duration: queryTime,
  threshold: SLOW_QUERY_THRESHOLD,
  context: 'user-dashboard'
});
```

#### Info Level
```typescript
const systemLogger = createLogger('System');

// Application startup
systemLogger.info('Server started successfully', {
  port: process.env.PORT,
  environment: process.env.NODE_ENV,
  version: process.env.npm_package_version
});

const userLogger = createLogger('UserService');

// Important business events
userLogger.info('User registered', {
  userId: user.id,
  email: user.email,
  registrationMethod: 'email'
});
```

#### Debug Level (Development Only)
```typescript
const apiLogger = createLogger('ApiRoutes');

// API request/response cycles
apiLogger.debug('API request received', {
  method: req.method,
  url: req.url,
  headers: sanitizeHeaders(req.headers),
  body: sanitizeBody(req.body)
});
```

### Client-Side Logging

#### Error Level
```typescript
const clientLogger = createLogger('ClientApp');

// Unhandled errors
clientLogger.error('Unhandled client error', {
  error: error.message,
  stack: error.stack,
  url: window.location.href,
  userAgent: navigator.userAgent,
  timestamp: new Date().toISOString()
});
```

#### Component-Specific Logging
```typescript
const componentLogger = createLogger('UserProfile');

// Component-specific warnings
componentLogger.warn('Optional data missing', {
  component: 'UserAvatar',
  missingField: 'avatarUrl',
  fallback: 'default-avatar.png'
});
```

## Advanced Features

### Request Correlation
```typescript
export class Logger {
    // ... existing methods

    public withCorrelation(requestId: string, sessionId?: string, userId?: string) {
        const correlationData = { requestId, sessionId, userId };
        
        return {
            error: (message: string, data?: Record<string, unknown>) => 
                this.error(message, { ...data, ...correlationData }),
            warn: (message: string, data?: Record<string, unknown>) => 
                this.warn(message, { ...data, ...correlationData }),
            info: (message: string, data?: Record<string, unknown>) => 
                this.info(message, { ...data, ...correlationData }),
            debug: (message: string, data?: Record<string, unknown>) => 
                this.debug(message, { ...data, ...correlationData }),
            verbose: (message: string, data?: Record<string, unknown>) => 
                this.verbose(message, { ...data, ...correlationData })
        };
    }
}

// Usage in API routes
export async function POST(request: Request) {
    const requestId = crypto.randomUUID();
    const logger = createLogger('UserApi').withCorrelation(requestId);
    
    logger.info('User creation started', { endpoint: request.url });
    // ... rest of implementation
}
```

### Structured Logging Support
```typescript
interface LogEntry {
    level: LogLevel;
    message: string;
    timestamp: string;
    context: string;
    correlation?: {
        requestId?: string;
        sessionId?: string;
        userId?: string;
    };
    data?: Record<string, unknown>;
}

export class Logger {
    // ... existing methods

    public structured(level: LogLevel, message: string, data?: Record<string, unknown>): void {
        if (this.shouldLog(level)) {
            const logEntry: LogEntry = {
                level,
                message,
                timestamp: new Date().toISOString(),
                context: this.context,
                data: data ? this.sanitizeForLogging(data) as Record<string, unknown> : undefined
            };
            
            const consoleMethod = this.getConsoleMethod(level);
            consoleMethod(JSON.stringify(logEntry));
        }
    }

    private getConsoleMethod(level: LogLevel) {
        switch (level) {
            case 'error': return console.error;
            case 'warn': return console.warn;
            case 'info': return console.info;
            default: return console.debug;
        }
    }
}
```

### Testing Support
```typescript
export class TestLogger extends Logger {
    private logHistory: Array<{ level: LogLevel; message: string; args: unknown[] }> = [];

    constructor(context: string) {
        super(context);
    }

    protected log(level: LogLevel, message: string, ...args: unknown[]): void {
        this.logHistory.push({ level, message, args });
        super.log(level, message, ...args);
    }

    public getLogHistory() {
        return [...this.logHistory];
    }

    public clearHistory(): void {
        this.logHistory = [];
    }

    public updateConfig(newConfig: LogConfig): void {
        this.config = newConfig;
    }
}

// Usage in tests
const testLogger = new TestLogger('TestContext');
// ... run test code
const logs = testLogger.getLogHistory();
expect(logs).toHaveLength(2);
expect(logs[0].level).toBe('error');
```

## Production vs Development

### Production Logging
- **Server**: `error`, `warn`, `info` levels only
- **Client**: `error` level only
- **Context isolation**: Use specific contexts to control log volume
- **Sanitize all sensitive data** automatically
- **Include correlation IDs** for request tracing
- **Monitor log volume** to avoid performance impact

### Development Logging
- **Server**: All levels including `debug` and `verbose`
- **Client**: `error`, `warn`, `info`, `debug` levels
- **Context validation**: Warn about unknown contexts
- **More detailed context** for debugging
- **Include development-specific metadata**

## Configuration Examples

### JSON Configuration Files

#### development.json
```json
{
    "level": "debug",
    "contexts": {
        "AuthService": "debug",
        "UserService": "debug", 
        "PaymentService": "debug",
        "DatabaseService": "debug",
        "ApiRoutes": "verbose",
        "ClientApp": "debug",
        "TestUtils": "verbose",
        "DevTools": "verbose"
    }
}
```

#### production.json
```json
{
    "level": "info",
    "contexts": {
        "AuthService": "warn",
        "UserService": "info",
        "PaymentService": "warn",
        "DatabaseService": "warn", 
        "ApiRoutes": "info",
        "ClientApp": "error",
        "SecurityService": "error",
        "TestUtils": "none",
        "DevTools": "none"
    }
}
```

#### test.json
```json
{
    "level": "warn",
    "contexts": {
        "AuthService": "error",
        "UserService": "warn",
        "PaymentService": "error",
        "DatabaseService": "error",
        "ApiRoutes": "warn",
        "ClientApp": "error",
        "TestUtils": "debug",
        "TestFramework": "verbose"
    }
}
```

### Runtime Configuration Override

#### Debugging Production Issues
```bash
# Temporarily enable debug logging for specific contexts
LOGGER_CONFIG_OVERRIDE=development npm start

# Use custom debug configuration
LOGGER_CONFIG_OVERRIDE=debug-payment npm start
```

#### Custom Debug Configuration (debug-payment.json)
```json
{
    "level": "info",
    "contexts": {
        "PaymentService": "verbose",
        "DatabaseService": "debug",
        "ApiRoutes": "debug",
        "AuthService": "info",
        "UserService": "warn"
    }
}
```

### Context Organization Patterns
```typescript
// Organize contexts by domain
const contexts = {
    // Authentication & Security
    'AuthService': 'warn',
    'SecurityMiddleware': 'error',
    'JwtService': 'warn',
    
    // Business Logic
    'UserService': 'info',
    'OrderService': 'info',
    'PaymentService': 'warn',
    
    // Infrastructure
    'DatabaseService': 'warn',
    'CacheService': 'info',
    'ApiClient': 'info',
    
    // Client Components
    'UserInterface': 'error',
    'FormValidation': 'warn',
    'NavigationComponent': 'error'
};
```

## Best Practices

### Do Log
- ✅ Use context-specific loggers for better organization
- ✅ Cache logger instances for performance
- ✅ Implement graceful fallbacks for configuration
- ✅ Validate contexts in development
- ✅ Use correlation IDs for request tracing
- ✅ Sanitize sensitive data automatically
- ✅ Organize configuration in environment-specific JSON files
- ✅ Implement runtime configuration overrides for debugging
- ✅ Use startup configuration caching for performance
- ✅ Create dedicated test environment configurations

### Don't Log
- ❌ Create new logger instances repeatedly
- ❌ Use global loggers without context
- ❌ Ignore configuration management
- ❌ Log sensitive information without sanitization
- ❌ Use debug/verbose levels in production client code
- ❌ Hardcode logging configuration in source code
- ❌ Skip fallback strategies for missing configurations
- ❌ Reload configuration files on every access

### Performance Considerations
- **Logger caching**: Reuse logger instances via factory pattern
- **Conditional logging**: Check `shouldLog()` before expensive operations
- **Context-based control**: Use contexts to limit log volume
- **Lazy evaluation**: Defer expensive log formatting until needed
- **Configuration caching**: Load configuration once at startup
- **Selective context activation**: Use `none` level to completely disable noisy contexts

### Operational Practices

#### Production Debugging
```bash
# Temporarily enable detailed logging for specific investigation
LOGGER_CONFIG_OVERRIDE=debug-user-issues pm2 restart app

# Create custom debug configurations for specific scenarios
# debug-user-issues.json, debug-payment-flows.json, etc.
```

#### Configuration Validation
```typescript
// Validate configuration at startup
export function validateLogConfig(config: LogConfig): void {
    const validLevels = ['none', 'error', 'warn', 'info', 'debug', 'verbose'];
    
    if (!validLevels.includes(config.level)) {
        throw new Error(`Invalid global log level: ${config.level}`);
    }
    
    for (const [context, level] of Object.entries(config.contexts)) {
        if (!validLevels.includes(level)) {
            throw new Error(`Invalid log level '${level}' for context '${context}'`);
        }
    }
}
```

#### Context Discovery
```typescript
// Development helper to identify all contexts being used
export function discoverActiveContexts(): Set<string> {
    // Implementation to track and report all logger contexts created
    // Useful for maintaining configuration files
}
```

## Monitoring and Alerting

### Context-Based Monitoring
- **Group alerts by context** for better triage
- **Set context-specific thresholds** for error rates
- **Monitor context usage patterns** for optimization
- **Track unknown context warnings** in development

### Key Metrics to Monitor
- **Error rates per context** and overall
- **Log volume per context** to identify noise
- **Context configuration effectiveness**
- **Performance impact of logging operations**

---

*Remember: Context-based logging provides powerful organization and control capabilities. Use contexts strategically to balance debugging needs with performance and security requirements.* 