#!/bin/bash


 # using llvm
 module use /sw/summit/modulefiles/ums/stf010/Core
# module load llvm/14.0.0-latest cuda
 module load llvm/12.0.0-20210125 cuda
 
# clang++ -Ofast -std=c++17 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o t2g
clang++ -Ofast -DSCHED_ROUNDROBIN -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_static_rr
clang++ -Ofast -DSCHED_RANDOM -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_dynamic_random
#clang++ -Ofast -DSCHED_DYNAMIC -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_dynamic_occ
clang++ -Ofast -DSCHED_DYNAMIC2 -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_dynamic_occ2
#clang++ -Ofast -DSCHED_ADAPTIVE -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_dynamic_ad
clang++ -Ofast -DSCHED_ADAPTIVE2 -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o ./bin/bench_dynamic_ad2


# clang++ -Ofast -std=c++14 -fopenmp  -fopenmp-targets=nvptx64-nvida-cuda --cuda-path=${OLCF_CUDA_ROOT} ./task2gpu_bench.cpp -o 
 
 # using xl
 #module load xl/16.1.1-10
 #xlc -std=c++17 -qsmp=omp -qoffload ./task2gpu_bench.cpp -o t2g





