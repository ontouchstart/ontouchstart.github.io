{
  description = "Bundle the three pages bun one-liner";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
    in {
      packages.${system} = {
        default = nixpkgs.legacyPackages.${system}.writeShellScriptBin "bun-three-page-oneliner" ''
          nix run github:nix-ontouchstart/bun -- -e 'const urls = ["https://ontouchstart.github.io", "https://ontouchstart.github.io/home/2026-10-09/meta_learner_bun/teach-machine-to-learn-to-build-tools-to-learn", "https://ontouchstart.github.io/home/2026-10-09/meta_learner_bun/blog_post_correction_loop"]; async function printBody(url) { try { const res = await fetch(url); const html = await res.text(); const bodyMatch = html.match(/<body[^>]*>([\s\S]*)<\/body>/i); const body = bodyMatch ? bodyMatch[1] : html; const text = body.replace(/<[^>]*>/g, "").replace(/\s+/g, " ").trim(); console.log("--- " + url + " ---"); console.log(text.substring(0, 1000) + "..."); console.log("--------------------------------------------------"); } catch (e) { console.log("Error fetching " + url + ": " + e.message); } } (async () => { for (const url of urls) { await printBody(url); } })();'
        '';
      };
    };
}
