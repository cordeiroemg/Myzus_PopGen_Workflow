grp <- find.clusters(x=myzus.genind, max.n.clust=40)
names(grp)
grp$size
table(pop(x=myzus.genind), grp$grp)

dapc1 <- dapc(x=myzus.genind, grp$grp)
scatter(dapc1)







grp$gr








# Retain all informative PC (here about 35)
# According to second graph select best K (here 2 or 3)
# Now we select K=2 and later rerun the analysis for K=3 (lines 14-18)
hauss.kfind <- find.clusters(x=myzus.genind, stat="BIC",
                               choose.n.clust=TRUE, max.n.clust=10, n.iter=100000, n.start=100, scale=FALSE)


table(pop(myzus.genind), hauss.kfind$grp)
hauss.kfind

table.value(df=table(pop(myzus.genind), hauss.kfind$grp), col.lab=
              paste("Inferred\ncluster", 1:length(hauss.kfind$size)), grid=TRUE)


# For K=7 - note parameters n.pca and n.clust - we just rerun the
# analysis and when results are stable, no problem here
myzus.kfind7 <- find.clusters(x=myzus.genind, n.pca=35, n.clust=7,
                                 stat="BIC", choose.n.clust=FALSE, max.n.clust=20, n.iter=100000,
                                 n.start=100, scale=FALSE)


# See results as text
table(pop(myzus.genind), myzus.kfind7$grp)
myzus.kfind7
# Graph showing table of original
# and inferred populations and
# assignment of individuals
table.value(df=table(pop(myzus.genind), myzus.kfind7$grp), col.lab=paste("Inferred\n cluster", 1:length(myzus.kfind7$size)), grid=TRUE)
# If needed, use custom text for
# parameter col.lab=c("...", "...")
# as many labels as inferred groups


# alfa-score - according to number of PC axis
optim.a.score(x=hauss.dapc)
## K=3
# Create DAPC
# Number of informative PC (Here 15, adegenet recommends < N/3)
# Select number of informative DA (here 2 - usually keep all of them)
myzus.dapc <- dapc(x=myzus.genind, pop=hauss.kfind$grp, scale=FALSE, var.contrib=TRUE, pca.info=TRUE)

# Information
myzus.dapc7
# A la PCA graph
scatter(x=myzus.dapc, main="DAPC, Myzus persicae",
           bg="white", cex=3, clab=0, col=rainbow(7), posi.da="bottomleft",
           scree.pca=TRUE, posi.pca="bottomright", leg=TRUE,
           txt.leg=c("Group 1", "Group 2", "Group 3", "Group 4", "Group 5", "Group 6", "Group 7"), 
           posi.leg="topleft")
