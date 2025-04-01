# Assignment 1: Getting Acquainted with UNIX and C

This assignment asks us to create a bash script that, through the utilization of Gnuplot, outputs various plots of the Collatz sequence. The Collatz sequence data was generated from the given program collatz.c. 
The first plot graphs the lengths of the Collatz sequences from 2 to 10,000. The second graph plots the maximum values of the Collatz sequences from 2 to 10,000.
The third graph reveals the frequency of each Collatz sequence length of the numbers from 2 to 10,000. The fourth plot I created graphs the relationship of 100 random seeds and the
corresponding sequence lengths (collatz.c was run randomly 100 times). Since it was run randomly, the values of the seeds for each of the runs is unknown (unlike their sequence lengths, which were measured.)

## How to Build the Program:

In order to run the bash script, the collatz.c program has to be compiled first. The given Makefile takes care of the compilation process of this program. In order to compile collatz.c (and run the bash script),
either enter `$ make collatz` or `$ clang -Wall -Wpedantic -Werror -Wextra -o collatz collatz.c`. However, because a bash script can conveniently automate building the program, my bash script already has the 
command `$ make collatz` to build collatz.c.  

## How to Run the Program:

In order to run the bash script, enter the command `$ ./plot.sh`. 

## Cleaning the Program:

Not only can it build collatz.c, but the Makefile can also clean up any binary files created from the compilation process. Although my bash script already cleans up any .o files using the 
given Makefile, in order to manually clean up this unnecessary files, simply type `$ make clean`.

