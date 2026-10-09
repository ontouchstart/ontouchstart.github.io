# Context: Meta-Learner Project
We are building a "Meta-Learner" system using the Bun runtime. The goal is to create a machine that can autonomously learn to build its own tools.

## Current Progress
We have successfully established the "Action -> Observation" loop:
1.  **Maker (Synthesis)**: A script (`maker.ts`) that generates other TypeScript scripts.
2.  **Executor (Validation)**: A script (`executor.ts`) that runs a script and reports success or failure.
3.  **Artifacts**: We have verified that `maker.ts` can create a script (e.g., `add_numbers.ts`) and `executor.ts` can confirm its success.

## Current Files
- `maker.ts`: Handles tool synthesis.
- `executor.ts`: Handles tool execution and basic success/failure reporting.
- `capabilities.json`: (Planned) A registry of successfully verified tools.
- `tools/`: Directory where scripts are stored.

## Next Objective: The Self-Correction Loop
The current system can create a tool, but it cannot "fix" a tool if it fails. We need to move from "Action -> Observation" to **"Action -> Observation -> Correction -> Action"**.

### Task for this session:
Implement a **Self-Correction Loop**. 
1.  **Modify `executor.ts`**: Ensure it captures the specific error message (stdout/stderr) from a failed script execution.
2.  **Modify `maker.ts`**: Update it to accept an "error" argument. If an error is passed, it should attempt to rewrite the script to fix that specific error.
3.  **Verification**: Create a "broken" script (e.g., one with a syntax error or a missing variable). Run the loop and verify that the machine can:
    - Detect the error.
    - Receive the error message.
    - Rewrite the script.
    - Successfully run the rewritten script.

### Constraints:
- Stay **bottom-up**. Do not build a full recursive manager yet.
- Focus on the logic of passing the error string from `executor` back to `maker`.
- Use Bun for all execution.
