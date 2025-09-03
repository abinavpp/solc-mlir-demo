# solc-mlir

**solc-mlir** is an MLIR-based compiler for Solidity, derived from solc 0.8.30.
Read more about it [here](solc-mlir.md). It's currently hosted at [era-solidity
(mlir branch)](https://github.com/matter-labs/era-solidity/tree/mlir).

The biggest improvement currently is compile-time (**upto 16x** faster with
multi-threaded lowering), especially in the presence of multiple contracts where
we utilize a multi-threaded lowering pipeline. See the current improvements
[here](solc-mlir.md#parallel-compilation).

You can download the solc-mlir binaries from the `release-<platform>` binaries
under "Artifacts"
[here](https://github.com/matter-labs/era-solidity/actions/runs/17426954675).
Upstream solc binaries can be found
[here](https://github.com/argotorg/solidity/releases/tag/v0.8.30)


---

## Usage

To compile with the MLIR-based compiler:

```bash
<solc-mlir> --standard-json mlir.json
```

To compile with the upstream compiler (via-ir):

```bash
<us-solc> --standard-json via-ir.json
```

To print the IR at different stages, run:

```bash
<solc-mlir> --mlir-target=evm --mlir-action=<action> erc20.sol
```

where `<action>` can one of:
- `print-init`: High level IR
- `print-std-mlir`: Standard dialect
- `print-llvm-ir`: LLVM IR
- `print-asm`: Assembly

## Build

To build solc-mlir from source:

```bash
# Build LLVM
git clone -b app-mlir https://github.com/matter-labs/era-compiler-llvm
mkdir -p era-compiler-llvm/build
cd era-compiler-llvm/build
cmake \
  ../llvm \
  -G Ninja \
  '-DLLVM_ENABLE_RTTI=ON' \
  '-DCMAKE_BUILD_TYPE=Release' \
  '-DLLVM_ENABLE_PROJECTS=mlir;lld' \
  '-DLLVM_TARGETS_TO_BUILD=EraVM;EVM'
ninja
cd ../..

# Build solc-mlir
git clone -b mlir https://github.com/matter-labs/era-solidity
mkdir -p era-solidity/build
cd era-solidity/build
cmake \
  .. \
  -G Ninja \
  '-DCMAKE_BUILD_TYPE=Release' \
  '-DMLIR_DIR=<llvm-build>/lib/cmake/mlir' \
  '-DLLD_DIR=<llvm-build>/lib/cmake/lld'
  # Where <llvm-build> is the *absolute* path to the llvm build.
ninja

# Run solc-mlir
solc/solc --version
```
