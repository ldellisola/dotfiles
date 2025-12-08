# Agent Guidelines

## Operating System & Shell Detection

**Priority order for command execution:**

1. Use MCPs (DesktopCommander, etc.) when available—they provide cross-platform consistency
2. Fall back to OS-specific commands only when MCPs cannot handle the task
3. Check the operating system before executing shell-specific commands

**Default shell**: nushell (available on both macOS and Windows)

**When using OS-specific commands:**

- Verify the operating system first
- Confirm the required shell is available
- Use PowerShell only on Windows if necessary
- Use zsh only on macOS if necessary

## Code Guidelines

- Write all code in TypeScript unless explicitly requested otherwise
- Use the latest stable versions of all libraries and frameworks
- always use context7 to check for code-examples, documentation and versions of libraries and frameworks
- Do not add unnecessary dependencies

## Testing & Validation

- Always run the application to test inputs and outputs when possible
- Prioritise manual verification over writing formal tests
- Document observed behaviour in `.agents/` files

## File Naming Conventions

Name files in `.agents/` clearly and consistently:

- `architecture.md` — System design and component relationships
- `features.md` — Feature list and current implementation status
- `context.md` — General project thread and session history

## Dependencies Management

- Track library versions in `.agents/dependencies.md`
- Document breaking changes and migration notes
- Keep lock files in version control
- Flag outdated dependencies for upgrades

## Error Handling

- Follow consistent error handling patterns across the codebase
- Log errors with sufficient context for debugging
- Document common failure modes in `.agents/context.md`

## Git Practices

- Commit `.agents/` files to version control
- Use clear commit messages for agent-related changes
- Keep agent context files in sync with code branches

## External Services

- Document API keys and service credentials (never commit sensitive data)
- Track service endpoints and version requirements in `.agents/`
- Record integration patterns and known limitations

## LLM Files (.agents folder)

**Creation:**

- Store all LLM-related files in `.agents/`
- Consolidate information into a few standardised files
- Do not create redundant LLM files
- Maintain a single thread of project sessions across all files

**Maintenance:**

- Track architecture and features in `.agents/*` files
- Preserve the general thread of all sessions
- Keep these files up to date with project changes

## Documentation

**README.md and CHANGELOG.md:**

- Include only essential information for end users
- Exclude LLM context and internal notes

**Architecture & Features:**

- Document in `.agents/*` files only
- This is the source of truth for agent context
