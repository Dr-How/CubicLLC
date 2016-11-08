set terminal postscript eps enhanced color dashed dl 1 size 6,2
set output 'Normal.eps'
set multiplot layout 1,3

set format y "%.1e"
set ytics 0,5e-4,2e-3 nomirror
set yrange [0:2e-3]
set border 3
set xtics 0.0,0.1,0.4 nomirror
set xlabel "water fraction"
set xrange [0:0.4]

set style line 1 dashtype 1 lw 3 lc 0
set style line 2 dashtype 2 lw 3 lc 1
set style line 3 dashtype 3 lw 3 lc 3
set style line 4 dashtype 4 lw 3 lc 4

set title "CMC"
set ylabel "energy"
plot "CMC/P.dat" using 1:3 title 'P' with lines ls 1,\
	"CMC/D.dat" using 1:3 title 'D' with lines ls 2,\
	"CMC/G.dat" using 1:3 title 'G' with lines ls 3

set title "k_H=k_L=1"
set ylabel "energy"
plot "H1L1/P.dat" using 1:6 title 'P' with lines ls 1,\
	"H1L1/D.dat" using 1:6 title 'D' with lines ls 2,\
	"H1L1/G.dat" using 1:6 title 'G' with lines ls 3

unset title
set format y "%g%%"
set ylabel "contribution of Hooke energy"
set ytics 0,20,100 nomirror
set yrange [0:100]
plot "H1L1/P.dat" using 1:($3/$6*100) title 'P' with lines ls 1,\
	"H1L1/D.dat" using 1:($3/$6*100) title 'D' with lines ls 2,\
	"H1L1/G.dat" using 1:($3/$6*100) title 'G' with lines ls 3

unset multiplot
