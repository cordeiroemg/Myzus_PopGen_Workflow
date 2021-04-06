library(vcfR) # Required library
library(adegenet)
library(ape)
library(dartR)

#setwd("C:/Users/corde/Documents/Projects/Exeter/Aphid_project/File.Conversiton.VCF2GenInd")
# Pick up downloaded file 'arabidopsis.vcf.gz' from the disc

myzus.vcf <- read.vcfR(file=file.choose())
#
pop <- read.table("pop_files/pop.map")
pop.list <- as.factor(pop[,2])
#
#tobacco <- read.table(file.choose())
#tobacco$V2 <- rep("Tobacco", length(tobacco[,1]))
#peach <- read.table(file.choose())
#peach$V2 <- rep("Peach", length(peach[,1]))
#veg <- read.table(file.choose())
#veg$V2 <- rep("Veg", length(veg[,1]))
#hosts <- rbind(tobacco, peach, veg)  
#host.list <- as.factor(hosts[,2])
host <- read.table("pop_files/pop_abba_baba.txt")
host.list <- as.factor(host[,2])
##
## Measure genetic diversity
myDiff <- genetic_diff(myzus.vcf, pops = host.list, method = 'nei')
#
#Average heterozygosity of each population and mean Gst, Htmax, GstMax and Gprimest
knitr::kable(round(colMeans(myDiff[,c(3:22, 45:49)], na.rm = TRUE), digits = 3))

##Location pop
#  |:--------|-----:|
#  |Hs_ALG   | 0.178|
#  |Hs_ARM   | 0.082|
#  |Hs_AUS   | 0.195|
#  |Hs_BRS   | 0.145|
#  |Hs_CGC   | 0.176|
#  |Hs_CHL   | 0.139|
#  |Hs_CHN   | 0.197|
#  |Hs_DE    | 0.098|
#  |Hs_FR    | 0.186|
#  |Hs_GC    | 0.171|
#  |Hs_HNG   | 0.091|
#  |Hs_IT    | 0.189|
#  |Hs_JP    | 0.110|
#  |Hs_NGC   | 0.185|
#  |Hs_NL    | 0.108|
#  |Hs_SK    | 0.184|
#  |Hs_SPN   | 0.181|
#  |Hs_TUN   | 0.195|
#  |Hs_UK    | 0.200|
#  |Hs_US    | 0.145|
#  |n_ZIM    | 3.997|
#  |Gst      | 0.116|
#  |Htmax    | 0.924|
#  |Gstmax   | 0.807|
#  |Gprimest | 0.149|

dpf <- melt(myDiff[,c(3:22,45,49)], na.rm=TRUE)
ggplot(dpf, aes(x=POS, y=value, fill=variable)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Genetic Diversity (Hs/Gst/G'st)") + scale_fill_discrete(labels = c("Algeria","Armenia","Australia","Belarus","C Grecce","Chile","China","Germany","France","Grecce","Hungary","Italy","Japan","N Grecce","Netherlands","S Korea","Spain", "Tunisia","UK","USA", "Zimbabwe", "Gst", "Gprimest"))
ggplot(dpf, aes(x=POS, y=value)) + geom_violin(fill=variable, adjust = 1.2)


knitr::kable(round(colMeans(myDiff[,c(3:5, 10:13)], na.rm = TRUE), digits = 3))
##Host pop
#  |:----------|-----:|
#  |Hs_Peach   | 0.195|
#  |Hs_Tobacco | 0.198|
#  |Hs_Veg     | 0.204|
#  |Gst        | 0.020|
#  |Htmax      | 0.715|
#  |Gstmax     | 0.736|
#  |Gprimest   | 0.031|
dpf <- melt(myDiff[,c(2:5,10,13)], na.rm=TRUE)
ggplot(dpf, aes(x=POS, y=value)) + geom_violin(fill=variable, adjust = 1.2)
## Formt data frame using melt
#dpf <- melt(myDiff[,c(3:22,49)], varnames=c('Index', 'Sample'), value.name = 'Depth', na.rm=TRUE)



