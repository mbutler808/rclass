# check if directory out exists, if not, make it
if [! -d "$out"]; then 
	mkdir out
  fi


## Species Trees ##

# infer the species tree with 1000 ultrafast bootstraps and an edge-linked fully-partitioned model 
iqtree2 -s input/turtle.fa -p input/turtle.nex --prefix out/species -B 1000 -nt AUTO

# infer the species tree fully-partitioned model with merging (partitionfinder) 
iqtree2 -s input/turtle.fa -p input/turtle.nex -m TEST+MERGE -rcluster 10 --prefix out/speciesmerge -bb 1000 -nt AUTO


## Gene Trees ##

# infer single-locus trees  
iqtree2 -s input/turtle.fa -S input/turtle.nex -m TEST --prefix out/loci -B 1000 


## Concordance factors ## 

# locus modelfinder species tree vs. single-locus trees 
iqtree2 -t out/species.treefile --gcf out/loci.treefile -s input/turtle.fa --scf 100 --prefix out/concord 


# If you need to redo any of these analyses, add the `-redo` flag at the end of the command

