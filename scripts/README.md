# Update Shared Prompts Script

A script to sync shared Cursor prompts and rules from the central repository to your project.

## Overview

The `update-shared-prompts.sh` script automates the process of:
- Downloading the latest prompts and rules from [nextjs-cursor-prompts](https://github.com/oakensoul/nextjs-cursor-prompts)
- Setting up the recommended directory structure in your project
- Showing you exactly what will change before making any updates
- Creating helpful README files for project organization

## Usage

### First Time Setup

1. Copy the script to your project:
```bash
curl -sL https://raw.githubusercontent.com/oakensoul/nextjs-cursor-prompts/main/scripts/update-shared-prompts.sh > scripts/update-shared-prompts.sh
chmod +x scripts/update-shared-prompts.sh
```

2. Run the script:
```bash
./scripts/update-shared-prompts.sh
```

3. The script will create this directory structure:
```
.cursor/
├── prompts/
│   ├── shared/           # Prompts from central repository
│   ├── project/          # Your project-specific prompts
│   │   └── README.md     # Guidelines for project prompts
│   └── experimental/     # Testing new prompt ideas
│       └── README.md     # Guidelines for experimental prompts
└── rules/
    ├── shared/           # Rules from central repository
    ├── project/          # Your project-specific rules
    │   └── README.md     # Guidelines for project rules
    └── experimental/     # Testing new rule ideas
        └── README.md     # Guidelines for experimental rules
```

### Regular Updates

Simply run the script whenever you want to get the latest shared content:
```bash
./scripts/update-shared-prompts.sh
```

## What the Script Does

### 1. Downloads Latest Content
- Fetches the latest version of the central repository
- Extracts prompts and rules to temporary location

### 2. Analyzes Changes
Before making any changes, the script shows you:
```
📊 Analyzing changes...

Prompts in latest version: 23
Rules in latest version: 6
Currently installed prompts: 20
Currently installed rules: 5

📝 Prompt changes:
  New prompt files:
    architecture/microservices-design.mdc
    debugging/performance-profiling.mdc
  
  Prompt files that will be updated:
    code-review/security-review.mdc
    testing/integration-tests.mdc

📝 Rule changes:
  New rule files:
    security-first.mdc
  
  Rule files that will be updated:
    code-change-minimal.mdc
```

### 3. Asks for Confirmation
```
🤔 Do you want to proceed with the update? [y/N]
```

The script defaults to "No" to prevent accidental updates. You must explicitly type 'y' or 'Y' to proceed.

### 4. Updates Content
If you confirm, the script:
- Copies new and updated prompts to `.cursor/prompts/shared/`
- Copies new and updated rules to `.cursor/rules/shared/`
- Creates directory structure and README files if missing
- Shows summary of what was updated

### 5. Provides Next Steps
```
💡 Next steps:
  1. Review the updated files:
     ls -la .cursor/prompts/shared
     ls -la .cursor/rules/shared
  2. Test any prompts or rules you plan to use
  3. Add your project-specific prompts to: .cursor/prompts/project/
  4. Add your project-specific rules to: .cursor/rules/project/
  5. Commit the changes: git add .cursor && git commit -m "Update shared prompts and rules"
```

## Directory Structure Explained

### `/shared/` Directories
- **Purpose**: Content synced from the central repository
- **Management**: Updated only via the script
- **Modification**: Don't edit these files directly - they'll be overwritten

### `/project/` Directories  
- **Purpose**: Prompts and rules specific to your project
- **Management**: Created and maintained by your team
- **Content**: 
  - Project-specific coding standards
  - Domain-specific prompt patterns
  - Team workflow rules
  - Custom constraints for your codebase

### `/experimental/` Directories
- **Purpose**: Testing new ideas before adoption
- **Management**: Temporary workspace for iteration
- **Workflow**:
  1. Create experimental prompts/rules
  2. Test them on real work
  3. Refine based on results
  4. Graduate successful ones to `/project/` or contribute back

## Script Configuration

The script uses these default settings (editable at the top of the file):

```bash
REPO_URL="https://github.com/oakensoul/nextjs-cursor-prompts"
SHARED_PROMPTS_DIR=".cursor/prompts/shared"
SHARED_RULES_DIR=".cursor/rules/shared"
```

## Requirements

- **curl**: For downloading the repository archive
- **unzip**: For extracting the downloaded archive
- **bash**: The script is written for bash shell
- **find/comm**: Standard Unix utilities for file comparison

## Troubleshooting

### Permission Denied
```bash
chmod +x scripts/update-shared-prompts.sh
```

### Network Issues
The script downloads from GitHub. If you have network restrictions:
1. Download the repository manually
2. Extract it locally  
3. Copy the `.cursor/prompts` and `.cursor/rules` folders to your project

### Custom Repository
To use a different repository, edit the `REPO_URL` at the top of the script:
```bash
REPO_URL="https://github.com/your-org/your-prompts-repo"
```

## Integration with NPM Scripts

### Recommended Package.json Integration

Add this script to your `package.json` for easy updates:

```json
{
  "scripts": {
    "update-prompts": "./scripts/update-shared-prompts.sh",
    "setup-dev": "npm install && ./scripts/update-shared-prompts.sh",
    "refresh-env": "npm install && ./scripts/update-shared-prompts.sh && npm run lint:fix"
  }
}
```

**Usage:**
```bash
# Update shared prompts and rules
npm run update-prompts

# Full development environment setup
npm run setup-dev

# Refresh entire development environment
npm run refresh-env
```

**Benefits:**
- **Consistent commands** across all projects using your prompt library
- **Easy integration** with other environment setup tasks
- **Team onboarding** - new developers just run `npm run setup-dev`
- **Environment maintenance** - combine with other refresh tasks

## Integration with Git

### Recommended Git Workflow

1. **Commit shared updates separately**:
```bash
./scripts/update-shared-prompts.sh
git add .cursor/prompts/shared .cursor/rules/shared
git commit -m "Update shared prompts and rules"
```

2. **Commit project-specific changes separately**:
```bash
git add .cursor/prompts/project .cursor/rules/project
git commit -m "Add project-specific prompt for user dashboard"
```

### `.gitignore` Considerations

You typically want to commit all `.cursor/` content:
```gitignore
# Don't ignore .cursor/ directory - it contains valuable team knowledge
```

But if you prefer to keep experimental work private:
```gitignore
.cursor/prompts/experimental/
.cursor/rules/experimental/
```

## Contributing Back

When you create useful project-specific prompts or rules that could benefit others:

1. **Generalize the content** - Remove project-specific details
2. **Test across contexts** - Ensure it works for different projects
3. **Follow contribution guidelines** - See the [main repository](https://github.com/oakensoul/nextjs-cursor-prompts)
4. **Submit a pull request** - Help grow the shared collection

## Related Documentation

- **Main Repository**: [nextjs-cursor-prompts](https://github.com/oakensoul/nextjs-cursor-prompts)
- **Prompt Standards**: [Prompt Creation Guidelines](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/docs/standards/standards-prompt.md)
- **Rule Standards**: [Rule Creation Guidelines](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/docs/standards/standards-rule.md)
- **Contributing**: [Contribution Guide](https://github.com/oakensoul/nextjs-cursor-prompts/blob/main/CONTRIBUTING.md) 