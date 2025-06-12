---
description:
globs:
alwaysApply: false
---
# 🔄 Component Development Workflows and Integration

> **Master guide for cross-prompt collaboration patterns, realistic development scenarios, and optimal workflow orchestration.**

## 🎯 **WORKFLOW INTEGRATION OBJECTIVES**

1. **ORCHESTRATE cross-prompt collaboration** for complex development scenarios
2. **OPTIMIZE user experience** with intuitive prompt discovery and selection guidance  
3. **DOCUMENT realistic workflows** that mirror actual component development needs
4. **ESTABLISH integration patterns** that maximize prompt system effectiveness
5. **PROVIDE troubleshooting resources** for common workflow challenges

---

## 📋 **PROMPT DISCOVERY AND SELECTION SYSTEM**

### **🔍 Smart Prompt Selection Decision Tree**

```
🎯 COMPONENT DEVELOPMENT GOAL ANALYSIS
│
├─── 📝 DATA COLLECTION FOCUS?
│    ├─ Login/Registration → component-create-form.mdc
│    ├─ Contact/Feedback → component-create-form.mdc  
│    ├─ Multi-step Wizard → component-create-form.mdc
│    └─ Survey/Questionnaire → component-create-form.mdc
│
├─── 🎨 INTERACTIVE UI ELEMENT?
│    ├─ Buttons/Controls → component-create-ui.mdc
│    ├─ Modals/Overlays → component-create-ui.mdc
│    ├─ Input Components → component-create-ui.mdc
│    └─ Interactive Widgets → component-create-ui.mdc
│
├─── 📐 STRUCTURAL/LAYOUT FOCUS?
│    ├─ Page Layouts → component-create-layout.mdc
│    ├─ Navigation Structure → component-create-navigation.mdc
│    ├─ Content Organization → component-create-layout.mdc
│    └─ Grid Systems → component-create-layout.mdc
│
├─── 🃏 CONTENT DISPLAY CARDS?
│    ├─ Product Cards → component-create-card.mdc
│    ├─ Profile Cards → component-create-card.mdc
│    ├─ Info Panels → component-create-card.mdc
│    └─ Data Display → component-create-card.mdc
│
├─── 🧭 NAVIGATION SYSTEMS?
│    ├─ Main Navigation → component-create-navigation.mdc
│    ├─ Breadcrumbs → component-create-navigation.mdc
│    ├─ Sidebars → component-create-navigation.mdc
│    └─ Menu Systems → component-create-navigation.mdc
│
├─── 📢 MARKETING/CONVERSION?
│    ├─ Hero Sections → component-create-marketing.mdc
│    ├─ Landing Pages → component-create-marketing.mdc
│    ├─ CTAs → component-create-marketing.mdc
│    └─ Feature Blocks → component-create-marketing.mdc
│
├─── 🎨 ICON/GRAPHIC ELEMENTS?
│    ├─ SVG Icons → component-create-icon.mdc
│    ├─ Icon Systems → component-create-icon.mdc
│    ├─ Visual Elements → component-create-icon.mdc
│    └─ Graphic Components → component-create-icon.mdc
│
└─── 🔄 COMPLEX/HYBRID COMPONENTS?
     └─ Use component-create-guide.mdc + integration patterns below
```

### **⚡ Quick Selection Guide**

| Component Type | Primary Prompt | Secondary Prompts | Integration Level |
|---|---|---|---|
| **Authentication Form** | `component-create-form.mdc` | `component-create-ui.mdc` (buttons) | Medium |
| **Product Listing Page** | `component-create-layout.mdc` | `component-create-card.mdc`, `component-create-navigation.mdc` | High |
| **User Dashboard** | `component-create-layout.mdc` | `component-create-navigation.mdc`, `component-create-card.mdc`, `component-create-ui.mdc` | Very High |
| **Marketing Landing** | `component-create-marketing.mdc` | `component-create-layout.mdc`, `component-create-form.mdc` | High |
| **Data Entry Interface** | `component-create-form.mdc` | `component-create-ui.mdc`, `component-create-layout.mdc` | Medium |
| **Content Management** | `component-create-ui.mdc` | `component-create-form.mdc`, `component-create-card.mdc` | Medium |

---

## 🏗️ **REALISTIC DEVELOPMENT SCENARIOS**

### **🛒 Scenario 1: E-Commerce Product Page Development**

**Goal**: Build a complete product page with listing, details, and purchase flow

#### **Phase 1: Page Structure** → `component-create-layout.mdc`
```typescript
// Start with layout foundation
interface ProductPageLayoutProps {
  children: React.ReactNode;
  sidebar?: React.ReactNode;
  breadcrumbs?: React.ReactNode;
}

// Layout provides structure for all other components
const ProductPageLayout: React.FC<ProductPageLayoutProps> = ({
  children,
  sidebar,
  breadcrumbs
}) => {
  return (
    <div className="product-page-layout">
      {breadcrumbs && (
        <nav className="breadcrumb-section">{breadcrumbs}</nav>
      )}
      <div className="content-grid">
        <main className="product-content">{children}</main>
        {sidebar && <aside className="product-sidebar">{sidebar}</aside>}
      </div>
    </div>
  );
};
```

#### **Phase 2: Navigation Elements** → `component-create-navigation.mdc`
```typescript
// Build breadcrumb navigation
interface ProductBreadcrumbsProps {
  category: string;
  subcategory?: string;
  productName: string;
}

// Breadcrumbs integrate with layout structure
const ProductBreadcrumbs: React.FC<ProductBreadcrumbsProps> = ({
  category,
  subcategory,
  productName
}) => {
  return (
    <nav aria-label="Breadcrumb">
      <ol className="breadcrumb-list">
        <li><Link href="/">Home</Link></li>
        <li><Link href={`/category/${category}`}>{category}</Link></li>
        {subcategory && (
          <li><Link href={`/category/${category}/${subcategory}`}>{subcategory}</Link></li>
        )}
        <li aria-current="page">{productName}</li>
      </ol>
    </nav>
  );
};
```

#### **Phase 3: Product Display Cards** → `component-create-card.mdc`
```typescript
// Create product information cards
interface ProductCardProps {
  product: Product;
  variant?: 'detailed' | 'compact' | 'featured';
  showActions?: boolean;
}

// Cards display structured product data
const ProductCard: React.FC<ProductCardProps> = ({
  product,
  variant = 'detailed',
  showActions = true
}) => {
  return (
    <article className={cn('product-card', `product-card--${variant}`)}>
      <div className="product-media">
        <Image src={product.image} alt={product.name} />
      </div>
      <div className="product-info">
        <h3 className="product-title">{product.name}</h3>
        <p className="product-price">${product.price}</p>
        <p className="product-description">{product.description}</p>
        {showActions && (
          <div className="product-actions">
            <AddToCartButton productId={product.id} />
            <WishlistButton productId={product.id} />
          </div>
        )}
      </div>
    </article>
  );
};
```

#### **Phase 4: Purchase Form** → `component-create-form.mdc`
```typescript
// Add to cart and purchase forms
interface AddToCartFormProps {
  productId: string;
  availableVariants?: ProductVariant[];
  onSuccess?: () => void;
}

// Form handles product purchase workflow
const AddToCartForm: React.FC<AddToCartFormProps> = ({
  productId,
  availableVariants,
  onSuccess
}) => {
  const [quantity, setQuantity] = useState(1);
  const [selectedVariant, setSelectedVariant] = useState<string>();
  
  return (
    <form onSubmit={handleAddToCart} className="add-to-cart-form">
      {availableVariants && (
        <VariantSelector 
          variants={availableVariants}
          selected={selectedVariant}
          onChange={setSelectedVariant}
        />
      )}
      <QuantitySelector value={quantity} onChange={setQuantity} />
      <button type="submit" className="add-to-cart-button">
        Add to Cart
      </button>
    </form>
  );
};
```

#### **Phase 5: Interactive UI Elements** → `component-create-ui.mdc`
```typescript
// Interactive elements that enhance UX
interface QuantitySelectorProps {
  value: number;
  onChange: (value: number) => void;
  min?: number;
  max?: number;
}

// UI component provides interactive controls
const QuantitySelector: React.FC<QuantitySelectorProps> = ({
  value,
  onChange,
  min = 1,
  max = 10
}) => {
  return (
    <div className="quantity-selector">
      <label htmlFor="quantity">Quantity</label>
      <div className="quantity-controls">
        <button 
          type="button"
          onClick={() => onChange(Math.max(min, value - 1))}
          disabled={value <= min}
          aria-label="Decrease quantity"
        >
          -
        </button>
        <input
          id="quantity"
          type="number"
          value={value}
          onChange={(e) => onChange(Number(e.target.value))}
          min={min}
          max={max}
        />
        <button 
          type="button"
          onClick={() => onChange(Math.min(max, value + 1))}
          disabled={value >= max}
          aria-label="Increase quantity"
        >
          +
        </button>
      </div>
    </div>
  );
};
```

**Cross-Prompt Integration Benefits:**
- ✅ **Layout provides structure** for all other components
- ✅ **Navigation integrates seamlessly** with layout framework
- ✅ **Cards display content** within layout constraints
- ✅ **Forms handle interactions** with proper validation
- ✅ **UI elements enhance** user experience consistently

---

### **🏢 Scenario 2: User Dashboard Development**

**Goal**: Create a comprehensive user dashboard with navigation, data display, and management tools

#### **Workflow Orchestration:**

1. **Foundation** → `component-create-layout.mdc`
   - Main dashboard layout with sidebar and content areas
   - Responsive grid system for dashboard widgets
   - Proper semantic structure for screen readers

2. **Navigation** → `component-create-navigation.mdc`  
   - Sidebar navigation with user context
   - Tab navigation for dashboard sections
   - Breadcrumb navigation for deep sections

3. **Data Display** → `component-create-card.mdc`
   - Statistics cards for key metrics
   - Activity feed cards for recent actions
   - Information cards for user data

4. **Management Tools** → `component-create-form.mdc`
   - Settings forms for user preferences
   - Data entry forms for content management
   - Search and filter forms

5. **Interactive Controls** → `component-create-ui.mdc`
   - Toggle switches for settings
   - Action buttons for common tasks
   - Status indicators and badges

#### **Integration Pattern:**
```typescript
// Dashboard orchestrates all specialized components
const UserDashboard: React.FC<DashboardProps> = ({ user }) => {
  return (
    <DashboardLayout> {/* Layout prompt */}
      <DashboardSidebar> {/* Navigation prompt */}
        <UserNav user={user} />
        <QuickActions />
      </DashboardSidebar>
      
      <DashboardContent>
        <StatsCardGrid> {/* Card prompt */}
          <MetricCard title="Total Orders" value={user.orderCount} />
          <MetricCard title="Account Balance" value={user.balance} />
        </StatsCardGrid>
        
        <DashboardSection>
          <UserSettingsForm user={user} /> {/* Form prompt */}
          <ActivityFeed activities={user.recentActivity} /> {/* Card prompt */}
        </DashboardSection>
      </DashboardContent>
    </DashboardLayout>
  );
};
```

---

### **🎯 Scenario 3: Marketing Landing Page**

**Goal**: Build a conversion-optimized landing page with hero section, features, and lead capture

#### **Multi-Prompt Workflow:**

1. **Hero Section** → `component-create-marketing.mdc`
2. **Page Structure** → `component-create-layout.mdc`  
3. **Feature Cards** → `component-create-card.mdc`
4. **Lead Capture** → `component-create-form.mdc`
5. **CTAs and Buttons** → `component-create-ui.mdc`
6. **Icons and Graphics** → `component-create-icon.mdc`

#### **Integration Example:**
```typescript
// Landing page combines marketing, layout, and conversion elements
const LandingPage: React.FC<LandingPageProps> = ({ campaign }) => {
  return (
    <LandingPageLayout> {/* Layout foundation */}
      <HeroSection campaign={campaign}> {/* Marketing prompt */}
        <HeroTitle>{campaign.headline}</HeroTitle>
        <HeroSubtitle>{campaign.subtitle}</HeroSubtitle>
        <CTAButton variant="primary">Get Started</CTAButton> {/* UI prompt */}
      </HeroSection>
      
      <FeaturesSection>
        <FeatureGrid> {/* Layout prompt */}
          {campaign.features.map(feature => (
            <FeatureCard key={feature.id} feature={feature} /> {/* Card prompt */}
          ))}
        </FeatureGrid>
      </FeaturesSection>
      
      <LeadCaptureSection>
        <NewsletterForm onSubmit={handleSubmit} /> {/* Form prompt */}
      </LeadCaptureSection>
    </LandingPageLayout>
  );
};
```

---

## 🔧 **CROSS-PROMPT INTEGRATION PATTERNS**

### **Pattern 1: Layout → Content Component Flow**

**Use Case**: Structural component provides framework for content components

```typescript
// 1. Start with Layout (provides structure)
const PageLayout = () => (
  <div className="page-layout">
    <header className="page-header">{/* Navigation components */}</header>
    <main className="page-content">{/* Content components */}</main>
    <aside className="page-sidebar">{/* Card components */}</aside>
  </div>
);

// 2. Add Navigation (fits within layout)
const MainNavigation = () => (
  <nav className="main-nav">
    {/* Navigation structure that fits layout header */}
  </nav>
);

// 3. Insert Content Components (use layout content area)
const ContentArea = () => (
  <section className="content-section">
    {/* Forms, cards, UI elements within layout main */}
  </section>
);
```

### **Pattern 2: Form → UI Component Integration**

**Use Case**: Forms need custom UI components for enhanced UX

```typescript
// 1. Create Form Foundation
const ContactForm = () => {
  return (
    <form onSubmit={handleSubmit}>
      {/* Form structure from form prompt */}
    </form>
  );
};

// 2. Enhance with UI Components
const EnhancedContactForm = () => {
  return (
    <form onSubmit={handleSubmit}>
      <CustomInput /> {/* UI prompt component */}
      <FileUploadWidget /> {/* UI prompt component */}
      <SubmitButton loading={isLoading} /> {/* UI prompt component */}
    </form>
  );
};
```

### **Pattern 3: Card → Form Interaction**

**Use Case**: Cards that contain interactive forms or trigger form modals

```typescript
// 1. Card Display
const ProductCard = ({ product }) => (
  <article className="product-card">
    <ProductInfo product={product} />
    <QuickOrderForm productId={product.id} /> {/* Embedded form */}
  </article>
);

// 2. Form Integration
const QuickOrderForm = ({ productId }) => (
  <form className="quick-order-form">
    {/* Compact form designed for card context */}
  </form>
);
```

---

## 🎯 **USER EXPERIENCE OPTIMIZATION**

### **Prompt Discovery Enhancement**

#### **Contextual Recommendations**
```typescript
// Smart recommendations based on project context
interface PromptRecommendation {
  scenario: string;
  primaryPrompt: string;
  secondaryPrompts: string[];
  complexity: 'low' | 'medium' | 'high';
  estimatedTime: string;
}

const promptRecommendations: PromptRecommendation[] = [
  {
    scenario: "Building authentication flow",
    primaryPrompt: "component-create-form.mdc",
    secondaryPrompts: ["component-create-ui.mdc", "component-create-layout.mdc"],
    complexity: "medium",
    estimatedTime: "2-3 hours"
  },
  {
    scenario: "Creating product catalog",
    primaryPrompt: "component-create-card.mdc", 
    secondaryPrompts: ["component-create-layout.mdc", "component-create-navigation.mdc"],
    complexity: "high",
    estimatedTime: "4-6 hours"
  }
];
```

#### **Progressive Disclosure System**
```markdown
## Beginner Path 🌱
1. Start with `component-create-guide.mdc` to understand basics
2. Try single-domain prompts (form, ui, card)
3. Gradually combine 2 prompts for simple integrations

## Intermediate Path 🌿
1. Use specialized prompts directly for known requirements
2. Combine 2-3 prompts for medium complexity features
3. Reference this integration guide for workflow patterns

## Advanced Path 🌳
1. Orchestrate multiple prompts for complex features
2. Create custom integration patterns
3. Contribute back to workflow documentation
```

### **Workflow Optimization Strategies**

#### **Parallel Development Patterns**
```typescript
// Develop components in parallel when dependencies allow
interface ParallelDevelopmentPlan {
  phase1: string[]; // Independent components
  phase2: string[]; // Components that depend on phase1
  phase3: string[]; // Final integration components
}

const ecommerceDevelopmentPlan: ParallelDevelopmentPlan = {
  phase1: [
    "ProductCard (card prompt)",
    "SearchForm (form prompt)",
    "CTAButton (ui prompt)"
  ],
  phase2: [
    "ProductGrid (layout prompt + cards)",
    "Navigation (navigation prompt + ui)"
  ],
  phase3: [
    "ProductPage (integration of all components)"
  ]
};
```

#### **Quality Gates Integration**
```typescript
// Checkpoints between prompt usage
interface QualityGate {
  afterPrompt: string;
  validations: string[];
  nextSteps: string[];
}

const qualityGates: QualityGate[] = [
  {
    afterPrompt: "component-create-form.mdc",
    validations: [
      "Zod schema validation working",
      "Accessibility compliance verified",
      "Server action integration tested"
    ],
    nextSteps: [
      "Add UI enhancements (ui prompt)",
      "Integrate with layout (layout prompt)",
      "Add success/error states"
    ]
  }
];
```

---

## 🚨 **TROUBLESHOOTING AND COMMON PATTERNS**

### **Common Integration Challenges**

#### **Challenge 1: Prompt Overlap Confusion**
**Symptoms**: Unsure which prompt to use when component spans multiple domains

**Solutions**:
```typescript
// Use domain analysis to determine primary responsibility
interface ComponentAnalysis {
  primaryPurpose: 'data-collection' | 'data-display' | 'structure' | 'interaction';
  secondaryFeatures: string[];
  recommendedPrimary: string;
  integrationPrompts: string[];
}

// Example: Contact form with fancy animations
const contactFormAnalysis: ComponentAnalysis = {
  primaryPurpose: 'data-collection', // Form domain
  secondaryFeatures: ['animations', 'custom-styling'],
  recommendedPrimary: 'component-create-form.mdc',
  integrationPrompts: ['component-create-ui.mdc'] // For animations
};
```

#### **Challenge 2: Component Architecture Conflicts**
**Symptoms**: Components from different prompts don't integrate well

**Solutions**:
- **Establish clear interfaces** between components
- **Use composition patterns** rather than tight coupling
- **Follow consistent prop patterns** across all prompts

```typescript
// Consistent prop patterns across prompt domains
interface BaseComponentProps {
  className?: string;
  'data-testid'?: string;
  children?: React.ReactNode;
}

// All prompt components extend this base
interface FormProps extends BaseComponentProps {
  onSubmit: (data: unknown) => void;
  // Form-specific props
}

interface CardProps extends BaseComponentProps {
  variant?: string;
  // Card-specific props  
}
```

#### **Challenge 3: Testing Strategy Across Prompts**
**Symptoms**: Different testing approaches from different prompts

**Solutions**:
```typescript
// Unified testing strategy for integrated components
describe('Integrated Component Suite', () => {
  describe('Individual Components', () => {
    // Test each component in isolation using their respective prompt testing patterns
  });
  
  describe('Integration Tests', () => {
    // Test component interactions and workflows
    it('should handle form submission with layout updates', () => {
      // Cross-prompt integration testing
    });
  });
  
  describe('Accessibility Integration', () => {
    // Test that accessibility works across component boundaries
  });
});
```

### **Performance Optimization Patterns**

#### **Lazy Loading Strategy**
```typescript
// Optimize loading for multi-prompt component systems
const DashboardPage = () => {
  return (
    <Suspense fallback={<DashboardSkeleton />}>
      <DashboardLayout>
        <Suspense fallback={<NavSkeleton />}>
          <DashboardNavigation />
        </Suspense>
        <Suspense fallback={<ContentSkeleton />}>
          <DashboardContent />
        </Suspense>
      </DashboardLayout>
    </Suspense>
  );
};
```

#### **Bundle Optimization**
```typescript
// Code splitting for prompt-generated components
const FormComponents = lazy(() => import('./forms'));
const UIComponents = lazy(() => import('./ui'));
const LayoutComponents = lazy(() => import('./layout'));

// Load only what's needed for each page
```

---

## ✅ **WORKFLOW SUCCESS CRITERIA**

### **Integration Quality Checklist**

#### **Cross-Prompt Compatibility**
- [ ] **Consistent prop interfaces** across prompt-generated components
- [ ] **Compatible styling patterns** (TailwindCSS classes align)
- [ ] **Unified accessibility approach** (ARIA patterns consistent)
- [ ] **Testing strategy alignment** (vitest, accessibility tests)
- [ ] **Performance considerations** (bundle size, lazy loading)

#### **User Experience Validation**
- [ ] **Intuitive prompt selection** based on development goals
- [ ] **Clear integration examples** for common scenarios
- [ ] **Troubleshooting resources** for workflow challenges
- [ ] **Performance guidance** for multi-prompt applications
- [ ] **Quality gates** ensuring component integration success

#### **Documentation Completeness**
- [ ] **Realistic development scenarios** with multi-prompt workflows
- [ ] **Cross-reference system** linking related prompts effectively
- [ ] **Integration patterns** documented with working examples
- [ ] **Troubleshooting guide** covering common workflow issues
- [ ] **Best practices** for prompt orchestration and optimization

---

## 🎯 **WORKFLOW MASTERY PROGRESSION**

### **Level 1: Single Prompt Mastery**
- Master individual prompt usage
- Understand each prompt's specialized domain
- Build components following prompt best practices

### **Level 2: Two-Prompt Integration**
- Combine layout + content prompts
- Integrate form + UI prompts
- Master card + navigation combinations

### **Level 3: Multi-Prompt Orchestration**
- Build complex features using 3+ prompts
- Create custom integration patterns
- Optimize workflows for team development

### **Level 4: Workflow Innovation**
- Develop new integration patterns
- Contribute to workflow documentation
- Mentor others in prompt system usage

---

**This workflow integration system transforms individual specialized prompts into a powerful, cohesive development environment that scales from simple components to complex application features.**
