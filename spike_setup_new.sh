cd
mkdir RISCV
cd RISCV
mkdir bin
export RISCV=/home/username/RISCV/
 
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
rm -rf build && mkdir build && cd build
../configure --prefix=$RISCV --with-arch=rv32i --with-abi=ilp32 --with-xlen=32
make -j8
 
cd ../..

export PATH=$PATH:$RISCV/bin
 
git clone https://github.com/riscv/riscv-pk.git
cd riscv-pk
rm -rf build && mkdir build && cd build
../configure --prefix=$RISCV --host=riscv32-unknown-elf --enable-32bit
sed -i 's:-m32::g' Makefile
make -j8
make install
 
cd ../..

git clone https://github.com/riscv/riscv-isa-sim.git
cd riscv-isa-sim
rm -rf build && mkdir build && cd build
../configure --prefix=$RISCV --with-fesvr=$RISCV --with-isa=rv32i --enable-histogram --with-xlen=32
make -j8
make install
