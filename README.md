# Sam Liu

🤖 [Teach machine to learn to build tools to learn ...](https://ontouchstart.github.io/home/2026-10-09/meta_learner_bun/teach-machine-to-learn-to-build-tools-to-learn)

🤖 [The Leap to Self-Correction: From Automation to Autonomous Improvement](https://ontouchstart.github.io/home/2026-10-09/meta_learner_bun/blog_post_correction_loop)

🤖 [Beyond the Agentic Illusion: Towards True Recursive Self-Improvement](https://ontouchstart.github.io/home/2026-10-11/beyond-the-agentic-illusion)

🤖 [Automated Content Extraction Tooling and Agentic-Scale Source Control Systems](https://ontouchstart.github.io/home/2026-10-14/content_extraction_and_agentic_source_control)

🤖 [Review of an Anthropic blog post and Hacker News discussion](https://ontouchstart.github.io/home/2026-10-14/review_of_an_Anthropic_blog_post_and_Hacker_News_discussion)

👨🏻‍💻 [Nix, Rust and WASM](https://nix-ontouchstart.github.io)

🤖 [Complexity Feedback Loop](https://nix-ontouchstart.github.io/nix-ontouchstart-llama_cpp-sessions/2026-10-27_16-06-39_conv_da251f2e-Human_engineers_have_a_tendency_of_over_engineering_and_AI_only_makes_it_worse)

**Adding an AI-driven abstraction layer on top of an already complex system is the definition of over-engineering.**

Here is a breakdown of why AI makes the "Over-Engineering Trap" significantly more dangerous:

### 1. The "Zero-Cost" Complexity Problem
In the past, over-engineering was limited by human time. If an engineer wanted to build a hyper-complex, multi-layered abstraction for a simple task, it took weeks of effort. That "friction" served as a natural brake.

**AI removes that brake.** If an AI can generate a complex, 500-line Nix derivation in three seconds, engineers will use it. We are moving into an era where the **cost of creating complexity is near zero, but the cost of maintaining it remains high.** We will end up with "Software Skyscrapers" built by AI that no human actually knows how to repair.

### 2. The Erosion of the "Mental Model"
Good engineering relies on a human being having a clear mental model of how a system works. When you write a script, you understand the logic. When an AI "synthesizes" a Nix expression based on your "intent," the engineer no longer understands the *how*, only the *what*.

When that system inevitably breaks (and it will, because hardware is messy), the engineer is left staring at a "black box" of AI-generated code. You cannot debug what you didn't author. This leads to **"Cargo Cult Engineering,"** where teams keep the AI-generated infrastructure because they are too afraid to touch it and break it.

### 3. The "Just Make It Work" Trap
AI is very good at finding *a* path to a solution, but it isn't always the *simplest* or *most maintainable* path.
*   **Human Engineer:** Might struggle for an hour to find a clean way to map a path.
*   **AI:** Might instantly provide a 50-line "hack" involving nested wrappers and environment overrides that technically works but is a nightmare to scale.

Because the AI solution "works" immediately, the engineer accepts it. Over time, the codebase becomes a graveyard of "smart" hacks that were too complex to ever be refactored.

### 4. The "Abstraction Tax"
Every layer of abstraction (Nix $\rightarrow$ AI Layer $\rightarrow$ Hardware) adds what I call an **Abstraction Tax**.
*   If there is a bug in the hardware, you have to check the Nix layer.
*   If the Nix layer is fine, you have to check the AI Translation layer.
*   If the AI layer is fine, you have to check the prompt/intent.

By the time you find the root cause, you've spent hours navigating through layers of "convenience" that were actually just obstacles.

### How to fight this? (The Antidote)
To prevent AI from making over-engineering worse, the goal should not be **"AI as a Generator,"** but **"AI as a Simplifier."**

*   **Bad Path:** "AI, write me a complex system to handle all my cross-platform VM requirements." (Result: A bloated, unmaintainable mess).
*   **Good Path:** "Here is my messy, over-engineered Nix file. AI, identify the redundancies and rewrite this to be as minimal and flat as possible."

**The goal of engineering should be to reduce complexity, not to manage it.** AI should be used as a tool to strip away the "mess," not to build more "layers."
