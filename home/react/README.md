# home/react

https://ontouchstart.github.io/home/react/2026-10-01T13-10-11-895Z_01a0f796-36b7-76f5-aad9-6cb35447c38d

https://ontouchstart.github.io/home/react/2026-10-01T11-15-34-347Z_01a0f72d-454a-7511-b43e-87ffa200691d

https://ontouchstart.github.io/home/react/duck.ai_2026-09-30_22-03-59

https://ontouchstart.github.io/home/react/2026-09-30T20-43-52-222Z_01a0f40f-341e-771c-90cd-5e37562fda39

https://ontouchstart.github.io/home/react/2026-09-30T13-53-41-342Z_01a0f297-abdd-76ac-81cb-438bbd5d59f8

https://ontouchstart.github.io/home/react/2026-09-29T19-53-16-272Z_01a0eeba-84f0-7455-bdeb-4deda7f9dcfb

[changes.patch](changes.patch)

```patch
diff --git a/package.json b/package.json
index 24c65a60b1..a27218fdf8 100644
--- a/package.json
+++ b/package.json
@@ -45,6 +45,7 @@
     "@rollup/plugin-node-resolve": "^15.0.1",
     "@rollup/plugin-replace": "^5.0.2",
     "@rollup/plugin-typescript": "^12.1.2",
+    "@types/babel__code-frame": "^7.10.4",
     "@types/invariant": "^2.2.35",
     "@typescript-eslint/eslint-plugin": "^6.21.0",
     "@typescript-eslint/parser": "^6.21.0",
diff --git a/packages/react-devtools-extensions/improveImages.mjs b/packages/react-devtools-extensions/improveImages.mjs
index 385624a26b..20977f359c 100644
--- a/packages/react-devtools-extensions/improveImages.mjs
+++ b/packages/react-devtools-extensions/improveImages.mjs
@@ -4,7 +4,6 @@ import filesize from 'filesize'
 import imagemin from 'imagemin'
 import imageminGifsicle from 'imagemin-gifsicle'
 import imageminJpegtran from 'imagemin-jpegtran'
-import imageminOptipng from 'imagemin-optipng'
 import imageminSvgo from 'imagemin-svgo'
 import parseFilepath from 'parse-filepath'
 import chalk from 'chalk'
@@ -12,7 +11,6 @@ import chalk from 'chalk'
 const plugins = [
   imageminGifsicle({}),
   imageminJpegtran({}),
-  imageminOptipng({}),
   imageminSvgo({})
 ]
 
diff --git a/packages/react-devtools-extensions/package.json b/packages/react-devtools-extensions/package.json
index 9dfceea840..3711d141c7 100644
--- a/packages/react-devtools-extensions/package.json
+++ b/packages/react-devtools-extensions/package.json
@@ -49,7 +49,6 @@
     "imagemin": "^8.0.0",
     "imagemin-gifsicle": "^7.0.0",
     "imagemin-jpegtran": "^6.0.0",
-    "imagemin-optipng": "^7.0.0",
     "imagemin-svgo": "^7.0.0",
     "jest-fetch-mock": "^3.0.3",
     "node-libs-browser": "0.5.3",
diff --git a/packages/shared/ReactVersion.js b/packages/shared/ReactVersion.js
index bd5fa23ca2..1a733fd7ce 100644
--- a/packages/shared/ReactVersion.js
+++ b/packages/shared/ReactVersion.js
@@ -1,15 +1 @@
-/**
- * Copyright (c) Meta Platforms, Inc. and affiliates.
- *
- * This source code is licensed under the MIT license found in the
- * LICENSE file in the root directory of this source tree.
- */
-
-// TODO: this is special because it gets imported during build.
-//
-// It exists as a placeholder so that DevTools can support work tag changes between releases.
-// When we next publish a release, update the matching TODO in backend/renderer.js
-// TODO: This module is used both by the release scripts and to expose a version
-// at runtime. We should instead inject the version number as part of the build
-// process, and use the ReactVersions.js module as the single source of truth.
-export default '19.3.0';
+export default '19.3.0-canary-7df76897-20260929';
diff --git a/scripts/rollup/bundles.js b/scripts/rollup/bundles.js
index acd1846b39..e48831f132 100644
--- a/scripts/rollup/bundles.js
+++ b/scripts/rollup/bundles.js
@@ -1277,6 +1277,8 @@ const bundles = [
       'zod-validation-error/v4',
       'crypto',
       'util',
+      'tty',
+      'os',
     ],
     tsconfig: './packages/eslint-plugin-react-hooks/tsconfig.json',
     prebuild: `mkdir -p ./compiler/packages/babel-plugin-react-compiler/dist && echo "module.exports = require('../src/index.ts');" > ./compiler/packages/babel-plugin-react-compiler/dist/index.js`,
diff --git a/yarn.lock b/yarn.lock
index 8161186e1b..5750f59cdb 100644
--- a/yarn.lock
+++ b/yarn.lock
@@ -4058,6 +4058,11 @@
   dependencies:
     tslib "^2.4.0"
 
+"@types/babel__code-frame@^7.10.4":
+  version "7.27.0"
+  resolved "https://registry.yarnpkg.com/@types/babel__code-frame/-/babel__code-frame-7.27.0.tgz#4799f597ec9e7bbdd39e1374f43423742dcffa99"
+  integrity sha512-Dwlo+LrxDx/0SpfmJ/BKveHf7QXWvLBLc+x03l5sbzykj3oB9nHygCpSECF1a+s+QIxbghe+KHqC90vGtxLRAA==
+
 "@types/babel__core@^7.20.5":
   version "7.20.5"
   resolved "https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.20.5.tgz#3df15f27ba85319caa07ba08d0721889bb39c017"
@@ -8376,7 +8381,7 @@ eslint-utils@^2.0.0, eslint-utils@^2.1.0:
   dependencies:
     eslint-visitor-keys "^1.1.0"
 
-"eslint-v7@npm:eslint@^7.7.0", eslint@^7.7.0:
+"eslint-v7@npm:eslint@^7.7.0":
   version "7.32.0"
   resolved "https://registry.yarnpkg.com/eslint/-/eslint-7.32.0.tgz#c6d328a14be3fb08c8d1d21e12c02fdb7a2a812d"
   integrity sha512-VHZ8gX+EDfz+97jGcgyGCyRia/dPOd6Xh9yPv8Bl1+SoaIwD+a/vlrOmGRUyOYu7MwUhc7CxqeaDZU13S4+EpA==
@@ -8575,6 +8580,52 @@ eslint@8.57.0:
     strip-ansi "^6.0.1"
     text-table "^0.2.0"
 
+eslint@^7.7.0:
+  version "7.32.0"
+  resolved "https://registry.yarnpkg.com/eslint/-/eslint-7.32.0.tgz#c6d328a14be3fb08c8d1d21e12c02fdb7a2a812d"
+  integrity sha512-VHZ8gX+EDfz+97jGcgyGCyRia/dPOd6Xh9yPv8Bl1+SoaIwD+a/vlrOmGRUyOYu7MwUhc7CxqeaDZU13S4+EpA==
+  dependencies:
+    "@babel/code-frame" "7.12.11"
+    "@eslint/eslintrc" "^0.4.3"
+    "@humanwhocodes/config-array" "^0.5.0"
+    ajv "^6.10.0"
+    chalk "^4.0.0"
+    cross-spawn "^7.0.2"
+    debug "^4.0.1"
+    doctrine "^3.0.0"
+    enquirer "^2.3.5"
+    escape-string-regexp "^4.0.0"
+    eslint-scope "^5.1.1"
+    eslint-utils "^2.1.0"
+    eslint-visitor-keys "^2.0.0"
+    espree "^7.3.1"
+    esquery "^1.4.0"
+    esutils "^2.0.2"
+    fast-deep-equal "^3.1.3"
+    file-entry-cache "^6.0.1"
+    functional-red-black-tree "^1.0.1"
+    glob-parent "^5.1.2"
+    globals "^13.6.0"
+    ignore "^4.0.6"
+    import-fresh "^3.0.0"
+    imurmurhash "^0.1.4"
+    is-glob "^4.0.0"
+    js-yaml "^3.13.1"
+    json-stable-stringify-without-jsonify "^1.0.1"
+    levn "^0.4.1"
+    lodash.merge "^4.6.2"
+    minimatch "^3.0.4"
+    natural-compare "^1.4.0"
+    optionator "^0.9.1"
+    progress "^2.0.0"
+    regexpp "^3.1.0"
+    semver "^7.2.1"
+    strip-ansi "^6.0.0"
+    strip-json-comments "^3.1.0"
+    table "^6.0.9"
+    text-table "^0.2.0"
+    v8-compile-cache "^2.0.3"
+
 espree@10.0.1, espree@^10.0.1:
   version "10.0.1"
   resolved "https://registry.yarnpkg.com/espree/-/espree-10.0.1.tgz#600e60404157412751ba4a6f3a2ee1a42433139f"
@@ -10477,15 +10528,6 @@ imagemin-jpegtran@^6.0.0:
     is-jpg "^2.0.0"
     jpegtran-bin "^4.0.0"
 
-imagemin-optipng@^7.0.0:
-  version "7.1.0"
-  resolved "https://registry.yarnpkg.com/imagemin-optipng/-/imagemin-optipng-7.1.0.tgz#2225c82c35e5c29b7fa98d4f9ecee1161a68e888"
-  integrity sha512-JNORTZ6j6untH7e5gF4aWdhDCxe3ODsSLKs/f7Grewy3ebZpl1ZsU+VUTPY4rzeHgaFA8GSWOoA8V2M3OixWZQ==
-  dependencies:
-    exec-buffer "^3.0.0"
-    is-png "^2.0.0"
-    optipng-bin "^6.0.0"
-
 imagemin-svgo@^7.0.0:
   version "7.1.0"
   resolved "https://registry.yarnpkg.com/imagemin-svgo/-/imagemin-svgo-7.1.0.tgz#528a42fd3d55eff5d4af8fd1113f25fb61ad6d9a"
@@ -11041,11 +11083,6 @@ is-plain-object@^5.0.0:
   resolved "https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz#4427f50ab3429e9025ea7d52e9043a9ef4159344"
   integrity sha512-VRSzKkbMm5jMDoKLbltAkFQ5Qr7VDiTFGXxYFXXowVj387GeGNOCsOH6Msy00SGZ3Fp84b1Naa1psqgcCIEP5Q==
 
-is-png@^2.0.0:
-  version "2.0.0"
-  resolved "https://registry.yarnpkg.com/is-png/-/is-png-2.0.0.tgz#ee8cbc9e9b050425cedeeb4a6fb74a649b0a4a8d"
-  integrity sha512-4KPGizaVGj2LK7xwJIz8o5B2ubu1D/vcQsgOGFEDlpcvgZHto4gBnyd0ig7Ws+67ixmwKoNmu0hYnpo6AaKb5g==
-
 is-potential-custom-element-name@^1.0.1:
   version "1.0.1"
   resolved "https://registry.yarnpkg.com/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz#171ed6f19e3ac554394edf78caa05784a45bebb5"
@@ -13271,15 +13308,6 @@ optionator@^0.9.3:
     prelude-ls "^1.2.1"
     type-check "^0.4.0"
 
-optipng-bin@^6.0.0:
-  version "6.0.0"
-  resolved "https://registry.yarnpkg.com/optipng-bin/-/optipng-bin-6.0.0.tgz#376120fa79d5e71eee2f524176efdd3a5eabd316"
-  integrity sha512-95bB4y8IaTsa/8x6QH4bLUuyvyOoGBCLDA7wOgDL8UFqJpSUh1Hob8JRJhit+wC1ZLN3tQ7mFt7KuBj0x8F2Wg==
-  dependencies:
-    bin-build "^3.0.0"
-    bin-wrapper "^4.0.0"
-    logalot "^2.0.0"
-
 ordered-read-streams@^1.0.0:
   version "1.0.0"
   resolved "https://registry.yarnpkg.com/ordered-read-streams/-/ordered-read-streams-1.0.0.tgz#d674a86ffcedf83d0ae06afa2918855e96d4033a"
@@ -14364,7 +14392,7 @@ rc@1.2.8, rc@^1.2.8:
     object-assign "^4.1.1"
     scheduler "^0.20.2"
 
-"react-is-18@npm:react-is@^18.3.1", react-is@^16.8.1, "react-is@npm:react-is":
+"react-is-18@npm:react-is@^18.3.1":
   version "18.3.1"
   resolved "https://registry.yarnpkg.com/react-is/-/react-is-18.3.1.tgz#e83557dc12eae63a99e003a46388b1dcbb44db7e"
   integrity sha512-/LLMVyas0ljjAtoYiPqYiL8VWXzUUdThrmU5+n20DZv+a+ClRoevUzw5JxU+Ieh5/c87ytoTBV9G1FiKfNJdmg==
@@ -14374,6 +14402,11 @@ rc@1.2.8, rc@^1.2.8:
   resolved "https://registry.yarnpkg.com/react-is/-/react-is-19.2.8.tgz#09826f9fbc187bc668e3e5c62edc001f804d5018"
   integrity sha512-s5un28nYxKJw5gvUHyW5PCC28CvBqLu9r3cWgzHT4Vo/5fqqkFcdRYsGcKf50WMPpjjFZS5d76fn3YCo2njKwQ==
 
+react-is@^16.8.1, "react-is@npm:react-is":
+  version "18.3.1"
+  resolved "https://registry.yarnpkg.com/react-is/-/react-is-18.3.1.tgz#e83557dc12eae63a99e003a46388b1dcbb44db7e"
+  integrity sha512-/LLMVyas0ljjAtoYiPqYiL8VWXzUUdThrmU5+n20DZv+a+ClRoevUzw5JxU+Ieh5/c87ytoTBV9G1FiKfNJdmg==
+
 react-lifecycles-compat@^3.0.4:
   version "3.0.4"
   resolved "https://registry.yarnpkg.com/react-lifecycles-compat/-/react-lifecycles-compat-3.0.4.tgz#4f1a273afdfc8f3488a8c516bfda78f872352362"
@@ -15798,7 +15831,7 @@ string-natural-compare@^3.0.1:
   resolved "https://registry.yarnpkg.com/string-natural-compare/-/string-natural-compare-3.0.1.tgz#7a42d58474454963759e8e8b7ae63d71c1e7fdf4"
   integrity sha512-n3sPwynL1nwKi3WJ6AIsClwBMa0zTi54fn2oLU6ndfTSIO05xaznjSf15PcBZU6FNWbmN5Q6cxT4V5hGvB4taw==
 
-"string-width-cjs@npm:string-width@^4.2.0", string-width@^4.1.0, string-width@^4.2.0, string-width@^4.2.2, string-width@^4.2.3:
+"string-width-cjs@npm:string-width@^4.2.0":
   version "4.2.3"
   resolved "https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz#269c7117d27b05ad2e536830a8ec895ef9c6d010"
   integrity sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==
@@ -15825,6 +15858,15 @@ string-width@^4.0.0:
     is-fullwidth-code-point "^3.0.0"
     strip-ansi "^6.0.0"
 
+string-width@^4.1.0, string-width@^4.2.0, string-width@^4.2.2, string-width@^4.2.3:
+  version "4.2.3"
+  resolved "https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz#269c7117d27b05ad2e536830a8ec895ef9c6d010"
+  integrity sha512-wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==
+  dependencies:
+    emoji-regex "^8.0.0"
+    is-fullwidth-code-point "^3.0.0"
+    strip-ansi "^6.0.1"
+
 string-width@^5.0.1, string-width@^5.1.2:
   version "5.1.2"
   resolved "https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz#14f8daec6d81e7221d2a357e668cab73bdbca794"
@@ -15885,7 +15927,7 @@ string_decoder@~1.1.1:
   dependencies:
     safe-buffer "~5.1.0"
 
-"strip-ansi-cjs@npm:strip-ansi@^6.0.1", strip-ansi@^6.0.0, strip-ansi@^6.0.1:
+"strip-ansi-cjs@npm:strip-ansi@^6.0.1":
   version "6.0.1"
   resolved "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz#9e26c63d30f53443e9489495b2105d37b67a85d9"
   integrity sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==
@@ -15906,6 +15948,13 @@ strip-ansi@^5.1.0:
   dependencies:
     ansi-regex "^4.1.0"
 
+strip-ansi@^6.0.0, strip-ansi@^6.0.1:
+  version "6.0.1"
+  resolved "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz#9e26c63d30f53443e9489495b2105d37b67a85d9"
+  integrity sha512-Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==
+  dependencies:
+    ansi-regex "^5.0.1"
+
 strip-ansi@^7.0.1:
   version "7.1.0"
   resolved "https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz#d5b6568ca689d8561370b0707685d22434faff45"
@@ -17441,7 +17490,7 @@ workerize-loader@^2.0.2:
   dependencies:
     loader-utils "^2.0.0"
 
-"wrap-ansi-cjs@npm:wrap-ansi@^7.0.0", wrap-ansi@^7.0.0:
+"wrap-ansi-cjs@npm:wrap-ansi@^7.0.0":
   version "7.0.0"
   resolved "https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz#67e145cff510a6a6984bdf1152911d69d2eb9e43"
   integrity sha512-YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==
@@ -17459,6 +17508,15 @@ wrap-ansi@^6.2.0:
     string-width "^4.1.0"
     strip-ansi "^6.0.0"
 
+wrap-ansi@^7.0.0:
+  version "7.0.0"
+  resolved "https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz#67e145cff510a6a6984bdf1152911d69d2eb9e43"
+  integrity sha512-YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==
+  dependencies:
+    ansi-styles "^4.0.0"
+    string-width "^4.1.0"
+    strip-ansi "^6.0.0"
+
 wrap-ansi@^8.1.0:
   version "8.1.0"
   resolved "https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz#56dc22368ee570face1b49819975d9b9a5ead214"
```

```
git clone https://github.com/react/react
cd react
git apply < /home/react/changes.patch 
nix develop "git+https://github.com/nix-ontouchstart/react" --command bash -c "yarn install && yarn build"
```

```
bash-5.3# git clone https://github.com/react/react
Cloning into 'react'...
remote: Enumerating objects: 462918, done.
remote: Counting objects: 100% (1033/1033), done.
remote: Compressing objects: 100% (421/421), done.
remote: Total 462918 (delta 857), reused 612 (delta 612), pack-reused 461885 (from 5)
Receiving objects: 100% (462918/462918), 1.03 GiB | 5.21 MiB/s, done.
Resolving deltas: 100% (337870/337870), done.
bash-5.3# ls
bin  dev  etc  home  nix  proc	react  root  sys  tmp  usr  var
bash-5.3# cd react/compiler/
bash-5.3# nix develop "git+https://github.com/nix-ontouchstart/react?dir=compiler" --command bash -c "yarn install && yarn build"
remote: Enumerating objects: 263458, done.
remote: Counting objects: 100% (300/300), done.
remote: Compressing objects: 100% (226/226), done.
remote: Total 263458 (delta 181), reused 74 (delta 74), pack-reused 263158 (from 4)
Receiving objects: 100% (263458/263458), 131.73 MiB | 5.95 MiB/s, done.
Resolving deltas: 100% (207132/207132), done.
From https://github.com/nix-ontouchstart/react
 * [new branch]            main       -> main
yarn install v1.22.22
(node:511) [DEP0169] DeprecationWarning: `url.parse()` behavior is not standardized and prone to errors that have security implications. Use the WHATWG URL API instead. CVEs are not issued for `url.parse()` vulnerabilities.
(Use `node --trace-deprecation ...` to show where the warning was created)
[1/4] Resolving packages...
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.0"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.26.10"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.28.6"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.0"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.0"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.0"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.0"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.28.6"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
warning Resolution field "@babel/types@7.26.3" is incompatible with requested version "@babel/types@^7.27.1"
[2/4] Fetching packages...
warning react-forgive@0.0.0: The engine "vscode" appears to be invalid.
warning bare-fs@4.1.3: The engine "bare" appears to be invalid.
warning bare-os@3.6.1: The engine "bare" appears to be invalid.
[3/4] Linking dependencies...
warning " > eslint-plugin-react-compiler@0.0.0-experimental-9ed098e-20240725" has unmet peer dependency "eslint@>=7".
warning " > react-compiler-runtime@0.0.1" has unmet peer dependency "react@^17.0.0 || ^18.0.0 || ^19.0.0 || ^0.0.0-experimental".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > babel-plugin-react-compiler > @testing-library/react@13.4.0" has incorrect peer dependency "react@^18.0.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > babel-plugin-react-compiler > @testing-library/react@13.4.0" has incorrect peer dependency "react-dom@^18.0.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > babel-plugin-react-compiler > babel-jest@29.0.3" has incorrect peer dependency "@babel/core@^7.8.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > babel-plugin-react-compiler > babel-plugin-fbt@1.0.0" has unmet peer dependency "@fbtjs/default-collection-transform@^1.0.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > fbt@1.0.2" has unmet peer dependency "babel-plugin-fbt@^1.0.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > fbt@1.0.2" has unmet peer dependency "babel-plugin-fbt-runtime@^1.0.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > fbt@1.0.2" has incorrect peer dependency "react@>=0.12.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > @typescript-eslint/eslint-plugin@7.4.0" has unmet peer dependency "eslint@^8.56.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > @typescript-eslint/parser@7.4.0" has unmet peer dependency "eslint@^8.56.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > @typescript-eslint/eslint-plugin > @typescript-eslint/type-utils@7.4.0" has unmet peer dependency "eslint@^8.56.0".
warning "workspace-aggregator-c914a8c1-faa6-4422-b4cf-ed3cd0ea8f5c > snap > @typescript-eslint/eslint-plugin > @typescript-eslint/utils@7.4.0" has unmet peer dependency "eslint@^8.56.0".
[4/4] Building fresh packages...
Done in 120.50s.
yarn run v1.22.22
$ yarn workspaces run build

> babel-plugin-react-compiler-rust
$ tsc

> babel-plugin-react-compiler
$ rimraf dist && tsup
CLI Building entry: src/index.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/babel-plugin-react-compiler/tsup.config.ts
CLI Target: es2015
CJS Build start
CJS dist/index.js 3.60 MB
CJS ⚡️ Build success in 154ms

> eslint-plugin-react-compiler
$ rimraf dist && tsup
CLI Building entry: src/index.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/eslint-plugin-react-compiler/tsup.config.ts
CLI Target: es2015
CJS Build start
CJS dist/index.js 1.71 MB
CJS ⚡️ Build success in 88ms

> make-read-only-util
$ rimraf dist && tsup
CLI Building entry: src/makeReadOnly.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/make-read-only-util/tsup.config.ts
CLI Target: es2015
CJS Build start
CJS dist/makeReadOnly.js     3.78 KB
CJS dist/makeReadOnly.js.map 6.35 KB
CJS ⚡️ Build success in 8ms

> react-compiler-healthcheck
$ rimraf dist && tsup
CLI Building entry: src/index.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/react-compiler-healthcheck/tsup.config.ts
CLI Target: es2015
CJS Build start
CJS dist/index.js 1.70 MB
CJS ⚡️ Build success in 97ms

> react-compiler-runtime
$ rimraf dist && tsup
CLI Building entry: src/index.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/react-compiler-runtime/tsup.config.ts
CLI Target: es2015
CJS Build start
CJS dist/index.js     12.04 KB
CJS dist/index.js.map 18.81 KB
CJS ⚡️ Build success in 8ms

> react-forgive
$ yarn run compile
$ rimraf dist && concurrently -n server,client "scripts/build.mjs -t server" "scripts/build.mjs -t client"
[client] scripts/build.mjs -t client exited with code 0
[server] scripts/build.mjs -t server exited with code 0

> react-mcp-server
$ rimraf dist && tsup
CLI Building entry: src/index.ts
CLI Using tsconfig: tsconfig.json
CLI tsup v8.4.0
CLI Using tsup config: /react/compiler/packages/react-mcp-server/tsup.config.ts
CLI Target: es2022
CJS Build start
CJS dist/index.js 1.71 MB
CJS ⚡️ Build success in 95ms

> snap
$ rimraf dist && concurrently -n snap,runtime "tsc --build" "yarn --silent workspace react-compiler-runtime build"
$ rimraf dist && tsup
[runtime] CLI Building entry: src/index.ts
[runtime] CLI Using tsconfig: tsconfig.json
[runtime] CLI tsup v8.4.0
[runtime] CLI Using tsup config: /react/compiler/packages/react-compiler-runtime/tsup.config.ts
[runtime] CLI Target: es2015
[runtime] CJS Build start
[runtime] CJS dist/index.js     12.04 KB
[runtime] CJS dist/index.js.map 18.81 KB
[runtime] CJS ⚡️ Build success in 9ms
[runtime] yarn --silent workspace react-compiler-runtime build exited with code 0
[snap] tsc --build exited with code 0
Done in 9.22s.
bash-5.3# 
```
