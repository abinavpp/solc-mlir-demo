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
linux/solc --mlir-target=evm --mlir-action=<action> erc20.sol
```

where `<action>` can one of:
- `print-init`: High level IR
- `print-std-mlir`: Standard dialect
- `print-llvm-ir`: LLVM IR
- `print-asm`: Assembly
