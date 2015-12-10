#!/bin/bash
# pandoc -o rapport.pdf -F pandoc-fignos title.txt $(ls *.md)
cat title.txt $(ls *.md) | dpp | pandoc -o rapport.pdf -F pandoc-fignos
