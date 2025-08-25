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
