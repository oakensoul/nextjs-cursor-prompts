# Component Development Prompts

**Comprehensive React component creation and enhancement prompts with intelligent domain routing**

## 📁 **Component Category Overview**

This folder contains specialized prompts for React component development, from initial creation to ongoing maintenance and enhancement. The prompts are organized by component type and development lifecycle stage to ensure optimal development workflows.

## 🎯 **Available Component Creation Prompts**

### **Core Creation Prompts**

#### **component-create-guide.mdc** ⭐
- **Purpose**: Master orchestrator for component creation with intelligent routing
- **Scope**: Domain analysis, prompt routing, general-purpose component creation
- **Usage**: Entry point for all component creation - routes to specialized prompts
- **Deliverables**: Domain assessment, routing recommendations, or complete component

#### **component-create-form.mdc**
- **Purpose**: Form-focused component creation with validation and accessibility
- **Scope**: Login forms, data entry, multi-step wizards, field validation
- **Standards**: Form accessibility, validation patterns, user experience
- **Deliverables**: Complete form components with validation and testing

#### **component-create-ui.mdc**
- **Purpose**: Reusable UI element creation with variants and interactions
- **Scope**: Buttons, inputs, modals, tooltips, interactive elements
- **Standards**: Design system compliance, accessibility, state management
- **Deliverables**: Flexible UI components with comprehensive documentation

#### **component-create-layout.mdc**
- **Purpose**: Layout and structural component creation
- **Scope**: Headers, footers, grids, page layouts, responsive design
- **Standards**: Responsive design, semantic HTML, layout best practices
- **Deliverables**: Structural components with responsive behavior

#### **component-create-card.mdc**
- **Purpose**: Card-based content display component creation
- **Scope**: Data cards, product cards, info panels, content blocks
- **Standards**: Content hierarchy, accessibility, interaction patterns
- **Deliverables**: Card components with flexible content structures

#### **component-create-navigation.mdc**
- **Purpose**: Navigation component creation with accessibility focus
- **Scope**: Main navigation, breadcrumbs, tabs, pagination, menu systems
- **Standards**: Navigation accessibility, keyboard support, responsive behavior
- **Deliverables**: Accessible navigation components with full keyboard support

#### **component-create-marketing.mdc**
- **Purpose**: Marketing-focused component creation with SEO optimization
- **Scope**: Hero sections, landing pages, CTAs, conversion optimization
- **Standards**: SEO best practices, performance optimization, conversion focus
- **Deliverables**: Marketing components with analytics and performance tracking

#### **component-create-icon.mdc**
- **Purpose**: Icon component and icon system creation
- **Scope**: SVG icons, icon systems, graphic elements, accessibility
- **Standards**: Icon accessibility, consistent sizing, scalable systems
- **Deliverables**: Icon components with proper ARIA labels and documentation

## 🔄 **Available Component Update Prompts**

### **Enhancement and Maintenance Prompts**

#### **component-update-ui.mdc**
- **Purpose**: Enhance existing UI components with new features or improvements
- **Scope**: Adding variants, improving accessibility, performance optimization
- **Usage**: When updating buttons, inputs, modals, and interactive elements
- **Deliverables**: Enhanced components with backward compatibility

#### **component-update-form.mdc**
- **Purpose**: Improve form components with advanced validation and UX
- **Scope**: Adding field types, validation rules, accessibility improvements
- **Usage**: When extending form functionality or fixing form issues
- **Deliverables**: Improved form components with comprehensive validation

#### **component-update-layout.mdc**
- **Purpose**: Enhance layout components with responsive improvements
- **Scope**: Mobile optimization, grid improvements, accessibility updates
- **Usage**: When updating structural components for better responsiveness
- **Deliverables**: Enhanced layout components with improved responsive behavior

#### **component-update-card.mdc**
- **Purpose**: Improve card components with new layouts and interactions
- **Scope**: New card variants, interaction states, performance optimization
- **Usage**: When adding new card types or improving existing card components
- **Deliverables**: Enhanced card components with new features and better performance

#### **component-update-navigation.mdc**
- **Purpose**: Enhance navigation components with improved accessibility and UX
- **Scope**: Keyboard navigation, screen reader support, responsive improvements
- **Usage**: When improving navigation accessibility or adding new navigation patterns
- **Deliverables**: Enhanced navigation with comprehensive accessibility support

#### **component-update-marketing.mdc**
- **Purpose**: Optimize marketing components for better conversion and performance
- **Scope**: A/B testing setup, conversion optimization, performance improvements
- **Usage**: When optimizing marketing components for better business results
- **Deliverables**: Optimized marketing components with analytics integration

#### **component-update-icon.mdc**
- **Purpose**: Enhance icon systems with new icons and improved accessibility
- **Scope**: Icon system expansion, accessibility improvements, optimization
- **Usage**: When adding new icons or improving existing icon systems
- **Deliverables**: Enhanced icon systems with improved accessibility and documentation

## 🎯 **Component Development Patterns**

### **New Component Creation Workflow** ⭐
```bash
# Intelligent component creation with routing
Please follow .cursor/prompts/component/component-create-guide.mdc
Create a user profile card component with editing capabilities

# The guide will:
# 1. Analyze the component domain (likely routes to component-create-card.mdc)
# 2. Apply specialized card creation patterns
# 3. Include editing functionality with form elements
# 4. Ensure comprehensive testing and accessibility
```

### **Specialized Component Creation**
```bash
# Direct specialized component creation
Please follow .cursor/prompts/component/component-create-form.mdc
Create a multi-step user registration form with validation

# Or for UI components
Please follow .cursor/prompts/component/component-create-ui.mdc
Create a flexible button component with loading states and variants
```

### **Component Enhancement**
```bash
# Enhance existing components
Please follow .cursor/prompts/component/component-update-ui.mdc
Add dark mode support and accessibility improvements to the existing Modal component
```

### **Component System Development**
```bash
# Create coordinated component systems
Please follow these component prompts in sequence:
1. .cursor/prompts/component/component-create-icon.mdc - Create icon system
2. .cursor/prompts/component/component-create-ui.mdc - Create button system
3. .cursor/prompts/component/component-create-form.mdc - Create form system

Create a cohesive design system with icons, buttons, and forms
```

## 📊 **Component Development Standards**

### **Code Quality Requirements**
- **TypeScript**: Strict typing with proper interfaces and generics
- **Accessibility**: WCAG 2.1 AA compliance with proper ARIA labels
- **Testing**: Unit tests, integration tests, and accessibility testing
- **Documentation**: Component API documentation and usage examples
- **Performance**: Optimized rendering and bundle size considerations

### **Architecture Standards**
- **Composition**: Prefer composition over inheritance
- **Prop Design**: Intuitive, flexible, and type-safe props
- **State Management**: Local state with appropriate state management patterns
- **Error Handling**: Graceful error boundaries and fallback states
- **Responsive Design**: Mobile-first responsive behavior

### **File Structure Standards**
```
src/components/[domain]/ComponentName/
├── index.ts                    # Barrel export
├── ComponentName.tsx           # Main component
├── ComponentName.types.ts      # TypeScript interfaces
├── ComponentName.styles.ts     # Styled components or CSS modules
├── ComponentName.test.tsx      # Unit tests
├── ComponentName.stories.tsx   # Storybook stories
└── README.md                   # Component documentation
```

## 🔄 **Integration with Other Prompt Categories**

### **Quality Assurance Integration**
```bash
# Component creation with quality review
1. Create: .cursor/prompts/component/component-create-ui.mdc
2. Review: .cursor/prompts/quality/quality-review-code.mdc
3. Test: .cursor/prompts/test/test-create-unit.mdc
4. Document: .cursor/prompts/documentation/documentation-create-developer.mdc
```

### **Git Workflow Integration**
```bash
# Component development workflow
1. Branch: .cursor/prompts/git/git-branch-create.mdc
2. Create: .cursor/prompts/component/component-create-[type].mdc
3. Test: .cursor/prompts/test/test-create-comprehensive.mdc
4. Ship: .cursor/prompts/git/git-code-shipit.mdc
```

## 🎨 **Component Domain Reference**

### **When to Use Each Creation Prompt**

| Component Type | Examples | Use Prompt |
|----------------|----------|------------|
| **Forms** | Login, registration, contact forms, surveys | `component-create-form.mdc` |
| **UI Elements** | Buttons, inputs, modals, tooltips, badges | `component-create-ui.mdc` |
| **Layout** | Headers, footers, grids, page layouts | `component-create-layout.mdc` |
| **Cards** | Product cards, user profiles, info panels | `component-create-card.mdc` |
| **Navigation** | Menus, breadcrumbs, tabs, pagination | `component-create-navigation.mdc` |
| **Marketing** | Hero sections, CTAs, landing pages | `component-create-marketing.mdc` |
| **Icons** | SVG icons, icon systems, graphics | `component-create-icon.mdc` |
| **Complex/Hybrid** | Business logic, multi-domain components | `component-create-guide.mdc` |

### **When to Use Update Prompts**

| Update Scenario | Examples | Use Prompt |
|-----------------|----------|------------|
| **UI Enhancement** | Adding variants, improving interactions | `component-update-ui.mdc` |
| **Form Improvement** | New validation, field types, UX | `component-update-form.mdc` |
| **Layout Optimization** | Responsive improvements, accessibility | `component-update-layout.mdc` |
| **Card Enhancement** | New layouts, interaction states | `component-update-card.mdc` |
| **Navigation UX** | Accessibility, keyboard support | `component-update-navigation.mdc` |
| **Marketing Optimization** | Conversion, A/B testing, performance | `component-update-marketing.mdc` |
| **Icon System Growth** | New icons, accessibility, optimization | `component-update-icon.mdc` |

## 🚀 **Best Practices**

### **Component Creation Process**
1. **Domain Analysis**: Use `component-create-guide.mdc` for intelligent routing
2. **Specialized Creation**: Apply domain-specific prompt for optimal results
3. **Quality Review**: Apply quality review prompts for code assessment
4. **Testing**: Create comprehensive tests with testing prompts
5. **Documentation**: Document component API and usage patterns
6. **Integration**: Integrate with existing design system and patterns

### **Component Enhancement Process**
1. **Assessment**: Evaluate current component limitations and requirements
2. **Specialized Update**: Use appropriate `component-update-*.mdc` prompt
3. **Backward Compatibility**: Ensure existing usage patterns continue to work
4. **Testing**: Update and expand test coverage for new functionality
5. **Documentation**: Update component documentation and examples
6. **Migration Guide**: Provide guidance for adopting new features

### **Component Architecture Principles**
- **Single Responsibility**: Each component has a clear, focused purpose
- **Composition over Inheritance**: Build complex components from simple ones
- **Props Interface Design**: Intuitive, type-safe, and flexible component APIs
- **Accessibility First**: Built-in accessibility with proper ARIA support
- **Performance Conscious**: Optimized rendering and minimal bundle impact
- **Testing Friendly**: Designed for easy testing and debugging

---

**These component development prompts ensure consistent, high-quality React component creation and maintenance with specialized domain expertise and comprehensive quality assurance.** 