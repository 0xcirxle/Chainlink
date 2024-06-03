#!/bin/bash

# Command 1: Calculate the witness using snarkjs
node ../ZK/generate_witness.js ../ZK/VerifyEmail.wasm ../ZK/input.json ../ZK/witness.wtns

# Command 2: Generate the witness using node
snarkjs groth16 prove ../ZK/VerifyEmail.zkey ../ZK/witness.wtns proof.json public.json


# Command 3: Generate call data using snarkjs
snarkjs generatecall > output.txt

