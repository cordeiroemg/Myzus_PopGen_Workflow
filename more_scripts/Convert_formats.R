library(vcfR) # Required library
library(adegenet)
library(ape)
library(dartR)


#setwd("C:/Users/corde/Documents/Projects/Exeter/Aphid_project/File.Conversiton.VCF2GenInd")
# Pick up downloaded file 'arabidopsis.vcf.gz' from the disc

myzus.vcf <- read.vcfR(file=file.choose())

pop <- as.factor(c("us", "eu", "us", "af", "eu", "us", "mx", "eu", "eu", "sa", "mx", "sa", "us", "sa", "Pmir", "us", "eu", "eu"))

myDiff <- genetic_diff(myzus.vcf, pops = pop, method = 'nei')

knitr::kable(head(myDiff[,1:15]))



#################################################
# Genind
#Memomry intensive. did not work with Myzys data
#Mydata <- read.table(file=file.choose(), header = TRUE)
#myzus.genind <- vcfR2genind(x=myzus.vcf)
# Check it
#myzus.genind
#nInd(myzus.genind)
#indNames(myzus.genind)
#nLoc(myzus.genind)
#locNames(myzuss.genind)
#################################################

##Genlight
popmap <- read.table("popmap3.txt", header = FALSE, sep = "", dec = ".")
pop(myzus.genind)<- as.factor(t(popmap))
# Genlight (suitable for huge data, not required now)
# On Linux/Mac and with large data use higher n.cores
myzus.genlight <- vcfR2genlight(myzus.vcf, n.cores=2)
# Check it
myzus.genlight
pop(myzus.genlight)<- as.factor(t(popmap))

source(gl2structure)
myzus.str <- gl2structure(myzus.genlight, indNames = NULL, addcolumns = NULL, ploidy = 2,
             exportMarkerNames = TRUE, outfile = "myzus.str",  n.cores = 4)








