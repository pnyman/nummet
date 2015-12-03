#!/bin/bash
pandoc -o rapport.pdf -F pandoc-fignos title.txt $(ls *.md)

