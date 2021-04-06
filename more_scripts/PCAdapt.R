library(pcadapt)
library(vcfR)
source("https://bioconductor.org/biocLite.R")
biocLite("qvalue")
library(qvalue)

setwd("C:/Users/corde/Documents/Projects/Exeter/Aphid_project/PCAdapt")
popmap <- read.table("popmap.txt", header = FALSE, sep = "", dec = ".")

popmap <- read.table("156.markers_trns.txt", header = FALSE, sep = "", dec = ".")
list.m <- as.list(popmap)
myzus <- "MP100g.Chr1.6-temporary.bed"
myzus <- read.pcadapt(myzus, type = "bed")
x <- pcadapt(input = myzus, K = 20, min.maf = 0.05) 
scores<- x$scores
write.table(scores, "scores.txt", row.names=F, quote=F)



plot(x, option = "screeplot")
plot(x, option = "screeplot", K = 10)


# With integers
poplist.int <- c(rep(1, 63), rep(2, 56))
# With names
poplist.names <- c(rep("US", 63),rep("BR", 56))


#Make sure is right
print(poplist.int)

plot(x, option = "scores", pop = popmap$V1)

tiff("PCA_Host.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 6)             # smaller font size

plot(x, option = "scores", pop = popmap$V1, col= popmap$V1)
dev.off()


#Checking other components
plot(x, option = "scores", i = 3, j = 4, pop = popmap)


# Computing the test statistic based on PCA
x <- pcadapt(myzus, K = 2)
summary(x)


tiff("Manhattan_plot.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 6)             # smaller font size
plot(x , option = "manhattan", threshold = )
dev.off()


#The user is also given the possibility to check the distribution of the p-values using a Q-Q plot
plot(x, option = "qqplot", threshold = 0.05)
hist(x$pvalues, xlab = "p-values", main = NULL, breaks = 50, col = "orange")
plot(x, option = "stat.distribution")


qval <- qvalue(x$pvalues)$qvalues
alpha <- 0.05
outliers <- which(qval < alpha)
length(outliers)






SNPb <- read.table("populations.plink.map",header=F)
colnames(SNPb) <- c("Contig", "SNP.position", "Genetic.distance","Base-pair.position")
qval <- qvalue(x$pvalues)$qvalues
pca.snp.Position <- cbind(SNPb, qval)
class(pca.snp.Position$qval)
pca.snp.Position$SELECTION <- ifelse(pca.snp.Position$qval<=0.05,"diversifying","neutral")

# Subsetting for the positive selected SNPs
positive <- pca.snp.Position[which(pca.snp.Position$SELECTION=="diversifying"),]
neutral <- pca.snp.Position[which(pca.snp.Position$SELECTION=="neutral"),]
pca.snp.Position$SELECTION<- factor(pca.snp.Position$SELECTION)
levels(pca.snp.Position$SELECTION)
xtabs(data=pca.snp.Position, ~SELECTION)

write.table(positive, "positive.txt", row.names=F, quote=F)
write.table(neutral, "neutral.txt", row.names=F, quote=F)
write.table(pca.snp.Position, "all.txt", row.names=F, quote=F)

#Component-wise
x_cw <- pcadapt(piezo, K = 2, method = "componentwise")
summary(x_cw$pvalues)
plot(x_cw, option = "stat.distribution", K = 2)
