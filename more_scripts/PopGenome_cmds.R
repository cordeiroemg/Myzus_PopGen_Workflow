#mkdir GFF VCF fasta
#cd VCF
#bcftools filter MP100g.biallelic.PASS.vcf.gz --regions HiC_scaffold_2 -Ov -o HiC_scaffold_2.vcf
#bcftools filter MP100g.biallelic.PASS.vcf.gz --regions HiC_scaffold_3 -Ov -o HiC_scaffold_3.vcf
#bcftools filter MP100g.biallelic.PASS.vcf.gz --regions HiC_scaffold_4 -Ov -o HiC_scaffold_4.vcf
#bcftools filter MP100g.biallelic.PASS.vcf.gz --regions HiC_scaffold_5 -Ov -o HiC_scaffold_5.vcf
#bcftools filter MP100g.biallelic.PASS.vcf.gz --regions HiC_scaffold_6 -Ov -o HiC_scaffold_6.vcf
#cd GFF
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_1") print}' Myzus.G006.gff3 > HiC_scaffold_1
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_2") print}' Myzus.G006.gff3 > HiC_scaffold_3
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_3") print}' Myzus.G006.gff3 > HiC_scaffold_3
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_4") print}' Myzus.G006.gff3 > HiC_scaffold_4
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_5") print}' Myzus.G006.gff3 > HiC_scaffold_5
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "HiC_scaffold_6") print}' Myzus.G006.gff3 > HiC_scaffold_6

GENOME.class <- readData("VCF", format = "VCF", gffpath = "GFF")
get.sum.data(GENOME.class)
#n.sites n.biallelic.sites n.gaps n.unknowns n.valid.sites n.polyallelic.sites
#HiC_scaffold_1.vcf 99436795             34223      0     249721           NaN                   0
#HiC_scaffold_2.vcf 86289064             39116      0     233191           NaN                   0
#HiC_scaffold_3.vcf 69943515             34046      0     210992           NaN                   0
#HiC_scaffold_4.vcf 58738762             27371      0     168657           NaN                   0
#HiC_scaffold_5.vcf 30133166             19136      0      92324           NaN                   0
#HiC_scaffold_6.vcf 29629810             17981      0      89308           NaN                   0
#trans.transv.ratio
#HiC_scaffold_1.vcf           1.475264
#HiC_scaffold_2.vcf           1.606343
#HiC_scaffold_3.vcf           1.567959
#HiC_scaffold_4.vcf           1.617481
#HiC_scaffold_5.vcf           1.542990
#HiC_scaffold_6.vcf           1.556298

##Without setting up populations
get.individuals(GENOME.class)
GENOME.class <- F_ST.stats(GENOME.class)
GENOME.class <- neutrality.stats(GENOME.class)
GENOME.class@Pi
#pop 1
#[1,] 6145.496
#[2,] 8073.402
#[3,] 6837.360
#[4,] 5456.937
#[5,] 3876.026
#[6,] 3627.184
GENOME.class@Tajima.D
#pop 1
#[1,] 0.3151205
#[2,] 0.8373989
#[3,] 0.7289508
#[4,] 0.7005427
#[5,] 0.7624397
#[6,] 0.7463018

##set up populations and recaluclate those statistics
tobacco <- read.table("pop_files/tobacco.txt")
tobacco <- as.character(tobacco[,1])
peach <- read.table("pop_files/peach.txt")
peach <- as.character(peach[,1])
veg <- read.table("pop_files/veg.txt")
veg <- as.character(veg[,1])
cgreece <- read.table("pop_files/cgreece.txt")
cgreece <- as.character(cgreece[,1])
chile <- read.table("pop_files/chile.txt")
chile <- as.character(chile[,1])
chn <- read.table("pop_files/CHN.txt")
chn <- as.character(chn[,1])
greece <- read.table("pop_files/greece.txt")
greece <- as.character(greece[,1])
it <- read.table("pop_files/IT.txt")
it <- as.character(it[,1])
ngreece <- read.table("pop_files/Ngreece.txt")
ngreece <- as.character(ngreece[,1])
sgreece <- read.table("pop_files/Sgreece.txt")
sgreece <- as.character(sgreece[,1])
uk <- read.table("pop_files/UK.txt")
uk <- as.character(uk[,1])
usa <- read.table("pop_files/US.txt")
usa <- as.character(usa[,1])
aus <- read.table("pop_files/AUS.txt")
aus <- as.character(aus[,1])
eu <- read.table("pop_files/EU.txt")
eu <- as.character(eu[,1])
asia <- read.table("pop_files/Asia.txt")
asia <- as.character(asia[,1])

osr <- c("LIB18339","S21_FR1015OSR","S26_C","S27_P","S37_192","S3_4916A","S43_Nhill","S45_Mung","S47_Sunny","S71_SS","S72_FDF")
pepper <- c("S28_H","S50_C61","S39_KORPep","S40_KORPap","S42_Bund","S49_Vircap","S51_Hungpep","S76_SKChung","S77_SpSSMU")
potato <- c("LIB1672","LIB1673","LIB18341","S29_2015","S83_Chilpot1","S95_Tun1","S96_Tun9")
##run above geenral stats again
GENOME.class <- set.populations(GENOME.class,list(tobacco, peach, veg, uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn))
GENOME.class <- neutrality.stats(GENOME.class)
GENOME.class@Tajima.D
#pop 1      pop 2       pop 3       pop 4 pop 5       pop 6       pop 7        pop 8
#[1,] -0.20811160 -0.4990602 -0.23787260 -0.09996065   NaN -0.21143564 -0.22540499 -0.116191988
#[2,] -0.02613676 -0.2926941 -0.02997348 -0.09806977   NaN -0.20452694 -0.15069489 -0.001558721
#[3,] -0.06669836 -0.4038630 -0.08495480 -0.17754324   NaN -0.22905136 -0.13799823  0.036066078
#[4,] -0.03272257 -0.2684993 -0.10613013  0.03306769   NaN -0.22605676 -0.11539249 -0.057446486
#[5,] -0.07867483 -0.4359911 -0.12625654 -0.12593545   NaN -0.28149236 -0.15355399  0.020577846
#[6,] -0.08741741 -0.3702627 -0.06922778 -0.20637203   NaN  0.07020779 -0.05136836 -0.029878694
#pop 9      pop 10      pop 11      pop 12       pop 13
#[1,] -0.007368278 -0.18536274 -0.02543913 -0.15867058 -0.083351494
#[2,] -0.045942054 -0.15986300  0.13607530  0.03992880 -0.055779480
#[3,] -0.002315164 -0.05976270  0.10647108 -0.07896831 -0.061025657
#[4,] -0.059656246 -0.15199481  0.12759956 -0.01486196 -0.001301161
#[5,] -0.032193534 -0.10987314  0.22780817 -0.06322162  0.011504126
#[6,]  0.051786362 -0.09225389 -0.02693255  0.06684563 -0.119503089


##comparing tobacco and peach on Chr1
GENOME.class <- readData("chr1/VCF",format="VCF", gffpath="chr1/GFF")
GENOME.class <- set.populations(GENOME.class,list(tobacco, peach, veg))
GENOME2.class@populations
GENOME2.class.slide <- sliding.window.transform(GENOME2.class, 100000, 100000, type = 2)
tob_vs_peach <- F_ST.stats(GENOME2.class.slide)
tob_vs_peach@nuc.diversity.within
tob_vs_peach@nucleotide.F_ST[,1]
win.fst <- tob_vs_peach@nucleotide.F_ST[,1]
tb <- tob_vs_peach@nuc.diversity.within[,1]
pe <- tob_vs_peach@nuc.diversity.within[,2]
par(mfrow=c(3,1))
plot(1:length(win.fst), win.fst, ylim = c(0,1))
plot(1:length(tb), tb)
plot(1:length(pe), pe)
##theta_Watterson
tobvspe.neu <- neutrality.stats(GENOME2.class.slide)
tb.theta <- tobvspe.neu@theta_Watterson[,1]
pe.theta <- tobvspe.neu@theta_Watterson[,2]
par(mfrow=c(2,2))
plot(1:length(tb.theta), tb.theta)
plot(1:length(pe.theta), pe.theta)
##Tajima.D
tb.pe.tajima <- tobvspe.neu@Tajima.D
tb.tajima <- tobvspe.neu@Tajima.D[,1]
pe.tajima <- tobvspe.neu@Tajima.D[,2]
par(mfrow=c(3,2))
plot(1:length(tb.tajima), tb.tajima)
plot(1:length(pe.tajima), pe.tajima)

#####
tobacco <- read.table("pop_files/tobacco2.txt")
tobacco <- as.character(tobacco[,1])
peach <- read.table("pop_files/peach2.txt")
peach <- as.character(peach[,1])
######

##get diversity estimate using sliding windows for chr1
chr1 <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
#chr1 <- set.populations(chr1,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr1 <- set.populations(chr1,list(tobacco, peach), diploid = TRUE)
chr1.slide <- sliding.window.transform(chr1, 100000, 100000, type = 2)
to.pe.ve.1.fst <- F_ST.stats(chr1.slide)
win.fst <- to.pe.ve.1.fst@nuc.F_ST.pairwise["pop1/pop2",]
bins <- length(chr1.slide@region.names)
ids <- 1:bins
to.pe.ve.1.new <- neutrality.stats(chr1.slide)
to.pe.ve.div.within <- to.pe.ve.1.fst@nuc.diversity.within
chr1.div.within <- to.pe.ve.div.within/bins
##tobacco (mean chr1 pi)
mean(chr1.div.within[,1])
#[1] 0.006252252
##peach (mean chr1 pi)
mean(chr1.div.within[,2])
#[1] 0.005459753
##veg (mean chr1 pi)
mean(chr1.div.within[,3])
#[1] 0.00632896
chr1.theta <- to.pe.ve.1.new@theta_Watterson
chr1.theta <- chr1.theta/bins
chr1.tajima <- to.pe.ve.1.new@Tajima.D
chr1.tajima <- chr1.tajima/bins
ids <- 1:bins
chr1.loess.nucdiv.1 <- loess(chr1.div.within[,1] ~ ids, span = 0.05)
chr1.loess.nucdiv.2 <- loess(chr1.div.within[,2] ~ ids, span = 0.05)
chr1.loess.nucdiv.3 <- loess(chr1.div.within[,3] ~ ids, span = 0.05)
##
plot(predict(chr1.loess.nucdiv.1), type="l", xaxt="n",xlab = "Positions (Mb)", ylab = "Nucleotide diversity", main = "Chromosome 1 (100KB windows)" , ylim = c(0, 0.02))
lines(predict(chr1.loess.nucdiv.2), col="blue")
lines(predict(chr1.loess.nucdiv.3), col="red")
legend("topright", c("Tobacco", "Peach", "Veg"), col = c("black", "blue", "red"), lty = c(1))
##
end <- (1: bins) * 100000
chr1.fst <- data.frame(ids=end, fst=win.fst)
chr1.fst.drop <-chr1.fst %>% na.omit()
chr1.fst.drop$dat <- predict(loess(chr1.fst.drop[,2] ~ chr1.fst.drop[,1], span = 0.05))
##
chr1.div.within <- to.pe.ve.div.within/bins
chr1.nuc.div <- data.frame(ids=1:bins, nuc.div.tob=chr1.div.within[,1], nuc.div.pe=chr1.div.within[,2], theta.tob=chr1.theta[,1], theta.pe=chr1.theta[,2])
chr1.nuc.div.drop <- chr1.nuc.div %>% na.omit()
chr1.nuc.div.drop$nd.dat1 <- predict(loess(chr1.nuc.div.drop[,2] ~ chr1.nuc.div.drop[,1], span = 0.05))
chr1.nuc.div.drop$nd.dat2 <- predict(loess(chr1.nuc.div.drop[,3] ~ chr1.nuc.div.drop[,1], span = 0.05))
chr1.nuc.div.drop$theta.dat3 <- predict(loess(chr1.nuc.div.drop[,4] ~ chr1.nuc.div.drop[,1], span = 0.05))
chr1.nuc.div.drop$theta.dat4 <- predict(loess(chr1.nuc.div.drop[,5] ~ chr1.nuc.div.drop[,1], span = 0.05))
##
#chr1.predict.nd.tob <- chr1.nuc.div.drop[,c(1,2)]
#chr1.predict.nd.pe <- chr1.nuc.div.drop[,c(1,3)]
#chr1.predict.theta.tob <- chr1.nuc.div.drop[,c(1,4)]
#chr1.predict.theta.pe <- chr1.nuc.div.drop[,c(1,5)]
##
#chr1.predict.nd.tob$Type <- rep("Tobacco.Pi", length(chr1.predict.nd.tob[,2]))
#chr1.predict.nd.pe$Type <- rep("Peach.Pi", length(chr1.predict.nd.pe[,2]))
#chr1.predict.theta.tob$Type <- rep("Tobacco.thetaW", length(chr1.predict.theta.tob[,2]))
#chr1.predict.theta.pe$Type <- rep("Peach.thetaW", length(chr1.predict.theta.pe[,2]))
#colnames(chr1.predict.nd.tob) <- c("ids", "Variable", "Type")
#colnames(chr1.predict.nd.pe) <- c("ids", "Variable", "Type")
#colnames(chr1.predict.theta.tob) <- c("ids", "Variable", "Type")
#colnames(chr1.predict.theta.pe) <- c("ids", "Variable", "Type")
#chr1.final <- rbind(chr1.predict.nd.tob, chr1.predict.nd.pe, chr1.predict.theta.tob, chr1.predict.theta.pe)
p2 <- ggplot(chr1.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
#p2 <- ggplot(chr1.final) + geom_line(aes(x=ids, y = Variable, col=Type), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(), axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Pi/ThetaW")
#p2 <- ggplot(chr1.final) + geom_line(aes(x=ids, y = Variable, col=Type)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(), axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Pi/ThetaW")
##
##
chr1.taj <- data.frame(ids=1:bins, taj.tob=chr1.tajima[,1], taj.pe=chr1.tajima[,2])
chr1.taj.drop <- chr1.taj %>% na.omit()
chr1.taj.drop$taj.dat1 <- predict(loess(chr1.taj.drop[,2] ~ chr1.taj.drop[,1], span = 0.05))
chr1.taj.drop$taj.dat2 <- predict(loess(chr1.taj.drop[,3] ~ chr1.taj.drop[,1], span = 0.05))
##
#chr1.predict.taj.tob <- chr1.taj.drop[,c(1,2)]
#chr1.predict.taj.pe <- chr1.taj.drop[,c(1,3)]
#chr1.predict.taj.tob$Type <- rep("Tobacco", length(chr1.predict.taj.tob[,2]))
#chr1.predict.taj.pe$Type <- rep("Peach", length(chr1.predict.taj.pe[,2]))
#colnames(chr1.predict.taj.tob) <- c("ids", "Variable", "Type")
#colnames(chr1.predict.taj.pe) <- c("ids", "Variable", "Type")
##
#chr1.final.taj <- rbind(chr1.predict.taj.tob,chr1.predict.taj.pe)
p3 <- ggplot(chr1.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65")
#p3 <- ggplot(chr1.final.taj) + geom_line(aes(x=ids, y=Variable, col=Type)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows")

#####################################
## Chr1 gene level analysis##########
#####################################
chr1.genes <- splitting.data(chr1, subsites = "gene")
chr1.gene.bins <- length(chr1.genes@region.names)
chr1.genes.fst <- F_ST.stats(chr1.genes)
chr1.gene.nd <- chr1.genes.fst@nuc.diversity.within
chr1.gene.nd.bins <- chr1.gene.nd/chr1.gene.bins
mean(chr1.gene.nd.bins[,1])
#[1] 4.101509e-05
mean(chr1.gene.nd.bins[,2])
#[1] 3.642955e-05
mean(chr1.gene.nd.bins[,3])
#[1] 4.210906e-05
##
chr1.coding <- splitting.data(chr1, subsites = "coding")
chr1.coding.bins <- length(chr1.coding@region.names)
chr1.coding.fst <- F_ST.stats(chr1.coding)
chr1.coding.nd <- chr1.coding.fst@nuc.diversity.within
chr1.coding.nd.bins <- chr1.coding.nd/chr1.coding.bins
mean(chr1.coding.nd.bins[,1])
#[1] 2.421207e-07
mean(chr1.coding.nd.bins[,2])
#[1] 2.246576e-07
mean(chr1.coding.nd.bins[,3])
#[1] 2.571046e-07
##
chr1.intron <- splitting.data(chr1, subsites = "intron")
chr1.intron.bins <- length(chr1.intron@region.names)
chr1.intron.fst <- F_ST.stats(chr1.intron)
chr1.intron.nd <- chr1.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr1.intron.nd.bins <- chr1.intron.nd/chr1.intron.bins
mean(chr1.intron.nd.bins[,1])
#[1] 1.151244e-06
mean(chr1.intron.nd.bins[,2])
#[1] 1.01126e-06
mean(chr1.intron.nd.bins[,3])
#[1] 1.165895e-06
##
chr1.exon <- splitting.data(chr1, subsites = "exon")
chr1.exon.bins <- length(chr1.exon@region.names)
chr1.exon.fst <- F_ST.stats(chr1.exon)
chr1.exon.nd <- chr1.exon.fst@nuc.diversity.within
chr1.exon.nd.bins <- chr1.exon.nd/chr1.exon.bins
mean(chr1.exon.nd.bins[,1])
#[1] 2.881441e-07
mean(chr1.exon.nd.bins[,2])
#[1] 2.687309e-07
mean(chr1.exon.nd.bins[,3])
#[1] 3.078247e-07


##get diversity estimate using sliding windows for chr2
chr2 <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr2 <- set.populations(chr2,list(tobacco, peach), diploid = TRUE)
chr2.slide <- sliding.window.transform(chr2, 100000, 100000, type = 2)
to.pe.ve.2.fst <- F_ST.stats(chr2.slide)
win.fst <- to.pe.ve.2.fst@nuc.F_ST.pairwise["pop1/pop2",]
bins.2 <- length(chr2.slide@region.names)
to.pe.ve.2.neu <- neutrality.stats(chr2.slide)
to.pe.ve.2.div.within <- to.pe.ve.2.fst@nuc.diversity.within
chr2.div.within <- to.pe.ve.2.div.within/bins.2

##tobacco (mean chr2 pi)
mean(chr2.div.within[,1])
#[1] 0.01051322
##peach (mean chr2 pi)
mean(chr2.div.within[,2])
#[1] 0.009541477
##veg (mean chr2 pi)
mean(chr2.div.within[,3])
#[1] 0.01109299

chr2.theta <- to.pe.ve.2.neu@theta_Watterson
chr2.theta <- chr2.theta/bins.2
chr2.tajima <- to.pe.ve.2.neu@Tajima.D
chr2.tajima <- chr2.tajima/bins.2
ids.2 <- 1:bins.2
chr2.loess.nucdiv.1 <- loess(chr2.div.within[,1] ~ ids.2, span = 0.05)
chr2.loess.nucdiv.2 <- loess(chr2.div.within[,2] ~ ids.2, span = 0.05)
chr2.loess.nucdiv.3 <- loess(chr2.div.within[,3] ~ ids.2, span = 0.05)
plot(predict(chr2.loess.nucdiv.1), type="l", xlab = "Positions (Mb)", ylab = "Nucleotide diversity", main = "Chromosome 2 (100KB windows)" , ylim = c(0, 0.03))
lines(predict(chr2.loess.nucdiv.2), col="blue")
lines(predict(chr2.loess.nucdiv.3), col="red")
legend("bottomright", c("Tobacco", "Peach", "Veg"), col = c("black", "blue", "red"), lty = c(1))
##
chr2.win.fst <- to.pe.ve.2.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr2.fst <- data.frame(ids=1:bins.2, fst=chr2.win.fst)
chr2.fst.drop <-chr2.fst %>% na.omit()
chr2.fst.drop$dat <- predict(loess(chr2.fst.drop[,2] ~ chr2.fst.drop[,1], span = 0.05))
p2.1 <- ggplot(chr2.fst.drop, aes(x = ids, y = fst)) + geom_point(col="grey45") + geom_line(aes(y = dat), size = 1, col="goldenrod1") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
##
chr2.div.within <- to.pe.ve.2.div.within/bins.2
chr2.nuc.div <- data.frame(ids=1:bins.2, nuc.div.tob=chr2.div.within[,1], nuc.div.pe=chr2.div.within[,2], theta.tob=chr2.theta[,1], theta.pe=chr2.theta[,2])
chr2.nuc.div.drop <- chr2.nuc.div %>% na.omit()
chr2.nuc.div.drop$nd.dat1 <- predict(loess(chr2.nuc.div.drop[,2] ~ chr2.nuc.div.drop[,1], span = 0.05))
chr2.nuc.div.drop$nd.dat2 <- predict(loess(chr2.nuc.div.drop[,3] ~ chr2.nuc.div.drop[,1], span = 0.05))
chr2.nuc.div.drop$theta.dat3 <- predict(loess(chr2.nuc.div.drop[,4] ~ chr2.nuc.div.drop[,1], span = 0.05))
chr2.nuc.div.drop$theta.dat4 <- predict(loess(chr2.nuc.div.drop[,5] ~ chr2.nuc.div.drop[,1], span = 0.05))
p2.2 <- ggplot(chr2.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Pi/ThetaW")
##
chr2.taj <- data.frame(ids=1:bins.2, taj.tob=chr2.tajima[,1], taj.pe=chr2.tajima[,2])
chr2.taj.drop <- chr2.taj %>% na.omit()
chr2.taj.drop$taj.dat1 <- predict(loess(chr2.taj.drop[,2] ~ chr2.taj.drop[,1], span = 0.05))
chr2.taj.drop$taj.dat2 <- predict(loess(chr2.taj.drop[,3] ~ chr2.taj.drop[,1], span = 0.05))
p2.3 <- ggplot(chr2.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65")


#********************************************************************
##Check pi and nuc. div. within and compare it with theta
#chr2.win.pi <- to.pe.ve.2.fst@Pi/bins.2
#chr.pi.d <- data.frame(ids=1:bins.2, pi.tob=chr2.win.pi[,1], theta.tob=chr2.theta[,1])
#chr2.pi.drop <- chr.pi.d %>% na.omit()
#chr2.pi.drop$pi.dat1 <- predict(loess(chr2.pi.drop[,2] ~ chr2.pi.drop[,1], span = 0.05))
#chr2.pi.drop$theta.dat2 <- predict(loess(chr2.pi.drop[,3] ~ chr2.pi.drop[,1], span = 0.05))
#p2.pi <- ggplot(chr2.pi.drop) + geom_line(aes(x=ids, y = pi.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = theta.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows")
##
#chr2.div.within <- to.pe.ve.2.div.within/bins.2
#chr2.nuc.div.t <- data.frame(ids=1:bins.2, nuc.div.tob=chr2.div.within[,1], theta.tob=chr2.theta[,1])
#chr2.nuc.div.t.drop <- chr2.nuc.div.t %>% na.omit()
#chr2.nuc.div.t.drop$nd.dat1 <- predict(loess(chr2.nuc.div.t.drop[,2] ~ chr2.nuc.div.t.drop[,1], span = 0.05))
#chr2.nuc.div.t.drop$theta.dat2 <- predict(loess(chr2.nuc.div.t.drop[,3] ~ chr2.nuc.div.t.drop[,1], span = 0.05))
#p2.nd <- ggplot(chr2.nuc.div.t.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = theta.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows")
#********************************************************************

#####################################
## Chr2 gene level analysis##########
#####################################
chr2.genes <- splitting.data(chr2, subsites = "gene")
chr2.gene.bins <- length(chr2.genes@region.names)
chr2.genes.fst <- F_ST.stats(chr2.genes)
chr2.gene.nd <- chr2.genes.fst@nuc.diversity.within
chr2.gene.nd.bins <- chr2.gene.nd/chr2.gene.bins
mean(chr2.gene.nd.bins[,1])
#[1] 0.000127732
mean(chr2.gene.nd.bins[,2])
#[1] 0.0001145077
mean(chr2.gene.nd.bins[,3])
#[1] 0.0001341779
##
chr2.coding <- splitting.data(chr2, subsites = "coding")
chr2.coding.bins <- length(chr2.coding@region.names)
chr2.coding.fst <- F_ST.stats(chr2.coding)
chr2.coding.nd <- chr2.coding.fst@nuc.diversity.within
chr2.coding.nd.bins <- chr2.coding.nd/chr2.coding.bins
mean(chr2.coding.nd.bins[,1])
#[1] 5.321455e-07
mean(chr2.coding.nd.bins[,2])
#[1] 4.751432e-07
mean(chr2.coding.nd.bins[,3])
#[1] 5.566908e-07
##
chr2.intron <- splitting.data(chr2, subsites = "intron")
chr2.intron.bins <- length(chr2.intron@region.names)
chr2.intron.fst <- F_ST.stats(chr2.intron)
chr2.intron.nd <- chr2.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr2.intron.nd.bins <- chr2.intron.nd/chr2.intron.bins
mean(chr2.intron.nd.bins[,1])
#
mean(chr2.intron.nd.bins[,2])
#
mean(chr2.intron.nd.bins[,3])
#
##
chr2.exon <- splitting.data(chr2, subsites = "exon")
chr2.exon.bins <- length(chr2.exon@region.names)
chr2.exon.fst <- F_ST.stats(chr2.exon)
chr2.exon.nd <- chr2.exon.fst@nuc.diversity.within
chr2.exon.nd.bins <- chr2.exon.nd/chr2.exon.bins
mean(chr2.exon.nd.bins[,1])
#[1] 6.7856e-07
mean(chr2.exon.nd.bins[,2])
#[1] 6.064862e-07
mean(chr2.exon.nd.bins[,3])
#[1] 7.093564e-07

##get diversity estimate using sliding windows for chr3
chr3 <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
#chr3 <- set.populations(chr3,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr3 <- set.populations(chr3,list(tobacco, peach), diploid = TRUE)
chr3.slide <- sliding.window.transform(chr3, 100000, 100000, type = 2)
to.pe.ve.3.fst <- F_ST.stats(chr3.slide)
bins.3 <- length(chr3.slide@region.names)
to.pe.ve.3.neu <- neutrality.stats(chr3.slide)
to.pe.ve.3.div.within <- to.pe.ve.3.fst@nuc.diversity.within
chr3.div.within <- to.pe.ve.3.div.within/bins.3
##tobacco (mean chr3 pi)
mean(chr3.div.within[,1])
#[1] 0.01304476
##peach (mean chr3 pi)
mean(chr3.div.within[,2])
#[1] 0.01284813
##veg (mean chr3 pi)
mean(chr3.div.within[,3])
#[1] 0.014326

chr3.theta <- to.pe.ve.3.neu@theta_Watterson
chr3.theta <- chr3.theta/bins.3
chr3.tajima <- to.pe.ve.3.neu@Tajima.D
chr3.tajima <- chr3.tajima/bins.3
chr3.win.fst <- to.pe.ve.3.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr3.fst <- data.frame(ids=1:bins.3, fst=chr3.win.fst)
chr3.fst.drop <-chr3.fst %>% na.omit()
chr3.fst.drop$fst.dat <- predict(loess(chr3.fst.drop[,2] ~ chr3.fst.drop[,1], span = 0.05))
p3.1 <- ggplot(chr3.fst.drop, aes(x = ids, y = fst)) + geom_point(col="grey45") + geom_line(aes(y = fst.dat), size = 1, col="goldenrod1") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
##
chr3.div.within <- to.pe.ve.3.div.within/bins.3
chr3.nuc.div <- data.frame(ids=1:bins.3, nuc.div.tob=chr3.div.within[,1], nuc.div.pe=chr3.div.within[,2], theta.tob=chr3.theta[,1], theta.pe=chr3.theta[,2])
chr3.nuc.div.drop <- chr3.nuc.div %>% na.omit()
chr3.nuc.div.drop$nd.dat1 <- predict(loess(chr3.nuc.div.drop[,2] ~ chr3.nuc.div.drop[,1], span = 0.05))
chr3.nuc.div.drop$nd.dat2 <- predict(loess(chr3.nuc.div.drop[,3] ~ chr3.nuc.div.drop[,1], span = 0.05))
chr3.nuc.div.drop$theta.dat3 <- predict(loess(chr3.nuc.div.drop[,4] ~ chr3.nuc.div.drop[,1], span = 0.05))
chr3.nuc.div.drop$theta.dat4 <- predict(loess(chr3.nuc.div.drop[,5] ~ chr3.nuc.div.drop[,1], span = 0.05))
p3.2 <- ggplot(chr3.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi/ThetaW")
##
chr3.taj <- data.frame(ids=1:bins.3, taj.tob=chr3.tajima[,1], taj.pe=chr3.tajima[,2])
chr3.taj.drop <- chr3.taj %>% na.omit()
chr3.taj.drop$taj.dat1 <- predict(loess(chr3.taj.drop[,2] ~ chr3.taj.drop[,1], span = 0.05))
chr3.taj.drop$taj.dat2 <- predict(loess(chr3.taj.drop[,3] ~ chr3.taj.drop[,1], span = 0.05))

p3.3 <- ggplot(chr3.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65") 


#####################################
## Chr3 gene level analysis##########
#####################################
chr3.genes <- splitting.data(chr3, subsites = "gene")
chr3.gene.bins <- length(chr3.genes@region.names)
chr3.genes.fst <- F_ST.stats(chr3.genes)
chr3.gene.nd <- chr3.genes.fst@nuc.diversity.within
chr3.gene.nd.bins <- chr3.gene.nd/chr3.gene.bins
mean(chr3.gene.nd.bins[,1])
#[1] 0.0001544544
mean(chr3.gene.nd.bins[,2])
#[1] 0.0001494276
mean(chr3.gene.nd.bins[,3])
#[1] 0.0001658163
##
chr3.coding <- splitting.data(chr3, subsites = "coding")
chr3.coding.bins <- length(chr3.coding@region.names)
chr3.coding.fst <- F_ST.stats(chr3.coding)
chr3.coding.nd <- chr3.coding.fst@nuc.diversity.within
chr3.coding.nd.bins <- chr3.coding.nd/chr3.coding.bins
mean(chr3.coding.nd.bins[,1])
#[1] 6.530029e-07
mean(chr3.coding.nd.bins[,2])
#[1] 6.188857e-07
mean(chr3.coding.nd.bins[,3])
#[1] 6.926398e-07
##
chr3.intron <- splitting.data(chr3, subsites = "intron")
chr3.intron.bins <- length(chr3.intron@region.names)
chr3.intron.fst <- F_ST.stats(chr3.intron)
chr3.intron.nd <- chr3.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr3.intron.nd.bins <- chr3.intron.nd/chr3.intron.bins
mean(chr3.intron.nd.bins[,1])
#[1] 3.595862e-06
mean(chr3.intron.nd.bins[,2])
#[1] 3.493905e-06
mean(chr3.intron.nd.bins[,3])
#[1] 3.841666e-06
##
chr3.exon <- splitting.data(chr3, subsites = "exon")
chr3.exon.bins <- length(chr3.exon@region.names)
chr3.exon.fst <- F_ST.stats(chr3.exon)
chr3.exon.nd <- chr3.exon.fst@nuc.diversity.within
chr3.exon.nd.bins <- chr3.exon.nd/chr3.exon.bins
mean(chr3.exon.nd.bins[,1])
#[1] 8.038986e-07
mean(chr3.exon.nd.bins[,2])
#[1] 7.565936e-07
mean(chr3.exon.nd.bins[,3])
#[1] 8.460837e-07

##get diversity estimate using sliding windows for chr4
chr4 <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
#chr4 <- set.populations(chr4,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr4 <- set.populations(chr4,list(tobacco, peach), diploid = TRUE)
chr4.slide <- sliding.window.transform(chr4, 100000, 100000, type = 2)
to.pe.ve.4.fst <- F_ST.stats(chr4.slide)
bins.4 <- length(chr4.slide@region.names)
to.pe.ve.4.neu <- neutrality.stats(chr4.slide)
to.pe.ve.4.div.within <- to.pe.ve.4.fst@nuc.diversity.within
chr4.div.within <- to.pe.ve.4.div.within/bins.4
##tobacco (mean chr4 pi)
mean(chr4.div.within[,1])
#[1] 0.01549342
##peach (mean chr4 pi)
mean(chr4.div.within[,2])
#[1] 0.01409342
##veg (mean chr4 pi)
mean(chr4.div.within[,3])
#[1] 0.01597427

chr4.theta <- to.pe.ve.4.neu@theta_Watterson
chr4.theta <- chr4.theta/bins.4
chr4.tajima <- to.pe.ve.4.neu@Tajima.D
chr4.tajima <- chr4.tajima/bins.4
chr4.win.fst <- to.pe.ve.4.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr4.fst <- data.frame(ids=1:bins.4, fst=chr4.win.fst)
chr4.fst.drop <-chr4.fst %>% na.omit()
chr4.fst.drop$fst.dat <- predict(loess(chr4.fst.drop[,2] ~ chr4.fst.drop[,1], span = 0.05))
p4.1 <- ggplot(chr4.fst.drop, aes(x = ids, y = fst)) + geom_point(col="grey45") + geom_line(aes(y = fst.dat), size = 1, col="goldenrod1") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
##
chr4.div.within <- to.pe.ve.4.div.within/bins.4
chr4.nuc.div <- data.frame(ids=1:bins.4, nuc.div.tob=chr4.div.within[,1], nuc.div.pe=chr4.div.within[,2], theta.tob=chr4.theta[,1], theta.pe=chr4.theta[,2])
chr4.nuc.div.drop <- chr4.nuc.div %>% na.omit()
chr4.nuc.div.drop$nd.dat1 <- predict(loess(chr4.nuc.div.drop[,2] ~ chr4.nuc.div.drop[,1], span = 0.05))
chr4.nuc.div.drop$nd.dat2 <- predict(loess(chr4.nuc.div.drop[,3] ~ chr4.nuc.div.drop[,1], span = 0.05))
chr4.nuc.div.drop$theta.dat3 <- predict(loess(chr4.nuc.div.drop[,4] ~ chr4.nuc.div.drop[,1], span = 0.05))
chr4.nuc.div.drop$theta.dat4 <- predict(loess(chr4.nuc.div.drop[,5] ~ chr4.nuc.div.drop[,1], span = 0.05))
p4.2 <- ggplot(chr4.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi/ThetaW")
##
chr4.taj <- data.frame(ids=1:bins.4, taj.tob=chr4.tajima[,1], taj.pe=chr4.tajima[,2])
chr4.taj.drop <- chr4.taj %>% na.omit()
chr4.taj.drop$taj.dat1 <- predict(loess(chr4.taj.drop[,2] ~ chr4.taj.drop[,1], span = 0.05))
chr4.taj.drop$taj.dat2 <- predict(loess(chr4.taj.drop[,3] ~ chr4.taj.drop[,1], span = 0.05))

p4.3 <- ggplot(chr4.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65") 


#####################################
## Chr4 gene level analysis##########
#####################################
chr4.genes <- splitting.data(chr4, subsites = "gene")
chr4.gene.bins <- length(chr4.genes@region.names)
chr4.genes.fst <- F_ST.stats(chr4.genes)
chr4.gene.nd <- chr4.genes.fst@nuc.diversity.within
chr4.gene.nd.bins <- chr4.gene.nd/chr4.gene.bins
mean(chr4.gene.nd.bins[,1])
#[1] 0.0001735918
mean(chr4.gene.nd.bins[,2])
#[1] 0.0001583995
mean(chr4.gene.nd.bins[,3])
#[1] 0.0001809776
##
chr4.coding <- splitting.data(chr4, subsites = "coding")
chr4.coding.bins <- length(chr4.coding@region.names)
chr4.coding.fst <- F_ST.stats(chr4.coding)
chr4.coding.nd <- chr4.coding.fst@nuc.diversity.within
chr4.coding.nd.bins <- chr4.coding.nd/chr4.coding.bins
mean(chr4.coding.nd.bins[,1])
#[1] 6.99488e-07
mean(chr4.coding.nd.bins[,2])
#[1] 6.436714e-07
mean(chr4.coding.nd.bins[,3])
#[1] 7.412843e-07
##
chr4.intron <- splitting.data(chr4, subsites = "intron")
chr4.intron.bins <- length(chr4.intron@region.names)
chr4.intron.fst <- F_ST.stats(chr4.intron)
chr4.intron.nd <- chr4.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr4.intron.nd.bins <- chr4.intron.nd/chr4.intron.bins
mean(chr4.intron.nd.bins[,1])
#[1] 4.088049e-06
mean(chr4.intron.nd.bins[,2])
#[1] 3.72817e-06
mean(chr4.intron.nd.bins[,3])
#[1] 4.280642e-06
##
chr4.exon <- splitting.data(chr4, subsites = "exon")
chr4.exon.bins <- length(chr4.exon@region.names)
chr4.exon.fst <- F_ST.stats(chr4.exon)
chr4.exon.nd <- chr4.exon.fst@nuc.diversity.within
chr4.exon.nd.bins <- chr4.exon.nd/chr4.exon.bins
mean(chr4.exon.nd.bins[,1])
#[1] 9.077256e-07
mean(chr4.exon.nd.bins[,2])
#[1] 8.222114e-07
mean(chr4.exon.nd.bins[,3])
#[1] 9.475133e-07



##get diversity estimate using sliding windows for chr5
chr5 <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
#chr5 <- set.populations(chr5,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr5 <- set.populations(chr5,list(tobacco, peach), diploid = TRUE)
chr5.slide <- sliding.window.transform(chr5, 100000, 100000, type = 2)
to.pe.ve.5.fst <- F_ST.stats(chr5.slide)
bins.5 <- length(chr5.slide@region.names)
to.pe.ve.5.neu <- neutrality.stats(chr5.slide)
to.pe.ve.5.div.within <- to.pe.ve.5.fst@nuc.diversity.within
chr5.div.within <- to.pe.ve.5.div.within/bins.5
##tobacco (mean chr5 pi)
mean(chr5.div.within[,1])
#[1] 0.041385
##peach (mean chr5 pi)
mean(chr5.div.within[,2])
#[1] 0.03997447
##veg (mean chr5 pi)
mean(chr5.div.within[,3])
#[1] 0.04263359

chr5.theta <- to.pe.ve.5.neu@theta_Watterson
chr5.theta <- chr5.theta/bins.5
chr5.tajima <- to.pe.ve.5.neu@Tajima.D
chr5.tajima <- chr5.tajima/bins.5
chr5.win.fst <- to.pe.ve.5.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr5.fst <- data.frame(ids=1:bins.5, fst=chr5.win.fst)
chr5.fst.drop <-chr5.fst %>% na.omit()
chr5.fst.drop$fst.dat <- predict(loess(chr5.fst.drop[,2] ~ chr5.fst.drop[,1], span = 0.05))
p5.1 <- ggplot(chr5.fst.drop, aes(x = ids, y = fst)) + geom_point(col="grey45") + geom_line(aes(y = fst.dat), size = 1, col="goldenrod1") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
##
chr5.div.within <- to.pe.ve.5.div.within/bins.5
chr5.nuc.div <- data.frame(ids=1:bins.5, nuc.div.tob=chr5.div.within[,1], nuc.div.pe=chr5.div.within[,2], theta.tob=chr5.theta[,1], theta.pe=chr5.theta[,2])
chr5.nuc.div.drop <- chr5.nuc.div %>% na.omit()
chr5.nuc.div.drop$nd.dat1 <- predict(loess(chr5.nuc.div.drop[,2] ~ chr5.nuc.div.drop[,1], span = 0.05))
chr5.nuc.div.drop$nd.dat2 <- predict(loess(chr5.nuc.div.drop[,3] ~ chr5.nuc.div.drop[,1], span = 0.05))
chr5.nuc.div.drop$theta.dat3 <- predict(loess(chr5.nuc.div.drop[,4] ~ chr5.nuc.div.drop[,1], span = 0.05))
chr5.nuc.div.drop$theta.dat4 <- predict(loess(chr5.nuc.div.drop[,5] ~ chr5.nuc.div.drop[,1], span = 0.05))
p5.2 <- ggplot(chr5.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi/ThetaW")
##
chr5.taj <- data.frame(ids=1:bins.5, taj.tob=chr5.tajima[,1], taj.pe=chr5.tajima[,2])
chr5.taj.drop <- chr5.taj %>% na.omit()
chr5.taj.drop$taj.dat1 <- predict(loess(chr5.taj.drop[,2] ~ chr5.taj.drop[,1], span = 0.05))
chr5.taj.drop$taj.dat2 <- predict(loess(chr5.taj.drop[,3] ~ chr5.taj.drop[,1], span = 0.05))

p5.3 <- ggplot(chr5.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65") 

#####################################
## Chr5 gene level analysis##########
#####################################
chr5.genes <- splitting.data(chr5, subsites = "gene")
chr5.gene.bins <- length(chr5.genes@region.names)
chr5.genes.fst <- F_ST.stats(chr5.genes)
chr5.gene.nd <- chr5.genes.fst@nuc.diversity.within
chr5.gene.nd.bins <- chr5.gene.nd/chr5.gene.bins
mean(chr5.gene.nd.bins[,1])
#[1] 0.0004177374
mean(chr5.gene.nd.bins[,2])
#[1] 0.0004007619
mean(chr5.gene.nd.bins[,3])
#[1] 0.0004321948
##
chr5.coding <- splitting.data(chr5, subsites = "coding")
chr5.coding.bins <- length(chr5.coding@region.names)
chr5.coding.fst <- F_ST.stats(chr5.coding)
chr5.coding.nd <- chr5.coding.fst@nuc.diversity.within
chr5.coding.nd.bins <- chr5.coding.nd/chr5.coding.bins
mean(chr5.coding.nd.bins[,1])
#[1] 1.564801e-06
mean(chr5.coding.nd.bins[,2])
#[1] 1.470271e-06
mean(chr5.coding.nd.bins[,3])
#[1] 1.621172e-06
##
chr5.intron <- splitting.data(chr5, subsites = "intron")
chr5.intron.bins <- length(chr5.intron@region.names)
chr5.intron.fst <- F_ST.stats(chr5.intron)
chr5.intron.nd <- chr5.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr5.intron.nd.bins <- chr5.intron.nd/chr5.intron.bins
mean(chr5.intron.nd.bins[,1])
#[1] 9.390485e-06
mean(chr5.intron.nd.bins[,2])
#[1] 8.982461e-06
mean(chr5.intron.nd.bins[,3])
#[1] 9.772545e-06
##
chr5.exon <- splitting.data(chr5, subsites = "exon")
chr5.exon.bins <- length(chr5.exon@region.names)
chr5.exon.fst <- F_ST.stats(chr5.exon)
chr5.exon.nd <- chr5.exon.fst@nuc.diversity.within
chr5.exon.nd.bins <- chr5.exon.nd/chr5.exon.bins
mean(chr5.exon.nd.bins[,1])
#[1] 1.980283e-06
mean(chr5.exon.nd.bins[,2])
#[1] 1.903559e-06
mean(chr5.exon.nd.bins[,3])
#[1] 2.062016e-06


##get diversity estimate using sliding windows for chr6
chr6 <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
#chr6 <- set.populations(chr6,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr6 <- set.populations(chr6,list(tobacco, peach), diploid = TRUE)
chr6.slide <- sliding.window.transform(chr6, 100000, 100000, type = 2)
to.pe.ve.6.fst <- F_ST.stats(chr6.slide)
bins.6 <- length(chr6.slide@region.names)
to.pe.ve.6.neu <- neutrality.stats(chr6.slide)
to.pe.ve.6.div.within <- to.pe.ve.6.fst@nuc.diversity.within
chr6.div.within <- to.pe.ve.6.div.within/bins.6
##tobacco (mean chr6 pi)
mean(chr6.div.within[,1])
#[1] 0.04020115
##peach (mean chr6 pi)
mean(chr6.div.within[,2])
#[1] 0.03796607
##veg (mean chr6 pi)
mean(chr6.div.within[,3])
#[1] 0.04170756

chr6.theta <- to.pe.ve.6.neu@theta_Watterson
chr6.theta <- chr6.theta/bins.6
chr6.tajima <- to.pe.ve.6.neu@Tajima.D
chr6.tajima <- chr6.tajima/bins.6
chr6.win.fst <- to.pe.ve.6.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr6.fst <- data.frame(ids=1:bins.6, fst=chr6.win.fst)
chr6.fst.drop <-chr6.fst %>% na.omit()
chr6.fst.drop$fst.dat <- predict(loess(chr6.fst.drop[,2] ~ chr6.fst.drop[,1], span = 0.05))
p6.1 <- ggplot(chr6.fst.drop, aes(x = ids, y = fst)) + geom_point(col="grey45") + geom_line(aes(y = fst.dat), size = 1, col="goldenrod1") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Fst")
##
chr6.div.within <- to.pe.ve.6.div.within/bins.6
chr6.nuc.div <- data.frame(ids=1:bins.6, nuc.div.tob=chr6.div.within[,1], nuc.div.pe=chr6.div.within[,2], theta.tob=chr6.theta[,1], theta.pe=chr6.theta[,2])
chr6.nuc.div.drop <- chr6.nuc.div %>% na.omit()
chr6.nuc.div.drop$nd.dat1 <- predict(loess(chr6.nuc.div.drop[,2] ~ chr6.nuc.div.drop[,1], span = 0.05))
chr6.nuc.div.drop$nd.dat2 <- predict(loess(chr6.nuc.div.drop[,3] ~ chr6.nuc.div.drop[,1], span = 0.05))
chr6.nuc.div.drop$theta.dat3 <- predict(loess(chr6.nuc.div.drop[,4] ~ chr6.nuc.div.drop[,1], span = 0.05))
chr6.nuc.div.drop$theta.dat4 <- predict(loess(chr6.nuc.div.drop[,5] ~ chr6.nuc.div.drop[,1], span = 0.05))
p6.2 <- ggplot(chr6.nuc.div.drop) + geom_line(aes(x=ids, y = nd.dat1), size = 1, col="lightskyblue") + geom_line(aes(x=ids, y = nd.dat2), size = 1, col="lightsalmon")+ geom_line(aes(x=ids, y = theta.dat3), size = 1, col="seagreen1") + geom_line(aes(x=ids, y = theta.dat4), size = 1, col="khaki2")  + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi/ThetaW")
##
chr6.taj <- data.frame(ids=1:bins.6, taj.tob=chr6.tajima[,1], taj.pe=chr6.tajima[,2])
chr6.taj.drop <- chr6.taj %>% na.omit()
chr6.taj.drop$taj.dat1 <- predict(loess(chr6.taj.drop[,2] ~ chr6.taj.drop[,1], span = 0.05))
chr6.taj.drop$taj.dat2 <- predict(loess(chr6.taj.drop[,3] ~ chr6.taj.drop[,1], span = 0.05))
p6.3 <- ggplot(chr6.taj.drop) + geom_line(aes(x=ids, y = taj.dat1), size = 1, col="slategray2") + geom_line(aes(x=ids, y = taj.dat2), size = 1, col="rosybrown2") + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.text = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.line.x=element_line(colour = "black")) + ylab("TajimaD") + xlab("100,000 bp genomic windows") + geom_hline(yintercept=0, linetype="dashed", color = "grey65") 

#####################################
## Chr6 gene level analysis##########
#####################################
chr6.genes <- splitting.data(chr6, subsites = "gene")
chr6.gene.bins <- length(chr6.genes@region.names)
chr6.genes.fst <- F_ST.stats(chr6.genes)
chr6.gene.nd <- chr6.genes.fst@nuc.diversity.within
chr6.gene.nd.bins <- chr6.gene.nd/chr6.gene.bins
mean(chr6.gene.nd.bins[,1])
#[1] 0.0004343793
mean(chr6.gene.nd.bins[,2])
#[1] 0.0004075346
mean(chr6.gene.nd.bins[,3])
#[1] 0.000456459
##
chr6.coding <- splitting.data(chr6, subsites = "coding")
chr6.coding.bins <- length(chr6.coding@region.names)
chr6.coding.fst <- F_ST.stats(chr6.coding)
chr6.coding.nd <- chr6.coding.fst@nuc.diversity.within
chr6.coding.nd.bins <- chr6.coding.nd/chr6.coding.bins
mean(chr6.coding.nd.bins[,1])
#[1] 1.410161e-06
mean(chr6.coding.nd.bins[,2])
#[1] 1.389619e-06
mean(chr6.coding.nd.bins[,3])
#[1] 1.489127e-06
##
chr6.intron <- splitting.data(chr6, subsites = "intron")
chr6.intron.bins <- length(chr6.intron@region.names)
chr6.intron.fst <- F_ST.stats(chr6.intron)
chr6.intron.nd <- chr6.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
chr6.intron.nd.bins <- chr6.intron.nd/chr6.intron.bins
mean(chr6.intron.nd.bins[,1])
#[1] 1.022408e-05
mean(chr6.intron.nd.bins[,2])
#[1] 9.397702e-06
mean(chr6.intron.nd.bins[,3])
#[1] 1.076091e-05
##
chr6.exon <- splitting.data(chr6, subsites = "exon")
chr6.exon.bins <- length(chr6.exon@region.names)
chr6.exon.fst <- F_ST.stats(chr6.exon)
chr6.exon.nd <- chr6.exon.fst@nuc.diversity.within
chr6.exon.nd.bins <- chr6.exon.nd/chr6.exon.bins
mean(chr6.exon.nd.bins[,1])
#[1] 1.978455e-06
mean(chr6.exon.nd.bins[,2])
#[1] 1.96656e-06
mean(chr6.exon.nd.bins[,3])
#[1] 2.120684e-06


#####################################################
#All merged chr for Tob, peach, Veg diversity plot###
#####################################################
all.chr.host.pops <- rbind(chr1.div.within,chr2.div.within,chr3.div.within,chr4.div.within,chr5.div.within,chr6.div.within)
melt.all.chr.host.pops <- melt(all.chr.host.pops)
ggplot(melt.all.chr.host.pops, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "Veg(other hosts)"))




#############################################
#Merged gene structures diversity analysis###
#############################################

##Gene level
all.chr.genes.merged <- rbind(chr1.gene.nd.bins,chr2.gene.nd.bins,chr3.gene.nd.bins,chr4.gene.nd.bins,chr5.gene.nd.bins,chr6.gene.nd.bins)
melt.all.chr.gene.merged <- melt(all.chr.genes.merged)
ggplot(melt.all.chr.gene.merged, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "Veg"))
mean(all.chr.genes.merged[,1])
#[1] 0.000154354
mean(all.chr.genes.merged[,2])
#[1] 0.0001437804
mean(all.chr.genes.merged[,3])
#[1] 0.0001617841

##coding seqs
all.chr.coding.merged <- rbind(chr1.coding.nd.bins,chr2.coding.nd.bins,chr3.coding.nd.bins,chr4.coding.nd.bins,chr5.coding.nd.bins,chr6.coding.nd.bins)
melt.all.chr.coding.merged <- melt(all.chr.coding.merged)
ggplot(melt.all.chr.coding.merged, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "Veg"))
mean(all.chr.coding.merged[,1])
#[1] 6.318456e-07
mean(all.chr.coding.merged[,2])
#[1] 5.908307e-07
mean(all.chr.coding.merged[,3])
#[1] 6.651141e-07

##intronic seqs
all.chr.intron.merged <- rbind(chr1.intron.nd.bins,chr2.intron.nd.bins,chr3.intron.nd.bins,chr4.intron.nd.bins,chr5.intron.nd.bins,chr6.intron.nd.bins)
melt.all.chr.intron.merged <- melt(all.chr.intron.merged)
ggplot(melt.all.chr.intron.merged, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "Veg"))
mean(all.chr.intron.merged[,1])
#[1] 3.694428e-06
mean(all.chr.intron.merged[,2])
#[1] 3.428593e-0
mean(all.chr.intron.merged[,3])
#[1] 3.874028e-06

##exon seqs
all.chr.exon.merged <- rbind(chr1.exon.nd.bins,chr2.exon.nd.bins,chr3.exon.nd.bins,chr4.exon.nd.bins,chr5.exon.nd.bins,chr6.exon.nd.bins)
melt.all.chr.exon.merged <- melt(all.chr.exon.merged)
ggplot(melt.all.chr.exon.merged, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "Veg"))
mean(all.chr.exon.merged[,1])
#[1] 8.136451e-07
mean(all.chr.exon.merged[,2])
#[1] 7.635506e-07
mean(all.chr.exon.merged[,3])
#[1] 8.564838e-07


######################################################
## Diversity of other populations ####################
######################################################

chr1.n <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
chr1.n <- set.populations(chr1.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr1.n.slide <- sliding.window.transform(chr1.n, 100000, 100000, type = 2)
chr1.n.slide.fst <- F_ST.stats(chr1.n.slide)
chr1.n.bins <- length(chr1.n.slide@region.names)
chr1.n.slide.neu <- neutrality.stats(chr1.n.slide)
chr1.n.div.within <- chr1.n.slide.fst@nuc.diversity.within
chr1.n.div.within <- chr1.n.div.within/chr1.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr1.n.div.within[,i]))
}
#[1] 0.00247858         #UK
#[1] 9.446349e-06       #usa
#[1] 0.001821121        #chile
#[1] 0.002421445        #greece
#[1] 0.002361857        #sgreece
#[1] 0.002425215        #ngreece
#[1] 0.002331899        #cgreece
#[1] 0.002068382        #aus
#[1] 0.002550204        #it
#[1] 0.002592967        #chn
#[1] 0.002563489        #eu
#[1] 0.002602026        #asia

chr1.n.theta <- chr1.n.slide.neu@theta_Watterson
chr1.n.theta <- chr1.n.theta/chr1.n.bins
chr1.n.tajima <- chr1.n.slide.neu@Tajima.D
chr1.n.tajima <- chr1.n.tajima/chr1.n.bins


chr2.n <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
chr2.n <- set.populations(chr2.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr2.n.slide <- sliding.window.transform(chr2.n, 100000, 100000, type = 2)
chr2.n.slide.fst <- F_ST.stats(chr2.n.slide)
chr2.n.bins <- length(chr2.n.slide@region.names)
chr2.n.slide.neu <- neutrality.stats(chr2.n.slide)
chr2.n.div.within <- chr2.n.slide.fst@nuc.diversity.within
chr2.n.div.within <- chr2.n.div.within/chr2.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr2.n.div.within[,i]))
}
#[1] 0.00475809       #UK
#[1] 1.166373e-05     #usa
#[1] 0.003457848      #chile
#[1] 0.004645911      #greece
#[1] 0.004489371      #sgreece
#[1] 0.004567249      #ngreece
#[1] 0.004574012      #cgreece
#[1] 0.004017332      #aus
#[1] 0.004904967      #it
#[1] 0.004700484      #chn
#[1] 0.00498216       #eu
#[1] 0.004966161      #asia

chr2.n.theta <- chr2.n.slide.neu@theta_Watterson
chr2.n.theta <- chr2.n.theta/chr2.n.bins
chr2.n.tajima <- chr2.n.slide.neu@Tajima.D
chr2.n.tajima <- chr2.n.tajima/chr2.n.bins




chr3.n <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
chr3.n <- set.populations(chr3.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr3.n.slide <- sliding.window.transform(chr3.n, 100000, 100000, type = 2)
chr3.n.slide.fst <- F_ST.stats(chr3.n.slide)
chr3.n.bins <- length(chr3.n.slide@region.names)
chr3.n.slide.neu <- neutrality.stats(chr3.n.slide)
chr3.n.div.within <- chr3.n.slide.fst@nuc.diversity.within
chr3.n.div.within <- chr3.n.div.within/chr2.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr3.n.div.within[,i]))
}

#[1] 0.005131187
#[1] 5.532155e-06
#[1] 0.003722587
#[1] 0.004733402
#[1] 0.004967985
#[1] 0.004510698
#[1] 0.004661989
#[1] 0.004123889
#[1] 0.005057108
#[1] 0.004912645
#[1] 0.005108147
#[1] 0.005089108

chr3.n.theta <- chr3.n.slide.neu@theta_Watterson
chr3.n.theta <- chr3.n.theta/chr3.n.bins
chr3.n.tajima <- chr3.n.slide.neu@Tajima.D
chr3.n.tajima <- chr3.n.tajima/chr3.n.bins



chr4.n <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
chr4.n <- set.populations(chr4.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr4.n.slide <- sliding.window.transform(chr4.n, 100000, 100000, type = 2)
chr4.n.slide.fst <- F_ST.stats(chr4.n.slide)
chr4.n.bins <- length(chr4.n.slide@region.names)
chr4.n.slide.neu <- neutrality.stats(chr4.n.slide)
chr4.n.div.within <- chr4.n.slide.fst@nuc.diversity.within
chr4.n.div.within <- chr4.n.div.within/chr4.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr4.n.div.within[,i]))
}

#[1] 0.006823913
#[1] 9.673921e-06
#[1] 0.004630519
#[1] 0.006965686
#[1] 0.007076086
#[1] 0.006956904
#[1] 0.006687954
#[1] 0.00579095
#[1] 0.00704424
#[1] 0.007054385
#[1] 0.00724809
#[1] 0.007217519

chr4.n.theta <- chr4.n.slide.neu@theta_Watterson
chr4.n.theta <- chr4.n.theta/chr4.n.bins
chr4.n.tajima <- chr4.n.slide.neu@Tajima.D
chr4.n.tajima <- chr4.n.tajima/chr4.n.bins



chr5.n <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
chr5.n <- set.populations(chr5.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr5.n.slide <- sliding.window.transform(chr5.n, 100000, 100000, type = 2)
chr5.n.slide.fst <- F_ST.stats(chr5.n.slide)
chr5.n.bins <- length(chr5.n.slide@region.names)
chr5.n.slide.neu <- neutrality.stats(chr5.n.slide)
chr5.n.div.within <- chr5.n.slide.fst@nuc.diversity.within
chr5.n.div.within <- chr5.n.div.within/chr5.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr5.n.div.within[,i]))
}
#[1] 0.01885205
#[1] 3.679135e-05
#[1] 0.01335747
#[1] 0.01824947
#[1] 0.01712122
#[1] 0.0170756
#[1] 0.01860482
#[1] 0.0166119
#[1] 0.01931789
#[1] 0.01759056
#[1] 0.01938591
#[1] 0.01875518

chr5.n.theta <- chr5.n.slide.neu@theta_Watterson
chr5.n.theta <- chr5.n.theta/chr5.n.bins
chr5.n.tajima <- chr5.n.slide.neu@Tajima.D
chr5.n.tajima <- chr5.n.tajima/chr5.n.bins



chr6.n <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
chr6.n <- set.populations(chr6.n,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
chr6.n.slide <- sliding.window.transform(chr6.n, 100000, 100000, type = 2)
chr6.n.slide.fst <- F_ST.stats(chr6.n.slide)
chr6.n.bins <- length(chr6.n.slide@region.names)
chr6.n.slide.neu <- neutrality.stats(chr6.n.slide)
chr6.n.div.within <- chr6.n.slide.fst@nuc.diversity.within
chr6.n.div.within <- chr6.n.div.within/chr6.n.bins
## for all populations (mean chr1 pi)
num <- c(1,2,3,4,5,6,7,8,9,10,11,12)
for (i in num) {
  print(mean(chr6.n.div.within[,i]))
}

#[1] 0.01861985
#[1] 2.282688e-05
#[1] 0.01203357
#[1] 0.01759407
#[1] 0.01861532
#[1] 0.0175805
#[1] 0.01667913
#[1] 0.01489267
#[1] 0.01885523
#[1] 0.01805416
#[1] 0.01892071
#[1] 0.01859847

chr6.n.theta <- chr6.n.slide.neu@theta_Watterson
chr6.n.theta <- chr6.n.theta/chr6.n.bins
chr6.n.tajima <- chr6.n.slide.neu@Tajima.D
chr6.n.tajima <- chr6.n.tajima/chr6.n.bins

#merged all chr diversity for geographical pops
all.chr.other.pops <- rbind(chr1.n.div.within,chr2.n.div.within,chr3.n.div.within,chr4.n.div.within,chr5.n.div.within,chr6.n.div.within)
melt.all.chr.other.pops <- melt(all.chr.other.pops)
ggplot(melt.all.chr.other.pops, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Nucleotide diversity (Pi)") 

#merged all chr theta for geographical location
all.chr.other.pops.theta <- rbind(chr1.n.theta,chr2.n.theta,chr3.n.theta,chr4.n.theta,chr5.n.theta,chr6.n.theta)
melt.all.chr.other.pops.theta <- melt(all.chr.other.pops.theta)
ggplot(melt.all.chr.other.pops.theta, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("ThetaW") + scale_fill_discrete(name = "Populations", labels = c("UK", "US","Chile","Greece", "SGreece", "NGreece", "CGreece", "AUS", "IT", "CHN", "EU", "Asia"))

#merged all chr tajima for geographical location
all.chr.other.pops.tajima <- rbind(chr1.n.tajima,chr2.n.tajima,chr3.n.tajima,chr4.n.tajima,chr5.n.tajima,chr6.n.tajima)
melt.all.chr.other.pops.tajima <- melt(all.chr.other.pops.tajima)
ggplot(melt.all.chr.other.pops.tajima, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("TajimaD") + scale_fill_discrete(name = "Populations", labels = c("UK", "US","Chile","Greece", "SGreece", "NGreece", "CGreece", "AUS", "IT", "CHN", "EU", "Asia"))




#################################################################
#All merged chr for all hosts and other locations populations###
################################################################
all.chr.host.pops <- rbind(chr1.div.within,chr2.div.within,chr3.div.within,chr4.div.within,chr5.div.within,chr6.div.within)
colnames(all.chr.host.pops) <- c("Tobacco", "Peach", "Veg")
all.pops <- cbind(all.chr.other.pops, all.chr.host.pops)
melt.all.pops <- melt(all.pops)
ggplot(melt.all.pops, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Nucleotide Diversity (Pi)") + scale_fill_discrete(name = "Populations", labels = c("UK", "USA","Chile","Greece", "S Greece", "N Greece", "C Greece", "Australia", "Italy", "China", "EU", "Asia","Tobacco","Peach","Veg(Other hosts)"))


##Concatenate chromosomes object     
#all.chr <- concatenate.classes(list(chr1.n, chr2.n, chr3.n, chr4.n, chr5.n, chr6.n))
#all.chr <- set.populations(all.chr,list(uk, usa, chile, greece, sgreece, ngreece, cgreece, aus, it, chn, eu, asia))
#all.chr.slide <- sliding.window.transform(all.chr, 100000, 100000, type = 2)


ggplot(melt.all.chr.host.pops, aes(x=Var1, y=value, fill=Var2)) + geom_violin() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("Pi") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "OSR", "Pepper", "Potato"))


#combined theta
all.chr.theta <- rbind(chr1.theta, chr2.theta, chr3.theta, chr4.theta, chr5.theta, chr6.theta)
colnames(all.chr.theta) <- c("Tobacco", "Peach", "OSR", "Pepper", "Potato")
melt.all.theta <- melt(all.chr.theta)
ggplot(melt.all.theta, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("ThetaW") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "OSR", "Pepper", "Potato"))

all.chr.tajima <- rbind(chr1.tajima, chr2.tajima, chr3.tajima, chr4.tajima, chr5.tajima, chr6.tajima)
colnames(all.chr.tajima) <- c("Tobacco", "Peach", "OSR", "Pepper", "Potato")
melt.all.tajima <- melt(all.chr.tajima)
ggplot(melt.all.tajima, aes(x=Var1, y=value, fill=Var2)) + geom_boxplot() + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_blank(),axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"), axis.line.y=element_line(colour = "black"), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ylab("TajimaD") + scale_fill_discrete(name = "Populations", labels = c("Tobacco", "Peach", "OSR", "Pepper", "Potato"))



#Circa
end3 <- (1:bins.3) * 100000
id <- rep("HiC_scaffold_3", length(end3))
chr3.win.fst <- to.pe.ve.3.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr3.fst <- data.frame(chr=id, site=end3, fst=chr3.win.fst)
chr3.fst.drop <-chr3.fst %>% na.omit()
write.csv(chr3.fst.drop, "Chr3.FST")
end4 <- (1:bins.4) * 100000
id <- rep("HiC_scaffold_4", length(end4))
chr4.win.fst <- to.pe.ve.4.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr4.fst <- data.frame(chr=id, site=end4, fst=chr4.win.fst)
chr4.fst.drop <-chr4.fst %>% na.omit()
write.csv(chr4.fst.drop, "Chr4.FST")
end5 <- (1:bins.5) * 100000
id <- rep("HiC_scaffold_5", length(end5))
chr5.win.fst <- to.pe.ve.5.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr5.fst <- data.frame(chr=id, site=end5, fst=chr5.win.fst)
chr5.fst.drop <-chr5.fst %>% na.omit()
write.csv(chr5.fst.drop, "Chr5.FST")
end6 <- (1:bins.6) * 100000
id <- rep("HiC_scaffold_6", length(end6))
chr6.win.fst <- to.pe.ve.6.fst@nuc.F_ST.pairwise["pop1/pop2",]
chr6.fst <- data.frame(chr=id, site=end6, fst=chr6.win.fst)
chr6.fst.drop <-chr6.fst %>% na.omit()
write.csv(chr6.fst.drop, "Chr6.FST")

#########################################################################
end1 <- (1:bins.host) * 100000
id1 <- rep("HiC_scaffold_1", length(end1))
chr1.pi.peach <- data.frame(chr=id1, site=end1, pi=chr1.host.pi[,1])
chr1.pi.tobacco <- data.frame(chr=id, site=end1, pi=chr1.host.pi[,2])

end2 <- (1:chr2.bins.host) * 100000
id2 <- rep("HiC_scaffold_2", length(end2))
chr2.pi.peach <- data.frame(chr=id2, site=end2, pi=chr2.host.pi[,1])
chr2.pi.tobacco <- data.frame(chr=id2, site=end2, pi=chr2.host.pi[,2])

end3 <- (1:chr3.bins.host) * 100000
id3 <- rep("HiC_scaffold_3", length(end3))
chr3.pi.peach <- data.frame(chr=id3, site=end3, pi=chr3.host.pi[,1])
chr3.pi.tobacco <- data.frame(chr=id3, site=end3, pi=chr3.host.pi[,2])

end4 <- (1:chr4.bins.host) * 100000
id4 <- rep("HiC_scaffold_4", length(end4))
chr4.pi.peach <- data.frame(chr=id4, site=end4, pi=chr4.host.pi[,1])
chr4.pi.tobacco <- data.frame(chr=id4, site=end4, pi=chr4.host.pi[,2])

end5 <- (1:chr5.bins.host) * 100000
id5 <- rep("HiC_scaffold_5", length(end5))
chr5.pi.peach <- data.frame(chr=id5, site=end5, pi=chr5.host.pi[,1])
chr5.pi.tobacco <- data.frame(chr=id5, site=end5, pi=chr5.host.pi[,2])

end6 <- (1:chr6.bins.host) * 100000
id6 <- rep("HiC_scaffold_6", length(end6))
chr6.pi.peach <- data.frame(chr=id6, site=end6, pi=chr6.host.pi[,1])
chr6.pi.tobacco <- data.frame(chr=id6, site=end6, pi=chr6.host.pi[,2])


all.chr.pi.peach <- rbind(chr1.pi.peach,chr2.pi.peach,chr3.pi.peach,chr4.pi.peach,chr5.pi.peach,chr6.pi.peach)
all.chr.pi.tobacco <- rbind(chr1.pi.tobacco,chr2.pi.tobacco,chr3.pi.tobacco,chr4.pi.tobacco,chr5.pi.tobacco,chr6.pi.tobacco)

all.chr.pi.peach <- rbind(chr1.pi.peach,chr2.pi.peach,chr3.pi.peach,chr4.pi.peach,chr5.pi.peach,chr6.pi.peach)
all.chr.pi.tobacco <- rbind(chr1.pi.tobacco,chr2.pi.tobacco,chr3.pi.tobacco,chr4.pi.tobacco,chr5.pi.tobacco,chr6.pi.tobacco)
all.chr.pi.peach.drop <- all.chr.pi.peach %>% na.omit()
all.chr.pi.tobacco.drop <- all.chr.pi.tobacco %>% na.omit()
write.csv(all.chr.pi.peach.drop, "all.chr.peach.pi.csv")
write.csv(all.chr.pi.tobacco.drop, "all.chr.tobacco.pi.csv")


end1 <- (1:bins.host) * 100000
id1 <- rep("HiC_scaffold_1", length(end1))
chr1.dxy.peto <- data.frame(chr=id1, site=end1, pi=chr1.host.dxy["pop1/pop2",])

end2 <- (1:chr2.bins.host) * 100000
id2 <- rep("HiC_scaffold_2", length(end2))
chr2.dxy.peto <- data.frame(chr=id2, site=end2, pi=chr2.host.dxy["pop1/pop2",])

end3 <- (1:chr3.bins.host) * 100000
id3 <- rep("HiC_scaffold_3", length(end3))
chr3.dxy.peto <- data.frame(chr=id3, site=end3, pi=chr3.host.dxy["pop1/pop2",])

end4 <- (1:chr4.bins.host) * 100000
id4 <- rep("HiC_scaffold_4", length(end4))
chr4.dxy.peto <- data.frame(chr=id4, site=end4, pi=chr4.host.dxy["pop1/pop2",])

end5 <- (1:chr5.bins.host) * 100000
id5 <- rep("HiC_scaffold_5", length(end5))
chr5.dxy.peto <- data.frame(chr=id5, site=end5, pi=chr5.host.dxy["pop1/pop2",])

end6 <- (1:chr6.bins.host) * 100000
id6 <- rep("HiC_scaffold_6", length(end6))
chr6.dxy.peto <- data.frame(chr=id6, site=end6, pi=chr6.host.dxy["pop1/pop2",])

all.chr.dxy <- rbind(chr1.dxy.peto,chr2.dxy.peto,chr3.dxy.peto,chr4.dxy.peto,chr5.dxy.peto,chr6.dxy.peto)
all.chr.dxy.drop <- all.chr.dxy %>% na.omit()
write.csv(all.chr.dxy.drop, "all.chr.dxy.csv")



