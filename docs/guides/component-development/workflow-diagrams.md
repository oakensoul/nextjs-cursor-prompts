---
description:
globs:
alwaysApply: false
---
# 📊 Component Development Workflow Diagrams

> **Visual reference diagrams for component prompt system workflows and integration patterns.**

## 🎯 **PROMPT SYSTEM ARCHITECTURE**

```mermaid
flowchart TD
    subgraph "Core Prompts"
        G["component-create-guide.mdc"] --> F["component-create-form.mdc"]
        G --> U["component-create-ui.mdc"]
        G --> L["component-create-layout.mdc"]
        G --> C["component-create-card.mdc"]
        G --> N["component-create-navigation.mdc"]
        G --> M["component-create-marketing.mdc"]
        G --> I["component-create-icon.mdc"]
        
        F -. "update" .-> UF["component-update-form.mdc"]
        U -. "update" .-> UU["component-update-ui.mdc"]
        L -. "update" .-> UL["component-update-layout.mdc"]
        C -. "update" .-> UC["component-update-card.mdc"]
        N -. "update" .-> UN["component-update-navigation.mdc"]
        M -. "update" .-> UM["component-update-marketing.mdc"]
        I -. "update" .-> UI["component-update-icon.mdc"]
    end
    
    subgraph "Integration Resources"
        W["component-workflow-integration.mdc"]
        T["component-troubleshooting-guide.mdc"]
        D["component-workflow-diagram.mdc"]
    end
    
    G <--> W
    G <--> T
    W <--> T
    D <-. "visualizes" .-> W
    D <-. "visualizes" .-> T
    
    style G fill:#f9f,stroke:#333,stroke-width:2px
    style W fill:#bbf,stroke:#333,stroke-width:2px
    style T fill:#bbf,stroke:#333,stroke-width:2px
    style D fill:#ffd,stroke:#333,stroke-width:2px
```

## 🔄 **COMPONENT DEVELOPMENT WORKFLOW**

```mermaid
flowchart LR
    Start(["Start"]) --> Analysis["Component Analysis"]
    Analysis --> Domain{"Domain Selection"}
    
    Domain -->|"Data Collection"| Form["component-create-form.mdc"]
    Domain -->|"UI Elements"| UI["component-create-ui.mdc"]
    Domain -->|"Structure"| Layout["component-create-layout.mdc"]
    Domain -->|"Content Cards"| Card["component-create-card.mdc"]
    Domain -->|"Navigation"| Nav["component-create-navigation.mdc"]
    Domain -->|"Marketing"| Marketing["component-create-marketing.mdc"]
    Domain -->|"Icons"| Icon["component-create-icon.mdc"]
    Domain -->|"Hybrid/Complex"| Integration["component-workflow-integration.mdc"]
    
    Form & UI & Layout & Card & Nav & Marketing & Icon --> Impl["Implementation"]
    Integration -->|"Multiple Domains"| Impl
    
    Impl --> Issues{"Issues?"}
    Issues -->|"Yes"| Troubleshoot["component-troubleshooting-guide.mdc"]
    Issues -->|"No"| Testing["Testing"]
    Troubleshoot --> Testing
    
    Testing --> Done(["Complete"])
    
    classDef primary fill:#f9f,stroke:#333,stroke-width:2px
    classDef secondary fill:#bbf,stroke:#333,stroke-width:2px
    classDef process fill:#dfd,stroke:#333
    classDef decision fill:#ffd,stroke:#333
    
    class Analysis,Impl,Testing process
    class Domain,Issues decision
    class Form,UI,Layout,Card,Nav,Marketing,Icon secondary
    class Integration,Troubleshoot primary
```

## 🛠️ **MULTI-PROMPT INTEGRATION PATTERN**

```mermaid
flowchart TD
    subgraph "Component Architecture"
        Layout["Layout Component<br>(component-create-layout.mdc)"]
        Nav["Navigation Component<br>(component-create-navigation.mdc)"]
        Card["Card Component<br>(component-create-card.mdc)"]
        Form["Form Component<br>(component-create-form.mdc)"]
        UI["UI Elements<br>(component-create-ui.mdc)"]
        
        Layout --> Nav
        Layout --> Card
        Layout --> Form
        Card --> UI
        Form --> UI
    end
    
    Start(["Start"]) --> Layout
    Layout --> Quality["Quality Gates"]
    Quality --> Issues{"Issues?"}
    Issues -->|"Yes"| Troubleshoot["Troubleshooting<br>(component-troubleshooting-guide.mdc)"]
    Issues -->|"No"| Done(["Complete"])
    Troubleshoot --> Issues
    
    classDef container fill:#f5f5f5,stroke:#333
    classDef component fill:#dfd,stroke:#333
    classDef process fill:#bbf,stroke:#333
    classDef decision fill:#ffd,stroke:#333
    
    class "Component Architecture" container
    class Layout,Nav,Card,Form,UI component
    class Quality,Troubleshoot process
    class Issues decision
```

## 📈 **COMPONENT COMPLEXITY PROGRESSION**

```mermaid
flowchart LR
    subgraph "Beginner"
        B1["Single Domain Component<br>component-create-ui.mdc"]
    end
    
    subgraph "Intermediate"
        I1["Two Domain Integration<br>Forms + UI"]
        I2["Layout Structure<br>component-create-layout.mdc"]
    end
    
    subgraph "Advanced"
        A1["Multi-Domain Integration<br>component-workflow-integration.mdc"]
        A2["Performance Optimization<br>component-troubleshooting-guide.mdc"]
    end
    
    B1 --> I1
    B1 --> I2
    I1 & I2 --> A1
    A1 --> A2
    
    classDef beginner fill:#dfd,stroke:#333
    classDef intermediate fill:#bbf,stroke:#333
    classDef advanced fill:#f9f,stroke:#333
    
    class B1 beginner
    class I1,I2 intermediate
    class A1,A2 advanced
```

## 🧩 **PROMPT SELECTION DECISION FLOW**

```mermaid
flowchart TD
    Start(["Component Needed"]) --> Q1{"Data Collection<br>Focus?"}
    Q1 -->|"Yes"| Form["component-create-form.mdc"]
    Q1 -->|"No"| Q2{"Interactive UI<br>Element?"}
    
    Q2 -->|"Yes"| UI["component-create-ui.mdc"]
    Q2 -->|"No"| Q3{"Page/Content<br>Structure?"}
    
    Q3 -->|"Yes"| Layout["component-create-layout.mdc"]
    Q3 -->|"No"| Q4{"Card-based<br>Content?"}
    
    Q4 -->|"Yes"| Card["component-create-card.mdc"]
    Q4 -->|"No"| Q5{"Navigation<br>System?"}
    
    Q5 -->|"Yes"| Nav["component-create-navigation.mdc"]
    Q5 -->|"No"| Q6{"Marketing/<br>Conversion?"}
    
    Q6 -->|"Yes"| Marketing["component-create-marketing.mdc"]
    Q6 -->|"No"| Q7{"Icon/Visual<br>Element?"}
    
    Q7 -->|"Yes"| Icon["component-create-icon.mdc"]
    Q7 -->|"No"| Q8{"Complex/<br>Hybrid?"}
    
    Q8 -->|"Yes"| Workflow["component-workflow-integration.mdc"]
    Q8 -->|"No"| Guide["component-create-guide.mdc"]
    
    classDef decision fill:#ffd,stroke:#333
    classDef prompt fill:#dfd,stroke:#333
    classDef integration fill:#bbf,stroke:#333
    
    class Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8 decision
    class Form,UI,Layout,Card,Nav,Marketing,Icon,Guide prompt
    class Workflow integration
```

---

**These visual diagrams provide clear guidance on component development workflows, prompt selection, and integration patterns. Use them in conjunction with detailed documentation for optimal component development.**
