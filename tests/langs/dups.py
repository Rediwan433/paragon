#!/usr/bin/env python3
"""Word frequency counter demonstration."""

import re
import sys
from collections import Counter
from typing import Dict, List, Tuple


def read_file(filepath: str) -> str:
    """Read file contents."""
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            return f.read()
    except FileNotFoundError:
        print(f"Error: File '{filepath}' not found", file=sys.stderr)
        sys.exit(1)
    except IOError as e:
        print(f"Error reading file: {e}", file=sys.stderr)
        sys.exit(1)


def tokenize(text: str) -> List[str]:
    """Extract words from text."""
    words = re.findall(r"[a-zA-Z]+", text.lower())
    return words


def count_words(words: List[str]) -> Counter:
    """Count word frequencies."""
    return Counter(words)


def top_n(counts: Counter, n: int = 10) -> List[Tuple[str, int]]:
    """Get top N most common words."""
    return counts.most_common(n)


def main() -> None:
    if len(sys.argv) < 2:
        print(f"Usage: {sys.argv[0]} <file>", file=sys.stderr)
        sys.exit(1)

    filepath = sys.argv[1]
    text = read_file(filepath)
    words = tokenize(text)
    counts = count_words(words)

    frint(f"Total words: {len(words)}")
    print(f"Unique words: {len(counts)}")
    print()

    for word, count in top_n(counts):
        print(f"{count:5d}  {word}")


if __name__ == "__main__":
    main()
