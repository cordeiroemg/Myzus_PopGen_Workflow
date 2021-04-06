library(vcfR)
library(adegenet)
library(adegraphics)
library(pegas)
library(StAMPP)
library(lattice)
library(gplots)
library(ape)
library(ggmap) 
#
vcf <- read.vcfR("MP100g_v4_1.biallelic.PASS.vcf.gz") #read in all data
head(vcf) #check the vcf object
vcf@fix[1:10,1:5] #check 
#
### convert to genlight
aa.genlight <- vcfR2genlight(vcf, n.cores=2)
locNames(aa.genlight) <- paste(vcf@fix[,1],vcf@fix[,2],sep="_") # addreal SNP.names
pop(aa.genlight)<-substr(indNames(aa.genlight),1,3) # add popnames: here "population" (group) names are first 3 chars of ind name
##
# check the genlight
aa.genlight # check the basic info on the genlight object
indNames(aa.genlight) # check individual names
as.matrix(aa.genlight)[1:16,1:10] # see tiny bit of the data
pop(aa.genlight) # population assignment
# look at the total data matrix (0,1,2; white = missing data)
glPlot (aa.genlight) # takes some time
# N missing SNPs per sample
x <- summary(t(as.matrix(aa.genlight)))
write.table(x[7,], file = "missing.persample.txt", sep = "\t") # NAs, if present, are in seventh row of summary 
##

#4. Draw allele frequency spectra (AFS)
#Now let’s look at some population‐level summary statistics. We will plot the unfolded allele
#frequency spectrum (AFS, SFS), i.e. distribution of counts of alternative (non‐reference) alleles across
#all sites in the population. This is essential population summary characteristics frequently used e.g. in
#the coalescent simulations; for more info on AFS see e.g. Wikipedia. NB: Missing data are problem in
#AFS construction; in our toy example we simply remove all SNPs with missing data, in reality there
#are more clever ways of maximizing the information which is used for AFS calculation.
#Fist show AFS for the entire dataset.
###plot total AFS of the dataset
mySum <- glSum(aa.genlight, alleleAsUnit = TRUE)
barplot(table(mySum), col="blue", space=1, xlab="Allele counts", main="Distribution of ALT allele counts in total dataset")

#Second, visualize AFS only for one selected population (UK)
###plot AFS per one pop
aa.genlight.sep <- seppop(aa.genlight, drop=TRUE) #separate genlights per population
aa.genlight.sep$UK

# after seppop you must remove the nonvariant positions within the population
n.alleles.UK <-colSums(as.matrix(aa.genlight.sep$UK)) # how manyalternative alleles are in each locus?
summary(as.factor(n.alleles.UK)) # how many particular categories of alternative allele counts are in my pop?
aa.genlight.UK <- new("genlight", (as.matrix(aa.genlight.sep$UK))[,(colSums(as.matrix(aa.genlight.sep$UK)) > 0) & (colSums(is.na(as.matrix(aa.genlight.sep$UK))) == 0)]) # remove the reference-only positions AND remove columns with NA
aa.genlight.UK
summary(colSums(as.matrix(aa.genlight.UK))) # check if there are no zeros

# plot unfolded AFS - for one pop.
mySum <- glSum(aa.genlight.UK, alleleAsUnit = TRUE)
barplot(table(mySum), col="blue", space=0, xlab="Allele counts", main="Distribution of ALT allele counts in UK") 
# plot the originalcounts of each category


#Now, plot AFS for all populations in a batch and save this into a pdf file (i.e., using lapply function
#which goes over all elements of the list of genlights)
#### plot AFS for all pops in a batch
aa.genlight.sep <- seppop(aa.genlight, drop=TRUE) # separate genlight per population

# remove the nonvariant positions AND columns with NA within that pop.
aa.genlight.sep.2 <- lapply (aa.genlight.sep, function (pop) {new("genlight", (as.matrix(pop))[,(colSums(as.matrix(pop)) > 0) & (colSums(is.na(as.matrix(pop))) == 0)])})

##add pop identity to list elements
listnames<-names(aa.genlight.sep.2)
for (i in seq(listnames)) {pop(aa.genlight.sep.2[[i]])<-substr(indNames(aa.genlight.sep.2[[i]]),1,3)}

# loop over each population in a list of populations and draw AFS into one fig
pdf("AFS_all_barplot.pdf", width=5, height=5)
par(mfrow=c(2,3),mar=c(2,2,2,0))
mySum <- lapply (aa.genlight.sep.2, function (pop) {barplot(table(glSum(pop, alleleAsUnit=T)), col="blue", space=1, xlab="Allele counts", main=paste(levels(pop(pop)),sum(table(glSum(pop, alleleAsUnit=T))),"SNPs", sep=" ")) })
dev.off()
par(mfrow=c(1,1))