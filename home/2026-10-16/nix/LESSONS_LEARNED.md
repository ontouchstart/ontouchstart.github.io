# Lessons Learned: Running Tests in Nix

During the process of running tests in the Nix repository, the following lessons were learned:

## 1. Working Directory in `nix develop`
- **Issue:** Running `nix develop <path> --command <cmd>` executes the command in the current working directory (e.g., `/workspace`), not the directory where the flake is located.
- **Solution:** Explicitly `cd` into the flake directory before executing build or test commands.
- **Example:**
  ```bash
  nix develop /path/to/nix --command "bash -c 'cd /path/to/nix && meson setup build && meson test -C build'"
  ```

## 2. Environment Availability
- The `devShell` provided by the flake (defined in `packaging/dev-shell.nix`) correctly injects necessary build tools like `meson`, `ninja`, and `pkg-config` into the environment.
- Using `nativeBuildInputs` in the flake ensures these tools are available for use within the shell.

## 3. Meson Build System
- Nix uses Meson as its primary build system.
- Standard Meson commands (`meson setup`, `ninja`, `meson test`) work as expected once the environment is set up and the correct directory is entered.
- The `mesonBuildType` is set to `debugoptimized` in the shell, which is suitable for most development testing.

## 4. Test Suite Structure
- Tests are categorized into several types:
  - **Top-level tests:** Defined in `flake.nix` via `hydraJobs.tests`.
  - **Component tests:** Instrumented tests for specific Nix components.
  - **Functional tests:** A large suite of functional tests located in `tests/functional/`.
- Many tests are skipped in certain environments (e.g., those requiring specific OS features or hardware) which is normal behavior.
