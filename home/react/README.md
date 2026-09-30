
https://ontouchstart.github.io/home/react/2026-09-29T19-53-16-272Z_01a0eeba-84f0-7455-bdeb-4deda7f9dcfb

`flake.nix`

```nix
{
  description = "React repository";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      shell = pkgs.mkShell {
        buildInputs = with pkgs; [
          nodejs
          yarn
          git
          bash
          pkg-config
          python3
          cmake
          libgcc
          autoconf
          automake
          libtool
          zlib
          libpng
          openjdk
        ];
      };
    in
    {
      devShells.default = shell;
      devShells.aarch64-linux.default = shell;
    };
}
```

```
bash-5.3# nix develop --command "yarn install"
error: Path 'flake.nix' in the repository "/react" is not tracked by Git.

       To make it visible to Nix, run:

       git -C "/react" add -N "flake.nix"
bash-5.3# git -C "/react" add -N "flake.nix"
bash-5.3# nix develop --command "yarn install"
warning: Git tree '/react' is dirty
warning: updating lock file "/react/flake.lock":
• Added input 'nixpkgs':
    'github:nixos/nixpkgs/7a0f122f5090cf4c2ade2a13a0e229d4e19ba71f?narHash=sha256-ZoxIApko70jCdbH3l20HWXOBaT2HZd87orzd2yJ9dVE%3D' (2026-09-28)
/tmp/nix-shell.52tZCu: line 2366: exec: yarn install: not found
bash-5.3# nix develop --command "yarn install --ignore-scripts"
warning: Git tree '/react' is dirty
/tmp/nix-shell.UGBwR4: line 2366: exec: yarn install --ignore-scripts: not found
bash-5.3# nix develop --command yarn install --ignore-scripts
warning: Git tree '/react' is dirty
yarn install v1.22.22
(node:555) [DEP0169] DeprecationWarning: `url.parse()` behavior is not standardized and prone to errors that have security implications. Use the WHATWG URL API instead. CVEs are not issued for `url.parse()` vulnerabilities.
(Use `node --trace-deprecation ...` to show where the warning was created)
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
warning " > eslint-plugin-ft-flow@2.0.3" has unmet peer dependency "@babel/eslint-parser@^7.12.0".
warning " > eslint-plugin-ft-flow@2.0.3" has incorrect peer dependency "eslint@^8.1.0".
warning " > eslint-plugin-react@6.10.3" has incorrect peer dependency "eslint@^2.0.0 || ^3.0.0".
warning " > react-cache@2.0.0-alpha.0" has incorrect peer dependency "react@^17.0.0".
warning " > react-client@0.1.0" has incorrect peer dependency "react@^17.0.0".
warning " > react-debug-tools@0.16.0" has incorrect peer dependency "react@^17.0.0".
warning " > react-native-renderer@16.0.0" has incorrect peer dependency "react@^18.0.0".
warning " > react-noop-renderer@16.0.0" has incorrect peer dependency "react@^17.0.0".
warning " > react-server-dom-fb@0.1.0" has incorrect peer dependency "react@^18.0.0".
warning " > react-server-dom-fb@0.1.0" has incorrect peer dependency "react-dom@^18.0.0".
warning " > react-server-dom-webpack@19.3.0" has unmet peer dependency "webpack@^5.59.0".
warning " > react-server@0.1.0" has incorrect peer dependency "react@^17.0.0".
warning " > react-suspense-test-utils@0.1.0" has incorrect peer dependency "react@^17.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > eslint-plugin-react-hooks > @typescript-eslint/parser-v2@2.34.0" has incorrect peer dependency "eslint@^5.0.0 || ^6.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-extensions > acorn-jsx@5.3.1" has unmet peer dependency "acorn@^6.0.0 || ^7.0.0 || ^8.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-extensions > css-loader@1.0.1" has incorrect peer dependency "webpack@^4.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-extensions > raw-loader@3.1.0" has incorrect peer dependency "webpack@^4.3.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button@0.16.1" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button@0.16.1" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button@0.16.1" has incorrect peer dependency "react-is@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > react-virtualized-auto-sizer@1.0.23" has incorrect peer dependency "react@^15.3.0 || ^16.0.0-alpha || ^17.0.0 || ^18.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > react-virtualized-auto-sizer@1.0.23" has incorrect peer dependency "react-dom@^15.3.0 || ^16.0.0-alpha || ^17.0.0 || ^18.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > react-window@1.8.10" has incorrect peer dependency "react@^15.0.0 || ^16.0.0 || ^17.0.0 || ^18.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > react-window@1.8.10" has incorrect peer dependency "react-dom@^15.0.0 || ^16.0.0 || ^17.0.0 || ^18.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > react-dom-15@15.6.2" has incorrect peer dependency "react@^15.6.2".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-refresh > react-dom-16-8@16.8.0" has incorrect peer dependency "react@^16.0.0".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > use-sync-external-store > react-dom-17@17.0.2" has incorrect peer dependency "react@17.0.2".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/dropdown@0.16.1" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/dropdown@0.16.1" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/popover@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/popover@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/utils@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/utils@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/auto-id@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/auto-id@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/portal@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/portal@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/rect@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/rect@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/visually-hidden@0.16.0" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/tooltip > @reach/visually-hidden@0.16.0" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/dropdown > @reach/descendants@0.16.1" has incorrect peer dependency "react@^16.8.0 || 17.x".
warning "workspace-aggregator-09e166d6-90f3-46ae-a804-b465212b8ded > react-devtools-shared > @reach/menu-button > @reach/dropdown > @reach/descendants@0.16.1" has incorrect peer dependency "react-dom@^16.8.0 || 17.x".
warning Workspaces can only be enabled in private projects.
warning Workspaces can only be enabled in private projects.
[4/4] Building fresh packages...
warning Ignored scripts due to flag.
Done in 44.49s.
bash-5.3# nix develop --command yarn build
warning: Git tree '/react' is dirty
yarn run v1.22.22
$ ./scripts/react-compiler/link-compiler.sh
$ node ./scripts/rollup/build-all-release-channels.js
 BUILDING  react.development.js (node_dev)
 COMPLETE  react.development.js (node_dev)

 BUILDING  react.production.js (node_prod)
 COMPLETE  react.production.js (node_prod)

 BUILDING  React-dev.js (fb_www_dev)
 COMPLETE  React-dev.js (fb_www_dev)

 BUILDING  React-prod.js (fb_www_prod)
 COMPLETE  React-prod.js (fb_www_prod)

 BUILDING  React-profiling.js (fb_www_profiling)
 COMPLETE  React-profiling.js (fb_www_profiling)

 BUILDING  React-dev.js (rn_fb_dev)
 COMPLETE  React-dev.js (rn_fb_dev)

 BUILDING  React-prod.js (rn_fb_prod)
 COMPLETE  React-prod.js (rn_fb_prod)

 BUILDING  React-profiling.js (rn_fb_profiling)
 COMPLETE  React-profiling.js (rn_fb_profiling)

 BUILDING  react.react-server.development.js (node_dev)
 COMPLETE  react.react-server.development.js (node_dev)

 BUILDING  react.react-server.production.js (node_prod)
 COMPLETE  react.react-server.production.js (node_prod)

 BUILDING  react-jsx-runtime.development.js (node_dev)
 COMPLETE  react-jsx-runtime.development.js (node_dev)

 BUILDING  react-jsx-runtime.production.js (node_prod)
 COMPLETE  react-jsx-runtime.production.js (node_prod)

 BUILDING  react-jsx-runtime.profiling.js (node_profiling)
 COMPLETE  react-jsx-runtime.profiling.js (node_profiling)

 BUILDING  JSXRuntime-dev.js (rn_fb_dev)
 COMPLETE  JSXRuntime-dev.js (rn_fb_dev)

 BUILDING  JSXRuntime-prod.js (rn_fb_prod)
 COMPLETE  JSXRuntime-prod.js (rn_fb_prod)

 BUILDING  JSXRuntime-profiling.js (rn_fb_profiling)
 COMPLETE  JSXRuntime-profiling.js (rn_fb_profiling)

 BUILDING  react-compiler-runtime.development.js (node_dev)
 COMPLETE  react-compiler-runtime.development.js (node_dev)

 BUILDING  react-compiler-runtime.production.js (node_prod)
 COMPLETE  react-compiler-runtime.production.js (node_prod)

 BUILDING  react-compiler-runtime.profiling.js (node_profiling)
 COMPLETE  react-compiler-runtime.profiling.js (node_profiling)

 BUILDING  react-jsx-runtime.react-server.development.js (node_dev)
 COMPLETE  react-jsx-runtime.react-server.development.js (node_dev)

 BUILDING  react-jsx-runtime.react-server.production.js (node_prod)
 COMPLETE  react-jsx-runtime.react-server.production.js (node_prod)

 BUILDING  react-jsx-dev-runtime.development.js (node_dev)
 COMPLETE  react-jsx-dev-runtime.development.js (node_dev)

 BUILDING  react-jsx-dev-runtime.production.js (node_prod)
 COMPLETE  react-jsx-dev-runtime.production.js (node_prod)

 BUILDING  react-jsx-dev-runtime.profiling.js (node_profiling)
 COMPLETE  react-jsx-dev-runtime.profiling.js (node_profiling)

 BUILDING  JSXDEVRuntime-dev.js (fb_www_dev)
 COMPLETE  JSXDEVRuntime-dev.js (fb_www_dev)

 BUILDING  JSXDEVRuntime-prod.js (fb_www_prod)
 COMPLETE  JSXDEVRuntime-prod.js (fb_www_prod)

 BUILDING  JSXDEVRuntime-profiling.js (fb_www_profiling)
 COMPLETE  JSXDEVRuntime-profiling.js (fb_www_profiling)

 BUILDING  JSXDEVRuntime-dev.js (rn_fb_dev)
 COMPLETE  JSXDEVRuntime-dev.js (rn_fb_dev)

 BUILDING  JSXDEVRuntime-prod.js (rn_fb_prod)
 COMPLETE  JSXDEVRuntime-prod.js (rn_fb_prod)

 BUILDING  JSXDEVRuntime-profiling.js (rn_fb_profiling)
 COMPLETE  JSXDEVRuntime-profiling.js (rn_fb_profiling)

 BUILDING  react-jsx-dev-runtime.react-server.development.js (node_dev)
 COMPLETE  react-jsx-dev-runtime.react-server.development.js (node_dev)

 BUILDING  react-jsx-dev-runtime.react-server.production.js (node_prod)
 COMPLETE  react-jsx-dev-runtime.react-server.production.js (node_prod)

 BUILDING  react-dom.development.js (node_dev)
 COMPLETE  react-dom.development.js (node_dev)

 BUILDING  react-dom.production.js (node_prod)
 COMPLETE  react-dom.production.js (node_prod)

 BUILDING  react-dom-client.development.js (node_dev)
 COMPLETE  react-dom-client.development.js (node_dev)

 BUILDING  react-dom-client.production.js (node_prod)
 COMPLETE  react-dom-client.production.js (node_prod)

 BUILDING  react-dom-profiling.development.js (node_dev)
 COMPLETE  react-dom-profiling.development.js (node_dev)

 BUILDING  react-dom-profiling.profiling.js (node_profiling)
 COMPLETE  react-dom-profiling.profiling.js (node_profiling)

 BUILDING  ReactDOM-dev.js (fb_www_dev)
 COMPLETE  ReactDOM-dev.js (fb_www_dev)

 BUILDING  ReactDOM-prod.js (fb_www_prod)
 COMPLETE  ReactDOM-prod.js (fb_www_prod)

 BUILDING  ReactDOM-profiling.js (fb_www_profiling)
 COMPLETE  ReactDOM-profiling.js (fb_www_profiling)

 BUILDING  ReactDOM-dev.js (rn_fb_dev)
 COMPLETE  ReactDOM-dev.js (rn_fb_dev)

 BUILDING  ReactDOM-prod.js (rn_fb_prod)
 COMPLETE  ReactDOM-prod.js (rn_fb_prod)

 BUILDING  ReactDOM-profiling.js (rn_fb_profiling)
 COMPLETE  ReactDOM-profiling.js (rn_fb_profiling)

 BUILDING  ReactDOMClient-dev.js (rn_fb_dev)
 COMPLETE  ReactDOMClient-dev.js (rn_fb_dev)

 BUILDING  ReactDOMClient-prod.js (rn_fb_prod)
 COMPLETE  ReactDOMClient-prod.js (rn_fb_prod)

 BUILDING  ReactDOMClient-profiling.js (rn_fb_profiling)
 COMPLETE  ReactDOMClient-profiling.js (rn_fb_profiling)

 BUILDING  ReactDOMProfiling-dev.js (rn_fb_dev)
 COMPLETE  ReactDOMProfiling-dev.js (rn_fb_dev)

 BUILDING  ReactDOMProfiling-prod.js (rn_fb_prod)
 COMPLETE  ReactDOMProfiling-prod.js (rn_fb_prod)

 BUILDING  ReactDOMProfiling-profiling.js (rn_fb_profiling)
 COMPLETE  ReactDOMProfiling-profiling.js (rn_fb_profiling)

 BUILDING  ReactDOMTestUtils-dev.js (rn_fb_dev)
 COMPLETE  ReactDOMTestUtils-dev.js (rn_fb_dev)

 BUILDING  ReactDOMTestUtils-prod.js (rn_fb_prod)
 COMPLETE  ReactDOMTestUtils-prod.js (rn_fb_prod)

 BUILDING  ReactDOMTestUtils-profiling.js (rn_fb_profiling)
 COMPLETE  ReactDOMTestUtils-profiling.js (rn_fb_profiling)

 BUILDING  react-dom.react-server.development.js (node_dev)
 COMPLETE  react-dom.react-server.development.js (node_dev)

 BUILDING  react-dom.react-server.production.js (node_prod)
 COMPLETE  react-dom.react-server.production.js (node_prod)

 BUILDING  react-dom-test-utils.development.js (node_dev)
 COMPLETE  react-dom-test-utils.development.js (node_dev)

 BUILDING  react-dom-test-utils.production.js (node_prod)
 COMPLETE  react-dom-test-utils.production.js (node_prod)

 BUILDING  ReactDOMTesting-dev.js (fb_www_dev)
 COMPLETE  ReactDOMTesting-dev.js (fb_www_dev)

 BUILDING  ReactDOMTesting-prod.js (fb_www_prod)
 COMPLETE  ReactDOMTesting-prod.js (fb_www_prod)

 BUILDING  react-dom-server-legacy.browser.development.js (node_dev)
 COMPLETE  react-dom-server-legacy.browser.development.js (node_dev)

 BUILDING  react-dom-server-legacy.browser.production.js (node_prod)
 COMPLETE  react-dom-server-legacy.browser.production.js (node_prod)

 BUILDING  ReactDOMServer-dev.js (fb_www_dev)
 COMPLETE  ReactDOMServer-dev.js (fb_www_dev)

 BUILDING  ReactDOMServer-prod.js (fb_www_prod)
 COMPLETE  ReactDOMServer-prod.js (fb_www_prod)

 BUILDING  react-dom-server-legacy.node.development.js (node_dev)
 COMPLETE  react-dom-server-legacy.node.development.js (node_dev)

 BUILDING  react-dom-server-legacy.node.production.js (node_prod)
 COMPLETE  react-dom-server-legacy.node.production.js (node_prod)

 BUILDING  react-dom-server.browser.development.js (node_dev)
 COMPLETE  react-dom-server.browser.development.js (node_dev)

 BUILDING  react-dom-server.browser.production.js (node_prod)
 COMPLETE  react-dom-server.browser.production.js (node_prod)

 BUILDING  react-dom-server.node.development.js (node_dev)
 COMPLETE  react-dom-server.node.development.js (node_dev)

 BUILDING  react-dom-server.node.production.js (node_prod)
 COMPLETE  react-dom-server.node.production.js (node_prod)

 BUILDING  react-dom-server.edge.development.js (node_dev)
 COMPLETE  react-dom-server.edge.development.js (node_dev)

 BUILDING  react-dom-server.edge.production.js (node_prod)
 COMPLETE  react-dom-server.edge.production.js (node_prod)

 BUILDING  react-dom-server.bun.development.js (bun_dev)
 COMPLETE  react-dom-server.bun.development.js (bun_dev)

 BUILDING  react-dom-server.bun.production.js (bun_prod)
 COMPLETE  react-dom-server.bun.production.js (bun_prod)

 BUILDING  react-server-dom-webpack-server.browser.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-server.browser.development.js (node_dev)

 BUILDING  react-server-dom-webpack-server.browser.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-server.browser.production.js (node_prod)

 BUILDING  react-server-dom-webpack-server.node.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-server.node.development.js (node_dev)

 BUILDING  react-server-dom-webpack-server.node.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-server.node.production.js (node_prod)

 BUILDING  react-server-dom-webpack-server.edge.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-server.edge.development.js (node_dev)

 BUILDING  react-server-dom-webpack-server.edge.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-server.edge.production.js (node_prod)

 BUILDING  react-server-dom-webpack-client.browser.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-client.browser.development.js (node_dev)

 BUILDING  react-server-dom-webpack-client.browser.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-client.browser.production.js (node_prod)

 BUILDING  react-server-dom-webpack-client.node.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-client.node.development.js (node_dev)

 BUILDING  react-server-dom-webpack-client.node.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-client.node.production.js (node_prod)

 BUILDING  react-server-dom-webpack-client.edge.development.js (node_dev)
 COMPLETE  react-server-dom-webpack-client.edge.development.js (node_dev)

 BUILDING  react-server-dom-webpack-client.edge.production.js (node_prod)
 COMPLETE  react-server-dom-webpack-client.edge.production.js (node_prod)

 BUILDING  react-server-dom-webpack-plugin.js (node_es2015)
 COMPLETE  react-server-dom-webpack-plugin.js (node_es2015)

 BUILDING  react-server-dom-webpack-node-loader.production.js (esm_prod)
 COMPLETE  react-server-dom-webpack-node-loader.production.js (esm_prod)

 BUILDING  react-server-dom-webpack-node-register.js (node_es2015)
 COMPLETE  react-server-dom-webpack-node-register.js (node_es2015)

 BUILDING  react-server-dom-turbopack-server.browser.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-server.browser.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-server.browser.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-server.browser.production.js (node_prod)

 BUILDING  react-server-dom-turbopack-server.node.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-server.node.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-server.node.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-server.node.production.js (node_prod)

 BUILDING  react-server-dom-turbopack-server.edge.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-server.edge.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-server.edge.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-server.edge.production.js (node_prod)

 BUILDING  react-server-dom-turbopack-client.browser.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-client.browser.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-client.browser.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-client.browser.production.js (node_prod)

 BUILDING  react-server-dom-turbopack-client.node.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-client.node.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-client.node.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-client.node.production.js (node_prod)

 BUILDING  react-server-dom-turbopack-client.edge.development.js (node_dev)
 COMPLETE  react-server-dom-turbopack-client.edge.development.js (node_dev)

 BUILDING  react-server-dom-turbopack-client.edge.production.js (node_prod)
 COMPLETE  react-server-dom-turbopack-client.edge.production.js (node_prod)

 BUILDING  react-server-dom-parcel-server.browser.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-server.browser.development.js (node_dev)

 BUILDING  react-server-dom-parcel-server.browser.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-server.browser.production.js (node_prod)

 BUILDING  react-server-dom-parcel-server.node.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-server.node.development.js (node_dev)

 BUILDING  react-server-dom-parcel-server.node.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-server.node.production.js (node_prod)

 BUILDING  react-server-dom-parcel-server.edge.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-server.edge.development.js (node_dev)

 BUILDING  react-server-dom-parcel-server.edge.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-server.edge.production.js (node_prod)

 BUILDING  react-server-dom-parcel-client.browser.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-client.browser.development.js (node_dev)

 BUILDING  react-server-dom-parcel-client.browser.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-client.browser.production.js (node_prod)

 BUILDING  react-server-dom-parcel-client.node.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-client.node.development.js (node_dev)

 BUILDING  react-server-dom-parcel-client.node.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-client.node.production.js (node_prod)

 BUILDING  react-server-dom-parcel-client.edge.development.js (node_dev)
 COMPLETE  react-server-dom-parcel-client.edge.development.js (node_dev)

 BUILDING  react-server-dom-parcel-client.edge.production.js (node_prod)
 COMPLETE  react-server-dom-parcel-client.edge.production.js (node_prod)

 BUILDING  react-server-dom-esm-server.node.development.js (node_dev)
 COMPLETE  react-server-dom-esm-server.node.development.js (node_dev)

 BUILDING  react-server-dom-esm-server.node.production.js (node_prod)
 COMPLETE  react-server-dom-esm-server.node.production.js (node_prod)

 BUILDING  react-server-dom-esm-client.browser.development.js (esm_dev)
 COMPLETE  react-server-dom-esm-client.browser.development.js (esm_dev)

 BUILDING  react-server-dom-esm-client.browser.production.js (esm_prod)
 COMPLETE  react-server-dom-esm-client.browser.production.js (esm_prod)

 BUILDING  react-server-dom-esm-client.browser.development.js (node_dev)
 COMPLETE  react-server-dom-esm-client.browser.development.js (node_dev)

 BUILDING  react-server-dom-esm-client.browser.production.js (node_prod)
 COMPLETE  react-server-dom-esm-client.browser.production.js (node_prod)

 BUILDING  react-server-dom-esm-client.node.development.js (node_dev)
 COMPLETE  react-server-dom-esm-client.node.development.js (node_dev)

 BUILDING  react-server-dom-esm-client.node.production.js (node_prod)
 COMPLETE  react-server-dom-esm-client.node.production.js (node_prod)

 BUILDING  react-server-dom-esm-node-loader.production.js (esm_prod)
 COMPLETE  react-server-dom-esm-node-loader.production.js (esm_prod)

 BUILDING  ReactFlightServer-dev.js (fb_www_dev)
 COMPLETE  ReactFlightServer-dev.js (fb_www_dev)

 BUILDING  ReactFlightServer-prod.js (fb_www_prod)
 COMPLETE  ReactFlightServer-prod.js (fb_www_prod)

 BUILDING  ReactFlightClient-dev.js (fb_www_dev)
 COMPLETE  ReactFlightClient-dev.js (fb_www_dev)

 BUILDING  ReactFlightClient-prod.js (fb_www_prod)
 COMPLETE  ReactFlightClient-prod.js (fb_www_prod)

 BUILDING  react-server-dom-unbundled-server.node.development.js (node_dev)
 COMPLETE  react-server-dom-unbundled-server.node.development.js (node_dev)

 BUILDING  react-server-dom-unbundled-server.node.production.js (node_prod)
 COMPLETE  react-server-dom-unbundled-server.node.production.js (node_prod)

 BUILDING  react-server-dom-unbundled-client.node.development.js (node_dev)
 COMPLETE  react-server-dom-unbundled-client.node.development.js (node_dev)

 BUILDING  react-server-dom-unbundled-client.node.production.js (node_prod)
 COMPLETE  react-server-dom-unbundled-client.node.production.js (node_prod)

 BUILDING  react-server-dom-unbundled-node-loader.production.js (esm_prod)
 COMPLETE  react-server-dom-unbundled-node-loader.production.js (esm_prod)

 BUILDING  react-server-dom-unbundled-node-register.js (node_es2015)
 COMPLETE  react-server-dom-unbundled-node-register.js (node_es2015)

 BUILDING  react-suspense-test-utils.js (node_es2015)
 COMPLETE  react-suspense-test-utils.js (node_es2015)

 BUILDING  react-art.development.js (node_dev)
 COMPLETE  react-art.development.js (node_dev)

 BUILDING  react-art.production.js (node_prod)
 COMPLETE  react-art.production.js (node_prod)

 BUILDING  ReactART-dev.js (fb_www_dev)
 COMPLETE  ReactART-dev.js (fb_www_dev)

 BUILDING  ReactART-prod.js (fb_www_prod)
 COMPLETE  ReactART-prod.js (fb_www_prod)

 BUILDING  ReactFabric-dev.js (rn_fb_dev)
 COMPLETE  ReactFabric-dev.js (rn_fb_dev)

 BUILDING  ReactFabric-prod.js (rn_fb_prod)
 COMPLETE  ReactFabric-prod.js (rn_fb_prod)

 BUILDING  ReactFabric-profiling.js (rn_fb_profiling)
 COMPLETE  ReactFabric-profiling.js (rn_fb_profiling)

 BUILDING  ReactFabric-dev.js (rn_oss_dev)
 COMPLETE  ReactFabric-dev.js (rn_oss_dev)

 BUILDING  ReactFabric-prod.js (rn_oss_prod)
 COMPLETE  ReactFabric-prod.js (rn_oss_prod)

 BUILDING  ReactFabric-profiling.js (rn_oss_profiling)
 COMPLETE  ReactFabric-profiling.js (rn_oss_profiling)

 BUILDING  react-test-renderer.development.js (node_dev)
 COMPLETE  react-test-renderer.development.js (node_dev)

 BUILDING  react-test-renderer.production.js (node_prod)
 COMPLETE  react-test-renderer.production.js (node_prod)

 BUILDING  ReactTestRenderer-dev.js (fb_www_dev)
 COMPLETE  ReactTestRenderer-dev.js (fb_www_dev)

 BUILDING  ReactTestRenderer-dev.js (rn_fb_dev)
 COMPLETE  ReactTestRenderer-dev.js (rn_fb_dev)

 BUILDING  ReactTestRenderer-prod.js (rn_fb_prod)
 COMPLETE  ReactTestRenderer-prod.js (rn_fb_prod)

 BUILDING  ReactTestRenderer-profiling.js (rn_fb_profiling)
 COMPLETE  ReactTestRenderer-profiling.js (rn_fb_profiling)

 BUILDING  react-noop-renderer.development.js (node_dev)
 COMPLETE  react-noop-renderer.development.js (node_dev)

 BUILDING  react-noop-renderer.production.js (node_prod)
 COMPLETE  react-noop-renderer.production.js (node_prod)

 BUILDING  react-noop-renderer-persistent.development.js (node_dev)
 COMPLETE  react-noop-renderer-persistent.development.js (node_dev)

 BUILDING  react-noop-renderer-persistent.production.js (node_prod)
 COMPLETE  react-noop-renderer-persistent.production.js (node_prod)

 BUILDING  react-noop-renderer-server.development.js (node_dev)
 COMPLETE  react-noop-renderer-server.development.js (node_dev)

 BUILDING  react-noop-renderer-server.production.js (node_prod)
 COMPLETE  react-noop-renderer-server.production.js (node_prod)

 BUILDING  react-noop-renderer-flight-server.development.js (node_dev)
 COMPLETE  react-noop-renderer-flight-server.development.js (node_dev)

 BUILDING  react-noop-renderer-flight-server.production.js (node_prod)
 COMPLETE  react-noop-renderer-flight-server.production.js (node_prod)

 BUILDING  react-noop-renderer-flight-client.development.js (node_dev)
 COMPLETE  react-noop-renderer-flight-client.development.js (node_dev)

 BUILDING  react-noop-renderer-flight-client.production.js (node_prod)
 COMPLETE  react-noop-renderer-flight-client.production.js (node_prod)

 BUILDING  react-reconciler.development.js (node_dev)
 COMPLETE  react-reconciler.development.js (node_dev)

 BUILDING  react-reconciler.production.js (node_prod)
 COMPLETE  react-reconciler.production.js (node_prod)

 BUILDING  react-reconciler.profiling.js (node_profiling)
 COMPLETE  react-reconciler.profiling.js (node_profiling)

 BUILDING  ReactReconciler-dev.js (fb_www_dev)
 COMPLETE  ReactReconciler-dev.js (fb_www_dev)

 BUILDING  ReactReconciler-prod.js (fb_www_prod)
 COMPLETE  ReactReconciler-prod.js (fb_www_prod)

 BUILDING  react-server.development.js (node_dev)
 COMPLETE  react-server.development.js (node_dev)

 BUILDING  react-server.production.js (node_prod)
 COMPLETE  react-server.production.js (node_prod)

 BUILDING  react-server-flight.development.js (node_dev)
 COMPLETE  react-server-flight.development.js (node_dev)

 BUILDING  react-server-flight.production.js (node_prod)
 COMPLETE  react-server-flight.production.js (node_prod)

 BUILDING  react-client-flight.development.js (node_dev)
 COMPLETE  react-client-flight.development.js (node_dev)

 BUILDING  react-client-flight.production.js (node_prod)
 COMPLETE  react-client-flight.production.js (node_prod)

 BUILDING  react-reconciler-reflection.development.js (node_dev)
 COMPLETE  react-reconciler-reflection.development.js (node_dev)

 BUILDING  react-reconciler-reflection.production.js (node_prod)
 COMPLETE  react-reconciler-reflection.production.js (node_prod)

 BUILDING  react-reconciler-constants.development.js (node_dev)
 COMPLETE  react-reconciler-constants.development.js (node_dev)

 BUILDING  react-reconciler-constants.production.js (node_prod)
 COMPLETE  react-reconciler-constants.production.js (node_prod)

 BUILDING  ReactReconcilerConstants-dev.js (fb_www_dev)
 COMPLETE  ReactReconcilerConstants-dev.js (fb_www_dev)

 BUILDING  ReactReconcilerConstants-prod.js (fb_www_prod)
 COMPLETE  ReactReconcilerConstants-prod.js (fb_www_prod)

 BUILDING  react-is.development.js (node_dev)
 COMPLETE  react-is.development.js (node_dev)

 BUILDING  react-is.production.js (node_prod)
 COMPLETE  react-is.production.js (node_prod)

 BUILDING  ReactIs-dev.js (fb_www_dev)
 COMPLETE  ReactIs-dev.js (fb_www_dev)

 BUILDING  ReactIs-prod.js (fb_www_prod)
 COMPLETE  ReactIs-prod.js (fb_www_prod)

 BUILDING  ReactIs-dev.js (rn_fb_dev)
 COMPLETE  ReactIs-dev.js (rn_fb_dev)

 BUILDING  ReactIs-prod.js (rn_fb_prod)
 COMPLETE  ReactIs-prod.js (rn_fb_prod)

 BUILDING  ReactIs-profiling.js (rn_fb_profiling)
 COMPLETE  ReactIs-profiling.js (rn_fb_profiling)

 BUILDING  react-debug-tools.development.js (node_dev)
 COMPLETE  react-debug-tools.development.js (node_dev)

 BUILDING  react-debug-tools.production.js (node_prod)
 COMPLETE  react-debug-tools.production.js (node_prod)

 BUILDING  react-cache.development.js (node_dev)
 COMPLETE  react-cache.development.js (node_dev)

 BUILDING  react-cache.production.js (node_prod)
 COMPLETE  react-cache.production.js (node_prod)

 BUILDING  ReactCacheOld-dev.js (fb_www_dev)
 COMPLETE  ReactCacheOld-dev.js (fb_www_dev)

 BUILDING  ReactCacheOld-prod.js (fb_www_prod)
 COMPLETE  ReactCacheOld-prod.js (fb_www_prod)

 BUILDING  use-subscription.development.js (node_dev)
 COMPLETE  use-subscription.development.js (node_dev)

 BUILDING  use-subscription.production.js (node_prod)
 COMPLETE  use-subscription.production.js (node_prod)

 BUILDING  use-sync-external-store.development.js (node_dev)
 COMPLETE  use-sync-external-store.development.js (node_dev)

 BUILDING  use-sync-external-store.production.js (node_prod)
 COMPLETE  use-sync-external-store.production.js (node_prod)

 BUILDING  use-sync-external-store-shim.development.js (node_dev)
 COMPLETE  use-sync-external-store-shim.development.js (node_dev)

 BUILDING  use-sync-external-store-shim.production.js (node_prod)
 COMPLETE  use-sync-external-store-shim.production.js (node_prod)

 BUILDING  use-sync-external-store-shim.native.development.js (node_dev)
 COMPLETE  use-sync-external-store-shim.native.development.js (node_dev)

 BUILDING  use-sync-external-store-shim.native.production.js (node_prod)
 COMPLETE  use-sync-external-store-shim.native.production.js (node_prod)

 BUILDING  use-sync-external-store-with-selector.development.js (node_dev)
 COMPLETE  use-sync-external-store-with-selector.development.js (node_dev)

 BUILDING  use-sync-external-store-with-selector.production.js (node_prod)
 COMPLETE  use-sync-external-store-with-selector.production.js (node_prod)

 BUILDING  use-sync-external-store-shim/with-selector.development.js (node_dev)
 COMPLETE  use-sync-external-store-shim/with-selector.development.js (node_dev)

 BUILDING  use-sync-external-store-shim/with-selector.production.js (node_prod)
 COMPLETE  use-sync-external-store-shim/with-selector.production.js (node_prod)

 BUILDING  scheduler.development.js (node_dev)
 COMPLETE  scheduler.development.js (node_dev)

 BUILDING  scheduler.production.js (node_prod)
 COMPLETE  scheduler.production.js (node_prod)

 BUILDING  Scheduler-dev.js (fb_www_dev)
 COMPLETE  Scheduler-dev.js (fb_www_dev)

 BUILDING  Scheduler-prod.js (fb_www_prod)
 COMPLETE  Scheduler-prod.js (fb_www_prod)

 BUILDING  Scheduler-profiling.js (fb_www_profiling)
 COMPLETE  Scheduler-profiling.js (fb_www_profiling)

 BUILDING  Scheduler-dev.js (rn_fb_dev)
 COMPLETE  Scheduler-dev.js (rn_fb_dev)

 BUILDING  Scheduler-prod.js (rn_fb_prod)
 COMPLETE  Scheduler-prod.js (rn_fb_prod)

 BUILDING  Scheduler-profiling.js (rn_fb_profiling)
 COMPLETE  Scheduler-profiling.js (rn_fb_profiling)

 BUILDING  scheduler-unstable_mock.development.js (node_dev)
 COMPLETE  scheduler-unstable_mock.development.js (node_dev)

 BUILDING  scheduler-unstable_mock.production.js (node_prod)
 COMPLETE  scheduler-unstable_mock.production.js (node_prod)

 BUILDING  SchedulerMock-dev.js (fb_www_dev)
 COMPLETE  SchedulerMock-dev.js (fb_www_dev)

 BUILDING  SchedulerMock-prod.js (fb_www_prod)
 COMPLETE  SchedulerMock-prod.js (fb_www_prod)

 BUILDING  SchedulerMock-dev.js (rn_fb_dev)
 COMPLETE  SchedulerMock-dev.js (rn_fb_dev)

 BUILDING  SchedulerMock-prod.js (rn_fb_prod)
 COMPLETE  SchedulerMock-prod.js (rn_fb_prod)

 BUILDING  scheduler.native.development.js (node_dev)
 COMPLETE  scheduler.native.development.js (node_dev)

 BUILDING  scheduler.native.production.js (node_prod)
 COMPLETE  scheduler.native.production.js (node_prod)

 BUILDING  scheduler-unstable_post_task.development.js (node_dev)
 COMPLETE  scheduler-unstable_post_task.development.js (node_dev)

 BUILDING  scheduler-unstable_post_task.production.js (node_prod)
 COMPLETE  scheduler-unstable_post_task.production.js (node_prod)

 BUILDING  SchedulerPostTask-dev.js (fb_www_dev)
 COMPLETE  SchedulerPostTask-dev.js (fb_www_dev)

 BUILDING  SchedulerPostTask-prod.js (fb_www_prod)
 COMPLETE  SchedulerPostTask-prod.js (fb_www_prod)

 BUILDING  SchedulerPostTask-profiling.js (fb_www_profiling)
 COMPLETE  SchedulerPostTask-profiling.js (fb_www_profiling)

 BUILDING  jest-react.development.js (node_dev)
 COMPLETE  jest-react.development.js (node_dev)

 BUILDING  jest-react.production.js (node_prod)
 COMPLETE  jest-react.production.js (node_prod)

Running: mkdir -p ./compiler/packages/babel-plugin-react-compiler/dist && echo "module.exports = require('../src/index.ts');" > ./compiler/packages/babel-plugin-react-compiler/dist/index.js
 BUILDING  eslint-plugin-react-hooks.development.js (node_dev)

@rollup/plugin-typescript TS7016: Could not find a declaration file for module '@babel/code-frame'. '/react/node_modules/@babel/code-frame/lib/index.js' implicitly has an 'any' type.
  Try `npm i --save-dev @types/babel__code-frame` if it exists or add a new declaration (.d.ts) file containing `declare module '@babel/code-frame';`

error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
bash-5.3# 

```

```
bash-5.3# nix develop --command yarn test
warning: Git tree '/react' is dirty
yarn run v1.22.22
$ node ./scripts/jest/jest-cli.js
$ NODE_ENV=development RELEASE_CHANNEL=experimental compactConsole=false node ./scripts/jest/jest.js --config ./scripts/jest/config.source.js

Running tests for default (experimental)...
 PASS  packages/react-reconciler/src/__tests__/ReactHooksWithNoopRenderer-test.js (10.175 s)
 PASS  packages/react-dom/src/__tests__/ReactDOMFragmentRefs-test.js (10.406 s)
 PASS  packages/react-client/src/__tests__/ReactFlight-test.js (11.278 s)
 PASS  packages/react-dom/src/__tests__/ReactDOMServerPartialHydration-test.internal.js (11.469 s)
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseEffectsSemantics-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseWithNoopRenderer-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMComponent-test.js (12.981 s)
 PASS  packages/react-refresh/src/__tests__/ReactFresh-test.js (13.068 s)
 PASS  packages/react-server/src/__tests__/ReactFlightAsyncDebugInfo-test.js
 PASS  packages/react-dom/src/events/__tests__/DOMPluginEventSystem-test.internal.js (15.178 s)
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseList-test.js
 PASS  packages/react-dom/src/__tests__/ReactErrorBoundaries-test.internal.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMBrowser-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMEdge-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncremental-test.js
 FAIL  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js
  ● ReactFlightDOMNode › should not corrupt the Node.js Buffer pool by detaching ArrayBuffers when using Web Streams

    expect(received).toBe(expected) // Object.is equality

    Expected: 8192
    Received: 65536

      1415 |
      1416 |     // Verify this chunk uses the Buffer pool (8192 bytes for files < 4KB).
    > 1417 |     expect(fileChunk.buffer.byteLength).toBe(8192);
           |                                         ^
      1418 |
      1419 |     const readable = await serverAct(() =>
      1420 |       ReactServerDOMServer.renderToReadableStream(fileChunk, webpackMap),

      at Object.<anonymous> (packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js:1417:41)

  ● ReactFlightDOMNode › detaches the abort listener from a composite signal once the prerender completes

    TypeError: signals[0] is not of type AbortSignal.

      2490 |     const outer = new AbortController();
      2491 |     const timeout = new AbortController();
    > 2492 |     const composite = AbortSignal.any([outer.signal, timeout.signal]);
           |                                 ^
      2493 |
      2494 |     function App() {
      2495 |       return <div>hello world</div>;

      at Object.<anonymous> (packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js:2492:33)

 PASS  packages/react-dom/src/__tests__/ReactDOMInput-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerPartialHydrationActivity-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactTransitionTracing-test.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyErrorBoundaries-test.internal.js
 PASS  packages/internal-test-utils/__tests__/ReactInternalTestUtils-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactUse-test.js
 PASS  packages/react/src/__tests__/ReactProfiler-test.internal.js
 PASS  packages/react-debug-tools/src/__tests__/ReactHooksInspectionIntegration-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMForm-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMHydrationDiff-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactHooks-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSelect-test.js
 PASS  packages/react-dom/src/__tests__/DOMPropertyOperations-test.js
 PASS  packages/react-dom/src/__tests__/ReactComponentLifeCycle-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOM-test.js (9.612 s)
 PASS  packages/react-dom/src/__tests__/ReactUpdates-test.js
 PASS  packages/react-native-renderer/src/__tests__/ResponderEventPlugin-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactAsyncActions-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalErrorHandling-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerSelectiveHydration-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactLazy-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/Activity-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMLegacyFiber-test.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyUpdates-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMEventPropagation-test.js (9.641 s)
 PASS  packages/react-native-renderer/src/__tests__/ReactFabric-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactNewContext-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspense-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMEventListener-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerSelectiveHydrationActivity-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactCompositeComponent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMTestSelectors-test.js
 PASS  packages/react/src/__tests__/ReactStrictMode-test.js
 PASS  packages/react-reconciler/src/__tests__/useEffectEvent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMViewTransition-test.js
 PASS  packages/react/src/__tests__/ReactChildren-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzStaticBrowser-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactDeferredValue-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactTransition-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMTextarea-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalSideEffects-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSingletonComponents-test.js
 PASS  packages/use-sync-external-store/src/__tests__/useSyncExternalStoreShared-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactContextPropagation-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMForm-test.js
 PASS  packages/react-dom/src/__tests__/ReactServerRendering-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOM-test.js
 PASS  packages/react-test-renderer/src/__tests__/ReactTestRenderer-test.internal.js
 PASS  packages/react-dom/src/events/plugins/__tests__/BeforeInputEventPlugin-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFiber-test.js (5.794 s)
 PASS  packages/react-dom/src/__tests__/ReactDOMFiberAsync-test.js
 PASS  packages/react/src/__tests__/createReactClassIntegration-test.js
 PASS  packages/react-dom/src/__tests__/ReactServerRenderingHydration-test.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyCompositeComponent-test.js
 PASS  packages/react-dom/src/__tests__/ReactMultiChildReconcile-test.js
 PASS  packages/react-dom/src/events/plugins/__tests__/ChangeEventPlugin-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMReply-test.js
 PASS  packages/react-debug-tools/src/__tests__/ReactHooksInspection-test.js
 PASS  packages/react-refresh/src/__tests__/ReactFreshIntegration-test.js (16.551 s)
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzForm-test.js
 PASS  packages/react-reconciler/src/__tests__/StrictEffectsMode-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactFragment-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFloat-test.js (36.878 s)
 PASS  packages/react-reconciler/src/__tests__/ReactExpiration-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMUseId-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzServerNode-test.js
 PASS  packages/react/src/__tests__/ReactTypeScriptClass-test.ts
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzShellHydration-test.js
 PASS  packages/scheduler/src/__tests__/SchedulerMock-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzSuspenseList-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationHooks-test.js (7.117 s)
 PASS  packages/react/src/__tests__/ReactES6Class-test.js
 PASS  packages/react/src/__tests__/ReactContextValidator-test.js
 PASS  packages/react-reconciler/src/__tests__/StrictEffectsModeDefaults-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactComponent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMImageLoad-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspensePlaceholder-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactTestUtilsAct-test.js
 PASS  packages/react/src/__tests__/ReactCoffeeScriptClass-test.coffee
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalUpdates-test.js
 PASS  packages/react-reconciler/src/__tests__/useMemoCache-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzViewTransition-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzServerBrowser-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseyCommitPhase-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactScope-test.internal.js
 PASS  packages/react/src/__tests__/ReactElementValidator-test.internal.js
 PASS  packages/react-dom/src/events/plugins/__tests__/SimpleEventPlugin-test.js
 PASS  packages/react-dom/src/__tests__/ReactCompositeComponentState-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMConsoleErrorReportingLegacy-test.js
 PASS  packages/react-reconciler/src/__tests__/useSyncExternalStore-test.js
 PASS  packages/scheduler/src/__tests__/SchedulerProfiling-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactMemo-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticKeyboardEvent-test.js
 PASS  packages/internal-test-utils/__tests__/ReactInternalTestUtilsDOM-test.js
 PASS  packages/use-subscription/src/__tests__/useSubscription-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSiblingPrerendering-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzSuppressHydrationWarning-test.js
 PASS  packages/react-reconciler/src/__tests__/ActivityLegacySuspense-test.js
 PASS  packages/react-reconciler/src/__tests__/ActivitySuspense-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationElements-test.js (14.425 s)
 PASS  packages/react-dom/src/__tests__/refs-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMActivity-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseEffectsSemanticsDOM-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzStaticNode-test.js
 PASS  packages/react-dom/src/__tests__/ReactMultiChild-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactPerformanceTrack-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMConsoleErrorReporting-test.js
 PASS  packages/react-refresh/src/__tests__/ReactFreshBabelPlugin-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactUpdaters-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyMount-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactActWarnings-test.js
 PASS  packages/react-art/src/__tests__/ReactART-test.js
 PASS  packages/react/src/__tests__/ReactCreateElement-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactConcurrentErrorRecovery-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMRoot-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMReplyEdge-test.js
 PASS  packages/react-dom/src/__tests__/ReactRenderDocument-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationUserInteraction-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMNativeEventHeuristic-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSchedulerIntegration-test.js
 PASS  packages/react/src/__tests__/forwardRef-test.js
 PASS  packages/react-cache/src/__tests__/ReactCacheOld-test.internal.js
 PASS  packages/scheduler/src/__tests__/SchedulerPostTask-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzServer-test.js (45.448 s)
 PASS  packages/react/src/__tests__/ReactJSXRuntime-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerLifecycles-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactDefaultTransitionIndicator-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactOwnerStacks-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationLegacyContext-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseFuzz-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFragmentRefsDocument-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalErrorLogging-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactFlushSync-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIsomorphicAct-test.js
 PASS  packages/react-debug-tools/src/__tests__/ReactDevToolsHooksIntegration-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalScheduling-test.js
 PASS  packages/react/src/__tests__/ReactElementClone-test.js
 PASS  packages/react-test-renderer/src/__tests__/ReactTestRendererTraversal-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzStatic-test.js
 PASS  packages/react-dom/src/__tests__/ReactEmptyComponent-test.js
 PASS  packages/dom-event-testing-library/__tests__/index-test.internal.js
 PASS  packages/scheduler/src/__tests__/Scheduler-test.js
 PASS  packages/react-dom/src/client/__tests__/trustedTypes-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactBrowserEventEmitter-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactErrorStacks-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOMEdge-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOMNode-test.js
 PASS  packages/scheduler/src/__tests__/SchedulerSetImmediate-test.js
 PASS  packages/react-dom/src/__tests__/ReactIdentity-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSuspensePlaceholder-test.js
 PASS  packages/react-dom/src/__tests__/ReactTreeTraversal-test.js
 PASS  packages/react/src/__tests__/ReactJSXElementValidator-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOM-test.js
 PASS  packages/react-is/src/__tests__/ReactIs-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationReconnecting-test.js
 PASS  packages/react-dom/src/__tests__/CSSPropertyOperations-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMTextComponent-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactCache-test.js
 PASS  packages/react-dom/src/events/plugins/__tests__/EnterLeaveEventPlugin-test.js
 PASS  packages/react-reconciler/src/__tests__/ActivityStrictMode-test.js
 PASS  packages/react-markup/src/__tests__/ReactMarkupServer-test.js
 PASS  packages/react-dom/src/__tests__/ReactFunctionComponent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMOption-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationNewContext-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerSuspense-test.internal.js
 PASS  packages/react/src/__tests__/ReactJSXTransformIntegration-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSVG-test.js
 PASS  packages/react-native-renderer/src/__tests__/EventPluginRegistry-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyContextDisabled-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMAttribute-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSrcObject-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationClassContextType-test.js
 PASS  scripts/eslint-rules/__tests__/safe-string-coercion-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactCPUSuspense-test.js
 PASS  packages/react-dom/src/__tests__/validateDOMNesting-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOMBrowser-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseCallback-test.js
 PASS  packages/react-dom/src/events/plugins/__tests__/SelectEventPlugin-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactPersistent-test.js
 PASS  packages/react-markup/src/__tests__/ReactMarkupClient-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMShorthandCSSPropertyCollision-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactSuspenseFallback-test.js
 PASS  packages/react-dom/src/__tests__/ReactChildReconciler-test.js
 PASS  packages/react/src/__tests__/ReactProfilerDevToolsIntegration-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactConfigurableErrorLogging-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzServerEdge-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMComponentTree-test.js
 PASS  packages/react-server/src/__tests__/ReactFlightServer-test.js
 PASS  packages/react-reconciler/src/__tests__/useRef-test.internal.js
 PASS  packages/react/src/__tests__/ReactMismatchedVersions-test.js
 PASS  packages/react/src/__tests__/forwardRef-test.internal.js
 PASS  scripts/babel/__tests__/transform-test-gate-pragma-test.js
 PASS  scripts/eslint-rules/__tests__/no-production-logging-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalReflection-test.js
 PASS  packages/react-dom/src/__tests__/findDOMNodeFB-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMReplyNode-test.js
 PASS  packages/react-server-dom-fb/src/__tests__/ReactDOMServerFB-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMFizzDeferredValue-test.js
 PASS  packages/react-dom/src/__tests__/ReactWrongReturnPointer-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMHooks-test.js
 PASS  packages/react-server/src/__tests__/ReactServer-test.js
 PASS  packages/use-sync-external-store/src/__tests__/useSyncExternalStoreNative-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationUntrustedURL-test.js
 PASS  packages/react-dom/src/events/__tests__/getEventKey-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSelection-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactSubtreeFlagsWarning-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactFiberRefs-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactFlushSyncNoAggregateError-test.js
 PASS  packages/react-test-renderer/src/__tests__/ReactTestRenderer-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactBatching-test.internal.js
 PASS  packages/react-dom/src/__tests__/refs-destruction-test.js
 PASS  packages/react/src/__tests__/ReactStrictMode-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactUpdatePriority-test.js
 PASS  packages/react-dom/src/__tests__/ReactStartTransitionMultipleRenderers-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactConditionalUseWarning-test.js
 PASS  packages/react/src/__tests__/ReactPureComponent-test.js
 PASS  packages/react/src/__tests__/ReactProfilerComponent-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationLegacyContextDisabled-test.internal.js
 PASS  packages/react-test-renderer/src/__tests__/ReactTestRendererAsync-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactPersistentUpdatesMinimalism-test.js
 PASS  scripts/error-codes/__tests__/transform-error-messages.js
 PASS  packages/react-reconciler/src/__tests__/ReactTopLevelFragment-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticMouseEvent-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactFiberHostContext-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactTestUtilsActUnmockedScheduler-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactClassComponentPropResolution-test.js
 PASS  packages/react-debug-tools/src/__tests__/ReactHooksInspectionIntegrationDOM-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMHostComponentTransitions-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalUpdatesMinimalism-test.js
 PASS  packages/react-dom/src/__tests__/ReactCompositeComponentNestedState-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactInterleavedUpdates-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticClipboardEvent-test.js
 PASS  packages/react-dom/src/__tests__/ReactMountDestruction-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMInvalidARIAHook-test.js
 PASS  packages/scheduler/src/__tests__/SchedulerSetTimeout-test.js
 PASS  packages/react-native-renderer/src/__tests__/ReactFabricFragmentRefs-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationSelect-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOMReply-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticEvent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMSafariMicrotaskBug-test.js
 PASS  packages/react-refresh/src/__tests__/ReactFreshMultipleRenderer-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationSpecialTypes-test.js
 PASS  packages/react-test-renderer/src/__tests__/ReactTestRendererAct-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticWheelEvent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationBasic-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationModes-test.js
 PASS  packages/react-dom/src/__tests__/refsLegacy-test.js
 PASS  packages/react-client/src/__tests__/ReactFlightDebugChannel-test.js
 PASS  packages/react-dom/src/__tests__/ReactClassComponentPropResolutionFizz-test.js
 PASS  packages/react-dom/src/__tests__/InvalidEventListeners-test.js
 PASS  packages/react-dom/src/__tests__/ReactCompositeComponentDOMMinimalism-test.js
 PASS  packages/use-sync-external-store/src/__tests__/useSyncExternalStoreShimServer-test.js
 PASS  packages/react-reconciler/src/__tests__/ErrorBoundaryReconciliation-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ActivityErrorHandling-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationCheckbox-test.js
 PASS  packages/react-dom/src/client/__tests__/getNodeForCharacterOffset-test.js
 PASS  packages/react-dom/src/__tests__/quoteAttributeValueForBrowser-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationRefs-test.js
 PASS  packages/react-dom/src/__tests__/ReactEventIndependence-test.js
 PASS  packages/react/src/__tests__/ReactStartTransition-test.js
 PASS  packages/shared/__tests__/ReactError-test.internal.js
 PASS  scripts/eslint-rules/__tests__/warning-args-test.internal.js
 PASS  scripts/eslint-rules/__tests__/prod-error-codes-test.internal.js
 PASS  packages/react-dom/src/__tests__/escapeTextForBrowser-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMNestedEvents-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationFragment-test.js
 PASS  packages/react-dom/src/__tests__/ReactMultiChildText-test.js (7.075 s)
 PASS  packages/react-dom/src/__tests__/ReactDOMLegacyComponentTree-test.internal.js
 PASS  packages/react-reconciler/src/__tests__/ReactEffectOrdering-test.js
 PASS  packages/react/src/__tests__/onlyChild-test.js
 PASS  packages/react-dom/src/events/__tests__/SyntheticFocusEvent-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationTextarea-test.js
 PASS  packages/react-server-dom-webpack/src/__tests__/ReactFlightNonWritablePromiseThen-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactNoopRendererAct-test.js
 PASS  packages/react-reconciler/src/__tests__/ViewTransitionReactServer-test.js
 PASS  packages/react-dom/src/__tests__/ReactErrorLoggingRecovery-test.js
 PASS  packages/react-dom/src/__tests__/ReactErrorBoundariesHooks-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactMockedComponent-test.js
 PASS  packages/react-reconciler/src/__tests__/ActivityReactServer-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactIncrementalErrorReplay-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactTopLevelText-test.js
 PASS  packages/shared/__tests__/ReactErrorProd-test.internal.js
 PASS  packages/shared/__tests__/normalizeConsoleFormat-test.internal.js
 PASS  packages/react/src/__tests__/ReactCreateRef-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMBrowser-test.js
 PASS  packages/react-dom/src/__tests__/ReactServerRenderingBrowser-test.js
 PASS  packages/react-server-dom-turbopack/src/__tests__/ReactFlightTurbopackDOMReplyEdge-test.js
 PASS  scripts/babel/__tests__/transform-prevent-infinite-loops-test.js
 PASS  scripts/error-codes/__tests__/invertObject-test.js
 PASS  packages/react-reconciler/src/__tests__/ReactClassSetStateCallback-test.js
 PASS  scripts/shared/__tests__/evalToString-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMIframe-test.js
 PASS  packages/react/src/__tests__/ReactVersion-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationObject-test.js
 PASS  scripts/eslint-rules/__tests__/no-primitive-constructors-test.internal.js
 PASS  packages/react-dom/src/__tests__/ReactDOMserverIntegrationProgress-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMLegacyFloat-test.js
 PASS  packages/react-native-renderer/src/__tests__/ReactNativeError-test.internal.js
 PASS  packages/react-dom/src/client/__tests__/dangerouslySetInnerHTML-test.js
 PASS  packages/react-dom/src/__tests__/ReactLegacyRootWarnings-test.js
 PASS  packages/shared/__tests__/ReactDOMFrameScheduling-test.js
 PASS  scripts/babel/__tests__/transform-lazy-jsx-import-test.js
 PASS  packages/react-test-renderer/__tests__/shallow-test.js
 PASS  packages/shared/__tests__/ReactSymbols-test.internal.js
 PASS  packages/react/src/__tests__/React-hooks-arity.js
 PASS  packages/react-dom/src/__tests__/ReactDOMInReactServer-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationInput-test.js
 PASS  packages/react-dom/src/__tests__/ReactDOMServerIntegrationAttributes-test.js (25.248 s)
 PASS  packages/react/src/__tests__/ReactClassEquivalence-test.js (11.105 s)

Summary of all failing tests
 FAIL  packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js
  ● ReactFlightDOMNode › should not corrupt the Node.js Buffer pool by detaching ArrayBuffers when using Web Streams

    expect(received).toBe(expected) // Object.is equality

    Expected: 8192
    Received: 65536

      1415 |
      1416 |     // Verify this chunk uses the Buffer pool (8192 bytes for files < 4KB).
    > 1417 |     expect(fileChunk.buffer.byteLength).toBe(8192);
           |                                         ^
      1418 |
      1419 |     const readable = await serverAct(() =>
      1420 |       ReactServerDOMServer.renderToReadableStream(fileChunk, webpackMap),

      at Object.<anonymous> (packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js:1417:41)

  ● ReactFlightDOMNode › detaches the abort listener from a composite signal once the prerender completes

    TypeError: signals[0] is not of type AbortSignal.

      2490 |     const outer = new AbortController();
      2491 |     const timeout = new AbortController();
    > 2492 |     const composite = AbortSignal.any([outer.signal, timeout.signal]);
           |                                 ^
      2493 |
      2494 |     function App() {
      2495 |       return <div>hello world</div>;

      at Object.<anonymous> (packages/react-server-dom-webpack/src/__tests__/ReactFlightDOMNode-test.js:2492:33)


Test Suites: 1 failed, 324 passed, 325 total
Tests:       2 failed, 23 skipped, 6947 passed, 6972 total
Snapshots:   302 passed, 302 total
Time:        67.016 s
Ran all test suites.
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
bash-5.3# 

```
