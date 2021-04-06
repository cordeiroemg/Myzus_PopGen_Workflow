tobacco <- read.table("pop_files/tobacco2.txt")
tobacco <- as.character(tobacco[,1])
peach <- read.table("pop_files/peach2.txt")
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

setwd("/Users/ks/Downloads/PopGenome")
##get diversity estimate using sliding windows for chr2
chr1.countries <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
chr1.host <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr1.countries <- set.populations(chr1,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr1.host <- set.populations(chr1.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)

######################################################################
chr1 <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
chr1 <- set.synnonsyn(chr1, ref.chr="/Users/ks/Downloads/PopGenome/chr1/fasta/HiC_scaffold_1.fas", save.codons=TRUE)
chr1 <- set.populations(chr1,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr1.gene.split <- splitting.data(chr1, subsites = "gene")
chr1.gene.split <- neutrality.stats(chr1.gene.split, subsites="syn")
chr1.gene.split <- F_ST.stats(chr1.gene.split, subsites = "syn")
chr1.gene.nd.syn <- chr1.gene.split@nuc.diversity.within
sum(chr1.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr1.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr1.gene.nd.syn[,i], na.rm = TRUE))
}

chr1.gene.split.ns <- splitting.data(chr1, subsites = "gene")
chr1.gene.split.ns <- neutrality.stats(chr1.gene.split.ns, subsites="nonsyn")
chr1.gene.split.ns <- F_ST.stats(chr1.gene.split.ns, subsites = "nonsyn")
chr1.gene.nd.ns <- chr1.gene.split.ns@nuc.diversity.within
sum(chr1.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr1.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr1.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################

##########
chr1.cou.slide <- sliding.window.transform(chr1.countries, 100000, 100000, type = 2)
chr1.cou.slide <- F_ST.stats(chr1.cou.slide)
bins.cou <- length(chr1.cou.slide@region.names)
chr1.cou.slide <- neutrality.stats(chr1.cou.slide)
chr1.cou.theta <- chr1.cou.slide@theta_Watterson
chr1.cou.theta <- chr1.cou.slide@theta_Watterson/bins.cou
chr1.cou.tajima <- chr1.cou.slide@Tajima.D
chr1.cou.tajima <- chr1.cou.slide@Tajima.D/bins.cou
chr1.cou.pi <- chr1.cou.slide@nuc.diversity.within
chr1.cou.pi <- chr1.cou.pi/bins.cou
chr1.cou.dxy <- chr1.host.slide@nuc.diversity.between
chr1.cou.dxy <- chr1.cou.dxy/bins.cou
##########
chr1.host.slide <- sliding.window.transform(chr1.host, 100000, 100000, type = 2)
chr1.host.slide <- F_ST.stats(chr1.host.slide)
bins.host <- length(chr1.host.slide@region.names)
chr1.host.slide <- neutrality.stats(chr1.host.slide)
chr1.host.theta <- chr1.host.slide@theta_Watterson
chr1.host.theta <- chr1.host.slide@theta_Watterson/bins.host
chr1.host.tajima <- chr1.host.slide@Tajima.D
chr1.host.tajima <- chr1.host.slide@Tajima.D/bins.host
chr1.host.pi <- chr1.host.slide@nuc.diversity.within
chr1.host.pi <- chr1.host.pi/bins.host
chr1.host.dxy <- chr1.host.slide@nuc.diversity.between
chr1.host.dxy <- chr1.host.dxy/bins.host

#####################################
## Chr1 gene level analysis##########
#####################################
chr1 <- readData("chr1/VCF", format = "VCF", gffpath = "chr1/GFF")
chr1 <- set.populations(chr1,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr1.genes <- splitting.data(chr1, subsites = "gene")
chr1.genes.fst <- F_ST.stats(chr1.genes)
chr1.gene.nd <- chr1.genes.fst@nuc.diversity.within

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.gene.nd[,i], na.rm = TRUE))
  print(median(chr1.gene.nd[,i], na.rm = TRUE))
  print(sd(chr1.gene.nd[,i], na.rm = TRUE))
}

chr1.coding <- splitting.data(chr1, subsites = "coding")
chr1.coding.fst <- F_ST.stats(chr1.coding)
chr1.coding.nd <- chr1.coding.fst@nuc.diversity.within

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.coding.nd[,i], na.rm = TRUE))
  print(median(chr1.coding.nd[,i], na.rm = TRUE))
  print(sd(chr1.coding.nd[,i], na.rm = TRUE))
}

##
chr1.intron <- splitting.data(chr1, subsites = "intron")
chr1.intron.fst <- F_ST.stats(chr1.intron)
chr1.intron.nd <- chr1.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.intron.nd[,i], na.rm = TRUE))
  print(median(chr1.intron.nd[,i], na.rm = TRUE))
  print(sd(chr1.intron.nd[,i], na.rm = TRUE))
}

##
chr1.exon <- splitting.data(chr1, subsites = "exon")
chr1.exon.fst <- F_ST.stats(chr1.exon)
chr1.exon.nd <- chr1.exon.fst@nuc.diversity.within

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.exon.nd[,i], na.rm = TRUE))
  print(median(chr1.exon.nd[,i], na.rm = TRUE))
  print(sd(chr1.exon.nd[,i], na.rm = TRUE))
}



##Chr2

######################################################################
chr2 <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
chr2 <- set.synnonsyn(chr2, ref.chr="/Users/ks/Downloads/PopGenome/chr2/fasta/HiC_scaffold_2.fas", save.codons=TRUE)
chr2 <- set.populations(chr2,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr2.gene.split <- splitting.data(chr2, subsites = "gene")
chr2.gene.split <- neutrality.stats(chr2.gene.split, subsites="syn")
chr2.gene.split <- F_ST.stats(chr2.gene.split, subsites = "syn")
chr2.gene.nd.syn <- chr2.gene.split@nuc.diversity.within
sum(chr2.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr2.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr2.gene.nd.syn[,i], na.rm = TRUE))
}

chr2.gene.split.ns <- splitting.data(chr2, subsites = "gene")
chr2.gene.split.ns <- neutrality.stats(chr2.gene.split.ns, subsites="nonsyn")
chr2.gene.split.ns <- F_ST.stats(chr2.gene.split.ns, subsites = "nonsyn")
chr2.gene.nd.ns <- chr2.gene.split.ns@nuc.diversity.within
sum(chr2.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr2.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr2.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################




##get diversity estimate using sliding windows for chr2
chr2.countries <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
chr2.host <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr2.countries <- set.populations(chr2.countries,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr2.host <- set.populations(chr2.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
##########
chr2.cou.slide <- sliding.window.transform(chr2.countries, 100000, 100000, type = 2)
chr2.cou.slide <- F_ST.stats(chr2.cou.slide)
chr2.bins.cou <- length(chr2.cou.slide@region.names)
chr2.cou.slide <- neutrality.stats(chr2.cou.slide)
chr2.cou.pi <- chr2.cou.slide@nuc.diversity.within
chr2.cou.pi <- chr2.cou.pi/chr2.bins.cou
chr2.cou.dxy <- chr2.cou.slide@nuc.diversity.between
chr2.cou.dxy <- chr2.cou.dxy/chr2.bins.cou
##########
chr2.host.slide <- sliding.window.transform(chr2.host, 100000, 100000, type = 2)
chr2.host.slide <- F_ST.stats(chr2.host.slide)
chr2.bins.host <- length(chr2.host.slide@region.names)
chr2.host.slide <- neutrality.stats(chr2.host.slide)
chr2.host.pi <- chr2.host.slide@nuc.diversity.within
chr2.host.pi <- chr2.host.pi/chr2.bins.host
chr2.host.dxy <- chr2.host.slide@nuc.diversity.between
chr2.host.dxy <- chr2.host.dxy/chr2.bins.host
chr2.host.theta <- chr2.host.slide@theta_Watterson
chr2.host.theta <- chr2.host.slide@theta_Watterson/chr2.bins.host
chr2.host.tajima <- chr2.host.slide@Tajima.D
chr2.host.tajima <- chr2.host.slide@Tajima.D/chr2.bins.host

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.host.pi[,i], na.rm = TRUE))
  print(median(chr2.host.pi[,i], na.rm = TRUE))
  print(sd(chr2.host.pi[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.host.theta[,i], na.rm = TRUE))
  print(median(chr2.host.theta[,i], na.rm = TRUE))
  print(sd(chr2.host.theta[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr1.host.theta[,i], na.rm = TRUE))
  print(median(chr1.host.theta[,i], na.rm = TRUE))
  print(sd(chr1.host.theta[,i], na.rm = TRUE))
}
#mean(chr2.host.slide@nuc.diversity.between["pop1/pop2", ]/bins.host, na.rm = T)

#####################################
## Chr2 gene level analysis##########
#####################################
chr2 <- readData("chr2/VCF", format = "VCF", gffpath = "chr2/GFF")
chr2 <- set.populations(chr2,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr2.genes <- splitting.data(chr2, subsites = "gene")
chr2.genes.fst <- F_ST.stats(chr2.genes)
chr2.gene.nd <- chr2.genes.fst@nuc.diversity.within

sum(chr2.genes@n.sites)
#[1] 38256235

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.gene.nd[,i], na.rm = TRUE))
  print(median(chr2.gene.nd[,i], na.rm = TRUE))
  print(sd(chr2.gene.nd[,i], na.rm = TRUE))
}
##
chr2.coding <- splitting.data(chr2, subsites = "coding")
chr2.coding.fst <- F_ST.stats(chr2.coding)
chr2.coding.nd <- chr2.coding.fst@nuc.diversity.within
sum(chr2.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.coding.nd[,i], na.rm = TRUE))
  print(median(chr2.coding.nd[,i], na.rm = TRUE))
  print(sd(chr2.coding.nd[,i], na.rm = TRUE))
}
##
chr2.intron <- splitting.data(chr2, subsites = "intron")
chr2.intron.fst <- F_ST.stats(chr2.intron)
chr2.intron.nd <- chr2.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
sum(chr2.intron@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.intron.nd[,i], na.rm = TRUE))
  print(median(chr2.intron.nd[,i], na.rm = TRUE))
  print(sd(chr2.intron.nd[,i], na.rm = TRUE))
}
##
chr2.exon <- splitting.data(chr2, subsites = "exon")
chr2.exon.fst <- F_ST.stats(chr2.exon)
chr2.exon.nd <- chr2.exon.fst@nuc.diversity.within
sum(chr2.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr2.exon.nd[,i], na.rm = TRUE))
  print(median(chr2.exon.nd[,i], na.rm = TRUE))
  print(sd(chr2.exon.nd[,i], na.rm = TRUE))
}


##Chr3

######################################################################
chr3 <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
chr3 <- set.synnonsyn(chr3, ref.chr="/Users/ks/Downloads/PopGenome/chr3/fasta/HiC_scaffold_3.fas", save.codons=TRUE)
chr3 <- set.populations(chr3,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr3.gene.split <- splitting.data(chr3, subsites = "gene")
chr3.gene.split <- neutrality.stats(chr3.gene.split, subsites="syn")
chr3.gene.split <- F_ST.stats(chr3.gene.split, subsites = "syn")
chr3.gene.nd.syn <- chr3.gene.split@nuc.diversity.within
sum(chr3.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr3.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr3.gene.nd.syn[,i], na.rm = TRUE))
}

chr3.gene.split.ns <- splitting.data(chr3, subsites = "gene")
chr3.gene.split.ns <- neutrality.stats(chr3.gene.split.ns, subsites="nonsyn")
chr3.gene.split.ns <- F_ST.stats(chr3.gene.split.ns, subsites = "nonsyn")
chr3.gene.nd.ns <- chr3.gene.split.ns@nuc.diversity.within
sum(chr3.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr3.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr3.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################



##get diversity estimate using sliding windows for chr2
chr3.countries <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
chr3.host <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr3.countries <- set.populations(chr3.countries,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr3.host <- set.populations(chr3.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
##########
chr2.cou.slide <- sliding.window.transform(chr2.countries, 100000, 100000, type = 2)
chr2.cou.slide <- F_ST.stats(chr2.cou.slide)
chr2.bins.cou <- length(chr2.cou.slide@region.names)
chr2.cou.slide <- neutrality.stats(chr2.cou.slide)
chr2.cou.pi <- chr2.cou.slide@nuc.diversity.within
chr2.cou.pi <- chr2.cou.pi/chr2.bins.cou
chr2.cou.dxy <- chr2.cou.slide@nuc.diversity.between
chr2.cou.dxy <- chr2.cou.dxy/chr2.bins.cou
##########
chr3.host.slide <- sliding.window.transform(chr3.host, 100000, 100000, type = 2)
chr3.host.slide <- F_ST.stats(chr3.host.slide)
chr3.bins.host <- length(chr3.host.slide@region.names)
chr3.host.slide <- neutrality.stats(chr3.host.slide)
chr3.host.pi <- chr3.host.slide@nuc.diversity.within
chr3.host.pi <- chr3.host.pi/chr3.bins.host
chr3.host.dxy <- chr3.host.slide@nuc.diversity.between
chr3.host.dxy <- chr3.host.dxy/chr3.bins.host
chr3.host.theta <- chr3.host.slide@theta_Watterson
chr3.host.theta <- chr3.host.slide@theta_Watterson/chr3.bins.host
chr3.host.tajima <- chr3.host.slide@Tajima.D
chr3.host.tajima <- chr3.host.slide@Tajima.D/chr3.bins.host

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.host.pi[,i], na.rm = TRUE))
  print(median(chr3.host.pi[,i], na.rm = TRUE))
  print(sd(chr3.host.pi[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.host.theta[,i], na.rm = TRUE))
  print(median(chr3.host.theta[,i], na.rm = TRUE))
  print(sd(chr3.host.theta[,i], na.rm = TRUE))
}

mean(chr3.host.slide@nuc.diversity.between["pop1/pop2", ]/chr3.bins.host, na.rm = T)

#####################################
## Chr2 gene level analysis##########
#####################################
chr3 <- readData("chr3/VCF", format = "VCF", gffpath = "chr3/GFF")
chr3 <- set.populations(chr3,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr3.genes <- splitting.data(chr3, subsites = "gene")
chr3.genes.fst <- F_ST.stats(chr3.genes)
chr3.gene.nd <- chr3.genes.fst@nuc.diversity.within

sum(chr3.genes@n.sites)
#[1] 38256235

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.gene.nd[,i], na.rm = TRUE))
  print(median(chr3.gene.nd[,i], na.rm = TRUE))
  print(sd(chr3.gene.nd[,i], na.rm = TRUE))
}
##
chr3.coding <- splitting.data(chr3, subsites = "coding")
chr3.coding.fst <- F_ST.stats(chr3.coding)
chr3.coding.nd <- chr3.coding.fst@nuc.diversity.within
sum(chr3.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.coding.nd[,i], na.rm = TRUE))
  print(median(chr3.coding.nd[,i], na.rm = TRUE))
  print(sd(chr3.coding.nd[,i], na.rm = TRUE))
}
##
chr3.intron <- splitting.data(chr3, subsites = "intron")
chr3.intron.fst <- F_ST.stats(chr3.intron)
chr3.intron.nd <- chr3.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
sum(chr3.intron@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.intron.nd[,i], na.rm = TRUE))
  print(median(chr3.intron.nd[,i], na.rm = TRUE))
  print(sd(chr3.intron.nd[,i], na.rm = TRUE))
}
##
chr3.exon <- splitting.data(chr3, subsites = "exon")
chr3.exon.fst <- F_ST.stats(chr3.exon)
chr3.exon.nd <- chr3.exon.fst@nuc.diversity.within
sum(chr3.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr3.exon.nd[,i], na.rm = TRUE))
  print(median(chr3.exon.nd[,i], na.rm = TRUE))
  print(sd(chr3.exon.nd[,i], na.rm = TRUE))
}


##Chr4

######################################################################
chr4 <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
chr4 <- set.synnonsyn(chr4, ref.chr="/Users/ks/Downloads/PopGenome/chr4/fasta/HiC_scaffold_4.fas", save.codons=TRUE)
chr4 <- set.populations(chr4,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr4.gene.split <- splitting.data(chr4, subsites = "gene")
chr4.gene.split <- neutrality.stats(chr4.gene.split, subsites="syn")
chr4.gene.split <- F_ST.stats(chr4.gene.split, subsites = "syn")
chr4.gene.nd.syn <- chr4.gene.split@nuc.diversity.within
sum(chr4.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr4.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr4.gene.nd.syn[,i], na.rm = TRUE))
}

chr4.gene.split.ns <- splitting.data(chr4, subsites = "gene")
chr4.gene.split.ns <- neutrality.stats(chr4.gene.split.ns, subsites="nonsyn")
chr4.gene.split.ns <- F_ST.stats(chr4.gene.split.ns, subsites = "nonsyn")
chr4.gene.nd.ns <- chr4.gene.split.ns@nuc.diversity.within
sum(chr4.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr4.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr4.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################



##get diversity estimate using sliding windows for chr2
chr4.countries <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
chr4.host <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr4.countries <- set.populations(chr4.countries,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr4.host <- set.populations(chr4.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
##########
chr2.cou.slide <- sliding.window.transform(chr2.countries, 100000, 100000, type = 2)
chr2.cou.slide <- F_ST.stats(chr2.cou.slide)
chr2.bins.cou <- length(chr2.cou.slide@region.names)
chr2.cou.slide <- neutrality.stats(chr2.cou.slide)
chr2.cou.pi <- chr2.cou.slide@nuc.diversity.within
chr2.cou.pi <- chr2.cou.pi/chr2.bins.cou
chr2.cou.dxy <- chr2.cou.slide@nuc.diversity.between
chr2.cou.dxy <- chr2.cou.dxy/chr2.bins.cou
##########
chr4.host.slide <- sliding.window.transform(chr4.host, 100000, 100000, type = 2)
chr4.host.slide <- F_ST.stats(chr4.host.slide)
chr4.bins.host <- length(chr4.host.slide@region.names)
chr4.host.slide <- neutrality.stats(chr4.host.slide)
chr4.host.pi <- chr4.host.slide@nuc.diversity.within
chr4.host.pi <- chr4.host.pi/chr4.bins.host
chr4.host.dxy <- chr4.host.slide@nuc.diversity.between
chr4.host.dxy <- chr4.host.dxy/chr4.bins.host
chr4.host.theta <- chr4.host.slide@theta_Watterson
chr4.host.theta <- chr4.host.slide@theta_Watterson/chr4.bins.host
chr4.host.tajima <- chr4.host.slide@Tajima.D
chr4.host.tajima <- chr4.host.slide@Tajima.D/chr4.bins.host

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.host.pi[,i], na.rm = TRUE))
  print(median(chr4.host.pi[,i], na.rm = TRUE))
  print(sd(chr4.host.pi[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.host.theta[,i], na.rm = TRUE))
  print(median(chr4.host.theta[,i], na.rm = TRUE))
  print(sd(chr4.host.theta[,i], na.rm = TRUE))
}


#####################################
## Chr4 gene level analysis##########
#####################################
chr4 <- readData("chr4/VCF", format = "VCF", gffpath = "chr4/GFF")
chr4 <- set.populations(chr4,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr4.genes <- splitting.data(chr4, subsites = "gene")
chr4.genes.fst <- F_ST.stats(chr4.genes)
chr4.gene.nd <- chr4.genes.fst@nuc.diversity.within

sum(chr4.genes@n.sites)
#[1] 38256235

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.gene.nd[,i], na.rm = TRUE))
  print(median(chr4.gene.nd[,i], na.rm = TRUE))
  print(sd(chr4.gene.nd[,i], na.rm = TRUE))
}
##
chr4.coding <- splitting.data(chr4, subsites = "coding")
chr4.coding.fst <- F_ST.stats(chr4.coding)
chr4.coding.nd <- chr4.coding.fst@nuc.diversity.within
sum(chr4.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.coding.nd[,i], na.rm = TRUE))
  print(median(chr4.coding.nd[,i], na.rm = TRUE))
  print(sd(chr4.coding.nd[,i], na.rm = TRUE))
}
##
chr4.intron <- splitting.data(chr4, subsites = "intron")
chr4.intron.fst <- F_ST.stats(chr4.intron)
chr4.intron.nd <- chr4.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
sum(chr4.intron@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.intron.nd[,i], na.rm = TRUE))
  print(median(chr4.intron.nd[,i], na.rm = TRUE))
  print(sd(chr4.intron.nd[,i], na.rm = TRUE))
}
##
chr4.exon <- splitting.data(chr4, subsites = "exon")
chr4.exon.fst <- F_ST.stats(chr4.exon)
chr4.exon.nd <- chr4.exon.fst@nuc.diversity.within
sum(chr4.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr4.exon.nd[,i], na.rm = TRUE))
  print(median(chr4.exon.nd[,i], na.rm = TRUE))
  print(sd(chr4.exon.nd[,i], na.rm = TRUE))
}


##Chr5

######################################################################
chr5 <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
chr5 <- set.synnonsyn(chr5, ref.chr="/Users/ks/Downloads/PopGenome/chr5/fasta/HiC_scaffold_5.fas", save.codons=TRUE)
chr5 <- set.populations(chr5,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr5.gene.split <- splitting.data(chr5, subsites = "gene")
chr5.gene.split <- neutrality.stats(chr5.gene.split, subsites="syn")
chr5.gene.split <- F_ST.stats(chr5.gene.split, subsites = "syn")
chr5.gene.nd.syn <- chr5.gene.split@nuc.diversity.within
sum(chr5.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr5.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr5.gene.nd.syn[,i], na.rm = TRUE))
}

chr5.gene.split.ns <- splitting.data(chr5, subsites = "gene")
chr5.gene.split.ns <- neutrality.stats(chr5.gene.split.ns, subsites="nonsyn")
chr5.gene.split.ns <- F_ST.stats(chr5.gene.split.ns, subsites = "nonsyn")
chr5.gene.nd.ns <- chr5.gene.split.ns@nuc.diversity.within
sum(chr5.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr5.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr5.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################



##get diversity estimate using sliding windows for chr2
chr5.countries <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
chr5.host <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr5.countries <- set.populations(chr5.countries,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr5.host <- set.populations(chr5.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
##########
chr2.cou.slide <- sliding.window.transform(chr2.countries, 100000, 100000, type = 2)
chr2.cou.slide <- F_ST.stats(chr2.cou.slide)
chr2.bins.cou <- length(chr2.cou.slide@region.names)
chr2.cou.slide <- neutrality.stats(chr2.cou.slide)
chr2.cou.pi <- chr2.cou.slide@nuc.diversity.within
chr2.cou.pi <- chr2.cou.pi/chr2.bins.cou
chr2.cou.dxy <- chr2.cou.slide@nuc.diversity.between
chr2.cou.dxy <- chr2.cou.dxy/chr2.bins.cou
##########
chr5.host.slide <- sliding.window.transform(chr5.host, 100000, 100000, type = 2)
chr5.host.slide <- F_ST.stats(chr5.host.slide)
chr5.bins.host <- length(chr5.host.slide@region.names)
chr5.host.slide <- neutrality.stats(chr5.host.slide)
chr5.host.pi <- chr5.host.slide@nuc.diversity.within
chr5.host.pi <- chr5.host.pi/chr5.bins.host
chr5.host.dxy <- chr5.host.slide@nuc.diversity.between
chr5.host.dxy <- chr5.host.dxy/chr5.bins.host
chr5.host.theta <- chr5.host.slide@theta_Watterson
chr5.host.theta <- chr5.host.slide@theta_Watterson/chr5.bins.host
chr5.host.tajima <- chr5.host.slide@Tajima.D
chr5.host.tajima <- chr5.host.slide@Tajima.D/chr5.bins.host

chr5.host@n.sites
chr5.host@n.sites2
chr5.host@n.biallelic.sites

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.host.pi[,i], na.rm = TRUE))
  print(median(chr5.host.pi[,i], na.rm = TRUE))
  print(sd(chr5.host.pi[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.host.theta[,i], na.rm = TRUE))
  print(median(chr5.host.theta[,i], na.rm = TRUE))
  print(sd(chr5.host.theta[,i], na.rm = TRUE))
}

#####################################
## Chr5 gene level analysis##########
#####################################
chr5 <- readData("chr5/VCF", format = "VCF", gffpath = "chr5/GFF")
chr5 <- set.populations(chr5,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr5.genes <- splitting.data(chr5, subsites = "gene")
chr5.genes.fst <- F_ST.stats(chr5.genes)
chr5.gene.nd <- chr5.genes.fst@nuc.diversity.within

sum(chr5.genes@n.sites)
#[1] 38256235

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.gene.nd[,i], na.rm = TRUE))
  print(median(chr5.gene.nd[,i], na.rm = TRUE))
  print(sd(chr5.gene.nd[,i], na.rm = TRUE))
}
##
chr5.coding <- splitting.data(chr5, subsites = "coding")
chr5.coding.fst <- F_ST.stats(chr5.coding)
chr5.coding.nd <- chr5.coding.fst@nuc.diversity.within
sum(chr5.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.coding.nd[,i], na.rm = TRUE))
  print(median(chr5.coding.nd[,i], na.rm = TRUE))
  print(sd(chr5.coding.nd[,i], na.rm = TRUE))
}
##
chr5.intron <- splitting.data(chr5, subsites = "intron")
chr5.intron.fst <- F_ST.stats(chr5.intron)
chr5.intron.nd <- chr5.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
sum(chr5.intron@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.intron.nd[,i], na.rm = TRUE))
  print(median(chr5.intron.nd[,i], na.rm = TRUE))
  print(sd(chr5.intron.nd[,i], na.rm = TRUE))
}
##
chr5.exon <- splitting.data(chr5, subsites = "exon")
chr5.exon.fst <- F_ST.stats(chr5.exon)
chr5.exon.nd <- chr5.exon.fst@nuc.diversity.within
sum(chr5.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr5.exon.nd[,i], na.rm = TRUE))
  print(median(chr5.exon.nd[,i], na.rm = TRUE))
  print(sd(chr5.exon.nd[,i], na.rm = TRUE))
}



##Chr6

######################################################################
chr6 <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
chr6 <- set.synnonsyn(chr6, ref.chr="/Users/ks/Downloads/PopGenome/chr6/fasta/HiC_scaffold_6.fas", save.codons=TRUE)
chr6 <- set.populations(chr6,list(peach, tobacco, osr, pepper, potato), diploid = TRUE)

chr6.gene.split <- splitting.data(chr6, subsites = "gene")
chr6.gene.split <- neutrality.stats(chr6.gene.split, subsites="syn")
chr6.gene.split <- F_ST.stats(chr6.gene.split, subsites = "syn")
chr6.gene.nd.syn <- chr6.gene.split@nuc.diversity.within
sum(chr6.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr6.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr6.gene.nd.syn[,i], na.rm = TRUE))
}

chr6.gene.split.ns <- splitting.data(chr6, subsites = "gene")
chr6.gene.split.ns <- neutrality.stats(chr6.gene.split.ns, subsites="nonsyn")
chr6.gene.split.ns <- F_ST.stats(chr6.gene.split.ns, subsites = "nonsyn")
chr6.gene.nd.ns <- chr6.gene.split.ns@nuc.diversity.within
sum(chr6.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr6.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr6.gene.nd.ns[,i], na.rm = TRUE))
}
########################################################################



##get diversity estimate using sliding windows for chr2
chr6.countries <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
chr6.host <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
#chr2 <- set.populations(chr2,list(tobacco, peach, osr, pepper, potato), diploid = TRUE)
chr6.countries <- set.populations(chr6.countries,list(uk,usa,aus,chn,chile,greece,it), diploid = TRUE)
chr6.host <- set.populations(chr6.host,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
##########
chr2.cou.slide <- sliding.window.transform(chr2.countries, 100000, 100000, type = 2)
chr2.cou.slide <- F_ST.stats(chr2.cou.slide)
chr2.bins.cou <- length(chr2.cou.slide@region.names)
chr2.cou.slide <- neutrality.stats(chr2.cou.slide)
chr2.cou.pi <- chr2.cou.slide@nuc.diversity.within
chr2.cou.pi <- chr2.cou.pi/chr2.bins.cou
chr2.cou.dxy <- chr2.cou.slide@nuc.diversity.between
chr2.cou.dxy <- chr2.cou.dxy/chr2.bins.cou
##########
chr6.host.slide <- sliding.window.transform(chr6.host, 100000, 100000, type = 2)
chr6.host.slide <- F_ST.stats(chr6.host.slide)
chr6.bins.host <- length(chr6.host.slide@region.names)
chr6.host.slide <- neutrality.stats(chr6.host.slide)
chr6.host.pi <- chr6.host.slide@nuc.diversity.within
chr6.host.pi <- chr6.host.pi/chr6.bins.host
chr6.host.dxy <- chr6.host.slide@nuc.diversity.between
chr6.host.dxy <- chr6.host.dxy/chr6.bins.host
chr6.host.theta <- chr6.host.slide@theta_Watterson
chr6.host.theta <- chr6.host.slide@theta_Watterson/chr6.bins.host
chr6.host.tajima <- chr6.host.slide@Tajima.D
chr6.host.tajima <- chr6.host.slide@Tajima.D/chr6.bins.host

chr6.host@n.sites
chr6.host@n.sites2
chr6.host@n.biallelic.sites

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.host.pi[,i], na.rm = TRUE))
  print(median(chr6.host.pi[,i], na.rm = TRUE))
  print(sd(chr6.host.pi[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.host.theta[,i], na.rm = TRUE))
  print(median(chr6.host.theta[,i], na.rm = TRUE))
  print(sd(chr6.host.theta[,i], na.rm = TRUE))
}

#####################################
## Chr5 gene level analysis##########
#####################################
chr6 <- readData("chr6/VCF", format = "VCF", gffpath = "chr6/GFF")
chr6 <- set.populations(chr6,list(peach,tobacco,osr,pepper,potato), diploid = TRUE)
chr6.genes <- splitting.data(chr6, subsites = "gene")
chr6.genes.fst <- F_ST.stats(chr6.genes)
chr6.gene.nd <- chr6.genes.fst@nuc.diversity.within

sum(chr6.genes@n.sites)
#[1] 38256235

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.gene.nd[,i], na.rm = TRUE))
  print(median(chr6.gene.nd[,i], na.rm = TRUE))
  print(sd(chr6.gene.nd[,i], na.rm = TRUE))
}
##
chr6.coding <- splitting.data(chr6, subsites = "coding")
chr6.coding.fst <- F_ST.stats(chr6.coding)
chr6.coding.nd <- chr6.coding.fst@nuc.diversity.within
sum(chr6.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.coding.nd[,i], na.rm = TRUE))
  print(median(chr6.coding.nd[,i], na.rm = TRUE))
  print(sd(chr6.coding.nd[,i], na.rm = TRUE))
}
##
chr6.intron <- splitting.data(chr6, subsites = "intron")
chr6.intron.fst <- F_ST.stats(chr6.intron)
chr6.intron.nd <- chr6.intron.fst@nuc.diversity.within ## you can also calculate pi (both values are similar)
sum(chr6.intron@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.intron.nd[,i], na.rm = TRUE))
  print(median(chr6.intron.nd[,i], na.rm = TRUE))
  print(sd(chr6.intron.nd[,i], na.rm = TRUE))
}
##
chr6.exon <- splitting.data(chr6, subsites = "exon")
chr6.exon.fst <- F_ST.stats(chr6.exon)
chr6.exon.nd <- chr6.exon.fst@nuc.diversity.within
sum(chr6.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr6.exon.nd[,i], na.rm = TRUE))
  print(median(chr6.exon.nd[,i], na.rm = TRUE))
  print(sd(chr6.exon.nd[,i], na.rm = TRUE))
}










mean(chr6.host.slide@nuc.diversity.between["pop1/pop2", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop1/pop2", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop1/pop2", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop1/pop3", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop1/pop3", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop1/pop3", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop1/pop4", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop1/pop4", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop1/pop4", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop1/pop5", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop1/pop5", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop1/pop5", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop2/pop3", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop2/pop3", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop2/pop3", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop2/pop4", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop2/pop4", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop2/pop4", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop2/pop5", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop2/pop5", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop2/pop5", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop3/pop4", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop3/pop4", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop3/pop4", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop3/pop5", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop3/pop5", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop3/pop5", ]/chr6.bins.host, na.rm = TRUE)

mean(chr6.host.slide@nuc.diversity.between["pop4/pop5", ]/chr6.bins.host, na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop4/pop5", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop4/pop5", ]/chr6.bins.host, na.rm = TRUE)



