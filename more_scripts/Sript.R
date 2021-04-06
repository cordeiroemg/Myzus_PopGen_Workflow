library("ape")
library("pegas")
library("seqinr")
library("ggplot2")
library("adegenet")

### importando dados do Structure
setwd("C:/Users/corde/Documents/Projects/Exeter/Aphid_project/pca/HWE")
obj=read.structure("MP100g.hwe2.noM.106_9370.str", n.ind = 106, n.loc = 9370, onerowperind = FALSE,
                   col.lab = 1, col.pop = 2, col.others = FALSE,
                   row.marknames = 0, NA.char = "-9", quiet = FALSE)

### PCA simples
## tratando os dados faltantes como m?dia
obj <- myzus.genlight
X <- tab(obj, NA.method="mean") 

### PCA 
pca1 <- dudi.pca(X,scannf=FALSE,scale=FALSE)
temp <- as.integer(pop(obj))
myCol <- transp(rainbow(3),.8)[temp]
plot(pca1$li, col=myCol, cex=3, pch=16)
barplot(pca1$eig[1:50],main="PCA eigenvalues", col=heat.colors(50))

s.label(pca1$li)
title("PCA\naxes 1-2")
add.scatter.eig(pca1$eig[1:20], 3,1,2)

tiff("PCA_HWE_Neutral_Location.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 12)             # smaller font size


s.class(pca1$li, pop(obj))
title("PCA\naxes 1-2")
add.scatter.eig(pca1$eig[1:20], 3,1,2)
dev.off() 

col <- funky(3)


tiff("PCA_HWE_Neutral_H11.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 12)             # smaller font size
s.class(pca1$li, pop(obj), col=transp(col,.9), axesell=FALSE,cstar=0, cpoint=2, grid=FALSE, addaxes = FALSE)
dev.off() 

tiff("PCA_HWE_Neutral_H22.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 12)             # smaller font size
s.class(pca1$li, pop(obj), col=transp(col,.9), cellipse = 0, clabel=0, axesell=FALSE,cstar=0, cpoint=3, grid=FALSE, addaxes = F)
dev.off()

tiff("PCA_HWE_Neutral_h33.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 12)             # smaller font size
s.class(pca1$li, pop(obj), col=transp(col,.9), cellipse = 1, clabel=0, axesell=FALSE,cstar=0, cpoint=3, grid=FALSE, addaxes = F)
dev.off()

add.scatter.eig(pca1$eig[1:20], 3,1,2)
title("Principal Component Analysis")

eig.perc <- 100*pca1$eig/sum(pca1$eig)
head(eig.perc)



### Pop PCA

objpop=genind2genpop(obj)
X1 <- tab(objpop, NA.method="mean") 
pca2 <- dudi.pca(X1,scannf=FALSE,scale=FALSE)
myCol <- transp(rainbow(4),.8)
plot(pca2$li, col=myCol, cex=3, pch=16)

### colocar os nomes sem sobrepor
library(wordcloud)
textplot(pca2$li[,1], pca2$li[,2], words=rownames(X1), cex=1.4, new=FALSE)

abline(h=0,v=0,col="grey",lty=2) #linhas
legend("bottomright", pch=c(16), col=transp(rainbow(4),.8), leg=c("North", "South"), pt.cex=2)
title("Principal Component Analysis")

barplot(pca2$eig[1:50],main="PCA eigenvalues", col=heat.colors(50))


## isolation by distance
a=read.table("popdist.txt", header=F)
objpop$other=a[,2:3]
objpop$other
Dgen <- dist.genpop(objpop,method=2)
Dgeo <- dist(objpop$other)
Dgeo
ibd <- mantel.randtest(Dgen,Dgeo)
ibd
plot(Dgeo, Dgen)
plot(Dgeo, Dgen)
abline(lm(Dgen~Dgeo), col="red",lty=2)
title("Isolation by distance plot")


### Poppr

library(poppr)
clone=as.genclone(obj)
(monpop_diversity <- poppr(clone))
?poppr

##arvore
tiff("Tree_Euschistus.tiff",    # create tiff for the heat map        
     width = 7*300,        # 5 x 300 pixels
     height = 5*300,
     res = 300,            # 300 pixels per inch
     pointsize = 10)             # smaller font size



X <- scaleGen(obj, NA.method="mean")
D <- dist(X)
tre <- nj(D)
myCol=rainbow(8)[as.integer(pop(obj))]
plot(tre, type = "unr", show.tip.lab = FALSE)
tiplabels(col = myCol, pch = 19, cex=2)

legend("bottomrigh", pch = 19, col=rainbow(11, alpha = 1), legend = c("Northern", "Souther"), cex=1, bty="n",y.intersp=0.8)

dev.off()  


## PopgenReport
Popgenreport.complete <- popgenreport(obj, mk.complete=TRUE, mk.Rcode=TRUE,
                                      mk.pdf=FALSE)



summary(Popgenreport.complete)
#muita informa??o

Popgenreport.complete

##Sugiro por Popgenreport.complete$
Popgenreport.complete$counts$nallelesbyloc



Popgenreport.complete <- popgenreport(obj, mk.complete=TRUE, mk.Rcode=TRUE,
                                      mk.pdf=FALSE, mk.fst=T)

