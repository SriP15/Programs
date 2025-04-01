#!/bin/bash

make clean && make collatz

#Plotting Graph One

#checking to make sure data file does not already exist for the Collatz Sequence Length graph
#I got the tip to make the code for the graphs "idempotent" by watching Eugene's Assignment 1 section.
if [[ -f /tmp/CollatzLength.dat ]]; then rm -f /tmp/CollatzLength.dat; fi

#creating data for Collatz Sequence Length graph
for i in {2..10000}; do echo $i `./collatz -n $i | wc -l` >> /tmp/CollatzLength.dat; done

#setting specifications for gnuplot graph
#I got the information on how to set the key off by reading the Gnuplot documentation given
#in the assignment 1 document (see http://gnuplot.info/docs_5.4/Gnuplot_5_4.pdf)
gnuplot <<END
        set terminal pdf
        set output "CollatzSequenceLengths.pdf"
        set title "Collatz Sequence Lengths"
        set xlabel "n"
        set ylabel "length"
        set key off
        plot "/tmp/CollatzLength.dat" with dots
END


#Plotting Graph Two

#checking to make sure data file does not already exist for the Maximum Collatz Sequence Value graph
#(I got the tip to make the code for the graphs "idempotent" by watching Eugene's Assignment 1 section.)
if [[ -f /tmp/MaxCollatz.dat ]]; then rm -f /tmp/MaxCollatz.dat; fi		 

#creating data for Maximum Collatz Sequence Value graph
for i in {2..10000}; do echo $i `./collatz -n $i | sort -nr | head -n 1` >> /tmp/MaxCollatz.dat; done

#setting specifications for gnuplot graph
#I got the information on how to set the y-range by reading the Gnuplot documentation given
#in the assignment 1 document (see http://gnuplot.info/docs_5.4/Gnuplot_5_4.pdf)
gnuplot <<END
        set terminal pdf
        set output "MaximumCollatzSequenceValue.pdf"
        set title "Maximum Collatz Sequence Value"
        set xlabel "n"
        set ylabel "value"
        set key off
        plot [] [0:100000] "/tmp/MaxCollatz.dat" with dots
END


#Plotting Graph Three

#checking to make sure data file does not already exist for the Collatz Sequence Length Histogram
#(I got the tip to make the code for the graphs "idempotent" by watching Eugene's Assignment 1 section.)
if [[ -f /tmp/CollatzFrequency.dat ]]; then rm -f /tmp/CollatzFrequency.dat; fi

#creating data for Collatz Sequence Length Histogram
awk '{print $2}' /tmp/CollatzLength.dat | sort -n | uniq -c > /tmp/CollatzFrequency.dat 

#setting specifications for gnuplot graph
#I got the information on how to set the x-range, xtics, style, and boxwidth (and how the 'using' statement works) by reading the Gnuplot documentation given
#in the assignment 1 document (link given above) 
gnuplot <<END
        set terminal pdf
        set output "CollatzSequenceLengthHistogram.pdf"
        set title "Collatz Sequence Length Histogram"
	set xlabel "length"
	set ylabel "frequency"
        set style fill solid 1.0
        set boxwidth 0.4 absolute
        set key off
        set xtics 0,25,225 
        plot [0:225] [] "/tmp/CollatzFrequency.dat" using 2:1 with boxes
END


#Plotting Graph Four
#note: this graph may take a while to run, as it uses the command sleep 1

#checking to make sure data file does not already exist for the Collatz Sequence Length Histogram
#(I got the tip to make the code for the graphs "idempotent" by watching Eugene's Assignment 1 section.)
if [[ -f /tmp/randcollatz.dat ]]; then rm -f /tmp/randcollatz.dat; fi

#creating data for Random Collatz Sequence Length Graph
#I got the information on how to pause the computer by reading the man page on sleep
for i in {2..100}; do echo $i `(./collatz | wc -l)` >> /tmp/randcollatz.dat; sleep 1 ; done

#setting specifications for gnuplot graph
gnuplot <<END
 	set terminal pdf
        set output "randcollatz.pdf"
 	set title "Lengths of 100 Random Collatz Sequences (with different seeds)"
 	set xlabel "random sequence index number (max index is 100)"
        set ylabel "lengths"
        set key off
        plot "/tmp/randcollatz.dat" with points
END

