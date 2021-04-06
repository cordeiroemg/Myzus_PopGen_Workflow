#mkdir GFF VCF fasta
#cd VCF
#bcftools filter B100g.minq30.mdp10.qdp25.maxdp650.recode.vcf.gz --regions NZ_CP002701.1 -Ov -o NZ_CP002701.1.vcf
#bcftools filter B100g.minq30.mdp10.qdp25.maxdp650.recode.vcf.gz --regions NZ_CP002702.1 -Ov -o NZ_CP002702.1.vcf
#cd GFF
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "NZ_CP002701.1") print}' GCF_000521565.1_ASM52156v1_genomic.gff > NZ_CP002702.1
#awk '$1 ~ /^#/ {print $0;next} {if ($1 == "NZ_CP002702.1") print}' GCF_000521565.1_ASM52156v1_genomic.gff > NZ_CP002702.1
btobacco <- as.character(read.table("pops/tobacco.txt")[,1])
bpeach <- as.character(read.table("pops/peach.txt")[,1])
bosr <- as.character(read.table("pops/OSR.txt")[,1])
bpepper <- as.character(read.table("pops/pepper.txt")[,1])
bpotato <- as.character(read.table("pops/potato.txt")[,1])
##
library(PopGenome)
setwd("/Users/ks/Downloads/PopGenome/Buchnera")
##
b100g.chr <- readData("NZ_CP002701.1/VCF", format = "VCF", gffpath = "NZ_CP002701.1/GFF")
b100g.chr <- set.synnonsyn(b100g.chr, ref.chr="/Users/ks/Downloads/PopGenome/Buchnera/NZ_CP002701.1/fasta/NZ_CP002701.1.fas")
b100g.chr <- set.populations(b100g.chr,list(bpeach, btobacco, bosr, bpepper, bpotato), diploid = TRUE)
##
b100g.chr.slide <- sliding.window.transform(b100g.chr, 100000, 100000, type = 2)
b100g.chr.slide <- F_ST.stats(b100g.chr.slide)
#b100g.chr.slide.fst <- b100g.chr.slide@nuc.F_ST.pairwise["pop1/pop2",]
b100g.chr.slide.bins <- length(b100g.chr.slide@region.names)
ids <- 1:b100g.chr.slide.bins
b100g.chr.slide <- neutrality.stats(b100g.chr.slide)
b100g.chr.slide.within <- b100g.chr.slide@nuc.diversity.within
b100g.chr.slide.within <- b100g.chr.slide.within/b100g.chr.slide.bins
##
b100g.chr.slide.theta <- b100g.chr.slide@theta_Watterson
b100g.chr.slide.theta <- b100g.chr.slide.theta/b100g.chr.slide.bins
##
b100g.chr.slide.dxy <- b100g.chr.slide@nuc.diversity.between
b100g.chr.slide.dxy <- b100g.chr.slide.dxy/b100g.chr.slide.bins

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(b100g.chr.slide.within[,i], na.rm = TRUE))
  print(median(b100g.chr.slide.within[,i], na.rm = TRUE))
  print(sd(b100g.chr.slide.within[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(b100g.chr.slide.theta[,i], na.rm = TRUE))
  print(median(b100g.chr.slide.theta[,i], na.rm = TRUE))
  print(sd(b100g.chr.slide.theta[,i], na.rm = TRUE))
}

mean(b100g.chr.slide.dxy["pop1/pop2", ], na.rm = TRUE)
median(chr6.host.slide@nuc.diversity.between["pop1/pop2", ]/chr6.bins.host, na.rm = TRUE)
sd(chr6.host.slide@nuc.diversity.between["pop1/pop2", ]/chr6.bins.host, na.rm = TRUE)



##Stats for plasmid
##
b100g.plasmid <- readData("NZ_CP002702.1/VCF", format = "VCF", gffpath = "NZ_CP002702.1/GFF")
b100g.plasmid <- set.synnonsyn(b100g.plasmid, ref.chr="/Users/ks/Downloads/PopGenome/Buchnera/NZ_CP002702.1/fasta/NZ_CP002702.1.fas")
b100g.plasmid <- set.populations(b100g.plasmid,list(bpeach, btobacco, bosr, bpepper, bpotato), diploid = TRUE)
##
b100g.plasmid.slide <- sliding.window.transform(b100g.plasmid, 1000, 1000, type = 2)
b100g.plasmid.slide <- F_ST.stats(b100g.plasmid.slide)
b100g.plasmid.slide <- neutrality.stats(b100g.plasmid.slide)
#
b100g.plasmid.slide.bins <- length(b100g.plasmid.slide@region.names)
b100g.plasmid.slide.within <- b100g.plasmid.slide@nuc.diversity.within/b100g.plasmid.slide.bins
b100g.plasmid.slide.theta <- b100g.plasmid.slide@theta_Watterson/b100g.plasmid.slide.bins
b100g.plasmid.slide.dxy <- b100g.plasmid.slide@nuc.diversity.between/b100g.plasmid.slide.bins

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(b100g.plasmid.slide.within[,i], na.rm = TRUE))
  print(median(b100g.plasmid.slide.within[,i], na.rm = TRUE))
  print(sd(b100g.plasmid.slide.within[,i], na.rm = TRUE))
}

for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(b100g.plasmid.slide.theta[,i], na.rm = TRUE))
  print(median(b100g.plasmid.slide.theta[,i], na.rm = TRUE))
  print(sd(b100g.plasmid.slide.theta[,i], na.rm = TRUE))
}



##############################
##Gene features (Chromosome)
##############################
chr <- readData("NZ_CP002701.1/VCF", format = "VCF", gffpath = "NZ_CP002701.1/GFF")
chr <- set.synnonsyn(chr, ref.chr="/Users/ks/Downloads/PopGenome/Buchnera/NZ_CP002701.1/fasta/NZ_CP002701.1.fas", save.codons=TRUE)
chr <- set.populations(chr,list(bpeach, btobacco, bosr, bpepper, bpotato), diploid = TRUE)


chr.gene.split <- splitting.data(chr, subsites = "gene")
chr.gene.split <- neutrality.stats(chr.gene.split, subsites="syn")
chr.gene.split <- F_ST.stats(chr.gene.split, subsites = "syn")
chr.gene.nd.syn <- chr.coding.split@nuc.diversity.within
sum(chr.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr.gene.nd.syn[,i], na.rm = TRUE))
  print(median(chr.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(chr.gene.nd.syn[,i], na.rm = TRUE))
}

chr.gene.split.ns <- splitting.data(chr, subsites = "gene")
chr.gene.split.ns <- neutrality.stats(chr.gene.split.ns, subsites="nonsyn")
chr.gene.split.ns <- F_ST.stats(chr.gene.split.ns, subsites = "nonsyn")
chr.gene.nd.ns <- chr.gene.split.ns@nuc.diversity.within
sum(chr.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr.gene.nd.ns[,i], na.rm = TRUE))
  print(median(chr.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(chr.gene.nd.ns[,i], na.rm = TRUE))
}


chr.gene <- splitting.data(chr, subsites = "gene")
chr.gene.fst <- F_ST.stats(chr.gene)
chr.gene.nd <- chr.gene.fst@nuc.diversity.within
sum(chr.gene@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr.gene.nd[,i], na.rm = TRUE))
  print(median(chr.gene.nd[,i], na.rm = TRUE))
  print(sd(chr.gene.nd[,i], na.rm = TRUE))
}

##
chr.coding <- splitting.data(chr, subsites = "coding")
chr.coding.fst <- F_ST.stats(chr.coding)
chr.coding.nd <- chr.coding.fst@nuc.diversity.within
sum(chr.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr.coding.nd[,i], na.rm = TRUE))
  print(median(chr.coding.nd[,i], na.rm = TRUE))
  print(sd(chr.coding.nd[,i], na.rm = TRUE))
}
##
chr.exon <- splitting.data(chr, subsites = "exon")
chr.exon.fst <- F_ST.stats(chr.exon)
chr.exon.nd <- chr.exon.fst@nuc.diversity.within
sum(chr.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(chr.exon.nd[,i], na.rm = TRUE))
  print(median(chr.exon.nd[,i], na.rm = TRUE))
  print(sd(chr.exon.nd[,i], na.rm = TRUE))
}


##############################
##Gene features (Plasmid)
##############################
plasmid <- readData("NZ_CP002702.1/VCF", format = "VCF", gffpath = "NZ_CP002702.1/GFF")
plasmid <- set.synnonsyn(plasmid, ref.chr="/Users/ks/Downloads/PopGenome/Buchnera/NZ_CP002702.1/fasta/NZ_CP002702.1.fas", save.codons=TRUE)
plasmid <- set.populations(plasmid,list(bpeach, btobacco, bosr, bpepper, bpotato), diploid = TRUE)


plasmid.gene.split <- splitting.data(plasmid, subsites = "gene")
plasmid.gene.split <- neutrality.stats(plasmid.gene.split, subsites="syn")
plasmid.gene.split <- F_ST.stats(plasmid.gene.split, subsites = "syn")
plasmid.gene.nd.syn <- plasmid.gene.split@nuc.diversity.within
sum(plasmid.gene.split@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(plasmid.gene.nd.syn[,i], na.rm = TRUE))
  print(median(plasmid.gene.nd.syn[,i], na.rm = TRUE))
  print(sd(plasmid.gene.nd.syn[,i], na.rm = TRUE))
}

plasmid.gene.split.ns <- splitting.data(plasmid, subsites = "gene")
plasmid.gene.split.ns <- neutrality.stats(plasmid.gene.split.ns, subsites="nonsyn")
plasmid.gene.split.ns <- F_ST.stats(plasmid.gene.split.ns, subsites = "nonsyn")
plasmid.gene.nd.ns <- plasmid.gene.split.ns@nuc.diversity.within
sum(plasmid.gene.split.ns@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(plasmid.gene.nd.ns[,i], na.rm = TRUE))
  print(median(plasmid.gene.nd.ns[,i], na.rm = TRUE))
  print(sd(plasmid.gene.nd.ns[,i], na.rm = TRUE))
}


plasmid.gene <- splitting.data(plasmid, subsites = "gene")
plasmid.gene.fst <- F_ST.stats(plasmid.gene)
plasmid.gene.nd <- plasmid.gene.fst@nuc.diversity.within
sum(plasmid.gene@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(plasmid.gene.nd[,i], na.rm = TRUE))
  print(median(plasmid.gene.nd[,i], na.rm = TRUE))
  print(sd(plasmid.gene.nd[,i], na.rm = TRUE))
}

##
plasmid.coding <- splitting.data(plasmid, subsites = "coding")
plasmid.coding.fst <- F_ST.stats(plasmid.coding)
plasmid.coding.nd <- plasmid.coding.fst@nuc.diversity.within
sum(plasmid.coding@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(plasmid.coding.nd[,i], na.rm = TRUE))
  print(median(plasmid.coding.nd[,i], na.rm = TRUE))
  print(sd(plasmid.coding.nd[,i], na.rm = TRUE))
}
##
plasmid.exon <- splitting.data(plasmid, subsites = "exon")
plasmid.exon.fst <- F_ST.stats(plasmid.exon)
plasmid.exon.nd <- plasmid.exon.fst@nuc.diversity.within
sum(plasmid.exon@n.sites)
for(i in 1:5) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  print(mean(plasmid.exon.nd[,i], na.rm = TRUE))
  print(median(plasmid.exon.nd[,i], na.rm = TRUE))
  print(sd(plasmid.exon.nd[,i], na.rm = TRUE))
}

##########################################################



b100g.chr <- readData("NZ_CP002701.1/VCF", format = "VCF", gffpath = "NZ_CP002701.1/GFF")
b100g.chr <- set.synnonsyn(b100g.chr, ref.chr="/Users/ks/Downloads/PopGenome/Buchnera/NZ_CP002701.1/fasta/NZ_CP002701.1.fas")
b100g.chr <- set.populations(b100g.chr,list(bpeach, btobacco, bosr, bpepper, bpotato), diploid = TRUE)
##
b100g.chr.slide <- sliding.window.transform(b100g.chr, 10000, 10000, type = 2)
b100g.chr.slide <- F_ST.stats(b100g.chr.slide)
#b100g.chr.slide.fst <- b100g.chr.slide@nuc.F_ST.pairwise["pop1/pop2",]
b100g.chr.slide.bins <- length(b100g.chr.slide@region.names)
ids <- 1:b100g.chr.slide.bins
b100g.chr.slide <- neutrality.stats(b100g.chr.slide)
b100g.chr.slide.within <- b100g.chr.slide@nuc.diversity.within
b100g.chr.slide.within <- b100g.chr.slide.within/b100g.chr.slide.bins
##
b100g.chr.slide.theta <- b100g.chr.slide@theta_Watterson
b100g.chr.slide.theta <- b100g.chr.slide.theta/b100g.chr.slide.bins
##
b100g.chr.slide.dxy <- b100g.chr.slide@nuc.diversity.between
b100g.chr.slide.dxy <- b100g.chr.slide.dxy/b100g.chr.slide.bins



end1 <- (1:b100g.chr.slide.bins) * 10000
id1 <- rep("NZ_CP002701.1", length(end1))
chr.pi.peach <- data.frame(chr=id1, site=end1, pi=b100g.chr.slide.within[,1])

end1 <- (1:b100g.chr.slide.bins) * 10000
id1 <- rep("NZ_CP002701.1", length(end1))
chr.pi.tobacco <- data.frame(chr=id1, site=end1, pi=b100g.chr.slide.within[,2])


chr.dxy.pop12 <- data.frame(chr=id1, site=end1, pi=b100g.chr.slide.dxy["pop1/pop2",])

all.chr.pi.peach.drop <- chr.pi.peach %>% na.omit()
all.chr.pi.tobacco.drop <- chr.pi.tobacco %>% na.omit()
write.csv(all.chr.pi.peach.drop, "buch.all.chr.peach.pi.csv")
write.csv(all.chr.pi.tobacco.drop, "buch.all.chr.tobacco.pi.csv")

all.chr.dxy.pop12 <- chr.dxy.pop12 %>% na.omit()
write.csv(all.chr.dxy.pop12, "buch.all.chr.peach.dxy.csv")


99459606 + 86290500 + 69950500 + 58741133 + 30198977 + 29635500
(374276216 / 390790610) * 100


