define vertex attribute done_v integer;
define vertex attribute para_v integer;
define vertex attribute conn_e integer;
define edge attribute para_e integer;
define face attribute para_f integer;

foreach vertex vv where not bare do {
	vv.done_v:=0;
	vv.para_v:=new_vertex(0,0,vv.id/1000);
	vv.conn_e:=new_edge(vv.id, vv.para_v);
	set edge[vv.conn_e] no_refine;
	set edge[vv.conn_e] bare;
	set edge[vv.conn_e] color -1;
}

foreach edge ee where not bare do {
	ee.para_e := new_edge(ee.vertex[1].para_v, ee.vertex[2].para_v);
	set edge[ee.para_e] wrap ee.wrap;
};

foreach facet ff do {
	ff.para_f := new_facet(ff.edge[1].oid*ff.edge[1].para_e/ff.edge[1].id, ff.edge[2].oid*ff.edge[2].para_e/ff.edge[2].id, ff.edge[3].oid*ff.edge[3].para_e/ff.edge[3].id);
	set facet[ff.para_f] density 0;
	set facet[ff.para_f] color yellow;
	set ff color lightblue;
};

done:=0;

Procedure Parallel (real dist, real threshold) {
	foreach vertex vv where not bare and para_v>0 and done_v==0 do
	for(coor:=1; coor<4; coor++)
	vertex[vv.para_v].x[coor] := vv.x[coor] + dist*vv.vertex_normal[coor];

	foreach vertex vv where para_v>0 and done_v==0 do
	if vertex[vv.para_v].dihedral > chreshold then {
		vv.done_v:=1;
		set edge[vv.conn_e] color 0;
		done++;
	};

	print done;
}
