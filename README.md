# FORTH Interpreter in Haskell

## Overview

This project implements a basic FORTH interpreter in Haskell. FORTH is a stack-based, reverse Polish notation (RPN) programming language. The interpreter supports arithmetic operations, stack manipulation commands, string operations, and outputs results based on input files.

## Features Implemented

### Core Features

- **Arithmetic Operations:**  
  Supports `+`, `-`, `*`, `/`, and `^` (power).  
  Handles both integers and floats.  
  *Example:*  
  Input: `3 4 + .`  
  Output: `7`

- **Stack Manipulation:**  
  **DUP:** Duplicates the top element of the stack.  
  *Example:*  
  Input: `5 DUP`  
  Output: `Stack not empty:`

- **String Operations:**  
  **STR:** Converts a value to a string.  
  **CONCAT2:** Concatenates two strings.  
  **CONCAT3:** Concatenates three strings (with error handling for insufficient arguments).  
  *Example:*  
  Input: `"Hello" " World" CONCAT2 .`  
  Output: `Hello World`

- **Output Commands:**  
  **. (dot):** Outputs the top of the stack.  
  **EMIT:** Outputs the ASCII character corresponding to an integer.  
  **CR:** Outputs a newline.

- **Error Handling:**  
  - Stack underflow errors (e.g., insufficient arguments for operations).  
  - Division by zero errors.  
  - Type mismatch errors for commands like `CONCAT2` and `CONCAT3`.

## What's Working

- All core features are implemented and tested:
  - Arithmetic operations (`+`, `-`, `*`, `/`, `^`).
  - String operations (`STR`, `CONCAT2`, etc.).
  - Stack manipulation (`DUP`).
  - Output commands (`EMIT`, `.`, `CR`).
- Robust error handling:
  - Provides meaningful error messages for stack underflow, division by zero, and type mismatches.

## What's Not Working

- Floating-point precision may vary slightly due to Haskell's handling of floating-point arithmetic.
- Nested user-defined functions are not supported (e.g., calling one user-defined function inside another).
- Some edge cases for malformed input may not be handled gracefully (e.g., invalid syntax).

## How to Run the Program

### Prerequisites

- **GHC and Cabal:**  
  Install GHC and Cabal using [GHCup](https://www.haskell.org/ghcup/).

- **Update Cabal:**  
  ```bash
  cabal update

- **Build Cabal**
  ```bash
  cd /path/to/FORTH
