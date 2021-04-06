##LD measurements
##snpStats

#First convert vcf.gz format to plink ped and map format which is accepted by snpstats
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr1.plink --plink --chr HiC_scaffold_1
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr2.plink --plink --chr HiC_scaffold_2
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr3.plink --plink --chr HiC_scaffold_3
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr4.plink --plink --chr HiC_scaffold_4
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr5.plink --plink --chr HiC_scaffold_5
#vcftools --gzvcf MP100g.biallelic.PASS.vcf.gz --out chr6.plink --plink --chr HiC_scaffold_6

#Install snpstats package
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install("snpStats")
library(snpStats)

#######################################################################
##example data
data(ld.example)
ld.ceph <- ld(ceph.1mb, stats=c("D.prime", "R.squared"), depth=100)
ld.yri <- ld(yri.1mb, stats=c("D.prime", "R.squared"), depth=100)
image(ld.ceph$D.prime, lwd=0)
support.ld
#######################################################################

setwd("/Users/ks/Downloads/LD")

#read ped and map file
chr1.ld <- read.pedfile("chr1.plink.ped", snps = "chr1.plink.map")
chr1.ld$genotypes
chr1.ld$map

#Summary of genotype col and other stats
chr1.ld.snpsum.col <- col.summary(chr1.ld.genotype)

#estimate LD using depth of 100 (if depth=1 means Dprime and rˆ2 of adjacent snps)
chr1.ld.check <- ld(chr1.ld.genotype, stats=c("D.prime", "R.squared"), depth=100)

#check the distribution stats of Dprime and rˆ2
quantile(chr1.ld.check$D.prime@x, na.rm=TRUE)


#read other chromosomes
#chr2
chr2.ld <- read.pedfile("chr2.plink.ped", snps = "chr2.plink.map")
chr2.ld.check <- ld(chr2.ld$genotype, stats=c("D.prime", "R.squared"), depth=100000)
quantile(chr2.ld.check$D.prime@x, na.rm=TRUE)




#other method with Index of association and rd
#https://grunwaldlab.github.io/Population_Genetics_in_R/Linkage_disequilibrium.html
#https://grunwaldlab.github.io/poppr/reference/coercion-methods.html



#third method using plink
#https://www.molecularecologist.com/2015/04/visualizing-linkage-disequilibrium-in-r/


#Fourth method
#https://github.com/pfpetrowski/OhtaDStats
#https://openresearchsoftware.metajnl.com/articles/10.5334/jors.250/





