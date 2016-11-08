This repository contains the programs(*.py), scripts(*.cmd for Surface Evolver, *.plt GnuPlot),
datafiles(*.fe) and results(*.stl, *.dat) of our Surface Evolver model of
bicontinuous LLC cubic phases.

Typical workflow for an inverse D phase (also applies to P and G):

* `load` "Inverse/Bilayer.fe" in Surface Evolver.

* `addload` "Surfaces/D.fe".

* run `initial` several times.

* run `bilayer`.

* change parameters `Q_size`, `V_patch`.

* change `expname` to name the experiment.

* `dump` the result to a file.

* in the dump file, change `kH` and/or `kL`.

* if necessary, change `energy` to `info_only` in the quantity line.

* you may modify the script before further proceeding.

* `load` dump file and `run`.

Typical workflow for a normal D phase (also applies to P and G):

* change the parameters in "Normal/D.fe"

* `load` "Normal/D.fe" and `run`

To prepare "Normal/G.fe"

* run "Surfaces/G_g.fe" to prepare a triangulation and dump.

* output the coordinates of the vertices to "G-coord.dat".

* run "Voronoi.py". Copy the results into the dump file.

* write the remain of the script as in "D.fe", save as "G.fe".

To STL 3D files

* load dump file into Surface Evolver.

* `read` "stl.cmd".

* show or hide the edges as you want.

* detorus, the `stl >>> your.stl`.
