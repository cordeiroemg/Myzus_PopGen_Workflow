library(vcfR) # Required library
library(adegenet)
library(ape)
library(dartR)
##
buch.vcf <- read.vcfR(file=file.choose()) ##Important vcf file with missing included. No. of samples are 128 including outgroups
buch.genind <- vcfR2genind(x=buch.vcf)
pop <- read.table(file = file.choose())
buch.genind
nInd(buch.genind)
indNames(buch.genind)
nLoc(buch.genind)
locNames(buch.genind)
##
grp <- find.clusters(buch.genind, max.n.clust=40)
dapc1 <- dapc(buch.genind, grp$grp)
scatter(dapc1)
myCol <- c("darkblue","purple","green","orange","red","blue")
scatter(dapc1,1,1, col=myCol, bg="white", scree.da=FALSE, legend=TRUE, solid=.4)












                            
































