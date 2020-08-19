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
 * Test different group sizes and find alternative solutions.
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
  sum( <i,j> in PosPrefEdges) cost[<i,j>] * (1-x[<i,j>]);
  //+ sum( <i,j> in PosPrefEdges) (1-x[<i,j>]);	// if want to have as few x=0 also 
   
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
  var grpSet = new Array(7,8,9,10,11,12,13,14,15,16,17);	// the different number of groups we consider
  
  // solution pool settings
  cplex.solnpoolagap = 0;			// absolute solution gap in solution pool = 0 (only keep optimal solutions)
  cplex.solnpoolgap = 0;			// relative gap	
  cplex.solnpoolcapacity = 3;		// number of alternative solutions
  cplex.solnpoolintensity = 0;		// 4 = enumerate all solutions (affect the performance)
  cplex.solnpoolreplace = 2;		// want diverse solutions
  
  var fT = new IloOplOutputFile("../../results.txt");		// open file for writing
  
  for (var i=0; i<grpSet.length; i++) {
    var def = mod.modelDefinition;
    var data = mod.dataElements;
    if ( mod!=thisOplModel ) mod.end();
    mod = new IloOplModel(def,cplex);
    data.groups = grpSet[i];
    mod.addDataSource(data);
    mod.generate();
    fT.writeln("-----------------");
    fT.writeln("Solve with ",grpSet[i]," groups:");
    if ( cplex.solve() ) {
      curr = cplex.getObjValue();
      if ( best>curr ) {best = curr; bestGrp = grpSet[i]}  
	  if (cplex.populate()) {	// find alternative solutions
		  var nsolns = cplex.solnPoolNsolns;
		  fT.writeln("Number of solutions found = ",nsolns);
		  for (var s=0; s<nsolns; s++) {
		    mod.setPoolSolution(s);
		    fT.writeln("Solution #", s+1, ": Dissatisfaction (obj) = ", cplex.getObjValue(s));
	       	for (k in mod.Groups) {
	  			fT.write("Grp ",k,": ");
	  			for (v in mod.PersonIds)
	  				if (mod.y[v][k]==1) fT.write(mod.PersonNames[v],", ");
	  			fT.writeln("");
		  	}
  			fT.writeln("Wishes not fulfilled: ");
			for (var e in mod.PosPrefEdges) 
				if (mod.x[e]==0) fT.writeln("   ",e.i,":",mod.PersonNames[e.i]," <--> ",e.j,":",mod.PersonNames[e.j]," (cost = ", mod.cost[e],")");
			fT.writeln("---------");
		    // write csv list with node labels for gephi
		    var f = new IloOplOutputFile("../../plot_node_labels_g"+grpSet[i]+"_s"+(s+1)+".csv");		// open file for writing
		    f.writeln("Id;Label;Group");
		    for (var k in mod.Groups) {
		  	  for (var v in mod.PersonIds)
		  	  	if (mod.y[v][k]==1) f.writeln(v,";",mod.PersonNames[v],";",k);
		    } 
		    f.close();	
  		  }
  		  fT.writeln();		  
	   }  
    } 
    else {
      fT.writeln("No solution!");
    }
  }
  if (best != Infinity) {
    fT.writeln("-----------------");
    fT.writeln("Best group number = ", bestGrp);
  }
  fT.close();	
  status;
}