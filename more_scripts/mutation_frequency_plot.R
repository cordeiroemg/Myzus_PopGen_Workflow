> setwd("/Users/ks/Downloads/")
> fileg <- read.csv("Excel_100G_Graphs.txt", sep = "\t", header = TRUE)
> fileg
Country nAChR_.R81T. MACE_.S431F. Kdr_.L1014. Skdr_.M918T.
1 Australia    0.0000000   0.63636364   0.1363636   0.04545454
2     Chile    0.0000000   0.08333333   0.5000000   0.41666667
3     China    0.0000000   0.50000000   0.1875000   0.00000000
4    France    0.4000000   0.10000000   0.4000000   0.40000000
5    Greece    0.1458333   0.39583333   0.3750000   0.20833333
6     Italy    0.0800000   0.18000000   0.3400000   0.22000000
7   Tunisia    0.0000000   0.20000000   0.5000000   0.10000000
8     Spain    0.4375000   0.00000000   0.0000000   0.18750000
9        UK    0.0000000   0.20000000   0.3666667   0.13333333
Skdr_.M918L. Skdr_.M918I. Rdl_.A302S. CY3_.T74I.
1   0.40909091   0.00000000  0.31818182  0.5909091
2   0.00000000   0.00000000  0.00000000  0.5000000
3   0.25000000   0.25000000  0.00000000  0.8125000
4   0.20000000   0.00000000  0.00000000  0.8000000
5   0.08333333   0.04166667  0.02083333  0.9791667
6   0.08000000   0.00000000  0.04000000  0.6400000
7   0.10000000   0.20000000  0.00000000  0.4000000
8   0.68750000   0.00000000  0.00000000  1.0000000
9   0.10000000   0.03333333  0.20000000  0.2333333
> fileg <- read.csv("Excel_100G_Graphs.txt", sep = "\t", header = TRUE)
> fileg
Country nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T Skdr_M918L
1 Australia  0.0000000 0.63636364 0.1363636 0.04545454 0.40909091
2     Chile  0.0000000 0.08333333 0.5000000 0.41666667 0.00000000
3     China  0.0000000 0.50000000 0.1875000 0.00000000 0.25000000
4    France  0.4000000 0.10000000 0.4000000 0.40000000 0.20000000
5    Greece  0.1458333 0.39583333 0.3750000 0.20833333 0.08333333
6     Italy  0.0800000 0.18000000 0.3400000 0.22000000 0.08000000
7   Tunisia  0.0000000 0.20000000 0.5000000 0.10000000 0.10000000
8     Spain  0.4375000 0.00000000 0.0000000 0.18750000 0.68750000
9        UK  0.0000000 0.20000000 0.3666667 0.13333333 0.10000000
Skdr_M918I  Rdl_A302S  CY3_T74I
1 0.00000000 0.31818182 0.5909091
2 0.00000000 0.00000000 0.5000000
3 0.25000000 0.00000000 0.8125000
4 0.00000000 0.00000000 0.8000000
5 0.04166667 0.02083333 0.9791667
6 0.00000000 0.04000000 0.6400000
7 0.20000000 0.00000000 0.4000000
8 0.00000000 0.00000000 1.0000000
9 0.03333333 0.20000000 0.2333333
> datam <- fileg[1:9,2:9]
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T Skdr_M918L Skdr_M918I
1  0.0000000 0.63636364 0.1363636 0.04545454 0.40909091 0.00000000
2  0.0000000 0.08333333 0.5000000 0.41666667 0.00000000 0.00000000
3  0.0000000 0.50000000 0.1875000 0.00000000 0.25000000 0.25000000
4  0.4000000 0.10000000 0.4000000 0.40000000 0.20000000 0.00000000
5  0.1458333 0.39583333 0.3750000 0.20833333 0.08333333 0.04166667
6  0.0800000 0.18000000 0.3400000 0.22000000 0.08000000 0.00000000
7  0.0000000 0.20000000 0.5000000 0.10000000 0.10000000 0.20000000
8  0.4375000 0.00000000 0.0000000 0.18750000 0.68750000 0.00000000
9  0.0000000 0.20000000 0.3666667 0.13333333 0.10000000 0.03333333
Rdl_A302S  CY3_T74I
1 0.31818182 0.5909091
2 0.00000000 0.5000000
3 0.00000000 0.8125000
4 0.00000000 0.8000000
5 0.02083333 0.9791667
6 0.04000000 0.6400000
7 0.00000000 0.4000000
8 0.00000000 1.0000000
9 0.20000000 0.2333333
> row.names(datam) <- fileg[,1]
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T Skdr_M918L Skdr_M918I
Australia  0.0000000 0.63636364 0.1363636 0.04545454 0.40909091 0.00000000
Chile      0.0000000 0.08333333 0.5000000 0.41666667 0.00000000 0.00000000
China      0.0000000 0.50000000 0.1875000 0.00000000 0.25000000 0.25000000
France     0.4000000 0.10000000 0.4000000 0.40000000 0.20000000 0.00000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333 0.08333333 0.04166667
Italy      0.0800000 0.18000000 0.3400000 0.22000000 0.08000000 0.00000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000 0.10000000 0.20000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000 0.68750000 0.00000000
UK         0.0000000 0.20000000 0.3666667 0.13333333 0.10000000 0.03333333
Rdl_A302S  CY3_T74I
Australia 0.31818182 0.5909091
Chile     0.00000000 0.5000000
China     0.00000000 0.8125000
France    0.00000000 0.8000000
Greece    0.02083333 0.9791667
Italy     0.04000000 0.6400000
Tunisia   0.00000000 0.4000000
Spain     0.00000000 1.0000000
UK        0.20000000 0.2333333
> library(ggplot2)
> aus <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.63636364, 0.1363636, 0.04545454, 0.40909091, 0.00000000, 0.31818182, 0.5909091))
> aus
mut       freq
1 nAChR_R81T 0.00000000
2 MACE_S431F 0.63636364
3  Kdr_L1014 0.13636360
4 Skdr_M918T 0.04545454
5 Skdr_M918L 0.40909091
6 Skdr_M918I 0.00000000
7  Rdl_A302S 0.31818182
8   CY3_T74I 0.59090910
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut))
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_blank(), axis.text.y = element_text(colour = "black"),axis.text.x = element_blank(),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(colour = "black"),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(colour = "black"),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#993333", size=6, angle=90, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=90, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 0.1, vjust = 0.1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 0, vjust = 0),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> ggplot(data=aus) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> chile <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000,0.08333333,0.5000000,0.41666667, 0.00000000,0.00000000,0.00000000,0.5000000))
> ggplot(data=chile) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> china <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.50000000, 0.1875000, 0.00000000, 0.25000000, 0.25000000, 0.00000000, 0.8125000))
> ggplot(data=china) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> france <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.4000000, 0.10000000, 0.4000000, 0.40000000, 0.20000000, 0.00000000, 0.00000000, 0.8000000))
> ggplot(data=france) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> greece <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.20000000, 0.00000000, 0.00000000, 0.8000000, 0.08333333, 0.04166667, 0.02083333, 0.9791667))
> ggplot(data=greece) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> italy <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0800000, 0.18000000, 0.3400000, 0.22000000, 0.08000000, 0.00000000, 0.04000000, 0.6400000))
> ggplot(data=italy) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> tun <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.20000000, 0.5000000, 0.10000000, 0.10000000 0.20000000, 0.00000000, 0.4000000))
Error: unexpected numeric constant in "tun <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.20000000, 0.5000000, 0.10000000, 0.10000000 0."
> tun <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.20000000, 0.5000000, 0.10000000, 0.10000000, 0.20000000, 0.00000000, 0.4000000))
> ggplot(data=tun) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> spn <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.4375000, 0.00000000, 0.0000000, 0.18750000, 0.68750000, 0.00000000, 0.00000000, 1.0000000))
> ggplot(data=spn) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")
> datam
nAChR_R81T MACE_S431F Kdr_L1014 Skdr_M918T
Australia  0.0000000 0.63636364 0.1363636 0.04545454
Chile      0.0000000 0.08333333 0.5000000 0.41666667
China      0.0000000 0.50000000 0.1875000 0.00000000
France     0.4000000 0.10000000 0.4000000 0.40000000
Greece     0.1458333 0.39583333 0.3750000 0.20833333
Italy      0.0800000 0.18000000 0.3400000 0.22000000
Tunisia    0.0000000 0.20000000 0.5000000 0.10000000
Spain      0.4375000 0.00000000 0.0000000 0.18750000
UK         0.0000000 0.20000000 0.3666667 0.13333333
Skdr_M918L Skdr_M918I  Rdl_A302S  CY3_T74I
Australia 0.40909091 0.00000000 0.31818182 0.5909091
Chile     0.00000000 0.00000000 0.00000000 0.5000000
China     0.25000000 0.25000000 0.00000000 0.8125000
France    0.20000000 0.00000000 0.00000000 0.8000000
Greece    0.08333333 0.04166667 0.02083333 0.9791667
Italy     0.08000000 0.00000000 0.04000000 0.6400000
Tunisia   0.10000000 0.20000000 0.00000000 0.4000000
Spain     0.68750000 0.00000000 0.00000000 1.0000000
UK        0.10000000 0.03333333 0.20000000 0.2333333
> uk <- data.frame(mut=c("nAChR_R81T","MACE_S431F","Kdr_L1014","Skdr_M918T","Skdr_M918L","Skdr_M918I","Rdl_A302S","CY3_T74I"), freq=c(0.0000000, 0.20000000, 0.3666667, 0.13333333, 0.10000000, 0.03333333, 0.20000000, 0.2333333))
> ggplot(data=uk) + geom_col(aes(x = mut, y = freq, fill = mut)) + theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.title.x=element_text(colour = "black"), axis.text.y = element_text(colour = "black"),axis.text.x = element_text(face="bold", color="#020202", size=6, angle=45, hjust = 1, vjust = 1),  axis.ticks.x=element_blank(), axis.line.y=element_line(colour = "black")) + ylab("Frequency") + xlab("Mutations")