Untitled
================
Axel
2022-05-18

    library(ape)
    library(phytools)
    library(geiger)
    library(phangorn)

comment

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