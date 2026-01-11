# PUNJ++ Compiler – Phase 2

## Overview

**PUNJ++ (Punjabi Programming Language Plus Plus)** is a high-level programming language designed for Punjabi speakers, aimed at simplifying programming by replacing traditional English syntax with Roman Punjabi expressions. The language preserves procedural and block-structured programming styles while making logic intuitive and accessible.

This repository contains **Phase 2** of the compiler project, which includes both the **lexical analyzer** and **syntax parser**, allowing users to process valid and invalid PUNJ++ programs.

---

## Features

- Uses **Roman Punjabi keywords** for natural readability.
- Case-sensitive language similar to C++.
- Supports **procedural programming** with **block structure**.
- Retains standard operators and data types from C++.
- Implements **input/output** with `likh` and `dass`.
- Custom operators for arithmetic and comparison:
  - `<+>` → Add and assign
  - `<->` → Equal comparison
  - `<!>` → Not equal
  - `++>` → Increment
- Punjabi-inspired **keywords** for control structures:

| Keyword  | Meaning                    | C++ Equivalent        |
|----------|----------------------------|---------------------|
| fher     | Conditional check          | if                  |
| nahiTa   | Otherwise                  | else                |
| jadTak   | Loop until fail            | while               |
| kaam     | Loop                       | for                 |
| chakkar  | Repeat loop                | do-while            |
| rok      | Break                      | break               |
| jaari    | Continue                   | continue            |
| morjaa   | Return value               | return              |
| nava     | New                        | new                 |
| class    | Class declaration          | class               |
| dekh     | Switch-like structure      | switch              |
| halat    | Case condition             | case                |
| mukao    | Default case               | default             |

- Custom punctuations:
  - `:::` → Start of block
  - `:::;` → End of block
  - `~>` → Statement terminator
  - `<>` → Custom separator

---

## Repository Structure

```
phase2codetry/
│
├── scanner.l          # Lexical analyzer (Flex)
├── parser.y           # Syntax parser (Bison)
├── parser.tab.c       # Generated parser source file
├── parser.tab.h       # Generated parser header file
├── lex.yy.c           # Generated lexer source file
├── compilor           # Executable compiler
├── valid_test.txt     # Sample valid PUNJ++ programs
├── invalid_test.txt   # Sample invalid PUNJ++ programs
├── results.txt        # Optional output log file
└── .vscode/           # VSCode settings
```

---

## Installation and Compilation

Ensure you have **Flex**, **Bison**, and **GCC** installed on your system.

### Step 1: Generate the parser

```bash
bison -d parser.y
```

This generates:

- `parser.tab.c` → Parser source file  
- `parser.tab.h` → Parser header file

---

### Step 2: Generate the lexer

```bash
flex scanner.l
```

This generates:

- `lex.yy.c` → Lexer source file

---

### Step 3: Compile the compiler

```bash
gcc lex.yy.c parser.tab.c -o compilor
```

This produces the executable `compilor`.

---

## Usage

### Run the compiler on a valid PUNJ++ program:

```bash
./compilor valid_test.txt
```

### Run the compiler on an invalid PUNJ++ program:

```bash
./compilor invalid_test.txt
```

The compiler will parse the program, identify lexical and syntactic errors, and display results accordingly.

---

## Example

### Sample Valid PUNJ++ Code (`valid_test.txt`)

```
int x ~>
x <+> 10 ~>
fher (x <-> 10) :::
dass << x ~>
:::
```

Equivalent C++ code:

```cpp
int x;
x = x + 10;
if (x == 10) {
    cout << x;
}
```

---

## Notes

- **Lexical analyzer** (`scanner.l`) recognizes identifiers, numbers, strings, characters, comments, and invalid tokens.
- **Parser** (`parser.y`) uses **CFG rules** to parse declarations, assignments, loops, conditional statements, and I/O statements.
- **Custom punctuations** like `:::`, `:::;`, `~>`, and `<>` are used to improve readability and block separation.

---

## Authors

**Talha Mudassar** – L1F22BSCS0379  

Phase 2 – Compiler Construction Project  

---

## License

This project is for **educational purposes** and can be freely used or modified for learning compiler construction.
