#!/bin/bash

# Update Shared Prompts Script
# This script pulls the latest prompts from the central prompt repository
# and updates the local .cursor/prompts/shared/ folder

set -e

# Configuration
REPO_URL="https://github.com/oakensoul/nextjs-cursor-prompts"
SHARED_PROMPTS_DIR=".cursor/prompts/shared"
SHARED_RULES_DIR=".cursor/rules/shared"
TEMP_DIR=$(mktemp -d)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔄 Updating shared prompts and rules from ${REPO_URL}${NC}"

# Create directory structure if it doesn't exist
echo -e "${YELLOW}📁 Setting up directory structure...${NC}"

# Prompts directories
mkdir -p "$SHARED_PROMPTS_DIR"
mkdir -p ".cursor/prompts/project"
mkdir -p ".cursor/prompts/experimental"

# Rules directories  
mkdir -p "$SHARED_RULES_DIR"
mkdir -p ".cursor/rules/project"
mkdir -p ".cursor/rules/experimental"

# Create README files if they don't exist
if [ ! -f ".cursor/prompts/project/README.md" ]; then
    cat > ".cursor/prompts/project/README.md" << 'EOF'
# Project-Specific Prompts

This directory contains prompts specific to this project. These prompts are:

- **Project-specific**: Tailored to your codebase, domain, and team practices
- **Version controlled**: Committed with your project for team sharing
- **Customizable**: Feel free to modify shared prompts for your specific needs

## Organization

- Keep prompts focused and well-documented
- Use descriptive filenames
- Consider which prompts might be worth contributing back to the shared collection

## Contributing Back

If you create a particularly useful prompt that could benefit other projects:
1. Generalize it (remove project-specific details)
2. Test it in different contexts
3. Consider contributing it back to the shared prompt repository
EOF
fi

if [ ! -f ".cursor/prompts/experimental/README.md" ]; then
    cat > ".cursor/prompts/experimental/README.md" << 'EOF'
# Experimental Prompts

This directory is for testing new prompt ideas before they become part of your regular workflow.

## Guidelines

- **Test freely**: Try new approaches and iterate quickly
- **Document results**: Note what works and what doesn't
- **Graduate successful prompts**: Move useful prompts to `/project` or contribute to `/shared`
- **Clean up regularly**: Remove prompts that didn't work out

## Workflow

1. Create new experimental prompts here
2. Test them on real work
3. Refine based on results
4. Move successful prompts to appropriate permanent location
EOF
fi

if [ ! -f ".cursor/rules/project/README.md" ]; then
    cat > ".cursor/rules/project/README.md" << 'EOF'
# Project-Specific Rules

This directory contains Cursor rules specific to this project, including:

- **Coding standards**: Project-specific style and patterns
- **Architecture guidelines**: How code should be structured in this project  
- **Domain knowledge**: Business logic and project-specific context
- **Team practices**: Workflows and conventions your team uses

## Best Practices

- Keep rules focused and actionable
- Document the reasoning behind each rule
- Review and update rules as the project evolves
EOF
fi

if [ ! -f ".cursor/rules/experimental/README.md" ]; then
    cat > ".cursor/rules/experimental/README.md" << 'EOF'
# Experimental Rules

Test new rules and coding guidelines here before adopting them project-wide.

## Purpose

- **Try new approaches**: Test different coding patterns or constraints
- **Validate effectiveness**: See if rules actually improve code quality
- **Iterate safely**: Experiment without disrupting established workflows

## Process

1. Create experimental rules based on team discussions or new ideas
2. Apply them to specific features or components
3. Evaluate impact on code quality and developer experience
4. Graduate successful rules to `/project` or contribute to `/shared`
EOF
fi

# Download latest version
echo -e "${BLUE}📥 Downloading latest prompts...${NC}"
cd "$TEMP_DIR"
curl -sL "${REPO_URL}/archive/main.zip" -o prompts.zip

# Extract and copy
echo -e "${BLUE}📦 Extracting prompts...${NC}"
unzip -q prompts.zip
cd nextjs-cursor-prompts-main

# Check if .cursor directories exist in the downloaded repo
if [ ! -d ".cursor/prompts" ]; then
    echo -e "${RED}❌ Error: .cursor/prompts not found in repository${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

if [ ! -d ".cursor/rules" ]; then
    echo -e "${RED}❌ Error: .cursor/rules not found in repository${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Go back to original directory and analyze changes
cd - > /dev/null
PROMPT_SOURCE="$TEMP_DIR/nextjs-cursor-prompts-main/.cursor/prompts"
RULES_SOURCE="$TEMP_DIR/nextjs-cursor-prompts-main/.cursor/rules"

echo -e "${YELLOW}📊 Analyzing changes...${NC}"
echo

# Count files and show what would be updated
NEW_PROMPT_FILES=$(find "$PROMPT_SOURCE" -name "*.md" -o -name "*.mdc" | wc -l | tr -d ' ')
NEW_RULE_FILES=$(find "$RULES_SOURCE" -name "*.md" -o -name "*.mdc" | wc -l | tr -d ' ')
echo -e "${BLUE}Prompts in latest version: ${NEW_PROMPT_FILES}${NC}"
echo -e "${BLUE}Rules in latest version: ${NEW_RULE_FILES}${NC}"

# Check existing files
EXISTING_PROMPT_FILES=$(find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | wc -l | tr -d ' ')
EXISTING_RULE_FILES=$(find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | wc -l | tr -d ' ')
echo -e "${BLUE}Currently installed prompts: ${EXISTING_PROMPT_FILES}${NC}"
echo -e "${BLUE}Currently installed rules: ${EXISTING_RULE_FILES}${NC}"

# Show specific changes for prompts
echo -e "\n${YELLOW}📝 Prompt changes:${NC}"
NEW_PROMPTS=$(comm -23 <(find "$PROMPT_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$PROMPT_SOURCE/||" | sort) <(find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_PROMPTS_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$NEW_PROMPTS" ]; then
    echo -e "${GREEN}  New prompt files:${NC}"
    echo "$NEW_PROMPTS" | sed 's/^/    /'
fi

UPDATED_PROMPTS=$(comm -12 <(find "$PROMPT_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$PROMPT_SOURCE/||" | sort) <(find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_PROMPTS_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$UPDATED_PROMPTS" ]; then
    echo -e "${YELLOW}  Prompt files that will be updated:${NC}"
    echo "$UPDATED_PROMPTS" | sed 's/^/    /'
fi

REMOVED_PROMPTS=$(comm -13 <(find "$PROMPT_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$PROMPT_SOURCE/||" | sort) <(find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_PROMPTS_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$REMOVED_PROMPTS" ]; then
    echo -e "${RED}  Prompt files that will be removed:${NC}"
    echo "$REMOVED_PROMPTS" | sed 's/^/    /'
fi

# Show specific changes for rules
echo -e "\n${YELLOW}📝 Rule changes:${NC}"
NEW_RULES=$(comm -23 <(find "$RULES_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$RULES_SOURCE/||" | sort) <(find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_RULES_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$NEW_RULES" ]; then
    echo -e "${GREEN}  New rule files:${NC}"
    echo "$NEW_RULES" | sed 's/^/    /'
fi

UPDATED_RULES=$(comm -12 <(find "$RULES_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$RULES_SOURCE/||" | sort) <(find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_RULES_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$UPDATED_RULES" ]; then
    echo -e "${YELLOW}  Rule files that will be updated:${NC}"
    echo "$UPDATED_RULES" | sed 's/^/    /'
fi

REMOVED_RULES=$(comm -13 <(find "$RULES_SOURCE" -name "*.md" -o -name "*.mdc" | sed "s|$RULES_SOURCE/||" | sort) <(find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" 2>/dev/null | sed "s|$SHARED_RULES_DIR/||" | sort) 2>/dev/null)
if [ ! -z "$REMOVED_RULES" ]; then
    echo -e "${RED}  Rule files that will be removed:${NC}"
    echo "$REMOVED_RULES" | sed 's/^/    /'
fi

echo
echo -e "${BLUE}🤔 Do you want to proceed with the update? [y/N]${NC}"
read -r CONFIRM

if [[ ! $CONFIRM =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}❌ Update cancelled${NC}"
    rm -rf "$TEMP_DIR"
    exit 0
fi

# Proceed with the update
echo -e "${BLUE}📋 Updating prompts and rules...${NC}"
cp -r "$PROMPT_SOURCE/"* "$SHARED_PROMPTS_DIR/"
cp -r "$RULES_SOURCE/"* "$SHARED_RULES_DIR/"

# Show what was updated
echo -e "${GREEN}✅ Prompts and rules updated successfully!${NC}"
echo -e "${YELLOW}📊 Updated contents:${NC}"
echo -e "${BLUE}  Shared prompts:${NC}"
find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" | head -10 | sed 's/^/    /'

PROMPT_COUNT=$(find "$SHARED_PROMPTS_DIR" -name "*.md" -o -name "*.mdc" | wc -l | tr -d ' ')
if [ $PROMPT_COUNT -gt 10 ]; then
    echo "    ... and $(expr $PROMPT_COUNT - 10) more prompt files"
fi

echo -e "${BLUE}  Shared rules:${NC}"
find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" | head -10 | sed 's/^/    /'

RULE_COUNT=$(find "$SHARED_RULES_DIR" -name "*.md" -o -name "*.mdc" | wc -l | tr -d ' ')
if [ $RULE_COUNT -gt 10 ]; then
    echo "    ... and $(expr $RULE_COUNT - 10) more rule files"
fi

# Cleanup
rm -rf "$TEMP_DIR"

echo
echo -e "${BLUE}💡 Next steps:${NC}"
echo -e "  1. Review the updated files:"
echo -e "     ${YELLOW}ls -la $SHARED_PROMPTS_DIR${NC}"
echo -e "     ${YELLOW}ls -la $SHARED_RULES_DIR${NC}"
echo -e "  2. Test any prompts or rules you plan to use"
echo -e "  3. Add your project-specific prompts to: ${YELLOW}.cursor/prompts/project/${NC}"
echo -e "  4. Add your project-specific rules to: ${YELLOW}.cursor/rules/project/${NC}"
echo -e "  5. Commit the changes: ${YELLOW}git add .cursor && git commit -m \"Update shared prompts and rules\"${NC}"
echo
echo -e "${GREEN}🎉 Happy prompting!${NC}" 