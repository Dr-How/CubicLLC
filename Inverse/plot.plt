reset
set terminal postscript eps enhanced color dashed size 6,5
set output 'Inverse.eps'
set multiplot

set format y "%.1e"
set border 3
set xtics 0.5,0.1,1.0 nomirror
set xlabel "water fraction"
set ylabel "energy"
set xrange [0.5:1.0]
set size 0.5,0.5

set style line 1 dashtype 1 lw 3 lc 0
set style line 2 dashtype 2 lw 3 lc 1
set style line 3 dashtype 3 lw 3 lc 3
set style line 4 dashtype 4 lw 3 lc 4

set title "CMC"
set ytics 0,1e-4,4e-4 nomirror
set origin 0,0.5
plot "CMC/P.dat" using 1:3 title 'P' with lines ls 1,\
	"CMC/D.dat" using 1:3 title 'D' with lines ls 2,\
	"CMC/G.dat" using 1:3 title 'G' with lines ls 3,\
	"CMC/I-WP.dat" using 1:3 title 'I-WP' with lines ls 4

set title "k_H=k_L=1"
set ytics 0,2e-5,8e-5 nomirror
set origin 0.5,0.5
plot "H1L1/P.dat" using 1:6 title 'P' with lines ls 1,\
	"H1L1/D.dat" using 1:6 title 'D' with lines ls 2,\
	"H1L1/G.dat" using 1:6 title 'G' with lines ls 3,\
	"H1L1/I-WP.dat" using 1:6 title 'I-WP' with lines ls 4

set title "k_H=1, k_L=5"
set ytics 0,4e-5,2e-4 nomirror
set origin 0,0
plot "H1L5/P.dat" using 1:6 title 'P' with lines ls 1,\
	"H1L5/D.dat" using 1:6 title 'D' with lines ls 2,\
	"H1L5/G.dat" using 1:6 title 'G' with lines ls 3,\

set title "k_H=1, k_L=9"
set ytics 0,1e-4,4e-4 nomirror
set origin 0.5,0
plot "H1L9/P.dat" using 1:6 title 'P' with lines ls 1,\
	"H1L9/D.dat" using 1:6 title 'D' with lines ls 2,\
	"H1L9/G.dat" using 1:6 title 'G' with lines ls 3,\

unset title
unset key
unset xlabel
unset ylabel
set xzeroaxis
set format y "%.0e"
set size 0.3,0.2

set origin 0.2,0.2
set ytics -3e-6,1e-6,2e-6 nomirror
plot "H1L5/diff.dat" using 1:($2-$3) title 'difference of P and D' with lines ls 1,\

set origin 0.7,0.2
set ytics 0,1e-6,4e-6 nomirror
plot "H1L9/diff.dat" using 1:($2-$3) title 'difference of P and D' with lines ls 1,\

unset multiplot
