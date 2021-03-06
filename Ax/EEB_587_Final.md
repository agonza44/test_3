Chrysobothris species distribution
================
Axel Gonzalez
2022-05-18

We first load the packages necessary for this job

    library(ape)
    library(phytools)
    library(geiger)
    library(phangorn)

We loaded and named the tree. We are particularly interested on know
more about the distribution of Chrysobothris species compared with other
closely related beetles. Chrysobothris femorata, and C. rugosiceps ara
more common on the eastern US compared to C. mali from western US and C.
neotexana from the south US. We also add Anoplophora glabripennis (Asian
long horned beetle) and Agrilus liragus as a reference species.

We plot a map using maximum parsimony likelihood.

    tree <- read.tree("RAxML_parsimonyTree.Chryso_CO1_GTRCAT_2")
    tree$edge
    # comment 


    tree_tip_labels<-tree$tip.label
    tree<-rtree(length(tree$tip.label),tip.label=tree$tip.label)

    plot(tree)
    tree$tip.label
    Chrysodata <- read.csv("Chrysodata.csv")

    rownames(Chrysodata) <- Chrysodata[,1]
    Chrysodata <- Chrysodata[,-1]

    cleaned.Chrysodata <- treedata(tree,data=Chrysodata,sort=TRUE)
    discrete.ChrysophyDat <- phangorn::phyDat((cleaned.Chrysodata$data), type="USER" ,levels=c("1","2","3","4"))

    anc.p <- phangorn::ancestral.pars(tree, discrete.ChrysophyDat[,1],type="ACCTRAN")
    plotAnc(tree, anc.p, 1)

    anc.p <- phangorn::ancestral.pml(tree, discrete.ChrysophyDat,type="ml")
    plotAnc(tree, anc.p, 1)
