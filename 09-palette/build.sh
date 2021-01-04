#!/bin/bash

c_file_name="os"

echo ${c_file_name}

ShowTip() {
    if [ "0" -eq $? ]; then
        echo -e "\033[32m $1 \033[0m"
    else
        echo -e "\033[31m $2 \033[0m"
        exit
    fi
}

if [ "$1"x = "clear"x ]; then
    rm -rf ./bin
    rm -rf ${c_file_name}.asm
    echo -e "\033[32m clear successful \033[0m"
    exit
fi


mkdir -p bin
ShowTip "create bin dir successful" "create bin dir error"

gcc -m32 -fno-asynchronous-unwind-tables -s -c -o \
./bin/${c_file_name}.o ${c_file_name}.c
../objconv -fnasm ./bin/${c_file_name}.o -o ${c_file_name}.asm 
ShowTip "objconv write_vag.o successful" "objconv write_vag.o error"

# sed -e '/^global/d' ${c_file_name}.asm
# sed -e '/^SECTION/d' ${c_file_name}.asm
# sed -e '/^extern/d' ${c_file_name}.asm
cat ${c_file_name}.asm | sed -e '/^SECTION/d' | sed -e '/^global/d' | sed -e '/^extern/d' > ${c_file_name}.asm

nasm boot.asm -o ./bin/boot.bin
ShowTip "compile boot.asm successful" "compile boot.asm error"

nasm kernel.asm -o ./bin/kernel.bin
ShowTip "compile kernel.asm successful" "compile kernel.asm error"

#nasm boot_read5M.asm -o ./bin/boot.bat
#ShowTip "compile boot_read5M.asm successful" "compile boot_read5M.asm error"

javac HelloOS.java Floppy.java  -d ./bin/
cd ./bin
ShowTip "java  OperatingSystem" "java  OperatingSystem"
java  HelloOS
ShowTip "java  OperatingSystem successful " "java  OperatingSystem error"
cd ..

echo -e "\033[32m generate successful \033[0m"