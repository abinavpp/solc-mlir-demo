# solc-mlir

**solc-mlir** is an MLIR-based compiler for Solidity, derived from solc 0.8.30.
The bundled **solc** binary is the official upstream Solidity compiler
(v0.8.30).

---

## Usage

To compile with the MLIR-based compiler in linux:

```bash
linux/solc-mlir --standard-json mlir.json
```

To compile with the upstream compiler (via-ir) in linux:

```bash
linux/solc --standard-json via-ir.json
```

To print the IR at different stages, run:

```bash
linux/solc-mlir --mlir-target=evm --mlir-action=<action> erc20.sol
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

# Build solc-mlir
git clone -b mlir https://github.com/matter-labs/era-solidity
mkdir -p era-solidity/build
cd era-solidity/build
cmake \
  .. \
  -G Ninja \
  '-DCMAKE_BUILD_TYPE=Release' \
  '-DMLIR_DIR=<llvm-build>/lib/cmake/mlir' \
  '-DLLD_DIR=<llvm-build>lib/cmake/lld'
# Where <llvm-build> is the build directory path of llvm
```
