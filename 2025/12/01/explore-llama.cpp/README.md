# Explore llama.cpp

[Makefile](Makefile)

```
% make server
git clone https://github.com/ggml-org/llama.cpp.git
cd llama.cpp && cmake -B build && cmake --build build --config Release -j 8
-- The C compiler identification is AppleClang 17.0.0.17000404
-- The CXX compiler identification is AppleClang 17.0.0.17000404
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Found Git: /usr/bin/git (found version "2.50.1 (Apple Git-155)")
-- The ASM compiler identification is AppleClang
-- Found assembler: /usr/bin/cc
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD
-- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
-- Found Threads: TRUE
-- ccache found, compilation results will be cached. Disable with GGML_CCACHE=OFF.
-- CMAKE_SYSTEM_PROCESSOR: arm64
-- GGML_SYSTEM_ARCH: ARM
-- Including CPU backend
-- Accelerate framework found
-- Could NOT find OpenMP_C (missing: OpenMP_C_FLAGS OpenMP_C_LIB_NAMES) 
-- Could NOT find OpenMP_CXX (missing: OpenMP_CXX_FLAGS OpenMP_CXX_LIB_NAMES) 
-- Could NOT find OpenMP (missing: OpenMP_C_FOUND OpenMP_CXX_FOUND) 
-- ARM detected
-- Performing Test GGML_COMPILER_SUPPORTS_FP16_FORMAT_I3E
-- Performing Test GGML_COMPILER_SUPPORTS_FP16_FORMAT_I3E - Failed
-- Performing Test GGML_MACHINE_SUPPORTS_dotprod
-- Performing Test GGML_MACHINE_SUPPORTS_dotprod - Success
-- Performing Test GGML_MACHINE_SUPPORTS_i8mm
-- Performing Test GGML_MACHINE_SUPPORTS_i8mm - Success
-- Performing Test GGML_MACHINE_SUPPORTS_sve
-- Performing Test GGML_MACHINE_SUPPORTS_sve - Failed
-- Performing Test GGML_MACHINE_SUPPORTS_nosve
-- Performing Test GGML_MACHINE_SUPPORTS_nosve - Success
-- Performing Test GGML_MACHINE_SUPPORTS_sme
-- Performing Test GGML_MACHINE_SUPPORTS_sme - Success
-- Checking for ARM features using flags:
--   -U__ARM_FEATURE_SVE
--   -mcpu=native+dotprod+i8mm+nosve+sme
-- Performing Test HAVE_DOTPROD
-- Performing Test HAVE_DOTPROD - Success
-- Performing Test HAVE_SVE
-- Performing Test HAVE_SVE - Failed
-- Performing Test HAVE_MATMUL_INT8
-- Performing Test HAVE_MATMUL_INT8 - Success
-- Performing Test HAVE_FMA
-- Performing Test HAVE_FMA - Success
-- Performing Test HAVE_FP16_VECTOR_ARITHMETIC
-- Performing Test HAVE_FP16_VECTOR_ARITHMETIC - Success
-- Performing Test HAVE_SME
-- Performing Test HAVE_SME - Success
-- Adding CPU backend variant ggml-cpu: -U__ARM_FEATURE_SVE;-mcpu=native+dotprod+i8mm+nosve+sme 
-- Looking for dgemm_
-- Looking for dgemm_ - found
-- Found BLAS: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Accelerate.framework
-- BLAS found, Libraries: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Accelerate.framework
-- BLAS found, Includes: 
-- Including BLAS backend
-- Metal framework found
-- Including METAL backend
-- ggml version: 0.9.4
-- ggml commit:  9810cb824
-- Found CURL: /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libcurl.tbd (found version "8.7.1")
-- Configuring done (3.2s)
-- Generating done (0.2s)
-- Build files have been written to: /Users/sam/github/ontouchstart.github.io/2025/12/01/explore-llama.cpp/llama.cpp/build
[  0%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml.c.o
[  1%] Building C object examples/gguf-hash/CMakeFiles/xxhash.dir/deps/xxhash/xxhash.c.o
[  1%] Building C object examples/gguf-hash/CMakeFiles/sha1.dir/deps/sha1/sha1.c.o
[  2%] Building C object examples/gguf-hash/CMakeFiles/sha256.dir/deps/sha256/sha256.c.o
[  2%] Building CXX object tools/mtmd/CMakeFiles/llama-gemma3-cli.dir/deprecation-warning.cpp.o
[  2%] Building CXX object vendor/cpp-httplib/CMakeFiles/cpp-httplib.dir/httplib.cpp.o
[  2%] Building CXX object common/CMakeFiles/build_info.dir/build-info.cpp.o
[  2%] Building CXX object tools/mtmd/CMakeFiles/llama-llava-cli.dir/deprecation-warning.cpp.o
[  2%] Built target build_info
[  2%] Built target sha256
[  2%] Built target sha1
[  2%] Built target xxhash
[  3%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml.cpp.o
[  4%] Linking CXX executable ../../bin/llama-llava-cli
[  4%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml-alloc.c.o
[  4%] Linking CXX executable ../../bin/llama-gemma3-cli
[  4%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-backend.cpp.o
[  5%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-opt.cpp.o
[  6%] Linking CXX static library libcpp-httplib.a
[  6%] Building CXX object tools/mtmd/CMakeFiles/llama-minicpmv-cli.dir/deprecation-warning.cpp.o
[  6%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/ggml-threading.cpp.o
[  6%] Building C object ggml/src/CMakeFiles/ggml-base.dir/ggml-quants.c.o
[  6%] Building CXX object ggml/src/CMakeFiles/ggml-base.dir/gguf.cpp.o
[  6%] Building CXX object tools/mtmd/CMakeFiles/llama-qwen2vl-cli.dir/deprecation-warning.cpp.o
[  6%] Linking CXX executable ../../bin/llama-minicpmv-cli
[  6%] Built target llama-llava-cli
[  6%] Built target llama-gemma3-cli
[  7%] Linking CXX shared library ../../bin/libggml-base.dylib
[  7%] Linking CXX executable ../../bin/llama-qwen2vl-cli
[  7%] Built target cpp-httplib
[  7%] Built target llama-minicpmv-cli
[  7%] Built target llama-qwen2vl-cli
[  7%] Built target ggml-base
[  8%] Generate assembly for embedded Metal library
Embedding Metal library
[  8%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/traits.cpp.o
[  9%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ggml-cpu.cpp.o
[  9%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ggml-cpu.c.o
[  9%] Building CXX object ggml/src/ggml-blas/CMakeFiles/ggml-blas.dir/ggml-blas.cpp.o
[ 10%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/quants.c.o
[ 10%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/repack.cpp.o
[ 10%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/hbm.cpp.o
[ 10%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/amx/amx.cpp.o
[ 10%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/amx/mmq.cpp.o
[ 11%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/binary-ops.cpp.o
[ 11%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/unary-ops.cpp.o
[ 11%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/vec.cpp.o
[ 11%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/ops.cpp.o
[ 11%] Linking CXX shared library ../../../bin/libggml-blas.dylib
[ 11%] Building C object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/arch/arm/quants.c.o
[ 12%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/llamafile/sgemm.cpp.o
[ 12%] Building CXX object ggml/src/CMakeFiles/ggml-cpu.dir/ggml-cpu/arch/arm/repack.cpp.o
[ 12%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-common.cpp.o
[ 12%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal.cpp.o
[ 13%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-device.cpp.o
[ 13%] Building C object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-device.m.o
[ 13%] Building C object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-context.m.o
[ 13%] Building CXX object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/ggml-metal-ops.cpp.o
[ 13%] Linking CXX shared library ../../bin/libggml-cpu.dylib
[ 14%] Building ASM object ggml/src/ggml-metal/CMakeFiles/ggml-metal.dir/__/__/__/autogenerated/ggml-metal-embed.s.o
[ 14%] Built target ggml-blas
[ 14%] Linking CXX shared library ../../../bin/libggml-metal.dylib
[ 14%] Built target ggml-cpu
[ 14%] Built target ggml-metal
[ 14%] Building CXX object ggml/src/CMakeFiles/ggml.dir/ggml-backend-reg.cpp.o
[ 14%] Linking CXX shared library ../../bin/libggml.dylib
[ 14%] Built target ggml
[ 14%] Building CXX object examples/gguf-hash/CMakeFiles/llama-gguf-hash.dir/gguf-hash.cpp.o
[ 14%] Building CXX object examples/gguf/CMakeFiles/llama-gguf.dir/gguf.cpp.o
[ 14%] Building CXX object src/CMakeFiles/llama.dir/llama-batch.cpp.o
[ 14%] Building CXX object src/CMakeFiles/llama.dir/llama.cpp.o
[ 14%] Building CXX object src/CMakeFiles/llama.dir/llama-adapter.cpp.o
[ 15%] Building CXX object src/CMakeFiles/llama.dir/llama-arch.cpp.o
[ 16%] Building CXX object src/CMakeFiles/llama.dir/llama-context.cpp.o
[ 16%] Building CXX object src/CMakeFiles/llama.dir/llama-chat.cpp.o
[ 17%] Linking CXX executable ../../bin/llama-gguf
[ 17%] Building CXX object src/CMakeFiles/llama.dir/llama-grammar.cpp.o
[ 17%] Building CXX object src/CMakeFiles/llama.dir/llama-impl.cpp.o
[ 17%] Building CXX object src/CMakeFiles/llama.dir/llama-io.cpp.o
[ 17%] Building CXX object src/CMakeFiles/llama.dir/llama-cparams.cpp.o
[ 17%] Linking CXX executable ../../bin/llama-gguf-hash
[ 17%] Building CXX object src/CMakeFiles/llama.dir/llama-graph.cpp.o
[ 18%] Building CXX object src/CMakeFiles/llama.dir/llama-hparams.cpp.o
[ 19%] Building CXX object src/CMakeFiles/llama.dir/llama-kv-cache-iswa.cpp.o
[ 19%] Building CXX object src/CMakeFiles/llama.dir/llama-kv-cache.cpp.o
[ 19%] Building CXX object src/CMakeFiles/llama.dir/llama-memory.cpp.o
[ 19%] Building CXX object src/CMakeFiles/llama.dir/llama-memory-hybrid.cpp.o
[ 19%] Building CXX object src/CMakeFiles/llama.dir/llama-mmap.cpp.o
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-memory-recurrent.cpp.o
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-model-loader.cpp.o
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-quant.cpp.o
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-model-saver.cpp.o
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-sampling.cpp.o
[ 20%] Built target llama-gguf
[ 20%] Building CXX object src/CMakeFiles/llama.dir/llama-vocab.cpp.o
[ 21%] Building CXX object src/CMakeFiles/llama.dir/llama-model.cpp.o
[ 21%] Built target llama-gguf-hash
[ 22%] Building CXX object src/CMakeFiles/llama.dir/unicode-data.cpp.o
[ 22%] Building CXX object src/CMakeFiles/llama.dir/unicode.cpp.o
[ 22%] Building CXX object src/CMakeFiles/llama.dir/models/afmoe.cpp.o
[ 23%] Building CXX object src/CMakeFiles/llama.dir/models/arcee.cpp.o
[ 23%] Building CXX object src/CMakeFiles/llama.dir/models/arctic.cpp.o
[ 23%] Building CXX object src/CMakeFiles/llama.dir/models/apertus.cpp.o
[ 23%] Building CXX object src/CMakeFiles/llama.dir/models/arwkv7.cpp.o
[ 23%] Building CXX object src/CMakeFiles/llama.dir/models/bailingmoe.cpp.o
[ 24%] Building CXX object src/CMakeFiles/llama.dir/models/baichuan.cpp.o
[ 24%] Building CXX object src/CMakeFiles/llama.dir/models/bailingmoe2.cpp.o
[ 24%] Building CXX object src/CMakeFiles/llama.dir/models/bert.cpp.o
[ 25%] Building CXX object src/CMakeFiles/llama.dir/models/bitnet.cpp.o
[ 25%] Building CXX object src/CMakeFiles/llama.dir/models/bloom.cpp.o
[ 25%] Building CXX object src/CMakeFiles/llama.dir/models/chameleon.cpp.o
[ 25%] Building CXX object src/CMakeFiles/llama.dir/models/chatglm.cpp.o
[ 26%] Building CXX object src/CMakeFiles/llama.dir/models/codeshell.cpp.o
[ 26%] Building CXX object src/CMakeFiles/llama.dir/models/cohere2-iswa.cpp.o
[ 26%] Building CXX object src/CMakeFiles/llama.dir/models/cogvlm.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/command-r.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/dbrx.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/deci.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/deepseek.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/dots1.cpp.o
[ 27%] Building CXX object src/CMakeFiles/llama.dir/models/dream.cpp.o
[ 28%] Building CXX object src/CMakeFiles/llama.dir/models/deepseek2.cpp.o
[ 28%] Building CXX object src/CMakeFiles/llama.dir/models/ernie4-5-moe.cpp.o
[ 29%] Building CXX object src/CMakeFiles/llama.dir/models/ernie4-5.cpp.o
[ 29%] Building CXX object src/CMakeFiles/llama.dir/models/exaone.cpp.o
[ 29%] Building CXX object src/CMakeFiles/llama.dir/models/exaone4.cpp.o
[ 30%] Building CXX object src/CMakeFiles/llama.dir/models/falcon-h1.cpp.o
[ 30%] Building CXX object src/CMakeFiles/llama.dir/models/gemma-embedding.cpp.o
[ 30%] Building CXX object src/CMakeFiles/llama.dir/models/falcon.cpp.o
[ 31%] Building CXX object src/CMakeFiles/llama.dir/models/gemma2-iswa.cpp.o
[ 31%] Building CXX object src/CMakeFiles/llama.dir/models/gemma.cpp.o
[ 31%] Building CXX object src/CMakeFiles/llama.dir/models/gemma3-iswa.cpp.o
[ 31%] Building CXX object src/CMakeFiles/llama.dir/models/gemma3n-iswa.cpp.o
[ 31%] Building CXX object src/CMakeFiles/llama.dir/models/glm4-moe.cpp.o
[ 32%] Building CXX object src/CMakeFiles/llama.dir/models/glm4.cpp.o
[ 32%] Building CXX object src/CMakeFiles/llama.dir/models/gptneox.cpp.o
[ 32%] Building CXX object src/CMakeFiles/llama.dir/models/gpt2.cpp.o
[ 32%] Building CXX object src/CMakeFiles/llama.dir/models/granite-hybrid.cpp.o
[ 32%] Building CXX object src/CMakeFiles/llama.dir/models/grok.cpp.o
[ 33%] Building CXX object src/CMakeFiles/llama.dir/models/granite.cpp.o
[ 33%] Building CXX object src/CMakeFiles/llama.dir/models/grovemoe.cpp.o
[ 34%] Building CXX object src/CMakeFiles/llama.dir/models/hunyuan-dense.cpp.o
[ 34%] Building CXX object src/CMakeFiles/llama.dir/models/internlm2.cpp.o
[ 34%] Building CXX object src/CMakeFiles/llama.dir/models/jais.cpp.o
[ 34%] Building CXX object src/CMakeFiles/llama.dir/models/hunyuan-moe.cpp.o
[ 35%] Building CXX object src/CMakeFiles/llama.dir/models/jamba.cpp.o
[ 35%] Building CXX object src/CMakeFiles/llama.dir/models/llada-moe.cpp.o
[ 35%] Building CXX object src/CMakeFiles/llama.dir/models/lfm2.cpp.o
[ 35%] Building CXX object src/CMakeFiles/llama.dir/models/llada.cpp.o
[ 36%] Building CXX object src/CMakeFiles/llama.dir/models/llama-iswa.cpp.o
[ 36%] Building CXX object src/CMakeFiles/llama.dir/models/mamba.cpp.o
[ 36%] Building CXX object src/CMakeFiles/llama.dir/models/llama.cpp.o
[ 37%] Building CXX object src/CMakeFiles/llama.dir/models/minicpm3.cpp.o
[ 37%] Building CXX object src/CMakeFiles/llama.dir/models/minimax-m2.cpp.o
[ 37%] Building CXX object src/CMakeFiles/llama.dir/models/nemotron-h.cpp.o
[ 37%] Building CXX object src/CMakeFiles/llama.dir/models/mpt.cpp.o
[ 38%] Building CXX object src/CMakeFiles/llama.dir/models/nemotron.cpp.o
[ 38%] Building CXX object src/CMakeFiles/llama.dir/models/neo-bert.cpp.o
[ 38%] Building CXX object src/CMakeFiles/llama.dir/models/olmo.cpp.o
[ 39%] Building CXX object src/CMakeFiles/llama.dir/models/olmoe.cpp.o
[ 39%] Building CXX object src/CMakeFiles/llama.dir/models/olmo2.cpp.o
[ 39%] Building CXX object src/CMakeFiles/llama.dir/models/openai-moe-iswa.cpp.o
[ 39%] Building CXX object src/CMakeFiles/llama.dir/models/openelm.cpp.o
[ 40%] Building CXX object src/CMakeFiles/llama.dir/models/orion.cpp.o
[ 40%] Building CXX object src/CMakeFiles/llama.dir/models/phi2.cpp.o
[ 40%] Building CXX object src/CMakeFiles/llama.dir/models/pangu-embedded.cpp.o
[ 40%] Building CXX object src/CMakeFiles/llama.dir/models/phi3.cpp.o
[ 41%] Building CXX object src/CMakeFiles/llama.dir/models/plamo.cpp.o
[ 41%] Building CXX object src/CMakeFiles/llama.dir/models/plamo2.cpp.o
[ 41%] Building CXX object src/CMakeFiles/llama.dir/models/qwen.cpp.o
[ 41%] Building CXX object src/CMakeFiles/llama.dir/models/plm.cpp.o
[ 42%] Building CXX object src/CMakeFiles/llama.dir/models/qwen2.cpp.o
[ 42%] Building CXX object src/CMakeFiles/llama.dir/models/qwen2vl.cpp.o
[ 42%] Building CXX object src/CMakeFiles/llama.dir/models/qwen2moe.cpp.o
[ 42%] Building CXX object src/CMakeFiles/llama.dir/models/qwen3.cpp.o
[ 43%] Building CXX object src/CMakeFiles/llama.dir/models/qwen3vl.cpp.o
[ 43%] Building CXX object src/CMakeFiles/llama.dir/models/qwen3vl-moe.cpp.o
[ 43%] Building CXX object src/CMakeFiles/llama.dir/models/qwen3moe.cpp.o
[ 44%] Building CXX object src/CMakeFiles/llama.dir/models/qwen3next.cpp.o
[ 44%] Building CXX object src/CMakeFiles/llama.dir/models/refact.cpp.o
[ 44%] Building CXX object src/CMakeFiles/llama.dir/models/rnd1.cpp.o
[ 45%] Building CXX object src/CMakeFiles/llama.dir/models/rwkv6.cpp.o
[ 45%] Building CXX object src/CMakeFiles/llama.dir/models/rwkv6-base.cpp.o
[ 45%] Building CXX object src/CMakeFiles/llama.dir/models/rwkv6qwen2.cpp.o
[ 45%] Building CXX object src/CMakeFiles/llama.dir/models/rwkv7-base.cpp.o
[ 45%] Building CXX object src/CMakeFiles/llama.dir/models/rwkv7.cpp.o
[ 46%] Building CXX object src/CMakeFiles/llama.dir/models/seed-oss.cpp.o
[ 46%] Building CXX object src/CMakeFiles/llama.dir/models/smallthinker.cpp.o
[ 46%] Building CXX object src/CMakeFiles/llama.dir/models/smollm3.cpp.o
[ 47%] Building CXX object src/CMakeFiles/llama.dir/models/stablelm.cpp.o
[ 47%] Building CXX object src/CMakeFiles/llama.dir/models/starcoder.cpp.o
[ 47%] Building CXX object src/CMakeFiles/llama.dir/models/starcoder2.cpp.o
[ 47%] Building CXX object src/CMakeFiles/llama.dir/models/t5-dec.cpp.o
[ 47%] Building CXX object src/CMakeFiles/llama.dir/models/wavtokenizer-dec.cpp.o
[ 48%] Building CXX object src/CMakeFiles/llama.dir/models/t5-enc.cpp.o
[ 48%] Building CXX object src/CMakeFiles/llama.dir/models/xverse.cpp.o
[ 48%] Building CXX object src/CMakeFiles/llama.dir/models/mistral3.cpp.o
[ 49%] Building CXX object src/CMakeFiles/llama.dir/models/graph-context-mamba.cpp.o
[ 49%] Linking CXX shared library ../bin/libllama.dylib
[ 49%] Built target llama
[ 50%] Building CXX object examples/simple-chat/CMakeFiles/llama-simple-chat.dir/simple-chat.cpp.o
[ 50%] Building CXX object tools/mtmd/CMakeFiles/mtmd.dir/mtmd.cpp.o
[ 51%] Building CXX object common/CMakeFiles/common.dir/chat-parser-xml-toolcall.cpp.o
[ 51%] Building CXX object common/CMakeFiles/common.dir/arg.cpp.o
[ 51%] Building CXX object examples/simple/CMakeFiles/llama-simple.dir/simple.cpp.o
[ 51%] Building CXX object common/CMakeFiles/common.dir/chat-parser.cpp.o
[ 51%] Building C object tests/CMakeFiles/test-c.dir/test-c.c.o
[ 51%] Building CXX object tools/mtmd/CMakeFiles/mtmd.dir/mtmd-audio.cpp.o
[ 51%] Linking C executable ../bin/test-c
[ 51%] Linking CXX executable ../../bin/llama-simple
[ 51%] Linking CXX executable ../../bin/llama-simple-chat
[ 51%] Building CXX object tools/mtmd/CMakeFiles/mtmd.dir/clip.cpp.o
[ 51%] Building CXX object common/CMakeFiles/common.dir/chat.cpp.o
[ 52%] Building CXX object tools/mtmd/CMakeFiles/mtmd.dir/mtmd-helper.cpp.o
[ 52%] Building CXX object common/CMakeFiles/common.dir/common.cpp.o
[ 52%] Building CXX object common/CMakeFiles/common.dir/console.cpp.o
[ 53%] Building CXX object common/CMakeFiles/common.dir/download.cpp.o
[ 53%] Building CXX object common/CMakeFiles/common.dir/json-partial.cpp.o
[ 53%] Building CXX object common/CMakeFiles/common.dir/llguidance.cpp.o
[ 53%] Building CXX object common/CMakeFiles/common.dir/json-schema-to-grammar.cpp.o
[ 53%] Linking CXX shared library ../../bin/libmtmd.dylib
[ 53%] Built target test-c
[ 53%] Built target llama-simple-chat
[ 53%] Built target llama-simple
[ 54%] Building CXX object common/CMakeFiles/common.dir/log.cpp.o
[ 54%] Building CXX object common/CMakeFiles/common.dir/ngram-cache.cpp.o
[ 54%] Building CXX object common/CMakeFiles/common.dir/regex-partial.cpp.o
[ 55%] Building CXX object common/CMakeFiles/common.dir/sampling.cpp.o
[ 55%] Building CXX object common/CMakeFiles/common.dir/speculative.cpp.o
[ 55%] Linking CXX static library libcommon.a
[ 55%] Built target mtmd
[ 55%] Built target common
[ 56%] Building CXX object tests/CMakeFiles/test-json-schema-to-grammar.dir/test-json-schema-to-grammar.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-grammar-parser.dir/test-grammar-parser.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-chat.dir/test-chat.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-llama-grammar.dir/test-llama-grammar.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-tokenizer-0.dir/test-tokenizer-0.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-sampling.dir/test-sampling.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-grammar-integration.dir/test-grammar-integration.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-quantize-stats.dir/test-quantize-stats.cpp.o
[ 56%] Building CXX object tests/CMakeFiles/test-grammar-parser.dir/get-model.cpp.o
[ 57%] Building CXX object tests/CMakeFiles/test-llama-grammar.dir/get-model.cpp.o
[ 58%] Building CXX object tests/CMakeFiles/test-sampling.dir/get-model.cpp.o
[ 58%] Building CXX object tests/CMakeFiles/test-json-schema-to-grammar.dir/get-model.cpp.o
[ 58%] Linking CXX executable ../bin/test-tokenizer-0
[ 59%] Building CXX object tests/CMakeFiles/test-chat.dir/get-model.cpp.o
[ 59%] Building CXX object tests/CMakeFiles/test-grammar-integration.dir/get-model.cpp.o
[ 59%] Linking CXX executable ../bin/test-quantize-stats
[ 59%] Linking CXX executable ../bin/test-json-schema-to-grammar
[ 60%] Linking CXX executable ../bin/test-sampling
[ 60%] Linking CXX executable ../bin/test-grammar-parser
[ 60%] Linking CXX executable ../bin/test-llama-grammar
[ 61%] Linking CXX executable ../bin/test-grammar-integration
[ 61%] Linking CXX executable ../bin/test-chat
[ 61%] Built target test-llama-grammar
[ 61%] Built target test-tokenizer-0
[ 61%] Built target test-sampling
[ 61%] Built target test-json-schema-to-grammar
[ 61%] Built target test-grammar-parser
[ 61%] Built target test-quantize-stats
[ 61%] Built target test-grammar-integration
[ 61%] Built target test-chat
[ 61%] Building CXX object tests/CMakeFiles/test-tokenizer-1-bpe.dir/test-tokenizer-1-bpe.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-gbnf-validator.dir/test-gbnf-validator.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-chat-parser.dir/test-chat-parser.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-tokenizer-1-spm.dir/test-tokenizer-1-spm.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-chat-parser.dir/get-model.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-json-partial.dir/test-json-partial.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-chat-template.dir/test-chat-template.cpp.o
[ 61%] Building CXX object tests/CMakeFiles/test-log.dir/test-log.cpp.o
[ 61%] Linking CXX executable ../bin/test-gbnf-validator
[ 62%] Linking CXX executable ../bin/test-tokenizer-1-bpe
[ 62%] Linking CXX executable ../bin/test-tokenizer-1-spm
[ 63%] Linking CXX executable ../bin/test-chat-parser
[ 63%] Building CXX object tests/CMakeFiles/test-json-partial.dir/get-model.cpp.o
[ 64%] Building CXX object tests/CMakeFiles/test-log.dir/get-model.cpp.o
[ 64%] Building CXX object tests/CMakeFiles/test-chat-template.dir/get-model.cpp.o
[ 65%] Building CXX object tests/CMakeFiles/test-regex-partial.dir/test-regex-partial.cpp.o
[ 65%] Linking CXX executable ../bin/test-log
[ 65%] Linking CXX executable ../bin/test-json-partial
[ 66%] Linking CXX executable ../bin/test-chat-template
[ 66%] Building CXX object tests/CMakeFiles/test-regex-partial.dir/get-model.cpp.o
[ 66%] Built target test-gbnf-validator
[ 66%] Built target test-tokenizer-1-bpe
[ 66%] Built target test-tokenizer-1-spm
[ 66%] Linking CXX executable ../bin/test-regex-partial
[ 66%] Built target test-chat-parser
[ 67%] Building CXX object tests/CMakeFiles/test-arg-parser.dir/test-arg-parser.cpp.o
[ 67%] Built target test-log
[ 67%] Building CXX object tests/CMakeFiles/test-thread-safety.dir/test-thread-safety.cpp.o
[ 67%] Building CXX object tests/CMakeFiles/test-gguf.dir/test-gguf.cpp.o
[ 68%] Building CXX object tests/CMakeFiles/test-opt.dir/test-opt.cpp.o
[ 68%] Built target test-json-partial
[ 68%] Built target test-chat-template
[ 68%] Building CXX object tests/CMakeFiles/test-arg-parser.dir/get-model.cpp.o
[ 68%] Building CXX object tests/CMakeFiles/test-backend-ops.dir/test-backend-ops.cpp.o
[ 68%] Building CXX object tests/CMakeFiles/test-model-load-cancel.dir/test-model-load-cancel.cpp.o
[ 68%] Built target test-regex-partial
[ 68%] Building CXX object tests/CMakeFiles/test-thread-safety.dir/get-model.cpp.o
[ 68%] Building CXX object tests/CMakeFiles/test-opt.dir/get-model.cpp.o
[ 69%] Building CXX object tests/CMakeFiles/test-gguf.dir/get-model.cpp.o
[ 69%] Linking CXX executable ../bin/test-arg-parser
[ 69%] Building CXX object tests/CMakeFiles/test-autorelease.dir/test-autorelease.cpp.o
[ 70%] Building CXX object tests/CMakeFiles/test-backend-ops.dir/get-model.cpp.o
[ 70%] Linking CXX executable ../bin/test-gguf
[ 71%] Linking CXX executable ../bin/test-thread-safety
[ 71%] Linking CXX executable ../bin/test-opt
[ 71%] Building CXX object tests/CMakeFiles/test-model-load-cancel.dir/get-model.cpp.o
[ 72%] Building CXX object tests/CMakeFiles/test-autorelease.dir/get-model.cpp.o
[ 72%] Linking CXX executable ../bin/test-backend-ops
[ 72%] Linking CXX executable ../bin/test-autorelease
[ 73%] Linking CXX executable ../bin/test-model-load-cancel
[ 73%] Building CXX object tests/CMakeFiles/test-barrier.dir/test-barrier.cpp.o
[ 73%] Building CXX object tests/CMakeFiles/test-barrier.dir/get-model.cpp.o
[ 73%] Built target test-arg-parser
[ 73%] Built target test-opt
[ 73%] Built target test-gguf
[ 73%] Built target test-thread-safety
[ 73%] Built target test-backend-ops
[ 74%] Linking CXX executable ../bin/test-barrier
[ 74%] Building CXX object tests/CMakeFiles/test-quantize-fns.dir/test-quantize-fns.cpp.o
[ 74%] Built target test-model-load-cancel
[ 74%] Building CXX object tests/CMakeFiles/test-quantize-perf.dir/test-quantize-perf.cpp.o
[ 74%] Building CXX object tests/CMakeFiles/test-rope.dir/test-rope.cpp.o
[ 74%] Building C object tests/CMakeFiles/test-mtmd-c-api.dir/test-mtmd-c-api.c.o
[ 74%] Built target test-autorelease
[ 74%] Building CXX object tests/CMakeFiles/test-mtmd-c-api.dir/get-model.cpp.o
[ 74%] Building CXX object tests/CMakeFiles/test-alloc.dir/test-alloc.cpp.o
[ 75%] Building CXX object tests/CMakeFiles/test-quantize-perf.dir/get-model.cpp.o
[ 77%] Building CXX object tests/CMakeFiles/test-quantize-fns.dir/get-model.cpp.o
[ 77%] Building CXX object tests/CMakeFiles/test-rope.dir/get-model.cpp.o
[ 77%] Linking CXX executable ../bin/test-mtmd-c-api
[ 77%] Building CXX object tests/CMakeFiles/test-alloc.dir/get-model.cpp.o
[ 77%] Built target test-barrier
[ 77%] Building CXX object examples/batched/CMakeFiles/llama-batched.dir/batched.cpp.o
[ 77%] Linking CXX executable ../bin/test-quantize-perf
[ 77%] Building CXX object examples/embedding/CMakeFiles/llama-embedding.dir/embedding.cpp.o
[ 77%] Linking CXX executable ../bin/test-rope
[ 77%] Linking CXX executable ../bin/test-alloc
[ 77%] Linking CXX executable ../bin/test-quantize-fns
[ 78%] Building CXX object examples/eval-callback/CMakeFiles/llama-eval-callback.dir/eval-callback.cpp.o
[ 79%] Linking CXX executable ../../bin/llama-batched
[ 79%] Linking CXX executable ../../bin/llama-embedding
[ 79%] Built target test-mtmd-c-api
[ 79%] Linking CXX executable ../../bin/llama-eval-callback
[ 79%] Built target test-rope
[ 79%] Built target test-quantize-perf
[ 80%] Building CXX object examples/lookahead/CMakeFiles/llama-lookahead.dir/lookahead.cpp.o
[ 80%] Built target test-alloc
[ 80%] Built target test-quantize-fns
[ 81%] Building CXX object examples/lookup/CMakeFiles/llama-lookup-create.dir/lookup-create.cpp.o
[ 81%] Building CXX object examples/lookup/CMakeFiles/llama-lookup.dir/lookup.cpp.o
[ 81%] Linking CXX executable ../../bin/llama-lookahead
[ 81%] Built target llama-batched
[ 81%] Building CXX object examples/lookup/CMakeFiles/llama-lookup-merge.dir/lookup-merge.cpp.o
[ 82%] Building CXX object examples/lookup/CMakeFiles/llama-lookup-stats.dir/lookup-stats.cpp.o
[ 82%] Built target llama-embedding
[ 82%] Linking CXX executable ../../bin/llama-lookup-create
[ 82%] Built target llama-eval-callback
[ 82%] Linking CXX executable ../../bin/llama-lookup
[ 82%] Linking CXX executable ../../bin/llama-lookup-merge
[ 82%] Linking CXX executable ../../bin/llama-lookup-stats
[ 82%] Building CXX object examples/parallel/CMakeFiles/llama-parallel.dir/parallel.cpp.o
[ 82%] Building CXX object examples/passkey/CMakeFiles/llama-passkey.dir/passkey.cpp.o
[ 83%] Building CXX object examples/retrieval/CMakeFiles/llama-retrieval.dir/retrieval.cpp.o
[ 83%] Built target llama-lookahead
[ 83%] Linking CXX executable ../../bin/llama-passkey
[ 84%] Linking CXX executable ../../bin/llama-parallel
[ 84%] Linking CXX executable ../../bin/llama-retrieval
[ 84%] Built target llama-lookup-merge
[ 84%] Built target llama-lookup-create
[ 84%] Building CXX object examples/save-load-state/CMakeFiles/llama-save-load-state.dir/save-load-state.cpp.o
[ 84%] Built target llama-lookup
[ 84%] Built target llama-lookup-stats
[ 84%] Linking CXX executable ../../bin/llama-save-load-state
[ 85%] Building CXX object examples/speculative-simple/CMakeFiles/llama-speculative-simple.dir/speculative-simple.cpp.o
[ 85%] Building CXX object examples/speculative/CMakeFiles/llama-speculative.dir/speculative.cpp.o
[ 86%] Building CXX object examples/gen-docs/CMakeFiles/llama-gen-docs.dir/gen-docs.cpp.o
[ 87%] Building CXX object examples/training/CMakeFiles/llama-finetune.dir/finetune.cpp.o
[ 87%] Built target llama-passkey
[ 87%] Linking CXX executable ../../bin/llama-speculative-simple
[ 87%] Built target llama-parallel
[ 87%] Linking CXX executable ../../bin/llama-speculative
[ 87%] Built target llama-retrieval
[ 87%] Linking CXX executable ../../bin/llama-finetune
[ 87%] Linking CXX executable ../../bin/llama-gen-docs
[ 87%] Building CXX object examples/diffusion/CMakeFiles/llama-diffusion-cli.dir/diffusion-cli.cpp.o
[ 87%] Building CXX object examples/model-conversion/CMakeFiles/llama-logits.dir/logits.cpp.o
[ 87%] Building CXX object examples/convert-llama2c-to-ggml/CMakeFiles/llama-convert-llama2c-to-ggml.dir/convert-llama2c-to-ggml.cpp.o
[ 87%] Built target llama-save-load-state
[ 88%] Linking CXX executable ../../bin/llama-diffusion-cli
[ 88%] Built target llama-speculative-simple
[ 89%] Linking CXX executable ../../bin/llama-convert-llama2c-to-ggml
[ 89%] Linking CXX executable ../../bin/llama-logits
[ 89%] Built target llama-speculative
[ 89%] Building CXX object pocs/vdot/CMakeFiles/llama-vdot.dir/vdot.cpp.o
[ 89%] Built target llama-gen-docs
[ 89%] Built target llama-finetune
[ 89%] Building CXX object pocs/vdot/CMakeFiles/llama-q8dot.dir/q8dot.cpp.o
[ 90%] Building CXX object tools/batched-bench/CMakeFiles/llama-batched-bench.dir/batched-bench.cpp.o
[ 90%] Linking CXX executable ../../bin/llama-vdot
[ 90%] Building CXX object tools/gguf-split/CMakeFiles/llama-gguf-split.dir/gguf-split.cpp.o
[ 90%] Building CXX object tools/imatrix/CMakeFiles/llama-imatrix.dir/imatrix.cpp.o
[ 90%] Built target llama-diffusion-cli
[ 90%] Linking CXX executable ../../bin/llama-q8dot
[ 90%] Built target llama-convert-llama2c-to-ggml
[ 90%] Built target llama-logits
[ 91%] Linking CXX executable ../../bin/llama-gguf-split
[ 91%] Linking CXX executable ../../bin/llama-imatrix
[ 91%] Linking CXX executable ../../bin/llama-batched-bench
[ 91%] Building CXX object tools/llama-bench/CMakeFiles/llama-bench.dir/llama-bench.cpp.o
[ 91%] Building CXX object tools/perplexity/CMakeFiles/llama-perplexity.dir/perplexity.cpp.o
[ 91%] Building CXX object tools/main/CMakeFiles/llama-cli.dir/main.cpp.o
[ 91%] Built target llama-vdot
[ 92%] Linking CXX executable ../../bin/llama-bench
[ 92%] Built target llama-q8dot
[ 93%] Linking CXX executable ../../bin/llama-perplexity
[ 93%] Linking CXX executable ../../bin/llama-cli
[ 93%] Building CXX object tools/quantize/CMakeFiles/llama-quantize.dir/quantize.cpp.o
[ 94%] Generating loading.html.hpp
[ 94%] Built target llama-imatrix
[ 94%] Built target llama-gguf-split
[ 94%] Built target llama-batched-bench
[ 95%] Linking CXX executable ../../bin/llama-quantize
[ 95%] Generating index.html.gz.hpp
[ 95%] Building CXX object tools/run/CMakeFiles/llama-run.dir/run.cpp.o
[ 95%] Building CXX object tools/tokenize/CMakeFiles/llama-tokenize.dir/tokenize.cpp.o
[ 95%] Built target llama-bench
[ 95%] Building CXX object tools/tts/CMakeFiles/llama-tts.dir/tts.cpp.o
[ 95%] Built target llama-cli
[ 96%] Building CXX object tools/mtmd/CMakeFiles/llama-mtmd-cli.dir/mtmd-cli.cpp.o
[ 97%] Linking CXX executable ../../bin/llama-tokenize
[ 97%] Building CXX object tools/run/CMakeFiles/llama-run.dir/linenoise.cpp/linenoise.cpp.o
[ 97%] Built target llama-perplexity
[ 97%] Linking CXX executable ../../bin/llama-tts
[ 97%] Built target llama-quantize
[ 97%] Building CXX object tools/cvector-generator/CMakeFiles/llama-cvector-generator.dir/cvector-generator.cpp.o
[ 97%] Linking CXX executable ../../bin/llama-mtmd-cli
[ 98%] Linking CXX executable ../../bin/llama-run
[ 98%] Building CXX object tools/export-lora/CMakeFiles/llama-export-lora.dir/export-lora.cpp.o
[ 98%] Linking CXX executable ../../bin/llama-cvector-generator
[ 98%] Linking CXX executable ../../bin/llama-export-lora
[ 98%] Built target llama-tokenize
[ 98%] Built target llama-tts
[ 98%] Built target llama-mtmd-cli
[ 98%] Built target llama-run
[ 98%] Built target llama-cvector-generator
[ 98%] Built target llama-export-lora
[ 99%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-queue.cpp.o
[ 99%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-task.cpp.o
[100%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-context.cpp.o
[100%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-models.cpp.o
[100%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server.cpp.o
[100%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-http.cpp.o
[100%] Building CXX object tools/server/CMakeFiles/llama-server.dir/server-common.cpp.o
[100%] Linking CXX executable ../../bin/llama-server
[100%] Built target llama-server
# download the gguf model and save to ~/gguf/
./llama.cpp/build/bin/llama-server -m ~/gguf/gpt-oss-20b-mxfp4.gguf --ctx-size 0 --jinja -ub 2048 -b 2048
```

# upload a pdf to test

![Screenshot%202025-12-01%20at%206.20.53%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.20.53%E2%80%AFPM.png)
![Screenshot%202025-12-01%20at%206.39.33%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.39.33%E2%80%AFPM.png)
![Screenshot%202025-12-01%20at%206.40.43%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.40.43%E2%80%AFPM.png)
![Screenshot%202025-12-01%20at%206.40.54%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.40.54%E2%80%AFPM.png)
![Screenshot%202025-12-01%20at%206.41.06%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.41.06%E2%80%AFPM.png)
![Screenshot%202025-12-01%20at%206.21.12%E2%80%AFPM.png](Screenshot%202025-12-01%20at%206.21.12%E2%80%AFPM.png)

**“Attention Is All You Need” – Summary**

| Topic | Key Points |
|-------|------------|
| **Motivation** | Existing encoder–decoder models for sequence transduction rely on RNNs or convolutions, which force a largely sequential computation that limits parallelism and makes learning long‑range dependencies difficult. |
| **Core Idea** | Replace all recurrent or convolutional layers with **self‑attention** (scaled dot‑product attention) and feed‑forward networks, yielding the **Transformer** architecture. |
| **Model Architecture** |  • **Encoder** – 6 identical layers, each with: 1) multi‑head self‑attention, 2) position‑wise feed‑forward network. <br>  • **Decoder** – 6 identical layers, each with: 1) masked multi‑head self‑attention, 2) encoder‑decoder multi‑head attention, 3) feed‑forward network. <br>  • Residual connections + layer‑norm around every sub‑layer. <br>  • All tensors are of dimension \(d_{\text{model}} = 512\) (base) or 1024 (big). <br>  • Multi‑head attention: 8 heads, each with \(d_k = d_v = 64\). |
| **Attention Mechanism** |  • **Scaled dot‑product**: \(\text{Attention}(Q,K,V)=\text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V\). <br>  • **Multi‑head**: project queries, keys, values into \(h\) sub‑spaces, attend in parallel, concatenate results, and linearly project back. <br>  • Masks prevent a decoder position from attending to future positions. |
| **Position Encoding** | Since there is no recurrence or convolution, positional information is injected by adding deterministic sinusoidal encodings (or optionally learned embeddings). Sinusoids allow the model to extrapolate to longer sequences. |
| **Feed‑Forward Layer** | Two linear transforms with a ReLU in between: \( \text{FFN}(x)=\text{max}(0, xW_1+b_1)W_2+b_2\). Hidden size \(d_{\text{ff}} = 2048\) (base). |
| **Training Details** | • Data: WMT 2014 English‑German (≈4.5 M pairs) and English‑French (≈36 M). <br> • Tokenisation: Byte‑Pair Encoding (≈37 k vocab) or word‑piece (32 k). <br> • Optimiser: Adam with warm‑up schedule (4000 steps). <br> • Regularisation: dropout (0.1 on base, 0.3 on big), label‑smoothing (ε=0.1). <br> • Hardware: 8×P100 GPUs. Base trained 12 h (~100k steps); big trained 3.5 days (~300k steps). |
| **Results** | • **English→German**: big model achieves 28.4 BLEU, surpassing all previous single models and ensembles by >2 BLEU. <br> • **English→French**: big model achieves 41.8 BLEU, beating all single models and beating ensembles by ~1 BLEU. <br> • Training cost is far lower than prior state‑of‑the‑art systems (≈1/4–1/10 of FLOPs). |
| **Ablation / Variant Studies** | • Reducing heads or key/value dimensions hurts performance. <br> • Larger models (d_model=1024) improve BLEU. <br> • Dropout is critical to avoid over‑fitting. <br> • Learned positional embeddings perform almost as well as sinusoids. |
| **Generalisation to Other Tasks** | Applied the same architecture to **English constituency parsing** (WSJ). A 4‑layer transformer achieved 92.7 F1 (WSJ‑only) and 93.0 F1 (multi‑task), matching or surpassing specialised parsers. |
| **Insights & Interpretability** | Attention visualisations show heads learning syntactic/semantic patterns (e.g., long‑range dependencies, anaphora resolution). |
| **Contributions & Impact** | 1. First end‑to‑end model based solely on attention. 2. Demonstrates that removing recurrence/convolution can improve both speed and translation quality. 3. Provides a flexible, highly parallel architecture that can be applied beyond MT (e.g., parsing). 4. Introduces efficient training tricks (scaled dot‑product, multi‑head, positional encoding). 5. Code released in Tensor2Tensor. |

**Take‑away**: The Transformer shows that all sequence‑to‑sequence tasks can be solved with a simple stack of self‑attention and feed‑forward layers, achieving state‑of‑the‑art performance while being far more parallelisable and computationally efficient than RNN‑based counterparts.
