import numpy as np
from scipy.spatial import Voronoi

# read in file
vertexData = np.loadtxt("G-coord.dat")
vertexPosition = vertexData[:, 1:4]
vertexNormal = vertexData[:, 4:]

vertices = vertexPosition[:]

for i in range(len(vertexData)):
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+0*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+0*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])+1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])-1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])+0*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])+0*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])-1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])-1*np.array([0,8,0])+0*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+0*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+0*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+0*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+0*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])+1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])+1*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])-1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+0*np.array([8,0,0])-1*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])-1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])+1*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])-1*np.array([0,8,0])+1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]+1*np.array([8,0,0])-1*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])+1*np.array([0,8,0])-1*np.array([4,4,4])))
	vertices=np.vstack((vertices,vertexPosition[i]-1*np.array([8,0,0])-1*np.array([0,8,0])-1*np.array([4,4,4])))

# 3d voronoi
vor = Voronoi(vertices)

"""
medial surface points for space dividing surface:
  pole voronoi vertex (farthest vertex of the point's voronoi cell,
  max and min of vector dot multiply normal vector)
index correlations:
  facet i -- center i -- vor cell i --vor.vertices-- min+max dot product

"""

for i in range(len(vertexData)):
	vorCell = vor.point_region[i]
	vorCellVertices = vor.regions[vorCell]
	vorCellMax = 0
	vorCellMin = 0
	maxDist=0
	minDist=0
	for j in range(len(vorCellVertices)):
		vorCellVertex = vor.vertices[vorCellVertices[j]]
		dist = np.dot(vorCellVertex - vertexPosition[i], vertexNormal[i])
		if dist > maxDist:
			maxDist = dist
			vorCellMax=vorCellVertices[j]
		if dist < minDist:
			minDist = dist
			vorCellMin=vorCellVertices[j]
	print i+1, vertexPosition[i][0], vertexPosition[i][1], vertexPosition[i][2], "pos_p {", vor.vertices[vorCellMax][0], vor.vertices[vorCellMax][1], vor.vertices[vorCellMax][2], "} neg_p {", vor.vertices[vorCellMin][0], vor.vertices[vorCellMin][1], vor.vertices[vorCellMin][2], "}"
