#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# ci.sh — simple, robust local CI/build script for the CMake project
# Usage: ./ci.sh [build-dir] [config]
# Defaults: build-dir=build, config=Release

BUILD_DIR=${1:-build}
CONFIG=${2:-Release}

echo "[ci] Build dir: ${BUILD_DIR}, Config: ${CONFIG}"

command -v cmake >/dev/null 2>&1 || { echo "cmake not found in PATH" >&2; exit 1; }
command -v ctest >/dev/null 2>&1 || { echo "ctest not found in PATH" >&2; exit 1; }

if [ -d "${BUILD_DIR}" ]; then
  echo "[ci] Removing existing ${BUILD_DIR} (rm -rf)"
  rm -rf "${BUILD_DIR}"
fi

echo "[ci] Creating ${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
pushd "${BUILD_DIR}" >/dev/null

trap 'popd >/dev/null' EXIT

echo "[ci] Configuring with cmake .."
cmake .. -DCMAKE_BUILD_TYPE=${CONFIG}

echo "[ci] Building (cmake --build . --config ${CONFIG})"
cmake --build . --config "${CONFIG}"

echo "[ci] Running tests (ctest --output-on-failure -C ${CONFIG})"
ctest --output-on-failure -C "${CONFIG}"

echo "[ci] Done"
