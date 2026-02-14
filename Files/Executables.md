# Executable Binary Formats

## Overview

An **executable** is compiled source code produced by a **compiler**. This document describes the six primary binary file formats used for executables, object code, and shared libraries across different operating systems.

---

## Binary Format Reference

### 1. ELF (Executable and Linkable Format)

| Attribute | Details |
|-----------|---------|
| **Platforms** | Linux, BSD, and Unix-like systems |
| **Extensions** | none, `.so`, `.o` |
| **Supports** | Executables, object files, shared libraries, core dumps |

The modern standard for Unix-like systems. Features a flexible, extensible, and platform-independent design.

---

### 2. PE (Portable Executable)

| Attribute | Details |
|-----------|---------|
| **Platforms** | Windows |
| **Extensions** | `.exe`, `.dll`, `.sys` |
| **Derived from** | COFF |

Contains headers, sections, and optional data directories.

---

### 3. Mach-O (Mach Object)

| Attribute | Details |
|-----------|---------|
| **Platforms** | macOS, iOS, Apple systems |
| **Extensions** | none, `.dylib`, `.bundle` |
| **Special feature** | "Fat" (universal) binaries supporting multiple architectures |

---

### 4. COFF (Common Object File Format)

| Attribute | Details |
|-----------|---------|
| **Platforms** | Legacy Unix (System V) |
| **Extensions** | `.o` |
| **Status** | Historical base for PE and ELF predecessor |

Simpler design, less extensible than modern formats.

---

### 5. a.out (Assembler Output)

| Attribute | Details |
|-----------|---------|
| **Platforms** | Legacy Unix |
| **Extensions** | none |
| **Status** | **Obsolete** — replaced by ELF and COFF |

Original Unix binary format; lacked shared library support.

---

### 6. COM (Command file)

| Attribute | Details |
|-----------|---------|
| **Platforms** | MS-DOS |
| **Extensions** | `.com` |
| **Limitations** | No headers, 64KB size limit, fixed load address |

Minimal format containing raw machine code only.

---

## Quick Comparison

| Format | Platform | Extensions | Status |
|--------|----------|------------|--------|
| **ELF** | Linux, BSD, Unix | none, `.so`, `.o` | **Current standard** |
| **PE** | Windows | `.exe`, `.dll` | **Current standard** |
| **Mach-O** | macOS, iOS | none, `.dylib` | **Current standard** |
| **COFF** | Legacy Unix | `.o` | Legacy |
| **a.out** | Legacy Unix | none | Obsolete |
| **COM** | DOS | `.com` | Obsolete |

---

## Key Concepts

All formats handle:

- **Code and data organization** — memory layout and segmentation
- **Symbol resolution** — linking external references
- **OS loading** — how the operating system loads and executes the program
