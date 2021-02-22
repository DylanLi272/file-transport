cd
mkdir RISCV
cd RISCV

git clone --recursive https://github.com/riscv/riscv-gnu-toolchain
git clone https://github.com/riscv/riscv-pk
git clone https://github.com/riscv/riscv-isa-sim

export RISCV=/home/username/RISCV
export PATH=$PATH:$RISCV/bin

cd riscv-gnu-toolchain
mkdir build
cd build
../configure --prefix=$RISCV --with-arch=rv32i
make

cd ../riscv-pk
mkdir build
cd build
../configure --prefix=$RISCV --host=riscv32-unknown-elf
make
make install

cd ../riscv-isa-sim
mkdir build
cd build
../configure --prefix=$RISCV --enable-histogram
make
make install
