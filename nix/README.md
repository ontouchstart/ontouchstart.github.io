# nix

https://nix.dev/manual/nix/2.35

https://nixos.org/learn

https://hub.docker.com/r/nixos/nix

https://mitchellh.com/writing/nix-with-dockerfiles

https://ontouchstart.github.io/nix/build.log


# Installation

RTMF: https://nix.dev/manual/nix/2.35/installation/

```
curl -sL https://nixos.org/nix/install > install.sh
cat -n install.sh
     1	#!/bin/sh
     2	
     3	# This script installs the Nix package manager on your system by
     4	# downloading a binary distribution and running its installer script
     5	# (which in turn creates and populates /nix).
     6	
     7	{ # Prevent execution if this script was only partially downloaded
     8	oops() {
     9	    echo "$0:" "$@" >&2
    10	    exit 1
    11	}
    12	
    13	umask 0022
    14	
    15	tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
    16	          oops "Can't create temporary directory for downloading the Nix binary tarball")"
    17	cleanup() {
    18	    rm -rf "$tmpDir"
    19	}
    20	trap cleanup EXIT INT QUIT TERM
    21	
    22	require_util() {
    23	    command -v "$1" > /dev/null 2>&1 ||
    24	        oops "you do not have '$1' installed, which I need to $2"
    25	}
    26	
    27	case "$(uname -s).$(uname -m)" in
    28	    Linux.x86_64)
    29	        hash=0c3960a9792331a22081c3c7a5d8465db9b17c50b3acdf18587fa4c6f2cb1158
    30	        path=3d229fmjbbhn74zwp21z6rfx2a35ryy8/nix-2.35.2-x86_64-linux.tar.xz
    31	        system=x86_64-linux
    32	        ;;
    33	    Linux.i?86)
    34	        hash=55363adb55f1447be49298c671f5beb539526f2f3181e8e11eab669af6d5990b
    35	        path=bzfrrx38n5qc3kj6id18zqbysk48vykz/nix-2.35.2-i686-linux.tar.xz
    36	        system=i686-linux
    37	        ;;
    38	    Linux.aarch64)
    39	        hash=4d0302a2910f5eec1c33b8deef634f04899a75737e7001ec49908d003ae5efda
    40	        path=f8vsr7dbkb5slmwiv6s2cc5bjw73xqwn/nix-2.35.2-aarch64-linux.tar.xz
    41	        system=aarch64-linux
    42	        ;;
    43	    Linux.armv6l)
    44	        hash=2f79330820e2de68279d1c796827d4d6269396c3cbb22bacf6c238639db9b306
    45	        path=j3i097mi5gf31qqcfimgmdqmdrncpvnc/nix-2.35.2-armv6l-linux.tar.xz
    46	        system=armv6l-linux
    47	        ;;
    48	    Linux.armv7l)
    49	        hash=e4a68bd13f20b10f67b551178116655520323f5a29a7e82a2db24a6b2a166e89
    50	        path=jq9dyz2q83d4z6rhfgfzbaqgcar7ss82/nix-2.35.2-armv7l-linux.tar.xz
    51	        system=armv7l-linux
    52	        ;;
    53	    Linux.riscv64)
    54	        hash=98ee79540d4b9ccfe733655ea049a67af24f15860fbf92103bc1911bbd905a53
    55	        path=1slh67389ncg34nqsz1a0ampcwzlcxq8/nix-2.35.2-riscv64-linux.tar.xz
    56	        system=riscv64-linux
    57	        ;;
    58	    Darwin.x86_64)
    59	        hash=d725518d89f3b0b8d4af702a9d38d519814014cbe125afb3ed0545c9d755f6a5
    60	        path=q89r761wxaykz2zhb2l8j0rsljm9k9ak/nix-2.35.2-x86_64-darwin.tar.xz
    61	        system=x86_64-darwin
    62	        ;;
    63	    Darwin.arm64|Darwin.aarch64)
    64	        hash=1695c13aba5afa7c2ecd6dc4a9393f602e7bbc440ed45e81602c831546580ec3
    65	        path=hl0qj2xiq7npi3xxk1byan3nc75kx0q1/nix-2.35.2-aarch64-darwin.tar.xz
    66	        system=aarch64-darwin
    67	        ;;
    68	    FreeBSD.amd64|FreeBSD.x86_64)
    69	        hash=e944893995e82989a13df992e6f636f1050a2498f7792f9cef3cb2e1d18ba692
    70	        path=j9ll2y5d3mh1ichmkrfnjfrjc64z18gf/nix-2.35.2-x86_64-freebsd.tar.xz
    71	        system=x86_64-freebsd
    72	        ;;
    73	    *) oops "sorry, there is no binary distribution of Nix for your platform";;
    74	esac
    75	
    76	# Use this command-line option to fetch the tarballs using nar-serve or Cachix
    77	if [ "${1:-}" = "--tarball-url-prefix" ]; then
    78	    if [ -z "${2:-}" ]; then
    79	        oops "missing argument for --tarball-url-prefix"
    80	    fi
    81	    url=${2}/${path}
    82	    shift 2
    83	else
    84	    url=https://releases.nixos.org/nix/nix-2.35.2/nix-2.35.2-$system.tar.xz
    85	fi
    86	
    87	tarball=$tmpDir/nix-2.35.2-$system.tar.xz
    88	
    89	require_util tar "unpack the binary tarball"
    90	if [ "$(uname -s)" != "Darwin" ]; then
    91	    require_util xz "unpack the binary tarball"
    92	fi
    93	
    94	if command -v curl > /dev/null 2>&1; then
    95	    fetch() { curl --fail -L "$1" -o "$2"; }
    96	elif command -v wget > /dev/null 2>&1; then
    97	    fetch() { wget "$1" -O "$2"; }
    98	else
    99	    oops "you don't have wget or curl installed, which I need to download the binary tarball"
   100	fi
   101	
   102	echo "downloading Nix 2.35.2 binary tarball for $system from '$url' to '$tmpDir'..."
   103	fetch "$url" "$tarball" || oops "failed to download '$url'"
   104	
   105	if command -v sha256sum > /dev/null 2>&1; then
   106	    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
   107	elif command -v shasum > /dev/null 2>&1; then
   108	    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
   109	elif command -v openssl > /dev/null 2>&1; then
   110	    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
   111	else
   112	    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
   113	fi
   114	
   115	if [ "$hash" != "$hash2" ]; then
   116	    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
   117	fi
   118	
   119	unpack=$tmpDir/unpack
   120	mkdir -p "$unpack"
   121	tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"
   122	
   123	script=$(echo "$unpack"/*/install)
   124	
   125	[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
   126	export INVOKED_FROM_INSTALL_IN=1
   127	"$script" "$@"
   128	
   129	} # End of wrapping
```

[🤖](/llama.cpp/transcripts/firefox/2026/08/31/2026-08-31_13-43-56_conv_82693474.yml)

