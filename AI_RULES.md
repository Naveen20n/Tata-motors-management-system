# AI Development Rules — Smart Tata Automotive Digital Showroom

## Technology
- Frontend: React.js
- UI: Bootstrap 5
- Backend: Django
- API: Django REST Framework
- Database: MySQL

## Core Rule
AI tools must work on small, isolated tasks instead of attempting to build the entire project in one operation.

## General Rules
1. Read the relevant documentation before coding.
2. Modify only files required for the current task.
3. Do not rewrite unrelated files.
4. Do not create duplicate components.
5. Do not install packages unless required.
6. Do not change the database schema without approval.
7. Do not change the technology stack.
8. Reuse existing components and services.
9. Use REST APIs between React and Django.
10. Use Bootstrap 5; do not introduce Tailwind.
11. Keep business logic on the backend where appropriate.
12. Use environment variables for secrets.
13. Never hard-code passwords, API keys or payment secrets.
14. Preserve existing functionality.
15. Explain major changes before implementing them.

## Credit-Saving Rules
1. Do not ask an AI agent to build the entire application.
2. Give one feature per prompt.
3. Reference documentation instead of repeating project context.
4. Use lower-cost models for simple tasks.
5. Use stronger models only for difficult architecture/debugging.
6. Do not run multiple agents on the same files simultaneously.
7. Test after each feature.
8. Commit stable features to Git.
9. Ask for diagnosis before requesting a large rewrite.
10. Prefer targeted patches over complete file regeneration.

## Prompt Template
```text
Context:
Read docs/SRA.md and docs/API_DOCUMENTATION.md.

Task:
Implement only [FEATURE].

Scope:
Modify only [FILES].

Constraints:
Do not install packages.
Do not change database schema.
Do not modify unrelated features.

Validation:
Run relevant tests and report failures.

Output:
First explain planned changes, then implement them.
```

## Debugging Template
```text
Read the error and specified files.
Identify the root cause.
Do not modify files yet.

Return:
1. Root cause
2. Affected file
3. Exact fix
4. Test required
```

## Code Quality
- Use meaningful names.
- Keep functions small.
- Keep React components focused.
- Use serializers for API validation.
- Use Django permissions for authorization.
- Avoid duplicated business logic.
- Follow consistent formatting.

## Database Rules
- Use foreign keys.
- Avoid unnecessary duplicated data.
- Add indexes to search/filter fields.
- Validate IDs and ownership.
- Do not delete transactional records blindly.

## API Rules
- Use correct HTTP methods.
- Return meaningful status codes.
- Validate requests.
- Authenticate protected endpoints.
- Authorize by role and ownership.
- Do not trust frontend prices or permissions.
- Use pagination for large lists.

## Frontend Rules
- Use reusable components.
- Show loading/error/empty states.
- Validate forms.
- Do not treat frontend validation as security.
- Configure API URLs through environment variables.
- Ensure responsive Bootstrap layouts.

## Testing Workflow
```text
Plan
 ↓
Implement
 ↓
Run
 ↓
Test
 ↓
Fix
 ↓
Git Commit
```

## Git Workflow
```bash
git add .
git commit -m "Add vehicle search"
```

Do not mix unrelated features in one commit.

## AI Tool Allocation

### Cursor
Primary tool for React, Django, CRUD, API integration, debugging and refactoring.

### GitHub Copilot
Use mainly for autocomplete, small functions, repetitive code and small fixes.

### Codex
Use for complex bugs, architecture review, security review and difficult backend problems.

### Antigravity
Use for UI experiments, prototypes and larger agentic experiments.

Do not let multiple AI tools modify the same feature simultaneously.

## Final Rule
**Build small, test small, commit small.**
