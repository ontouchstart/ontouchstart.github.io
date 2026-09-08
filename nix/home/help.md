[93m  │ [0m[1mWarning[0m 
[93m  │ [0mThis program is ]8;;@docroot@/development/experimental-features.md#xp-feature-nix-command\[1;93mexperimental[0m]8;;\ and its interface is subject to change.

[1;91m[0m[1;91mName[0m

[1;94mnix[0m - a tool for reproducible and declarative configuration management

[1;91m[0m[1;91mSynopsis[0m

[1;94mnix[0m [[3moption[0m...] [3msubcommand[0m

where [3msubcommand[0m is one of the following:

[1mHelp commands:[0m

[93m  · [0m]8;;./nix3-help.md\[1;93mnix help[0m]8;;\ - show help about [1;94mnix[0m or a particular subcommand 
[93m  · [0m]8;;./nix3-help-stores.md\[1;93mnix help-stores[0m]8;;\ - show help about store types and their settings 

[1mMain commands:[0m

[93m  · [0m]8;;./nix3-build.md\[1;93mnix build[0m]8;;\ - build a derivation or fetch a store path 
[93m  · [0m]8;;./nix3-develop.md\[1;93mnix develop[0m]8;;\ - run a bash shell that provides the build environment of a
    derivation 
[93m  · [0m]8;;./nix3-flake.md\[1;93mnix flake[0m]8;;\ - manage Nix flakes 
[93m  · [0m]8;;./nix3-profile.md\[1;93mnix profile[0m]8;;\ - manage Nix profiles 
[93m  · [0m]8;;./nix3-run.md\[1;93mnix run[0m]8;;\ - run a Nix application 
[93m  · [0m]8;;./nix3-search.md\[1;93mnix search[0m]8;;\ - search for packages 

[1mMain commands:[0m

[93m  · [0m]8;;./nix3-repl.md\[1;93mnix repl[0m]8;;\ - start an interactive environment for evaluating Nix expressions 

[1mInfrequently used commands:[0m

[93m  · [0m]8;;./nix3-bundle.md\[1;93mnix bundle[0m]8;;\ - bundle an application so that it works outside of the Nix
    store 
[93m  · [0m]8;;./nix3-copy.md\[1;93mnix copy[0m]8;;\ - copy paths between Nix stores 
[93m  · [0m]8;;./nix3-edit.md\[1;93mnix edit[0m]8;;\ - open the Nix expression of a Nix package in $EDITOR 
[93m  · [0m]8;;./nix3-eval.md\[1;93mnix eval[0m]8;;\ - evaluate a Nix expression 
[93m  · [0m]8;;./nix3-fmt.md\[1;93mnix fmt[0m]8;;\ - reformat your code in the standard style 
[93m  · [0m]8;;./nix3-formatter.md\[1;93mnix formatter[0m]8;;\ - build or run the formatter 
[93m  · [0m]8;;./nix3-log.md\[1;93mnix log[0m]8;;\ - show the build log of the specified packages or paths, if
    available 
[93m  · [0m]8;;./nix3-path-info.md\[1;93mnix path-info[0m]8;;\ - query information about store paths 
[93m  · [0m]8;;./nix3-registry.md\[1;93mnix registry[0m]8;;\ - manage the flake registry 
[93m  · [0m]8;;./nix3-why-depends.md\[1;93mnix why-depends[0m]8;;\ - show why a package has another package in its closure 

[1mUtility/scripting commands:[0m

[93m  · [0m]8;;./nix3-config.md\[1;93mnix config[0m]8;;\ - manipulate the Nix configuration 
[93m  · [0m]8;;./nix3-daemon.md\[1;93mnix daemon[0m]8;;\ - daemon to perform store operations on behalf of non-root
    clients 
[93m  · [0m]8;;./nix3-derivation.md\[1;93mnix derivation[0m]8;;\ - work with derivations 
[93m  · [0m]8;;./nix3-env.md\[1;93mnix env[0m]8;;\ - manipulate the process environment 
[93m  · [0m]8;;./nix3-hash.md\[1;93mnix hash[0m]8;;\ - compute and convert cryptographic hashes 
[93m  · [0m]8;;./nix3-key.md\[1;93mnix key[0m]8;;\ - generate and convert Nix signing keys 
[93m  · [0m]8;;./nix3-nar.md\[1;93mnix nar[0m]8;;\ - create or inspect NAR files 
[93m  · [0m]8;;./nix3-print-dev-env.md\[1;93mnix print-dev-env[0m]8;;\ - print shell code that can be sourced by bash to
    reproduce the build environment of a derivation 
[93m  · [0m]8;;./nix3-store.md\[1;93mnix store[0m]8;;\ - manipulate a Nix store 

[1mCommands for upgrading or troubleshooting your Nix installation:[0m

[93m  · [0m]8;;./nix3-upgrade-nix.md\[1;93mnix upgrade-nix[0m]8;;\ - upgrade Nix to the latest stable version 

[1;91m[0m[1;91mExamples[0m

[93m  · [0mCreate a new flake:
    
    [1;94m  │ [0m[1m# nix flake new hello[0m
    [1;94m  │ [0m[1m# cd hello[0m

[93m  · [0mBuild the flake in the current directory:
    
    [1;94m  │ [0m[1m# nix build[0m
    [1;94m  │ [0m[1m# ./result/bin/hello[0m
    [1;94m  │ [0m[1mHello, world![0m

[93m  · [0mRun the flake in the current directory:
    
    [1;94m  │ [0m[1m# nix run[0m
    [1;94m  │ [0m[1mHello, world![0m

[93m  · [0mStart a development shell for hacking on this flake:
    
    [1;94m  │ [0m[1m# nix develop[0m
    [1;94m  │ [0m[1m# unpackPhase[0m
    [1;94m  │ [0m[1m# cd hello-*[0m
    [1;94m  │ [0m[1m# configurePhase[0m
    [1;94m  │ [0m[1m# buildPhase[0m
    [1;94m  │ [0m[1m# ./hello[0m
    [1;94m  │ [0m[1mHello, world![0m
    [1;94m  │ [0m[1m# installPhase[0m
    [1;94m  │ [0m[1m# ../outputs/out/bin/hello[0m
    [1;94m  │ [0m[1mHello, world![0m

[1;91m[0m[1;91mDescription[0m

Nix is a tool for building software, configurations and other artifacts in a
reproducible and declarative way. For more information, see the ]8;;https://nixos.org/\[1;93mNix homepage[0m]8;;\ [0m]8;;\
]8;;https://nixos.org/\[4;32mhttps://nixos.org/[0m]8;;\ or the ]8;;https://nix.dev/manual/nix/stable/\[1;93mNix manual[0m]8;;\ ]8;;https://nix.dev/manual/nix/stable/\[4;32mhttps://nix.dev/manual/nix/stable/[0m]8;;\.

[1;91m[0m[1;91mInstallables[0m

[93m  │ [0m[1mWarning[0m 
[93m  │ [0mInstallables are part of the unstable ]8;;@docroot@/development/experimental-features.md#xp-feature-nix-command\[1;93mnix-command[0m]8;;\]8;;@docroot@/development/experimental-features.md#xp-feature-nix-command\[1;93m experimental feature[0m]8;;\, and
[93m  │ [0msubject to change without notice.

Many [1;94mnix[0m subcommands operate on one or more [3minstallables[0m. These are command
line arguments that represent something that can be realised in the Nix store.

The following types of installable are supported by most commands:

[93m  · [0m]8;;#flake-output-attribute\[1;93mFlake output attribute[0m]8;;\ (experimental) 
    [93m  · [0mThis is the default 
[93m  · [0m]8;;#store-path\[1;93mStore path[0m]8;;\ 
    [93m  · [0mThis is assumed if the argument is a Nix store path or a symlink to a
        Nix store path 
[93m  · [0m]8;;#nix-file\[1;93mNix file[0m]8;;\, optionally qualified by an attribute path 
    [93m  · [0mSpecified with [1;94m--file[0m/[1;94m-f[0m 
[93m  · [0m]8;;#nix-expression\[1;93mNix expression[0m]8;;\, optionally qualified by an attribute path 
    [93m  · [0mSpecified with [1;94m--expr[0m 

For most commands, if no installable is specified, [1;94m.[0m is assumed. That is, Nix
will operate on the default flake output attribute of the flake in the current
directory.

[1;36m### [0m[1;36mFlake output attribute[0m

[93m  │ [0m[1mWarning[0m 
[93m  │ [0mFlake output attribute installables depend on both the ]8;;@docroot@/development/experimental-features.md#xp-feature-flakes\[1;93mflakes[0m]8;;\ and [0m]8;;\
[93m  │ [0m]8;;@docroot@/development/experimental-features.md#xp-feature-nix-command\[1;93mnix-command[0m]8;;\ experimental features, and subject to change without notice.

Example: [1;94mnixpkgs#hello[0m

These have the form [3mflakeref[0m[[1;94m#[0m[3mattrpath[0m], where [3mflakeref[0m is a ]8;;./nix3-flake.md#flake-references\[1;93mflake reference[0m]8;;\
and [3mattrpath[0m is an optional attribute path. For more information on flakes, see
]8;;./nix3-flake.md\[1;93mthe [0m]8;;\]8;;./nix3-flake.md\[1;93mnix flake[0m]8;;\]8;;./nix3-flake.md\[1;93m manual page[0m]8;;\. Flake references are most commonly a flake
identifier in the flake registry (e.g. [1;94mnixpkgs[0m), or a raw path (e.g. [0m
[1;94m/path/to/my-flake[0m or [1;94m.[0m or [1;94m../foo[0m), or a full URL (e.g. [1;94mgithub:nixos/nixpkgs[0m or [0m
[1;94mpath:.[0m)

When the flake reference is a raw path (a path without any URL scheme), it is
interpreted as a [1;94mpath:[0m or [1;94mgit+file:[0m url in the following way:

[93m  · [0mIf the path is within a Git repository, then the url will be of the form [0m
    [1;94mgit+file://[GIT_REPO_ROOT]?dir=[RELATIVE_FLAKE_DIR_PATH][0m where [0m
    [1;94mGIT_REPO_ROOT[0m is the path to the root of the git repository, and [0m
    [1;94mRELATIVE_FLAKE_DIR_PATH[0m is the path (relative to the directory root) of the
    closest parent of the given path that contains a [1;94mflake.nix[0m within the git
    repository. If no such directory exists, then Nix will error-out.
    
    Note that the search will only include files indexed by git. In particular,
    files which are matched by [1;94m.gitignore[0m or have never been [1;94mgit add[0m-ed will
    not be available in the flake. If this is undesirable, specify [0m
    [1;94mpath:<directory>[0m explicitly;
    
    For example, if [1;94m/foo/bar[0m is a git repository with the following structure:
    
    [1;94m  │ [0m[1m.[0m
    [1;94m  │ [0m[1m└── baz[0m
    [1;94m  │ [0m[1m  ├── blah[0m
    [1;94m  │ [0m[1m  │   └── file.txt[0m
    [1;94m  │ [0m[1m  └── flake.nix[0m
    
    Then [1;94m/foo/bar/baz/blah[0m will resolve to [1;94mgit+file:///foo/bar?dir=baz[0m

[93m  · [0mIf the supplied path is not a git repository, then the url will have the
    form [1;94mpath:FLAKE_DIR_PATH[0m where [1;94mFLAKE_DIR_PATH[0m is the closest parent of the
    supplied path that contains a [1;94mflake.nix[0m file (within the same file-system).
    If no such directory exists, then Nix will error-out.
    
    For example, if [1;94m/foo/bar/flake.nix[0m exists, then [1;94m/foo/bar/baz/[0m will resolve
    to [1;94mpath:/foo/bar[0m

If [3mattrpath[0m is omitted, Nix tries some default values; for most subcommands,
the default is [1;94mpackages.[0m[3msystem[0m[1;94m.default[0m (e.g. [1;94mpackages.x86_64-linux.default[0m),
but some subcommands have other defaults. If [3mattrpath[0m [3mis[0m specified, [3mattrpath[0m is
interpreted as relative to one or more prefixes; for most subcommands, these
are [1;94mpackages.[0m[3msystem[0m, [1;94mlegacyPackages.*system*[0m and the empty prefix. Thus, on [0m
[1;94mx86_64-linux[0m [1;94mnix build nixpkgs#hello[0m will try to build the attributes [0m
[1;94mpackages.x86_64-linux.hello[0m, [1;94mlegacyPackages.x86_64-linux.hello[0m and [1;94mhello[0m.

If [3mattrpath[0m begins with [1;94m.[0m then no prefixes or defaults are attempted. This
allows the form [3mflakeref[0m[[1;94m#.[0m[3mattrpath[0m], such as [0m
[1;94mgithub:NixOS/nixpkgs#.lib.fakeSha256[0m to avoid a search of [0m
[1;94mpackages.*system*.lib.fakeSha256[0m

[1;36m### [0m[1;36mStore path[0m

Example: [1;94m/nix/store/10l19qifk7hjjq47px8m2prqk1gv4isy-hello-2.10[0m

These are paths inside the Nix store, or symlinks that resolve to a path in the
Nix store.

A ]8;;@docroot@/glossary.md#gloss-store-derivation\[1;93mstore derivation[0m]8;;\ is also addressed by store path.

Example: [1;94m/nix/store/p7gp6lxdg32h4ka1q398wd9r2zkbbz2v-hello-2.10.drv[0m

If you want to refer to an output path of that store derivation, add the output
name preceded by a caret ([1;94m^[0m).

Example: [1;94m/nix/store/p7gp6lxdg32h4ka1q398wd9r2zkbbz2v-hello-2.10.drv^out[0m

All outputs can be referred to at once with the special syntax [1;94m^*[0m.

Example: [1;94m/nix/store/p7gp6lxdg32h4ka1q398wd9r2zkbbz2v-hello-2.10.drv^*[0m

[1;36m### [0m[1;36mNix file[0m

Example: [1;94m--file /path/to/nixpkgs hello[0m

When the option [1;94m-f[0m / [1;94m--file[0m [3mpath[0m [[3mattrpath[0m...] is given, installables are
interpreted as the value of the expression in the Nix file at [3mpath[0m. If
attribute paths are provided, commands will operate on the corresponding values
accessible at these paths. The Nix expression in that file, or any selected
attribute, must evaluate to a derivation.

[1;36m### [0m[1;36mNix expression[0m

Example: [1;94m--expr 'import <nixpkgs> {}' hello[0m

When the option [1;94m--expr[0m [3mexpression[0m [[3mattrpath[0m...] is given, installables are
interpreted as the value of the of the Nix expression. If attribute paths are
provided, commands will operate on the corresponding values accessible at these
paths. The Nix expression, or any selected attribute, must evaluate to a
derivation.

You may need to specify [1;94m--impure[0m if the expression references impure inputs
(such as [1;94m<nixpkgs>[0m).

[1;36m## [0m[1;36mDerivation output selection[0m

Derivations can have multiple outputs, each corresponding to a different store
path. For instance, a package can have a [1;94mbin[0m output that contains programs, and
a [1;94mdev[0m output that provides development artifacts like C/C++ header files. The
outputs on which [1;94mnix[0m commands operate are determined as follows:

[93m  · [0mYou can explicitly specify the desired outputs using the syntax [3minstallable[0m[1;94m^[0m[3moutput1[0m[1;94m,[0m[3m...[0m[1;94m,[0m[3moutputN[0m
    — that is, a caret followed immediately by a comma-separated list of
    derivation outputs to select. For installables specified as ]8;;#flake-output-attribute\[1;93mFlake output[0m]8;;\
    ]8;;#flake-output-attribute\[1;93mattributes[0m]8;;\ or ]8;;#store-path\[1;93mStore paths[0m]8;;\, the output is specified in the same argument:
    
    For example, you can obtain the [1;94mdev[0m and [1;94mstatic[0m outputs of the [1;94mglibc[0m
    package:
    
    [1;94m  │ [0m[1m# nix build 'nixpkgs#glibc^dev,static'[0m
    [1;94m  │ [0m[1m# ls ./result-dev/include/ ./result-static/lib/[0m
    [1;94m  │ [0m[1m…[0m
    
    and likewise, using a store path to a "drv" file to specify the derivation:
    
    [1;94m  │ [0m[1m# nix build '/nix/store/fpq78s2h8ffh66v2iy0q1838mhff06y8-glibc-2.33-78.drv^dev,static'[0m
    [1;94m  │ [0m[1m…[0m
    
    For [1;94m--expr[0m and [1;94m-f[0m/[1;94m--file[0m, the derivation output is specified as part of the
    attribute path:
    
    [1;94m  │ [0m[1m$ nix build -f '<nixpkgs>' 'glibc^dev,static'[0m
    [1;94m  │ [0m[1m$ nix build --impure --expr 'import <nixpkgs> { }' 'glibc^dev,static'[0m
    
    This syntax is the same even if the actual attribute path is empty:
    
    [1;94m  │ [0m[1m$ nix build --impure --expr 'let pkgs = import <nixpkgs> { }; in pkgs.glibc' '^dev,static'[0m

[93m  · [0mYou can also specify that [3mall[0m outputs should be used using the syntax [0m
    [3minstallable[0m[1;94m^*[0m. For example, the following shows the size of all outputs of
    the [1;94mglibc[0m package in the binary cache:
    
    [1;94m  │ [0m[1m# nix path-info --closure-size --eval-store auto --store https://cache.nixos.org 'nixpkgs#glibc^*'[0m
    [1;94m  │ [0m[1m/nix/store/i2fn2mjgihz960bwa7ldab5ra5fhxznh-glibc-2.33-123                 33208200[0m
    [1;94m  │ [0m[1m/nix/store/n2wnn3i47w6dbylh64hdjzgd5rrprdn8-glibc-2.33-123-bin             36142896[0m
    [1;94m  │ [0m[1m/nix/store/v7dyz518sbkzl8x2a1sgk1lwsfd3d6gm-glibc-2.33-123-debug          155787312[0m
    [1;94m  │ [0m[1m/nix/store/z4hv6ybyinqw9a3dwyl5k66a91aggylj-glibc-2.33-123-static          42488328[0m
    [1;94m  │ [0m[1m/nix/store/lrjirf0j1rjnvif6amyp9pfcqr2km385-glibc-2.33-123-dev             44200560[0m
    
    and likewise, using a store path to a "drv" file to specify the derivation:
    
    [1;94m  │ [0m[1m# nix path-info --closure-size '/nix/store/fpq78s2h8ffh66v2iy0q1838mhff06y8-glibc-2.33-78.drv^*'[0m
    [1;94m  │ [0m[1m…[0m

[93m  · [0mIf you didn't specify the desired outputs, but the derivation has an
    attribute [1;94mmeta.outputsToInstall[0m, Nix will use those outputs. For example,
    since the package [1;94mnixpkgs#libxml2[0m has this attribute:
    
    [1;94m  │ [0m[1m# nix eval 'nixpkgs#libxml2.meta.outputsToInstall'[0m
    [1;94m  │ [0m[1m[ "bin" "man" ][0m
    
    a command like [1;94mnix shell nixpkgs#libxml2[0m will provide only those two
    outputs by default.
    
    Note that a ]8;;given by its `.drv` file store path\[1;93mstore derivation[0m]8;;\ doesn't have any attributes like [1;94mmeta[0m, and
    thus this case doesn't apply to it.

[93m  · [0mOtherwise, Nix will use all outputs of the derivation.

[1;91m[0m[1;91mNix stores[0m

Most [1;94mnix[0m subcommands operate on a [3mNix store[0m. The various store types are
documented in the ]8;;@docroot@/store/types/index.md\[1;93mStore Types[0m]8;;\ section of the manual.

The same information is also available from the ]8;;./nix3-help-stores.md\[1;93mnix help-stores[0m]8;;\ command.

[1;91m[0m[1;91mShebang interpreter[0m

The [1;94mnix[0m command can be used as a [1;94m#![0m interpreter. Arguments to Nix can be passed
on subsequent lines in the script.

Verbatim strings may be passed in double backtick ([1;94m``[0m) quotes. [37m<!-- that's[0m
[37mmarkdown for two backticks in inline code. -->[0m Sequences of [3mn[0m backticks of 3 or
longer are parsed as [3mn-1[0m literal backticks. A single space before the closing [0m
[1;94m``[0m is ignored if present.

[1;94m--file[0m and [1;94m--expr[0m resolve relative paths based on the script location.

Examples:

[1;94m  │ [0m[1m#!/usr/bin/env nix[0m
[1;94m  │ [0m[1m#! nix shell --file ``<nixpkgs>`` hello cowsay --command bash[0m
[1;94m  │ [0m[1m[0m
[1;94m  │ [0m[1mhello | cowsay[0m

or with [1mflakes[0m:

[1;94m  │ [0m[1m#!/usr/bin/env nix[0m
[1;94m  │ [0m[1m#! nix shell nixpkgs#bash nixpkgs#hello nixpkgs#cowsay --command bash[0m
[1;94m  │ [0m[1m[0m
[1;94m  │ [0m[1mhello | cowsay[0m

or with an [1mexpression[0m:

[1;94m  │ [0m[1m#! /usr/bin/env nix[0m
[1;94m  │ [0m[1m#! nix shell --impure --expr ``[0m
[1;94m  │ [0m[1m#! nix with (import (builtins.getFlake "nixpkgs") {});[0m
[1;94m  │ [0m[1m#! nix terraform.withPlugins (plugins: [ plugins.openstack ])[0m
[1;94m  │ [0m[1m#! nix ``[0m
[1;94m  │ [0m[1m#! nix --command bash[0m
[1;94m  │ [0m[1m[0m
[1;94m  │ [0m[1mterraform "$@"[0m

or with cascading interpreters. Note that the [1;94m#! nix[0m lines don't need to follow
after the first line, to accommodate other interpreters.

[1;94m  │ [0m[1m#!/usr/bin/env nix[0m
[1;94m  │ [0m[1m//! ```cargo[0m
[1;94m  │ [0m[1m//! [dependencies][0m
[1;94m  │ [0m[1m//! time = "0.1.25"[0m
[1;94m  │ [0m[1m//! ```[0m
[1;94m  │ [0m[1m/*[0m
[1;94m  │ [0m[1m#!nix shell nixpkgs#rustc nixpkgs#rust-script nixpkgs#cargo --command rust-script[0m
[1;94m  │ [0m[1m*/[0m
[1;94m  │ [0m[1mfn main() {[0m
[1;94m  │ [0m[1m    for argument in std::env::args().skip(1) {[0m
[1;94m  │ [0m[1m        println!("{}", argument);[0m
[1;94m  │ [0m[1m    };[0m
[1;94m  │ [0m[1m    println!("{}", std::env::var("HOME").expect(""));[0m
[1;94m  │ [0m[1m    println!("{}", time::now().rfc822z());[0m
[1;94m  │ [0m[1m}[0m
[1;94m  │ [0m[1m// vim: ft=rust[0m

[1;91m[0m[1;91mOptions[0m

[1;36m## [0m[1;36mLogging-related options[0m

[93m  · [0m[1;94m--debug[0m
    
    Set the logging verbosity level to 'debug'.

[93m  · [0m[1;94m--log-format[0m [3mformat[0m
    
    Set the format of log output; one of [1;94mraw[0m, [1;94minternal-json[0m, [1;94mbar[0m or [0m
    [1;94mbar-with-logs[0m.

[93m  · [0m[1;94m--print-build-logs[0m / [1;94m-L[0m
    
    Print full build logs on standard error.

[93m  · [0m[1;94m--quiet[0m
    
    Decrease the logging verbosity level.

[93m  · [0m[1;94m--verbose[0m / [1;94m-v[0m
    
    Increase the logging verbosity level.

[1;36m## [0m[1;36mMiscellaneous global options[0m

[93m  · [0m[1;94m--help[0m
    
    Show usage information.

[93m  · [0m[1;94m--offline[0m
    
    Disable substituters and consider all previously downloaded files
    up-to-date.

[93m  · [0m[1;94m--option[0m [3mname[0m [3mvalue[0m
    
    Set the Nix configuration setting [3mname[0m to [3mvalue[0m (overriding [1;94mnix.conf[0m).

[93m  · [0m[1;94m--refresh[0m
    
    Consider all previously downloaded files out-of-date.

[93m  · [0m[1;94m--version[0m
    
    Show version information.

[93m  │ [0m[1mNote[0m
[93m  │ [0m
[93m  │ [0mSee ]8;;@docroot@/command-ref/conf-file.md#command-line-flags\[1;93mman nix.conf[0m]8;;\ for overriding configuration settings with command line
[93m  │ [0mflags.

