#!/bin/bash

for i in {1..10}; do
  echo "Running Test t$i.4TH..."
  cabal run FORTH tests/t$i.4TH
done
