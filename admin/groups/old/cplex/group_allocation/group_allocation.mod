/*********************************************
 * OPL 12.3 Model
 * Group allocation problem. Assign persons to groups.
 * Author: Lars Relund Nielsen
 * Creation Date: 17/08/2011
 *
 * Min total person dissatisfaction 
 * St. Min 3 persons in each group
 *     Max 5 persons in each group
 *     p groups avaliable
 * 
 * Optimize given group size (see dat file)
 *********************************************/

// Index 
int persons = ...;		
int groups = ...;
{int} Groups = asSet(1..groups);			
{int} PersonIds = asSet(1..persons);			
tuple edge {int i; int j;}
setof(edge) Edges = {<i,j> | ordered i,j in PersonIds};		// all edges in the complete graph
float prefs[PersonIds][PersonIds] = ...;	// preference matrix (tempoary storage) 
setof(edge) PosPrefEdges = {<i,j> | <i,j> in Edges : prefs[i][j]+prefs[j][i]>0 };		// edges with positive preference weight

// Parameters
int groupMax = ...;
int groupMin = ...;
float cost[PosPrefEdges] = [ <i,j> : (prefs[i][j]+prefs[j][i])/2 | <i,j> in PosPrefEdges ];
string PersonNames[PersonIds] = ...;

// Decision variables
dvar boolean x[PosPrefEdges];			// 1 if keep edge
dvar boolean y[PersonIds][Groups];		// 1 if person in group 
dvar boolean z[PosPrefEdges][Groups];	// 1 if edge in group

// MP model
minimize
  sum( <i,j> in PosPrefEdges) 
    cost[<i,j>] * (1-x[<i,j>]);
   
subject to {
  forall( k in Groups) {
    c1: sum (v in PersonIds) y[v][k] >= groupMin;
    c2: sum (v in PersonIds) y[v][k] <= groupMax;
  }  
  forall( v in PersonIds)
    c3: sum (k in Groups) y[v][k] == 1;
  forall(<i,j> in PosPrefEdges) {
    c4: sum (k in Groups) z[<i,j>][k] == x[<i,j>];
  	forall(k in Groups) {
    	//x[<i,j>] >= y[i][k]+y[j][k]-1;
    	c5a: z[<i,j>][k] <= y[i][k];
    	c5b: z[<i,j>][k] <= y[j][k];
    }   
  }  
}  	

// Preprocessing
execute {
  for (var k in Groups) {
  	write("Grp ",k,": ");
  	for (var v in PersonIds)
  		if (y[v][k]==1) write(PersonNames[v],", ");
  	writeln("");
  }  
  writeln("Dissatisfaction (obj) = ", cplex.getObjValue());		
  write("Zero edges: ");
  for (var e in PosPrefEdges) {
  	if (x[e]==0) write("(",e.i,",",e.j,"), ")  
  }	
  // write csv list with node labels for gephi
  var f = new IloOplOutputFile("../../plot_node_labels.csv");		// open file for writing
  f.writeln("Id;Label;Group");
  for (var k in Groups) {
  	for (var v in PersonIds)
  		if (y[v][k]==1) f.writeln(v,";",PersonNames[v],";",k);
  } 
  f.close();				
}