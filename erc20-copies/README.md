## Usage

To compare compile-time of `<num-copies>` erc20's:

```bash
./gen.sh <num-copies>

# To print compile-time of solx-mlir:
time <solx-mlir> --standard-json mlir.json > out

# To print compile-time of upstream solc --via-ir:
time <us-solc> --standard-json via-ir.json > out
