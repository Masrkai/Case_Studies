# Default option is 7 (Do all)
OPTION=${1:-7}

# Input file (constant)
INPUT_FILE="vector_test.cpp"

# Output file names
OPT_OUT="vector_test"
UNOPT_OUT="vector_test_basic"

# Common ASM flags
COMMON_ASM_FLAGS="-fverbose-asm"

# Optimization-specific flags
OPT_FLAGS="-O3 -march=native -ftree-vectorize -fopt-info-vec-missed -fopt-info-vec-optimized -fopt-info-vec-note"
UNOPT_FLAGS="-O0"

case $OPTION in
    1)
        echo "Compiling optimized ASM..."
        g++ $OPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${OPT_OUT}.s"
        echo "Output: ${OPT_OUT}.s"
        ;;
    2)
        echo "Compiling optimized Executable ELF binary..."
        g++ $OPT_FLAGS -c "$INPUT_FILE" -o "${OPT_OUT}.o"
        echo "Output: ${OPT_OUT}.o"
        ;;
    3)
        echo "Compiling un-optimized ASM..."
        g++ $UNOPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${UNOPT_OUT}.s"
        echo "Output: ${UNOPT_OUT}.s"
        ;;
    4)
        echo "Compiling un-optimized Executable ELF binary..."
        g++ $UNOPT_FLAGS -c "$INPUT_FILE" -o "${UNOPT_OUT}.o"
        echo "Output: ${UNOPT_OUT}.o"
        ;;
    5)
        echo "Compiling both ASM versions..."
        g++ $OPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${OPT_OUT}.s"
        g++ $UNOPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${UNOPT_OUT}.s"
        echo "Outputs: ${OPT_OUT}.s and ${UNOPT_OUT}.s"
        ;;
    6)
        echo "Compiling both Executable ELF binaries..."
        g++ $OPT_FLAGS -c "$INPUT_FILE" -o "${OPT_OUT}.o"
        g++ $UNOPT_FLAGS -c "$INPUT_FILE" -o "${UNOPT_OUT}.o"
        echo "Outputs: ${OPT_OUT}.o and ${UNOPT_OUT}.o"
        ;;
    7)
        echo "Compiling all versions (ASM and ELF binaries)..."
        # Optimized versions
        g++ $OPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${OPT_OUT}.s"
        g++ $OPT_FLAGS -c "$INPUT_FILE" -o "${OPT_OUT}.o"
        # Un-optimized versions
        g++ $UNOPT_FLAGS $COMMON_ASM_FLAGS -S "$INPUT_FILE" -o "${UNOPT_OUT}.s"
        g++ $UNOPT_FLAGS -c "$INPUT_FILE" -o "${UNOPT_OUT}.o"
        echo "Outputs: ${OPT_OUT}.s, ${OPT_OUT}.o, ${UNOPT_OUT}.s, ${UNOPT_OUT}.o"
        ;;
    *)
        echo "Invalid option: $OPTION"
        echo "Usage: $0 [1-7]"
        echo "  1: compile optimized ASM"
        echo "  2: compile optimized Executable ELF binary"
        echo "  3: compile un-optimized ASM"
        echo "  4: compile un-optimized Executable ELF binary"
        echo "  5: compile both's ASM"
        echo "  6: compile both's Executable ELF binary"
        echo "  7: Do all (5 & 6) - default"
        exit 1
        ;;
esac