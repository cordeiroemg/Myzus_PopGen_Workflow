library(MASS)

l1014.chisq.country <- chisq.test(l1014.country)
                                                       
t74.cont <- data.frame(mut=c(60,3,7,10,13,5,7), wt=c(6,1,9,1,1,1,2), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
t74.country <- data.frame(mut=c(7,4,8,20,10,1,24,3,1,9,3,5,4,1,2,1,0,2,1), wt=c(9,1,0,5,1,0,0,1,0,0,1,1,1,1,0,0,1,0,0), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
t74.host <- data.frame(mut=c(43,26,6,7,3), wt=c(4,0,5,3,4), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
                                                       
a302.host <- data.frame(mut=c(1,2,4,6,1), wt=c(46,24,7,4,6), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
a302.cont <- data.frame(mut=c(5,0,6,7,3,0,0), wt=c(59,4,10,4,11,6,9), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
a302.country <- data.frame(mut=c(6,0,0,2,7,0,2,3,1,0,0,0,0,0,0,0,0,0,0), wt=c(10,5,8,23,4,1,22,1,0,9,4,6,5,2,2,1,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))

s431.country <- data.frame(mut=c(4,1,0,8,10,1,17,3,1,9,0,1,2,1,2,1,0,0,0), wt=c(12,4,8,17,1,0,7,1,0,1,4,5,3,1,0,0,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
s431.host <- data.frame(mut=c(17,17,9,8,1), wt=c(30,9,3,2,6), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
s431.cont <- data.frame(mut=c(30,0,4,10,12,1,3), wt=c(36,4,12,1,2,5,6), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))

l1014.cont <- data.frame(mut=c(34,0,9,2,5,5,6), wt=c(32,4,7,9,8,1,3), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
l1014.country <- data.frame(mut=c(9,4,0,13,2,0,14,0,0,4,0,5,4,2,2,1,0,0,1), wt=c(7,1,8,12,9,1,10,4,1,4,4,1,1,0,0,0,1,2,0), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
l1014.host <- data.frame(mut=c(35,4,3,2,2), wt=c(12,22,8,8,5), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
                                                                                                               
r81t.host <- data.frame(mut=c(17,0,0,0,0), wt=c(30,26,11,10,7), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
r81t.country <- data.frame(mut=c(0,3,5,2,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0), wt=c(16,2,3,23,11,1,17,4,1,8,4,6,5,2,2,1,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
r81t.cont <- data.frame(mut=c(17,0,0,0,0,0,0), wt=c(49,4,16,11,13,6,11), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
                                                                                                               

install.packages("chisq.posthoc.test")
library(chisq.posthoc.test)
M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("F", "M"), party = c("Democrat","Independent", "Republican"))
chisq.posthoc.test(M)

##https://rpkgs.datanovia.com/rstatix/index.html
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/rstatix")

library(rstatix)

fisher_test(r81t.host)
row_wise_fisher_test(r81t.host)



> r81t.host <- data.frame(mut=c(17,0,0,0,0), wt=c(30,26,11,10,7), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
> fisher_test(r81t.host)
# A tibble: 1 x 3
n         p p.signif
* <dbl>     <dbl> <chr>   
  1   101 0.0000841 ****    
  > row_wise_fisher_test(r81t.host)
# A tibble: 5 x 5
group       n           p      p.adj p.adj.signif
* <chr>   <dbl>       <dbl>      <dbl> <chr>       
  1 Peach     101 0.000000343 0.00000172 ****        
  2 Tobacco   101 0.00525     0.021      *           
  3 OSR       101 0.203       0.609      ns          
4 Pepper    101 0.205       0.609      ns          
5 Potato    101 0.598       0.609      ns          
> 
  > 
  > r81t.country <- data.frame(mut=c(0,3,5,2,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0), wt=c(16,2,3,23,11,1,17,4,1,8,4,6,5,2,2,1,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN")
                               + )
> row_wise_fisher_test(r81t.country)
# A tibble: 19 x 5
group     n       p p.adj p.adj.signif
* <chr> <dbl>   <dbl> <dbl> <chr>       
  1 UK      127 0.126   1     ns          
2 FRN     127 0.0171  0.308 ns          
3 SPN     127 0.00105 0.02  *           
  4 IT      127 0.522   1     ns          
5 AUS     127 0.358   1     ns          
6 NL      127 1       1     ns          
7 GRC     127 0.0194  0.33  ns          
8 SK      127 1       1     ns          
9 HUN     127 1       1     ns          
10 CHN     127 0.596   1     ns          
11 US      127 1       1     ns          
12 CHL     127 1       1     ns          
13 TUN     127 1       1     ns          
14 ALG     127 1       1     ns          
15 BEL     127 1       1     ns          
16 ARM     127 1       1     ns          
17 GER     127 1       1     ns          
18 ZIM     127 1       1     ns          
19 JPN     127 1       1     ns          
> r81t.cont <- data.frame(mut=c(17,0,0,0,0,0,0), wt=c(49,4,16,11,13,6,11), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
> row_wise_fisher_test(r81t.cont)
# A tibble: 7 x 5
group         n          p   p.adj p.adj.signif
* <chr>     <dbl>      <dbl>   <dbl> <chr>       
  1 Europe      127 0.00000572 0.00004 ****        
  2 USA         127 1          1       ns          
3 UK          127 0.126      0.756   ns          
4 Australia   127 0.358      1       ns          
5 Asia        127 0.213      1       ns          
6 SAmerica    127 1          1       ns          
7 SAfrica     127 0.358      1       ns          
> l1014.country <- data.frame(mut=c(9,4,0,13,2,0,14,0,0,4,0,5,4,2,2,1,0,0,1), wt=c(7,1,8,12,9,1,10,4,1,4,4,1,1,0,0,0,1,2,0), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
> row_wise_fisher_test(l1014.country)
# A tibble: 19 x 5
group     n       p p.adj p.adj.signif
* <chr> <dbl>   <dbl> <dbl> <chr>       
  1 UK      127 0.595   1     ns          
2 FRN     127 0.194   1     ns          
3 SPN     127 0.00648 0.123 ns          
4 IT      127 0.663   1     ns          
5 AUS     127 0.0563  1     ns          
6 NL      127 1       1     ns          
7 GRC     127 0.365   1     ns          
8 SK      127 0.12    1     ns          
9 HUN     127 1       1     ns          
10 CHN     127 1       1     ns          
11 US      127 0.12    1     ns          
12 CHL     127 0.104   1     ns          
13 TUN     127 0.194   1     ns          
14 ALG     127 0.229   1     ns          
15 BEL     127 0.229   1     ns          
16 ARM     127 0.48    1     ns          
17 GER     127 1       1     ns          
18 ZIM     127 0.497   1     ns          
19 JPN     127 0.48    1     ns          
> l1014.cont <- data.frame(mut=c(34,0,9,2,5,5,6), wt=c(32,4,7,9,8,1,3), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
> row_wise_fisher_test(l1014.cont)
# A tibble: 7 x 5
group         n      p p.adj p.adj.signif
* <chr>     <dbl>  <dbl> <dbl> <chr>       
  1 Europe      125 0.592  1     ns          
2 USA         125 0.119  0.654 ns          
3 UK          125 0.598  1     ns          
4 Australia   125 0.0548 0.384 ns          
5 Asia        125 0.561  1     ns          
6 SAmerica    125 0.109  0.654 ns          
7 SAfrica     125 0.316  1     ns          
> l1014.host <- data.frame(mut=c(35,4,3,2,2), wt=c(12,22,8,8,5), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
> row_wise_fisher_test(l1014.host)
# A tibble: 5 x 5
group       n            p       p.adj p.adj.signif
* <chr>   <dbl>        <dbl>       <dbl> <chr>       
  1 Peach     101 0.0000000447 0.000000224 ****        
  2 Tobacco   101 0.00046      0.00184     **          
  3 OSR       101 0.337        0.674       ns          
4 Pepper    101 0.106        0.318       ns          
5 Potato    101 0.45         0.674       ns          
> s431.country <- data.frame(mut=c(4,1,0,8,10,1,17,3,1,9,0,1,2,1,2,1,0,0,0), wt=c(12,4,8,17,1,0,7,1,0,1,4,5,3,1,0,0,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
> row_wise_fisher_test(s431.country)
# A tibble: 19 x 5
group     n       p  p.adj p.adj.signif
* <chr> <dbl>   <dbl>  <dbl> <chr>       
  1 UK      129 0.0656  0.984  ns          
2 FRN     129 0.369   1      ns          
3 SPN     129 0.00678 0.115  ns          
4 IT      129 0.118   1      ns          
5 AUS     129 0.00304 0.0578 ns          
6 NL      129 0.473   1      ns          
7 GRC     129 0.0128  0.205  ns          
8 SK      129 0.344   1      ns          
9 HUN     129 0.473   1      ns          
10 CHN     129 0.00634 0.114  ns          
11 US      129 0.121   1      ns          
12 CHL     129 0.212   1      ns          
13 TUN     129 1       1      ns          
14 ALG     129 1       1      ns          
15 BEL     129 0.222   1      ns          
16 ARM     129 0.473   1      ns          
17 GER     129 1       1      ns          
18 ZIM     129 0.498   1      ns          
19 JPN     129 1       1      ns          
> s431.cont <- data.frame(mut=c(30,0,4,10,12,1,3), wt=c(36,4,12,1,2,5,6), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
> row_wise_fisher_test(s431.cont)
# A tibble: 7 x 5
group         n       p p.adj p.adj.signif
* <chr>     <dbl>   <dbl> <dbl> <chr>       
  1 Europe      126 0.721   0.992 ns          
2 USA         126 0.121   0.484 ns          
3 UK          126 0.0636  0.318 ns          
4 Australia   126 0.00315 0.022 *           
  5 Asia        126 0.00338 0.022 *           
  6 SAmerica    126 0.211   0.633 ns          
7 SAfrica     126 0.496   0.992 ns          
> s431.host <- data.frame(mut=c(17,17,9,8,1), wt=c(30,9,3,2,6), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
> row_wise_fisher_test(s431.host)
# A tibble: 5 x 5
group       n       p  p.adj p.adj.signif
* <chr>   <dbl>   <dbl>  <dbl> <chr>       
  1 Peach     102 0.00946 0.0473 *           
  2 Tobacco   102 0.113   0.278  ns          
3 OSR       102 0.123   0.278  ns          
4 Pepper    102 0.0927  0.278  ns          
5 Potato    102 0.0574  0.23   ns          
> a302.country <- data.frame(mut=c(6,0,0,2,7,0,2,3,1,0,0,0,0,0,0,0,0,0,0), wt=c(10,5,8,23,4,1,22,1,0,9,4,6,5,2,2,1,1,2,1), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
> row_wise_fisher_test(a302.country)
# A tibble: 19 x 5
group     n        p   p.adj p.adj.signif
* <chr> <dbl>    <dbl>   <dbl> <chr>       
  1 UK      128 0.0257   0.437   ns          
2 FRN     128 0.59     1       ns          
3 SPN     128 0.352    1       ns          
4 IT      128 0.365    1       ns          
5 AUS     128 0.000264 0.00502 **          
  6 NL      128 1        1       ns          
7 GRC     128 0.361    1       ns          
8 SK      128 0.0139   0.25    ns          
9 HUN     128 0.164    1       ns          
10 CHN     128 0.354    1       ns          
11 US      128 1        1       ns          
12 CHL     128 0.588    1       ns          
13 TUN     128 0.59     1       ns          
14 ALG     128 1        1       ns          
15 BEL     128 1        1       ns          
16 ARM     128 1        1       ns          
17 GER     128 1        1       ns          
18 ZIM     128 1        1       ns          
19 JPN     128 1        1       ns          
> a302.cont <- data.frame(mut=c(5,0,6,7,3,0,0), wt=c(59,4,10,4,11,6,9), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
> row_wise_fisher_test(a302.cont)
# A tibble: 7 x 5
group         n        p   p.adj p.adj.signif
* <chr>     <dbl>    <dbl>   <dbl> <chr>       
  1 Europe      124 0.00753  0.0452  *           
  2 USA         124 1        1       ns          
3 UK          124 0.0299   0.15    ns          
4 Australia   124 0.000326 0.00228 **          
  5 Asia        124 0.705    1       ns          
6 SAmerica    124 0.588    1       ns          
7 SAfrica     124 0.355    1       ns          
> a302.host <- data.frame(mut=c(1,2,4,6,1), wt=c(46,24,7,4,6), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
> row_wise_fisher_test(a302.host)
# A tibble: 5 x 5
group       n        p   p.adj p.adj.signif
* <chr>   <dbl>    <dbl>   <dbl> <chr>       
  1 Peach     101 0.00123  0.00492 **          
  2 Tobacco   101 0.51     1       ns          
3 OSR       101 0.0439   0.132   ns          
4 Pepper    101 0.000367 0.00183 **          
  5 Potato    101 1        1       ns          
> t74.country <- data.frame(mut=c(7,4,8,20,10,1,24,3,1,9,3,5,4,1,2,1,0,2,1), wt=c(9,1,0,5,1,0,0,1,0,0,1,1,1,1,0,0,1,0,0), row.names = c("UK","FRN","SPN","IT","AUS","NL","GRC","SK","HUN","CHN","US","CHL","TUN","ALG","BEL","ARM","GER","ZIM","JPN"))
> row_wise_fisher_test(t74.country)
# A tibble: 19 x 5
group     n        p  p.adj p.adj.signif
* <chr> <dbl>    <dbl>  <dbl> <chr>       
  1 UK      128 0.000142 0.0027 **          
  2 FRN     128 1        1      ns          
3 SPN     128 0.349    1      ns          
4 IT      128 0.768    1      ns          
5 AUS     128 0.688    1      ns          
6 NL      128 1        1      ns          
7 GRC     128 0.0131   0.236  ns          
8 SK      128 0.534    1      ns          
9 HUN     128 1        1      ns          
10 CHN     128 0.357    1      ns          
11 US      128 0.534    1      ns          
12 CHL     128 1        1      ns          
13 TUN     128 1        1      ns          
14 ALG     128 0.315    1      ns          
15 BEL     128 1        1      ns          
16 ARM     128 1        1      ns          
17 GER     128 0.172    1      ns          
18 ZIM     128 1        1      ns          
19 JPN     128 1        1      ns          
> t74.cont <- data.frame(mut=c(60,3,7,10,13,5,7), wt=c(6,1,9,1,1,1,2), row.names = c("Europe", "USA", "UK", "Australia", "Asia", "SAmerica", "SAfrica"))
> row_wise_fisher_test(t74.cont)
# A tibble: 7 x 5
group         n        p    p.adj p.adj.signif
* <chr>     <dbl>    <dbl>    <dbl> <chr>       
  1 Europe      126 0.0295   0.177    ns          
2 USA         126 0.522    1        ns          
3 UK          126 0.000102 0.000714 ***         
  4 Australia   126 0.689    1        ns          
5 Asia        126 0.462    1        ns          
6 SAmerica    126 1        1        ns          
7 SAfrica     126 0.644    1        ns          
> t74.host <- data.frame(mut=c(43,26,6,7,3), wt=c(4,0,5,3,4), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))
> row_wise_fisher_test(t74.host)
# A tibble: 5 x 5
group       n       p  p.adj p.adj.signif
* <chr>   <dbl>   <dbl>  <dbl> <chr>       
  1 Peach     101 0.0992  0.198  ns          
2 Tobacco   101 0.00998 0.0499 *           
  3 OSR       101 0.0138  0.0499 *           
  4 Pepper    101 0.194   0.198  ns          
5 Potato    101 0.0114  0.0499 *


ML.country <- data.frame(mut=c(28,6,21,11,7,41,10,42,2,2,2,3,2,9,3,4,13,8,2), wt=c(4,4,1,1,3,9,6,6,0,0,0,1,0,1,1,0,5,0,0), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
ML.host <- data.frame(mut=c(66,47,20,18,18), wt=c(28,5,2,2,0), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))


t918.country <- data.frame(mut=c(3,0,2,5,4,8,2,9,0,0,0,2,1,1,1,0,0,0,0), wt=c(29,8,20,7,6,42,14,39,2,2,2,2,1,9,3,4,18,8,2), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
t918.host <- data.frame(mut=c(31,1,0,1,1), wt=c(63,51,22,19,15), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

L918ttg.country <- data.frame(mut=c(5,0,9,0,1,1,0,4,1,0,1,1,0,0,0,0,5,3,0), wt=c(27,8,13,12,9,49,16,44,1,2,1,3,2,10,4,4,13,5,2), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
L918ttg.host <- data.frame(mut=c(4,4,9,6,2), wt=c(90,48,13,14,14), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

L918ctg.country <- data.frame(mut=c(0,0,0,0,1,3,6,0,0,0,0,0,0,1,0,0,0,0,0), wt=c(32,8,22,12,9,47,10,48,2,2,2,4,2,9,4,4,18,8,2), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
L918ctg.host <- data.frame(mut=c(10,0,0,1,1), wt=c(84,52,22,19,15), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

I918ata.country <- data.frame(mut=c(1,0,0,0,0,0,0,1,0,0,0,0,0,2,2,0,1,0,1), wt=c(31,8,22,12,10,50,16,47,2,2,2,4,2,8,2,4,17,8,1), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
I918ata.host <- data.frame(mut=c(6,0,0,0,0,), wt=c(88,52,22,20,16), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

I918att.country <- data.frame(mut=c(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,4,0,0), wt=c(32,8,22,12,10,50,16,47,2,2,2,4,2,10,4,4,14,8,2), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
I918att.host <- data.frame(mut=c(0,3,2,0,0), wt=c(94,49,20,20,16), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

F1014.country <- data.frame(mut=c(10,0,2,5,4,14,0,14,0,0,0,2,1,4,2,0,6,0,1), wt=c(22,8,20,7,6,36,16,34,2,2,2,2,1,6,2,4,12,8,1), row.names = c("UK","USA","AUS","CHL","FRA","IT","SPN","GRC","NL","GER","HUG","BEL","ARM","TUN","ALG","ZIM","CHN","SK","JPN"))
F1014.host <- data.frame(mut=c(39,5,3,2,2), wt=c(55,47,19,18,14), row.names = c("Peach", "Tobacco", "OSR", "Pepper", "Potato"))

















