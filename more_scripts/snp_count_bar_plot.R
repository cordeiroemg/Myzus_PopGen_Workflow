##the raw file is in Downloads folder
##For Myzus
data <- read.table("../MP100g_SNP_summary_mod.txt", header = TRUE, sep = "\t")
data1 <- data[,c("sample","RefHom")]
data2 <- data[,c("sample","NonRefHom")]
data3 <- data[,c("sample","Hets")]
data1[,3]=c(rep("RefHomozygous", nrow(data1)))
data2[,3]=c(rep("NonRefHomozygous", nrow(data2)))
data3[,3]=c(rep("Heterozygous", nrow(data3)))
colnames(data1) <- c("samples", "SNPs", "class")
colnames(data2) <- c("samples", "SNPs", "class")
colnames(data3) <- c("samples", "SNPs", "class")
data.new <- rbind(data1, data2, data3)
ggplot(data.new, aes(fill=class, y=SNPs, x=as.factor(samples))) + geom_bar(position="stack", stat="identity") + theme_classic() + scale_y_continuous(expand = c(0,0)) + theme(axis.line.y = element_line(color="white"), axis.line.x = element_line(color="white"), axis.text.x = element_text(face="bold", color="#993333", size=6, angle=90, hjust = 1, vjust = 1), axis.text.y = element_text(face="bold", color="#993333", size=8), axis.ticks = element_blank()) + labs(x="Samples", y = "Num. of SNPs")

##For Buchnera

bdata <- read.table("../Buchnera.stats.txt", header = TRUE, sep = "\t")
bdata1 <- bdata[,c("Samples","RefHom")]
bdata2 <- bdata[,c("Samples","NonRefHom")]
bdata3 <- bdata[,c("Samples","Hets")]
bdata1[,3]=c(rep("RefHomozygous", nrow(bdata1)))
bdata2[,3]=c(rep("NonRefHomozygous", nrow(bdata2)))
bdata3[,3]=c(rep("Heterozygous", nrow(bdata3)))
colnames(bdata1) <- c("samples", "SNPs", "class")
colnames(bdata2) <- c("samples", "SNPs", "class")
colnames(bdata3) <- c("samples", "SNPs", "class")
bdata.new <- rbind(bdata1, bdata2, bdata3)
ggplot(bdata.new, aes(fill=class, y=SNPs, x=as.factor(samples))) + geom_bar(position="stack", stat="identity") + theme_classic() + scale_y_continuous(expand = c(0,0)) + theme(axis.line.y = element_line(color="white"), axis.line.x = element_line(color="white"), axis.text.x = element_text(face="bold", color="#993333", size=6, angle=90, hjust = 1, vjust = 1), axis.text.y = element_text(face="bold", color="#993333", size=8), axis.ticks = element_blank()) + labs(x="Samples", y = "Num. of SNPs")








