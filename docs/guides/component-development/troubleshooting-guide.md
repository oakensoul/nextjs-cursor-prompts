---
description:
globs:
alwaysApply: false
---
# 🛠️ Component Development Troubleshooting and Best Practices

> **Comprehensive problem-solving resource and optimization guide for component prompt system mastery.**

## 🎯 **TROUBLESHOOTING OBJECTIVES**

1. **RESOLVE common workflow challenges** with systematic problem-solving approaches
2. **OPTIMIZE development efficiency** through proven best practices and patterns
3. **PREVENT integration issues** with proactive quality assurance strategies
4. **IMPROVE prompt effectiveness** through usage optimization and feedback loops
5. **ESTABLISH maintenance practices** for long-term system sustainability

---

## 🚨 **COMMON ISSUES AND SOLUTIONS**

### **Issue Category 1: Prompt Selection Confusion**

#### **🔍 Problem: Uncertain Which Prompt to Use**

**Symptoms:**
- Component requirements span multiple domains
- Unclear primary responsibility of component
- Overlapping functionality between prompt types

**Root Causes:**
- Insufficient component analysis before prompt selection
- Lack of clear domain boundaries understanding
- Trying to solve complex problems with single prompt

**Solutions:**

**Step 1: Component Domain Analysis**
```typescript
// Systematic component analysis framework
interface ComponentDomainAnalysis {
  // Primary functionality (highest priority)
  primaryFunction: 
    | 'data-collection'      // Forms, inputs, validation
    | 'data-display'         // Cards, lists, content presentation  
    | 'user-interaction'     // Buttons, controls, widgets
    | 'content-structure'    // Layouts, grids, organization
    | 'navigation'           // Menus, breadcrumbs, routing
    | 'marketing'            // Conversion, promotion, engagement
    | 'visual-elements'      // Icons, graphics, decoration
    | 'business-logic';      // Complex workflows, integrations

  // Secondary features (lower priority)
  secondaryFeatures: string[];
  
  // User interaction level
  interactionLevel: 'static' | 'basic' | 'complex';
  
  // Recommended approach
  recommendedStrategy: 'single-prompt' | 'multi-prompt' | 'custom-integration';
}

// Example analysis for complex component
const complexFormAnalysis: ComponentDomainAnalysis = {
  primaryFunction: 'data-collection',     // Forms domain wins
  secondaryFeatures: ['animations', 'custom-styling', 'real-time-updates'],
  interactionLevel: 'complex',
  recommendedStrategy: 'multi-prompt'     // Form + UI + possibly Layout
};
```

**Step 2: Decision Matrix Application**
```typescript
// Systematic prompt selection decision tree
const promptSelectionMatrix = {
  'data-collection': {
    primary: 'component-create-form.mdc',
    enhancers: ['component-create-ui.mdc', 'component-create-layout.mdc'],
    useCase: 'Forms, surveys, input validation, data entry'
  },
  'data-display': {
    primary: 'component-create-card.mdc',
    enhancers: ['component-create-layout.mdc', 'component-create-ui.mdc'],
    useCase: 'Product cards, profile displays, content blocks'
  },
  'user-interaction': {
    primary: 'component-create-ui.mdc',
    enhancers: ['component-create-form.mdc', 'component-create-icon.mdc'],
    useCase: 'Buttons, modals, interactive widgets, controls'
  },
  'content-structure': {
    primary: 'component-create-layout.mdc',
    enhancers: ['component-create-navigation.mdc', 'component-create-card.mdc'],
    useCase: 'Page layouts, grids, content organization'
  }
};
```

#### **🔍 Problem: Component Doesn't Fit Standard Patterns**

**Symptoms:**
- Requirements don't match any specialized prompt exactly
- Component combines multiple domains equally
- Unique business logic requirements

**Solutions:**

**Approach 1: Use General Guide with Integration**
```typescript
// When component spans multiple domains equally
const HybridComponent = () => {
  // Start with component-create-guide.mdc
  // Then enhance with specific domain patterns
  return (
    <ComponentWrapper> {/* General guide structure */}
      <FormSection>     {/* Form prompt patterns */}
        <InputFields />
      </FormSection>
      <DisplaySection>  {/* Card prompt patterns */}
        <DataCards />
      </DisplaySection>
      <ControlSection>  {/* UI prompt patterns */}
        <ActionButtons />
      </ControlSection>
    </ComponentWrapper>
  );
};
```

**Approach 2: Decomposition Strategy**
```typescript
// Break complex component into smaller, prompt-aligned pieces
interface ComplexComponentProps {
  data: BusinessData;
  onAction: (action: ActionType) => void;
}

// Decompose into prompt-aligned subcomponents
const ComplexBusinessComponent: React.FC<ComplexComponentProps> = ({ data, onAction }) => {
  return (
    <BusinessLayout>                    {/* Layout prompt */}
      <DataDisplaySection>
        <MetricsCard data={data.metrics} />     {/* Card prompt */}
        <StatusCard data={data.status} />       {/* Card prompt */}
      </DataDisplaySection>
      
      <ActionSection>
        <ConfigurationForm onSubmit={onAction} />   {/* Form prompt */}
        <QuickActionPanel actions={data.actions} /> {/* UI prompt */}
      </ActionSection>
    </BusinessLayout>
  );
};
```

---

### **Issue Category 2: Integration and Compatibility Problems**

#### **🔍 Problem: Components from Different Prompts Don't Work Together**

**Symptoms:**
- Styling conflicts between prompt-generated components
- Props interface mismatches
- Inconsistent accessibility patterns
- Testing strategy conflicts

**Root Causes:**
- Missing unified component architecture
- Inconsistent prop naming conventions
- Different TailwindCSS class usage patterns
- Varied accessibility implementation approaches

**Solutions:**

**Solution 1: Establish Unified Base Interfaces**
```typescript
// Create consistent base props across all prompt domains
interface BaseComponentProps {
  /** CSS class names for styling customization */
  className?: string;
  
  /** Test identifier for testing and debugging */
  'data-testid'?: string;
  
  /** Component children */
  children?: React.ReactNode;
  
  /** ARIA label for accessibility */
  'aria-label'?: string;
  
  /** Additional ARIA attributes */
  'aria-describedby'?: string;
  'aria-labelledby'?: string;
  
  /** Loading state for async operations */
  loading?: boolean;
  
  /** Disabled state */
  disabled?: boolean;
  
  /** Error state */
  error?: string | null;
}

// Extend base props in all domain-specific interfaces
interface FormComponentProps extends BaseComponentProps {
  onSubmit: (data: unknown) => void;
  initialData?: unknown;
  validationSchema?: unknown;
}

interface CardComponentProps extends BaseComponentProps {
  variant?: 'default' | 'featured' | 'compact';
  interactive?: boolean;
  onClick?: () => void;
}

interface UIComponentProps extends BaseComponentProps {
  variant?: 'primary' | 'secondary' | 'danger';
  size?: 'sm' | 'md' | 'lg';
}
```

**Solution 2: Standardized Styling System**
```typescript
// Unified styling approach across all prompts
import { cva, type VariantProps } from 'class-variance-authority';

// Base component styling that all prompts should use
const baseComponentVariants = cva(
  // Base classes applied to all components
  [
    'transition-all duration-200',
    'focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-blue-500',
    'disabled:opacity-50 disabled:cursor-not-allowed'
  ],
  {
    variants: {
      // State variants used across all prompt types
      state: {
        default: '',
        loading: 'opacity-75 cursor-wait',
        error: 'border-red-500 text-red-900',
        success: 'border-green-500 text-green-900'
      },
      // Size variants for consistency
      size: {
        sm: 'text-sm',
        md: 'text-base', 
        lg: 'text-lg'
      }
    },
    defaultVariants: {
      state: 'default',
      size: 'md'
    }
  }
);

// Each prompt extends this base with domain-specific variants
export const formVariants = cva(baseComponentVariants, {
  variants: {
    inputType: {
      text: 'border border-gray-300',
      email: 'border border-gray-300', 
      password: 'border border-gray-300'
    }
  }
});

export const cardVariants = cva(baseComponentVariants, {
  variants: {
    cardType: {
      default: 'bg-white border border-gray-200',
      featured: 'bg-blue-50 border border-blue-200',
      compact: 'bg-gray-50 border border-gray-100'
    }
  }
});
```

**Solution 3: Unified Testing Strategy**
```typescript
// Consistent testing patterns across all prompt types
import { render, screen, userEvent } from '@testing-library/react';
import { axe, toHaveNoViolations } from 'jest-axe';

expect.extend(toHaveNoViolations);

// Base test utilities for all prompt-generated components
export const testUtils = {
  // Standard accessibility test for all components
  async expectNoA11yViolations(component: React.ReactElement) {
    const { container } = render(component);
    const results = await axe(container);
    expect(results).toHaveNoViolations();
  },

  // Standard props testing for all components
  expectBasePropsSupport(Component: React.ComponentType<any>) {
    it('should support base component props', () => {
      render(
        <Component 
          className="custom-class"
          data-testid="test-component"
          aria-label="Test component"
        >
          Test content
        </Component>
      );

      const element = screen.getByTestId('test-component');
      expect(element).toHaveClass('custom-class');
      expect(element).toHaveAttribute('aria-label', 'Test component');
    });
  },

  // Standard keyboard navigation test
  async expectKeyboardNavigation(Component: React.ComponentType<any>) {
    const user = userEvent.setup();
    render(<Component interactive>Test component</Component>);
    
    const element = screen.getByRole('button') || screen.getByRole('link');
    await user.tab();
    expect(element).toHaveFocus();
  }
};

// Usage in prompt-specific tests
describe('FormComponent Integration', () => {
  testUtils.expectBasePropsSupport(FormComponent);
  
  it('should have no accessibility violations', async () => {
    await testUtils.expectNoA11yViolations(
      <FormComponent onSubmit={jest.fn()}>Form content</FormComponent>
    );
  });
});
```

#### **🔍 Problem: Performance Issues with Multi-Prompt Applications**

**Symptoms:**
- Slow page loads with multiple components
- Large bundle sizes
- Memory leaks with complex component trees
- Slow render times

**Solutions:**

**Solution 1: Component Lazy Loading Strategy**
```typescript
// Implement lazy loading for prompt-generated components
import { lazy, Suspense } from 'react';

// Lazy load components by domain
const FormComponents = lazy(() => import('@/components/client/forms'));
const UIComponents = lazy(() => import('@/components/client/ui'));
const CardComponents = lazy(() => import('@/components/server/cards'));
const LayoutComponents = lazy(() => import('@/components/client/layout'));

// Use Suspense with appropriate loading states
const OptimizedPage: React.FC = () => {
  return (
    <div className="page-container">
      <Suspense fallback={<LayoutSkeleton />}>
        <LayoutComponents.PageLayout>
          <Suspense fallback={<FormSkeleton />}>
            <FormComponents.ContactForm />
          </Suspense>
          
          <Suspense fallback={<CardGridSkeleton />}>
            <CardComponents.ProductGrid />
          </Suspense>
        </LayoutComponents.PageLayout>
      </Suspense>
    </div>
  );
};
```

**Solution 2: Memoization Strategy**
```typescript
// Optimize re-renders with proper memoization
import { memo, useMemo, useCallback } from 'react';

// Memoize expensive component calculations
const OptimizedCard = memo<CardProps>(({ product, onAction }) => {
  // Memoize expensive calculations
  const formattedPrice = useMemo(() => {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD'
    }).format(product.price);
  }, [product.price]);

  // Memoize event handlers
  const handleClick = useCallback(() => {
    onAction(product.id);
  }, [product.id, onAction]);

  return (
    <article className="product-card">
      <h3>{product.name}</h3>
      <p>{formattedPrice}</p>
      <button onClick={handleClick}>Add to Cart</button>
    </article>
  );
});
```

---

### **Issue Category 3: Quality and Maintenance Problems**

#### **🔍 Problem: Inconsistent Code Quality Across Prompts**

**Symptoms:**
- Different coding patterns between prompt-generated components
- Inconsistent error handling approaches
- Varied accessibility compliance levels
- Mixed testing coverage and quality

**Solutions:**

**Solution 1: Quality Assurance Checklist**
```typescript
// Comprehensive quality checklist for all prompt usage
interface ComponentQualityChecklist {
  // Code quality standards
  codeQuality: {
    typeScriptCompliance: boolean;        // Full TypeScript with proper types
    propsDocumentation: boolean;          // JSDoc comments for all props
    errorHandling: boolean;               // Proper error boundaries and handling
    performanceOptimization: boolean;     // Memoization, lazy loading where appropriate
  };

  // Accessibility compliance
  accessibility: {
    semanticHTML: boolean;                // Proper HTML5 semantic elements
    keyboardNavigation: boolean;          // Full keyboard accessibility
    screenReaderSupport: boolean;         // ARIA labels and descriptions
    colorContrast: boolean;               // WCAG compliant color usage
  };

  // Testing coverage
  testing: {
    unitTests: boolean;                   // Component unit tests
    integrationTests: boolean;            // Integration with other components
    accessibilityTests: boolean;          // Automated a11y testing
    performanceTests: boolean;            // Render performance validation
  };

  // Standards compliance
  standards: {
    fileNamingConventions: boolean;       // Consistent naming patterns
    importPatterns: boolean;              // Direct imports, no barrel exports
    componentArchitecture: boolean;       // Client/server organization
    catalystCompliance: boolean;          // Proper Catalyst extension patterns
  };
}

// Quality validation function
const validateComponentQuality = (
  componentPath: string,
  checklist: ComponentQualityChecklist
): QualityReport => {
  const issues: string[] = [];
  const recommendations: string[] = [];

  // Validate each category
  Object.entries(checklist).forEach(([category, checks]) => {
    Object.entries(checks).forEach(([check, passed]) => {
      if (!passed) {
        issues.push(`${category}.${check}: Failed validation`);
        recommendations.push(`Fix ${check} in ${category}`);
      }
    });
  });

  return {
    passed: issues.length === 0,
    issues,
    recommendations,
    overallScore: (
      Object.values(checklist).reduce((score, category) => {
        const categoryScore = Object.values(category).filter(Boolean).length / Object.values(category).length;
        return score + categoryScore;
      }, 0) / Object.keys(checklist).length
    ) * 100
  };
};
```

**Solution 2: Automated Quality Gates**
```typescript
// Automated quality validation for prompt-generated components
import { ESLint } from 'eslint';
import { exec } from 'child_process';
import { promises as fs } from 'fs';

interface QualityGateConfig {
  linting: {
    enabled: boolean;
    eslintConfig: string;
    failOnWarnings: boolean;
  };
  typeChecking: {
    enabled: boolean;
    strictMode: boolean;
  };
  testing: {
    minimumCoverage: number;
    requiredTestTypes: string[];
  };
  accessibility: {
    enabled: boolean;
    level: 'A' | 'AA' | 'AAA';
  };
}

class ComponentQualityGate {
  constructor(private config: QualityGateConfig) {}

  async validateComponent(componentPath: string): Promise<QualityGateResult> {
    const results: QualityGateResult = {
      passed: true,
      issues: [],
      recommendations: []
    };

    // Run ESLint validation
    if (this.config.linting.enabled) {
      const lintResults = await this.runLinting(componentPath);
      if (lintResults.issues.length > 0) {
        results.passed = false;
        results.issues.push(...lintResults.issues);
      }
    }

    // Run TypeScript checking
    if (this.config.typeChecking.enabled) {
      const typeResults = await this.runTypeChecking(componentPath);
      if (!typeResults.passed) {
        results.passed = false;
        results.issues.push(...typeResults.issues);
      }
    }

    // Run test coverage validation
    const testResults = await this.validateTestCoverage(componentPath);
    if (testResults.coverage < this.config.testing.minimumCoverage) {
      results.passed = false;
      results.issues.push(`Test coverage ${testResults.coverage}% below minimum ${this.config.testing.minimumCoverage}%`);
    }

    return results;
  }

  private async runLinting(componentPath: string): Promise<LintResult> {
    const eslint = new ESLint();
    const results = await eslint.lintFiles([componentPath]);
    
    return {
      passed: results.every(result => 
        result.errorCount === 0 && 
        (this.config.linting.failOnWarnings ? result.warningCount === 0 : true)
      ),
      issues: results.flatMap(result => 
        result.messages.map(msg => `${result.filePath}:${msg.line} - ${msg.message}`)
      )
    };
  }

  private async validateTestCoverage(componentPath: string): Promise<CoverageResult> {
    // Run test coverage analysis
    return new Promise((resolve) => {
      exec(`vitest run --coverage ${componentPath}`, (error, stdout) => {
        const coverageMatch = stdout.match(/All files\s+\|\s+([\d.]+)/);
        const coverage = coverageMatch ? parseFloat(coverageMatch[1]) : 0;
        
        resolve({
          coverage,
          passed: coverage >= this.config.testing.minimumCoverage
        });
      });
    });
  }
}
```

#### **🔍 Problem: Maintenance Overhead and Technical Debt**

**Symptoms:**
- Components become difficult to update
- Breaking changes affect multiple components
- Documentation becomes outdated
- Team knowledge silos develop

**Solutions:**

**Solution 1: Component Health Monitoring**
```typescript
// System for tracking component health and maintenance needs
interface ComponentHealthMetrics {
  lastUpdated: Date;
  updateFrequency: number;
  bugReports: number;
  usageCount: number;
  complexityScore: number;
  maintenanceRisk: 'low' | 'medium' | 'high' | 'critical';
}

interface ComponentHealthReport {
  componentName: string;
  promptOrigin: string;
  metrics: ComponentHealthMetrics;
  recommendations: MaintenanceRecommendation[];
  priorityScore: number;
}

class ComponentHealthTracker {
  async generateHealthReport(componentPath: string): Promise<ComponentHealthReport> {
    const metrics = await this.collectMetrics(componentPath);
    const recommendations = this.generateRecommendations(metrics);
    
    return {
      componentName: this.extractComponentName(componentPath),
      promptOrigin: await this.detectPromptOrigin(componentPath),
      metrics,
      recommendations,
      priorityScore: this.calculatePriorityScore(metrics)
    };
  }

  private generateRecommendations(metrics: ComponentHealthMetrics): MaintenanceRecommendation[] {
    const recommendations: MaintenanceRecommendation[] = [];

    if (metrics.complexityScore > 75) {
      recommendations.push({
        type: 'refactor',
        priority: 'high',
        description: 'Component complexity too high, consider decomposition',
        effort: 'medium'
      });
    }

    if (metrics.bugReports > 5) {
      recommendations.push({
        type: 'quality',
        priority: 'high', 
        description: 'High bug count indicates quality issues',
        effort: 'high'
      });
    }

    if (Date.now() - metrics.lastUpdated.getTime() > 90 * 24 * 60 * 60 * 1000) {
      recommendations.push({
        type: 'maintenance',
        priority: 'medium',
        description: 'Component not updated in 90+ days, review for deprecation',
        effort: 'low'
      });
    }

    return recommendations;
  }
}
```

**Solution 2: Documentation Automation**
```typescript
// Automated documentation generation and maintenance
interface ComponentDocumentation {
  name: string;
  description: string;
  promptOrigin: string;
  propsInterface: string;
  usageExamples: string[];
  integrationPatterns: string[];
  lastUpdated: Date;
  maintainers: string[];
}

class DocumentationGenerator {
  async generateComponentDocs(componentPath: string): Promise<ComponentDocumentation> {
    const sourceCode = await fs.readFile(componentPath, 'utf-8');
    
    return {
      name: this.extractComponentName(sourceCode),
      description: this.extractJSDocDescription(sourceCode),
      promptOrigin: this.detectPromptOrigin(sourceCode),
      propsInterface: this.extractPropsInterface(sourceCode),
      usageExamples: await this.generateUsageExamples(componentPath),
      integrationPatterns: await this.findIntegrationPatterns(componentPath),
      lastUpdated: new Date(),
      maintainers: await this.extractMaintainers(componentPath)
    };
  }

  private extractPropsInterface(sourceCode: string): string {
    // Extract TypeScript interface from component
    const interfaceMatch = sourceCode.match(/interface\s+\w+Props\s*{[^}]+}/);
    return interfaceMatch ? interfaceMatch[0] : '';
  }

  private async generateUsageExamples(componentPath: string): Promise<string[]> {
    // Scan test files and stories for usage examples
    const testDir = componentPath.replace('.tsx', '.test.tsx');
    const storyDir = componentPath.replace('.tsx', '.stories.tsx');
    
    const examples: string[] = [];
    
    try {
      const testContent = await fs.readFile(testDir, 'utf-8');
      examples.push(...this.extractExamplesFromTests(testContent));
    } catch {
      // Test file doesn't exist
    }

    try {
      const storyContent = await fs.readFile(storyDir, 'utf-8');
      examples.push(...this.extractExamplesFromStories(storyContent));
    } catch {
      // Story file doesn't exist
    }

    return examples;
  }
}
```

---

## 💡 **BEST PRACTICES AND OPTIMIZATION STRATEGIES**

### **Development Workflow Optimization**

#### **Best Practice 1: Progressive Component Development**

```typescript
// Recommended development sequence for complex components
interface ComponentDevelopmentPlan {
  phase1_foundation: {
    prompt: string;
    deliverable: string;
    duration: string;
    dependencies: string[];
  };
  phase2_enhancement: {
    prompt: string;
    deliverable: string;
    duration: string;
    dependencies: string[];
  };
  phase3_integration: {
    deliverable: string;
    duration: string;
    dependencies: string[];
  };
}

// Example: E-commerce product page development plan
const productPagePlan: ComponentDevelopmentPlan = {
  phase1_foundation: {
    prompt: 'component-create-layout.mdc',
    deliverable: 'Basic page structure with responsive grid',
    duration: '2 hours',
    dependencies: []
  },
  phase2_enhancement: {
    prompt: 'component-create-card.mdc',
    deliverable: 'Product display cards with variants',
    duration: '3 hours', 
    dependencies: ['phase1_foundation']
  },
  phase3_integration: {
    deliverable: 'Complete product page with navigation and forms',
    duration: '2 hours',
    dependencies: ['phase1_foundation', 'phase2_enhancement']
  }
};
```

#### **Best Practice 2: Quality-First Development**

```typescript
// Quality gates integrated into development workflow
interface QualityGateWorkflow {
  beforePromptUsage: QualityCheck[];
  afterComponentCreation: QualityCheck[];
  beforeIntegration: QualityCheck[];
  beforeDeployment: QualityCheck[];
}

const qualityWorkflow: QualityGateWorkflow = {
  beforePromptUsage: [
    { check: 'requirements-analysis', required: true },
    { check: 'prompt-selection-validation', required: true },
    { check: 'architecture-planning', required: true }
  ],
  afterComponentCreation: [
    { check: 'typescript-compliance', required: true },
    { check: 'accessibility-basic', required: true },
    { check: 'unit-tests-written', required: true },
    { check: 'props-documented', required: true }
  ],
  beforeIntegration: [
    { check: 'integration-tests', required: true },
    { check: 'accessibility-integration', required: true },
    { check: 'performance-validation', required: false },
    { check: 'cross-browser-testing', required: false }
  ],
  beforeDeployment: [
    { check: 'e2e-tests-passing', required: true },
    { check: 'bundle-size-validation', required: true },
    { check: 'documentation-updated', required: true },
    { check: 'security-scan', required: true }
  ]
};
```

#### **Best Practice 3: Team Collaboration Patterns**

```typescript
// Structured approach for team-based prompt usage
interface TeamCollaborationStrategy {
  roleAssignments: {
    promptSpecialist: string[];      // Team members specialized in specific prompts
    integrationLead: string;         // Responsible for cross-prompt integration
    qualityChampion: string;         // Ensures quality standards
    documentationOwner: string;      // Maintains prompt documentation
  };
  
  workflowProtocols: {
    promptSelectionReview: boolean;  // Require review for prompt selection
    pairProgramming: boolean;        // Use pair programming for complex components
    codeReviewGuidelines: string[];  // Specific review criteria for prompt-generated code
    knowledgeSharing: string[];      // Regular sharing sessions and retrospectives
  };
  
  qualityStandards: {
    minimumTestCoverage: number;
    accessibilityCompliance: string;
    performanceThresholds: PerformanceThresholds;
    documentationRequirements: string[];
  };
}

const teamStrategy: TeamCollaborationStrategy = {
  roleAssignments: {
    promptSpecialist: ['forms:alice', 'ui:bob', 'layout:carol', 'cards:dave'],
    integrationLead: 'eve',
    qualityChampion: 'frank', 
    documentationOwner: 'grace'
  },
  
  workflowProtocols: {
    promptSelectionReview: true,
    pairProgramming: true,
    codeReviewGuidelines: [
      'Verify prompt selection rationale',
      'Check integration compatibility',
      'Validate accessibility compliance',
      'Confirm testing adequacy'
    ],
    knowledgeSharing: [
      'Weekly prompt mastery sessions',
      'Monthly integration pattern reviews',
      'Quarterly prompt system retrospectives'
    ]
  },
  
  qualityStandards: {
    minimumTestCoverage: 85,
    accessibilityCompliance: 'WCAG 2.1 AA',
    performanceThresholds: {
      renderTime: 100, // milliseconds
      bundleSize: 50,  // KB per component
      memoryUsage: 10  // MB max
    },
    documentationRequirements: [
      'Component purpose and usage',
      'Props interface documentation', 
      'Integration examples',
      'Accessibility features'
    ]
  }
};
```

### **Performance Optimization Strategies**

#### **Strategy 1: Bundle Optimization**

```typescript
// Optimize component bundles for production
interface BundleOptimizationConfig {
  // Code splitting by prompt domain
  splitByDomain: boolean;
  
  // Tree shaking configuration
  treeShaking: {
    enabled: boolean;
    sideEffects: false;
    usedExports: boolean;
  };
  
  // Compression settings
  compression: {
    minification: boolean;
    gzip: boolean;
    brotli: boolean;
  };
  
  // Lazy loading strategy
  lazyLoading: {
    routeLevel: boolean;      // Lazy load entire routes
    componentLevel: boolean;  // Lazy load individual components
    chunkStrategy: 'prompt-domain' | 'feature-based' | 'size-based';
  };
}

// Webpack configuration for prompt-based optimization
const webpackOptimization = {
  splitChunks: {
    chunks: 'all',
    cacheGroups: {
      // Split by prompt domain
      formComponents: {
        test: /[\\/]components[\\/]client[\\/]forms[\\/]/,
        name: 'forms',
        priority: 10
      },
      uiComponents: {
        test: /[\\/]components[\\/]client[\\/]ui[\\/]/,
        name: 'ui',
        priority: 10
      },
      cardComponents: {
        test: /[\\/]components[\\/]server[\\/]cards[\\/]/,
        name: 'cards',
        priority: 10
      },
      layoutComponents: {
        test: /[\\/]components[\\/](client|server)[\\/]layout[\\/]/,
        name: 'layout',
        priority: 10
      }
    }
  }
};
```

#### **Strategy 2: Runtime Performance Optimization**

```typescript
// Performance monitoring and optimization for prompt-generated components
interface PerformanceMonitoringConfig {
  metricsCollection: {
    renderTimes: boolean;
    memoryUsage: boolean;
    bundleLoadTimes: boolean;
    userInteractionLatency: boolean;
  };
  
  optimizationTechniques: {
    memoization: boolean;
    virtualization: boolean;    // For large lists/grids
    prefetching: boolean;       // Prefetch component bundles
    serviceWorkerCaching: boolean;
  };
  
  performanceThresholds: {
    firstContentfulPaint: number;   // milliseconds
    largestContentfulPaint: number; // milliseconds
    cumulativeLayoutShift: number;  // score
    firstInputDelay: number;        // milliseconds
  };
}

class ComponentPerformanceMonitor {
  private metrics: Map<string, PerformanceMetric[]> = new Map();

  trackComponentRender(componentName: string, renderTime: number) {
    const componentMetrics = this.metrics.get(componentName) || [];
    componentMetrics.push({
      timestamp: Date.now(),
      renderTime,
      type: 'render'
    });
    this.metrics.set(componentName, componentMetrics);
    
    // Alert if performance threshold exceeded
    if (renderTime > this.thresholds.renderTime) {
      this.alertPerformanceIssue(componentName, 'slow-render', renderTime);
    }
  }

  generatePerformanceReport(): PerformanceReport {
    const report: PerformanceReport = {
      timestamp: new Date(),
      componentMetrics: [],
      recommendations: []
    };

    this.metrics.forEach((metrics, componentName) => {
      const avgRenderTime = metrics.reduce((sum, m) => sum + m.renderTime, 0) / metrics.length;
      
      report.componentMetrics.push({
        componentName,
        averageRenderTime: avgRenderTime,
        sampleCount: metrics.length,
        trend: this.calculateTrend(metrics)
      });

      // Generate optimization recommendations
      if (avgRenderTime > 50) {
        report.recommendations.push({
          component: componentName,
          issue: 'slow-render',
          recommendation: 'Consider memoization or component splitting',
          priority: avgRenderTime > 100 ? 'high' : 'medium'
        });
      }
    });

    return report;
  }
}
```

---

## ✅ **SUCCESS CRITERIA AND VALIDATION**

### **Troubleshooting Effectiveness Metrics**

```typescript
// Measure troubleshooting guide effectiveness
interface TroubleshootingMetrics {
  issueResolutionRate: number;      // % of issues resolved using guide
  averageResolutionTime: number;    // Minutes to resolve common issues
  userSatisfactionScore: number;    // 1-10 scale
  guideUsageFrequency: number;      // Times accessed per month
  
  commonIssuePatterns: {
    issueType: string;
    frequency: number;
    averageResolutionTime: number;
    resolutionSuccess: number;
  }[];
  
  improvementOpportunities: {
    missingContent: string[];
    unclearInstructions: string[];
    outdatedInformation: string[];
  };
}

// Validation checklist for troubleshooting guide
const troubleshootingValidation = {
  coverage: [
    'All common prompt selection issues addressed',
    'Integration problems have clear solutions',
    'Performance issues have optimization strategies',
    'Quality problems have prevention measures'
  ],
  
  usability: [
    'Issues are easy to identify and categorize',
    'Solutions are step-by-step and actionable',
    'Code examples are complete and runnable',
    'Cross-references are helpful and accurate'
  ],
  
  maintenance: [
    'Content is regularly updated with new issues',
    'Solutions are tested and validated',
    'User feedback is incorporated',
    'Metrics are tracked and analyzed'
  ]
};
```

### **Best Practices Adoption Metrics**

```typescript
// Track adoption and effectiveness of best practices
interface BestPracticesMetrics {
  adoptionRates: {
    qualityGateUsage: number;         // % of projects using quality gates
    progressiveDevelopment: number;   // % using recommended development sequence
    teamCollaboration: number;        // % following collaboration patterns
    performanceOptimization: number; // % implementing optimization strategies
  };
  
  qualityImpacts: {
    bugReductionRate: number;         // % reduction in bugs
    developmentSpeedIncrease: number; // % faster development
    maintainabilityScore: number;    // 1-10 scale
    teamSatisfaction: number;        // 1-10 scale
  };
  
  continuousImprovement: {
    feedbackLoopEffectiveness: number;
    documentationQuality: number;
    knowledgeRetention: number;
    skillDevelopment: number;
  };
}
```

---

## 🔄 **CONTINUOUS IMPROVEMENT FRAMEWORK**

### **Feedback Collection and Analysis**

```typescript
// System for collecting and analyzing feedback on troubleshooting effectiveness
interface FeedbackCollectionSystem {
  feedbackChannels: {
    issueTracking: boolean;      // GitHub issues for problems
    userSurveys: boolean;        // Regular satisfaction surveys
    usageAnalytics: boolean;     // Track guide usage patterns
    teamRetrospectives: boolean; // Regular team feedback sessions
  };
  
  analysisFramework: {
    quantitativeMetrics: string[];  // Measurable outcomes
    qualitativeInsights: string[];  // User experience feedback
    trendAnalysis: boolean;         // Track changes over time
    rootCauseAnalysis: boolean;     // Identify underlying issues
  };
  
  improvementProcess: {
    regularUpdates: string;         // Monthly, quarterly, etc.
    prioritizationCriteria: string[];
    testingProtocol: string;
    rolloutStrategy: string;
  };
}
```

---

**This comprehensive troubleshooting and best practices guide ensures the component prompt system remains effective, maintainable, and continuously improving based on real-world usage and feedback.**
