#library(BiocManager)
#install("ggtree")
library(ggtree)
library(dplyr)
library(ggplot2)
library(treeio)
a <- read.newick("M100g_ggtree.nw")
b <- read.newick("B100g_ggtree.nw")
p3 <- ggtree(a)
p4 <- ggtree(b)
d3 <- p3$data
d4 <- p4$data
d4$x <- 18+max(d4$x) - d4$x + 10+max(d3$x) + 1
pp <- p3 + geom_tiplab(hjust = -0.2) + geom_tree(data=d4) + geom_tiplab(data = d4, hjust = 1.2)
dd <- bind_rows(d3, d4) %>% filter(!is.na(label))
pp + geom_line(aes(x, y, group=label), data=dd, color='grey')
