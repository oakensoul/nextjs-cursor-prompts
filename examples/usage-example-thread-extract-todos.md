# Usage Example: Thread Action Item Extraction

This example demonstrates how to use the `prompt-thread-extract-todos.mdc` prompt to automatically organize action items from a complex conversation thread.

## 🎯 **Scenario: Complex Development Thread**

**Situation**: You've been working on a complex feature implementation that involved:
- Multiple file modifications (components, APIs, tests)  
- Architecture decisions and trade-off discussions
- Several identified improvements and optimizations
- Unresolved issues and future enhancements
- Documentation gaps and testing needs

**Thread Characteristics**:
- 30+ messages with high technical complexity
- 8+ files modified across different domains
- Multiple workstreams (implementation + testing + documentation)
- Several architectural decisions made
- Various future work items identified throughout

## 🚀 **Using the Extract Todos Prompt**

### **Step 1: Invoke the Prompt**
```
@prompt-thread-extract-todos
```

### **Step 2: Automatic Analysis**
The prompt will automatically:

1. **Analyze Thread Status**:
   ```
   📊 Thread Metadata:
   Estimated message count: 32 messages
   Primary focus areas: Feature implementation, API design, testing strategy
   Technical domains: NextJS, TypeScript, React, Testing, Documentation
   Conversation complexity: Very Complex
   ```

2. **Identify Action Items**:
   ```
   🔍 Action Item Discovery:
   ✅ Explicit mentions: 4 items ("we need to implement X", "should optimize Y")
   ✅ Implicit requirements: 3 items (logical next steps from completed work)
   ✅ Unfinished discussions: 2 items (topics mentioned but not explored)
   ✅ Quality improvements: 3 items (identified optimizations)
   ✅ Testing validation: 2 items (verification work needed)
   ✅ Documentation gaps: 2 items (missing docs identified)
   ```

3. **Calculate Complexity Score**:
   ```
   📊 Thread Status Analysis:
   Message count: 32
   Files modified: 8
   Tool usage: 25+ tool calls
   Context switching: 4 workstreams
   Decision complexity: 5 major decisions
   Calculated complexity score: 67 points
   🔄 Recommendation: CONTINUE IN NEW THREAD (Very High complexity)
   ```

### **Step 3: Generated Todo Structure**

The prompt automatically creates:

```
todo/
├── README.md                                    # Comprehensive index and guidance
├── thread-continuation-api-optimization.md     # Critical: API performance improvements
├── thread-continuation-test-coverage.md        # Critical: Comprehensive testing implementation  
├── thread-continuation-error-handling.md       # Important: Robust error handling patterns
├── thread-continuation-documentation.md        # Important: User guide and API docs
└── thread-continuation-monitoring.md           # Enhancement: Performance monitoring setup
```

### **Step 4: Generated README.md Content**

```markdown
# Thread Continuation Templates - TODO Folder

## 📋 **Available Templates**

### **1. [API Optimization](thread-continuation-api-optimization.md)**
**Priority**: Critical  
**Focus**: Implement caching layer and optimize database queries
**Next Steps**: Design caching strategy, implement Redis integration, optimize N+1 queries

### **2. [Test Coverage Enhancement](thread-continuation-test-coverage.md)**
**Priority**: Critical  
**Focus**: Achieve 90%+ test coverage with integration and e2e tests
**Next Steps**: Add missing unit tests, implement integration test suite, set up e2e testing

### **3. [Error Handling Patterns](thread-continuation-error-handling.md)**
**Priority**: Important  
**Focus**: Implement consistent error handling across API and UI
**Next Steps**: Design error taxonomy, implement error boundaries, add user-friendly messages

### **4. [Documentation Completion](thread-continuation-documentation.md)**
**Priority**: Important  
**Focus**: Create comprehensive user guide and API documentation
**Next Steps**: Write API reference, create user workflow guides, add code examples

### **5. [Performance Monitoring](thread-continuation-monitoring.md)**
**Priority**: Enhancement  
**Focus**: Set up comprehensive performance monitoring and alerting
**Next Steps**: Integrate monitoring tools, define performance metrics, set up alerts

## 🔄 **Thread Management System Validation**

**Complexity Assessment** (Current Thread):
- Message Count: 32 messages (Extended thread territory)
- Files Modified: 8+ files (High code volume threshold exceeded)
- Tool Usage: 25+ tool calls (High intensity threshold met)  
- Context Switching: 4 workstreams (Multiple concurrent tasks)
- Decision Complexity: 5 major architectural decisions

**Calculated Complexity Score**: 67 points (**Very High** complexity)

**🔄 Thread Management Recommendation**: Our conversation has reached very high complexity (67 points) and extended length (32+ messages). The thread management system strongly recommends transitioning to focused new threads using these continuation templates.
```

## ✅ **Results and Benefits**

### **What You Get**:
- **5 focused continuation templates** with complete context preservation
- **Priority-organized work items** (Critical → Important → Enhancement)
- **Complexity analysis validation** of your thread management system  
- **Ready-to-use thread starters** for immediate productive work
- **Clear workflow guidance** and success criteria for each item

### **Workflow Integration**:
1. **Choose Priority Item**: Start with critical items first
2. **Copy Template**: Use entire template content to start new thread
3. **Focus Execution**: Work on single item with preserved context
4. **Track Progress**: Use success criteria to validate completion
5. **Iterate**: Move to next priority item when ready

### **Quality Assurance**:
- ✅ Complete context preservation (no information loss)
- ✅ Actionable next steps with specific deliverables
- ✅ Realistic effort estimates and dependencies
- ✅ Integration with existing thread management workflow
- ✅ Complexity scoring validates thread management system

## 🎯 **When to Use This Prompt**

### **Ideal Scenarios**:
- Complex threads with 20+ messages and multiple work items
- High complexity conversations (40+ complexity points)
- Multiple concurrent workstreams or context switching
- Planning phase completion with implementation work ahead
- Team handoffs or knowledge transfer situations

### **Expected Outcomes**:
- Organized, prioritized work items ready for focused execution
- Reduced context switching and improved development efficiency  
- Clear handoff packages for team collaboration
- Validation of thread management system effectiveness
- Seamless transition from complex planning to focused implementation

---

**This prompt transforms overwhelming complex threads into organized, actionable work that can be efficiently executed in focused sessions, dramatically improving development workflow and productivity.** 