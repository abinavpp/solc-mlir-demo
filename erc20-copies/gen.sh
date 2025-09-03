#! /bin/bash

> out.sol

for ((i=0; i<= $1; i++)); do
 echo "contract ERC20_$i {" >> out.sol
 cat suffix.sol >> out.sol
done
