# D&amp;D dice
Awesome D&amp;D digital dice (d20) with supreme distributional fairness (mersenne twister 64 bit)

## Dependencies:
* GTK 3.0
```
sudo apt install libgtk-3-dev
```

## How to build:
```
mkdir -p build
cd build && cmake .. && make -j 4
```

## How to run:
```
make run
make memcheck
```
