#!/bin/bash

echo "% uname -m -o" > output.txt
uname -m -o >> output.txt 2>&1

echo -e "\n% ldd --version | head -n1" >> output.txt
ldd --version | head -n1 >> output.txt 2>&1

echo -e "\n% gcc -dumpmachine" >> output.txt
gcc -dumpmachine >> output.txt 2>&1

echo -e "\n% make" >> output.txt
make >> output.txt 2>&1

echo -e "\n% make conversion-dump" >> output.txt
make conversion-dump >> output.txt 2>&1

echo -e "\n% make try-dump" >> output.txt
make try-dump >> output.txt 2>&1 
