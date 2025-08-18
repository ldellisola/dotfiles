# AGENTS.md - Nushell Configuration Repository

## Project Overview
This is a Nushell configuration repository containing shell configuration files, modules, and completions for a Windows environment.

## Build/Test/Lint Commands
- No build system detected (configuration files only)
- No test framework found
- No linting tools configured
- Files are validated by Nushell syntax checking: `nu --check <file.nu>`

## Code Style Guidelines

### File Structure
- Configuration files: `*.nu` in root directory
- Modules: `modules/` directory with `mod.nu` files
- Completions: `completions/` directory for command completions

### Nushell Code Style
- Use snake_case for variable names: `let my_variable = "value"`
- Use kebab-case for function names: `def my-function []`
- Export functions with `export def` for modules
- Use `$env.` prefix for environment variables
- Prefer explicit types in function signatures when helpful
- Use `mut` keyword for mutable variables
- Comment functions with `# description` above definition

### Import/Module Conventions
- Use `source` for configuration files: `source ~/.dotfiles/nushell/starship.nu`
- Use `use` for modules: `use ~/.dotfiles/nushell/modules/system/ *`
- Group related functionality in modules under `modules/` directory

### Error Handling
- Use `error make` for custom errors with structured messages
- Include helpful error context and suggestions
- Use `try` blocks for operations that might fail

## Repository Rules
- No Cursor or Copilot rules found
- Configuration files should be compatible with Nushell 0.102.0+
- Maintain Windows compatibility for all scripts