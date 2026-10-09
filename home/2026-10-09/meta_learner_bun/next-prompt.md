# Context: Meta-Learner Project
We are building a "Meta-Learner" system using the Bun runtime. The goal is to create a machine that can autonomously learn to build its own tools.

## Current Progress
We have successfully established the **Self-Correction Loop**:
1.  **Maker (Synthesis)**: Generates tools and can now attempt to rewrite them based on error feedback.
2.  **Executor (Validation)**: Runs tools and provides structured error messages on failure.
3.  **The Loop**: The machine can now cycle through "Action -> Observation -> Correction -> Action".

## Current Files
- `maker.ts`: Handles tool synthesis and repair.
- `executor.ts`: Handles tool execution and captures error messages.
- `meta_learner_bun/blog_post_correction_loop.md`: Documenting our progress.

## Next Objective: Persistent Memory & Capability Registry
The machine currently has no "memory" of what it has successfully built. Every time it wants to build a tool, it starts from scratch. We need to implement a **Capability Registry** to track successfully verified tools.

### Task for this session:
Implement a **Capability Registry**.
1.  **Create `capabilities.json`**: A registry to store the names and metadata (e.g., success status) of verified tools.
2.  **Modify `executor.ts`**: When a tool execution succeeds, automatically record that tool in `capabilities.json`.
3.  **Modify `maker.ts`**: Before creating a tool, it should check `capabilities.json`. If the tool already exists in the registry, it should report that the tool is already available instead of attempting to build it.
4.  **Verification**:
    - Build a tool (e.g., `sum.ts`).
    - Run it successfully.
    - Verify it appears in `capabilities.json`.
    - Try to build `sum.ts` again and verify that `maker.ts` detects it already exists in the registry.

### Constraints:
- Keep the registry simple (JSON file).
- Ensure thread-safety (or simple file locking) if possible, though for now, a simple overwrite is fine.
- Focus on the "Memory" aspect—the machine should know its own capabilities.
