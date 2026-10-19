# Pi v1.3.0 Release Summary

This document summarizes the key updates, features, and environment improvements introduced in Pi v1.3.0.

## 🚀 Key New Features
- **Flexible Session Sharing**: Users can now specify where `/share` uploads are stored using `sessionShareDestination` (options: `auto`, `gist`, or `radius`).
- **Prompt Cache Preservation**: 
    - Changing the thinking level mid-session on **OpenAI GPT-6** models now preserves the prompt cache.
    - **Kimi Code** tools added mid-conversation no longer invalidate the prompt cache.
- **Clean Model Switching**: When switching models, reasoning blocks from previous models are now dropped rather than being passed as text to the new model, preventing reasoning "leakage" into the visible answer.
- **Resumed Sessions**: Sessions can now persist active tools across resumes.

## 🛠 Nix & Environment Deep Dive
Significant improvements were made to support users in specialized environments, particularly those using Nix or remote connections:

### Nix Package Improvements
- **Node.js Path Fix**: Fixed a bug where the Nix package would place its version of Node.js at the front of the `PATH`. This previously caused Pi's internal shell tools to use the wrong Node runtime. Pi's Node.js is now correctly treated as a fallback.
- **Nix Flake Build Stability**: Fixed issues where Nix flake builds would fail when provider APIs switched. The model catalog pin is now refreshed automatically when model API groups differ, ensuring consistent builds.
- **`PI_PACKAGE_DIR`**: This environment variable is specifically optimized for **Nix/Guix** store paths. It allows users to override the package directory to ensure Pi correctly locates its bundled assets (themes, prompts, etc.) in complex store structures.

### Remote & Environment Variables
- **Remote Clipboard Support**: Introduced `PI_CLIPBOARD_OSC52=1`. This enables Pi to send OSC 52 sequences, allowing clipboard copies to work correctly over SSH or when using terminal multiplexers (like `tmux` or `screen`) attached from remote machines.
- **Session Environment Variables**: Commands run by Pi's shell tools now receive a suite of `PI_*` variables:
    - `PI_SESSION_ID`: Unique ID for the current session.
    - `PI_SESSION_FILE`: Path to the session JSONL file.
    - `PI_PROVIDER` & `PI_MODEL`: Current model selection.
    - `PI_REASONING_LEVEL`: Current reasoning level (e.g., `high`, `max`).
- **Process Markers**: Pi sets `AI_AGENT=pi` and `PI_CODING_AGENT=true` for child processes, allowing tools to identify that they are running inside the Pi agent harness.

## 🔧 Stability & Provider Fixes
- **MCP OAuth Hardening**: Improved security for MCP connections, including better handling of refresh tokens and scope escalation.
- **Codemode Robustness**: 
    - Improved error reporting in codemode scripts to help the LLM recover from failures.
    - Added support for images in `models.classify()` and `models.generateImages()`.
    - Fixed memory issues when running scripts that print in large loops.
- **Provider Updates**: Fixed numerous issues across Anthropic (Bedrock/Claude), Google (Vertex/Gemini), and OpenRouter, including incorrect context window reporting and thinking level handling.
