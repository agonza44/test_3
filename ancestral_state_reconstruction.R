library(ape)
library(geiger)
library(phangorn)

tree <- read.tree("RAxML_bestTree.T2.tre")
discrete.data <- read.csv(file="Co1_tree_subset_states.csv", stringsAsFactors=FALSE) #death to factors.
rownames(discrete.data) <- discrete.data[,1]
discrete.data<-discrete.data[,-1]
CleanData <- function(phy, data){
  treedata()# in Geiger is probably my favorite function in R.
}
treedata(tree, discrete.data) 
cleaned.discrete<-treedata(tree,data=discrete.data,sort=TRUE)
cleaned.discrete
cleaned.discrete.phyDat <- phangorn::phyDat(cleaned.discrete$data, type="USER",levels = c(0,1))
anc.p <- phangorn::ancestral.pars(tree, cleaned.discrete.phyDat)
plotAnc(tree, anc.p, 2)
anc.ml <- ancestral.pml(pml(tree, cleaned.discrete.phyDat), type="ml")
plotAnc(tree, anc.ml, 2)
