reset
set terminal postscript eps enhanced color dashed size 6,2.5
set output 'Gyroid.eps'
set multiplot layout 1,2

set border 3
set xtics 0.5,0.1,1.0 nomirror
set xlabel "water fraction"
set xrange [0.5:1.0]

set style line 1 dashtype 1 lw 3 lc 0
set style line 2 dashtype 2 lw 3 lc 1
set style line 3 dashtype 3 lw 3 lc 3
set style line 4 dashtype 4 lw 3 lc 4

set format y "%g%%"
set ylabel "contribution of Hooke energy"
set ytics 0,20,100 nomirror
set yrange [0:100]
plot "H1L1/P.dat" using 1:($3/$6*100) title 'P' with lines ls 1,\
	"H1L1/D.dat" using 1:($3/$6*100) title 'D' with lines ls 2,\
	"H1L1/G.dat" using 1:($3/$6*100) title 'G' with lines ls 3,\
	"H1L1/I-WP.dat" using 1:($3/$6*100) title 'I-WP' with lines ls 4

set format y "%.1e"
set ylabel "energy"
set ytics 0,1e-5,4e-5 nomirror
unset yrange
plot "CMC/G.dat" using 1:3 title 'CMC' with lines lw 3,\
	"H1L1/G.dat" using 1:6 title 'k_H=1' with lines lw 3,\
	"H1L5/G.dat" using 1:($6/5) title 'k_H=1/5' with lines lw 3,\
	"H1L9/G.dat" using 1:($6/9) title 'k_H=1/9' with lines lw 3
