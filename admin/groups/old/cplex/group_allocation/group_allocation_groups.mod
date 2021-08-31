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
 * Test different group sizes.
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
//string PersonNames[PersonIds] = ["a", "b", "c", "d", "e", "f", "g", "h"];

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
    sum (v in PersonIds) y[v][k] >= groupMin;
    sum (v in PersonIds) y[v][k] <= groupMax;
  }  
  forall( v in PersonIds)
    sum (k in Groups) y[v][k] == 1;
  forall(<i,j> in PosPrefEdges) {
    sum (k in Groups) z[<i,j>][k] == x[<i,j>];
  	forall(k in Groups) {
    	//x[<i,j>] >= y[i][k]+y[j][k]-1;
    	z[<i,j>][k] <= y[i][k];
    	z[<i,j>][k] <= y[j][k];
    }   
  }  
}  	

main {
  var status = 0;
  var mod = thisOplModel;
  var best, bestGrp;
  var curr = Infinity;
  var k,v;
  best = curr;
  var grpSet = new Array(11,12,13,14,15);	// the different number of groups we consider
  
  for (var i=0; i<grpSet.length; i++) {
    var def = mod.modelDefinition;
    var data = mod.dataElements;
    if ( mod!=thisOplModel ) mod.end();
    mod = new IloOplModel(def,cplex);
    data.groups = grpSet[i];
    mod.addDataSource(data);
    mod.generate();
    writeln("-----------------");
    writeln("Solve with ",grpSet[i]," groups:");
    if ( cplex.solve() ) {
	  for (k in mod.Groups) {
	  	write("Grp ",k,": ");
	  	for (v in mod.PersonIds)
	  		if (mod.y[v][k]==1) write(mod.PersonNames[v],", ");
	  	writeln("");
	  }
      curr = cplex.getObjValue();
      writeln("Dissatisfaction (obj) = ",curr);
      if ( best>curr ) {best = curr; bestGrp = grpSet[i]}   
    } 
    else {
      writeln("No solution!");
    }
  }
  if (best != Infinity) {
    writeln("-----------------");
    writeln("Best group number = ",bestGrp);
  }
  status;
}
