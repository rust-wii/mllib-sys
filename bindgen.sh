#!/usr/bin/env bash

clang_version=$1

if [ -z "$clang_version" ]; then
    echo "  usage: ./bindgen.sh <clang_version>"
    echo "example: ./bindgen.sh 5.0.0"
    echo "Check your current version with \`clang -v\`."
    exit 1
fi

set -euxo pipefail

# Variables
DEVKITPRO="C:/devkitpro"
DEVKITPPC="C:/devkitpro/devkitPPC"
CLANGINCLUDE="C:/Program_Files/LLVM/lib/clang/8.0.0/include/"
OGCINCLUDE="C:/devkitPro/libogc/include/"

bindgen "$DEVKITPRO/MLlib/include/MLlib.h" \
    -o src/mllib.rs \
    --rust-target nightly \
    --use-core \
    --distrust-clang-mangling \
    --no-layout-tests \
    --ctypes-prefix "::libc" \
    --no-prepend-enum-name \
    --generate "functions,types,vars" \
    --blacklist-type "u(8|16|32|64|128)" \
    --blacklist-type "i(8|16|32|64|128)" \
    --blacklist-type "f(32|64)" \
    -- \
    --target=powerpc-none-eabi \
    --sysroot=$DEVKITPPC/powerpc-eabi \
    -isystem$DEVKITPPC/powerpc-eabi/include/** \
    -isystem$CLANGINCLUDE/** \
    -I$DEVKITPRO/MLlib/include/** \
    -I$OGCINCLUDE \
    -I$OGCINCLUDE/ogc \
    -I$DEVKITPPC/lib/gcc/powerpc-eabi/8.3.0/include \
    -I$DEVKITPPC/lib/gcc/powerpc-eabi/8.3.0/include-fixed \
    -mfloat-abi=hard \
    -nostdinc \
    -Wno-macro-redefined \
    -Wno-incompatible-library-redeclaration \
    -DHW_RVL
