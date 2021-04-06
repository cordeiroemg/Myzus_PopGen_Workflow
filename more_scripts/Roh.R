> install.packages("detectRUNS")
also installing the dependency ‘itertools’

trying URL 'https://cran.rstudio.com/bin/macosx/el-capitan/contrib/3.6/itertools_0.1-3.tgz'
Content type 'application/x-gzip' length 112584 bytes (109 KB)
==================================================
  downloaded 109 KB

trying URL 'https://cran.rstudio.com/bin/macosx/el-capitan/contrib/3.6/detectRUNS_0.9.6.tgz'
Content type 'application/x-gzip' length 1582603 bytes (1.5 MB)
==================================================
  downloaded 1.5 MB


The downloaded binary packages are in
/var/folders/kw/d8p33tb10mb_pr2bnvtlxl340000gn/T//Rtmp2C0RiQ/downloaded_packages
> library(detectRUNS)
Using detectRUNS 0.9.6
> setwd("Users/ks/Downloads/ROH")
Error in setwd("Users/ks/Downloads/ROH") : 
  cannot change working directory
> getwd()
[1] "/Users/ks"
> setwd("/Users/ks/Downloads/ROH")
> getwd()
[1] "/Users/ks/Downloads/ROH"
> dir()
[1] "peach_tobacco.map" "peach_tobacco.ped"
> genotypeFilePath <- "peach_tobacco.ped"
> mapFilePath <- "peach_tobacco.map"
> slidingRuns <- slidingRUNS.run(
  +     genotypeFile = genotypeFilePath,
  +     mapFile = mapFilePath,
  +     windowSize = 15,
  +     threshold = 0.05,
  +     minSNP = 20,
  +     ROHet = FALSE,
  +     maxOppWindow = 1,
  +     maxMissWindow = 1,
  +     maxGap = 10^6,
  +     minLengthBps = 250000,
  +     minDensity = 3.4/10^3,
  +     maxOppRun = NULL,
  +     maxMissRun = NULL
  + )
You are using the method: SLIDING WINDOWS
Analysing Runs of Homozygosity (ROHom)
Window size: 15
Threshold for calling SNP in a Run: 0.05
N. of RUNS for individual HFH5FBCX2_MP-DNAillumina is: 37
N. of RUNS for individual LIB15046 is: 30
N. of RUNS for individual LIB18337 is: 87
N. of RUNS for individual LIB18342 is: 45
N. of RUNS for individual LIB18343 is: 49
N. of RUNS for individual LIB18344 is: 74
N. of RUNS for individual LIB18346 is: 38
N. of RUNS for individual LIB18347 is: 30
N. of RUNS for individual LIB34498 is: 67
N. of RUNS for individual LIB34499 is: 68
N. of RUNS for individual LIB34500 is: 50
N. of RUNS for individual LIB34503 is: 32
N. of RUNS for individual LIB34504 is: 66
N. of RUNS for individual S101_Al6 is: 7
N. of RUNS for individual S12_IT418PBT is: 64
N. of RUNS for individual S13_IT418PHR is: 68
N. of RUNS for individual S15_IT518PRH is: 68
N. of RUNS for individual S16_SP518PP is: 74
N. of RUNS for individual S18_FR618PE is: 67
N. of RUNS for individual S19_FR618P is: 32
N. of RUNS for individual S23_GR516PNe is: 15
N. of RUNS for individual S2_4824J is: 77
N. of RUNS for individual S31_13HH is: 47
N. of RUNS for individual S34_48 is: 40
N. of RUNS for individual S35_49 is: 16
N. of RUNS for individual S36_52 is: 42
N. of RUNS for individual S38_195 is: 59
N. of RUNS for individual S41_64 is: 44
N. of RUNS for individual S4_SPN is: 74
N. of RUNS for individual S52_GPeTy2 is: 64
N. of RUNS for individual S53_GPeTy7 is: 66
N. of RUNS for individual S54_GPeTy3 is: 63
N. of RUNS for individual S55_GPeTy4 is: 80
N. of RUNS for individual S56_GPeTy8 is: 63
N. of RUNS for individual S57_GPeTy5 is: 52
N. of RUNS for individual S58_GPeTy1 is: 34
N. of RUNS for individual S59_GToKa1 is: 28
N. of RUNS for individual S5_FRC is: 88
N. of RUNS for individual S60_GToKa3 is: 5
N. of RUNS for individual S61_GToKa4 is: 26
N. of RUNS for individual S62_GPeAl1 is: 66
N. of RUNS for individual S63_GToKe1 is: 27
N. of RUNS for individual S64_GToKe2 is: 5
N. of RUNS for individual S65_GPePl1 is: 55
N. of RUNS for individual S66_GPePl2 is: 50
N. of RUNS for individual S67_GPeKa1 is: 71
N. of RUNS for individual S68_GPeLe1 is: 60
N. of RUNS for individual S69_GPeNa1 is: 49
N. of RUNS for individual S6_5524H is: 64
N. of RUNS for individual S70_GPeMe1 is: 39
N. of RUNS for individual S73_HBYT is: 21
N. of RUNS for individual S74_USOxford is: 38
N. of RUNS for individual S75_USLab is: 38
N. of RUNS for individual S78_SpRSA is: 87
N. of RUNS for individual S79_SpRSB is: 93
N. of RUNS for individual S80_SpSSA is: 94
N. of RUNS for individual S81_SpSSB is: 50
N. of RUNS for individual S84_Chilpea is: 105
N. of RUNS for individual S85_Chilpea2 is: 102
N. of RUNS for individual S86_Chilpea3 is: 100
N. of RUNS for individual S87_Chilpea4 is: 124
N. of RUNS for individual S88_Chilpea5 is: 108
N. of RUNS for individual S89_Lab is: 22
N. of RUNS for individual S8_114 is: 4
N. of RUNS for individual S90_Lab is: 29
N. of RUNS for individual S91_Field is: 33
N. of RUNS for individual S92_Field is: 50
N. of RUNS for individual S93_Field is: 5
N. of RUNS for individual S94_Field is: 34
N. of RUNS for individual S97_Tun11 is: 15
N. of RUNS for individual S9_144 is: 13
> summaryList <- summaryRuns(
  +     runs = slidingRuns, mapFile = mapFilePath, genotypeFile = genotypeFilePath,
  +     Class = 6, snpInRuns = TRUE)
Checking files...
Using class: 6
Total genome length: 274744571
calculating Froh on all genome
Total genome length: 274744571
calculating Froh chromosome by chromosome
Total genome length: 274744571
calculating Froh by Class
[1] "Class used: >0"
[1] "Class used: >6"
[1] "Class used: >12"
[1] "Class used: >24"
[1] "Class used: >48"
Class created: 0-6Class created: 6-12Class created: 12-24Class created: 24-48Class created: >48
Calculating SNPs inside ROH
Calculation % SNP in ROH
Chromosome founds:  5
|=====================================================================================| 100%
Calculation % SNP in ROH finish
> plot_Runs(runs = slidingRuns)
> plot_StackedRuns(runs = slidingRuns)
[1] "Current population:  Tobacco"
[1] "CHR:  2"
[1] "CHR:  3"
[1] "CHR:  4"
[1] "CHR:  5"
[1] "CHR:  6"
[1] "Current population:  Peach"
[1] "CHR:  2"
[1] "CHR:  3"
[1] "CHR:  4"
[1] "CHR:  5"
[1] "CHR:  6"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==2,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  2"
[1] "N. of runs: 1340"
[1] "N.of SNP is 272307"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==3,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  3"
[1] "N. of runs: 843"
[1] "N.of SNP is 245038"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==4,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  4"
[1] "N. of runs: 718"
[1] "N.of SNP is 196028"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==5,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  5"
[1] "N. of runs: 395"
[1] "N.of SNP is 111460"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==6,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  6"
[1] "N. of runs: 391"
[1] "N.of SNP is 107289"
> plot_manhattanRuns(
  +     runs = slidingRuns[slidingRuns$group=="Peach",], 
  +     genotypeFile = genotypeFilePath, mapFile = mapFilePath)
[1] "Calculation % SNP in ROH"
[1] "Chromosome founds:  5"
|================================================================================================================================================| 100%
[1] "Calculation % SNP in ROH finish"
[1] "Manhattan plot: START"
[1] "Processing Groups: Peach"
[1] "Creating Manhattan plot for  Peach"
[1] "Manhattan plot created for  Peach"
> plot_manhattanRuns(
  +     runs = slidingRuns[slidingRuns$group=="Tobacco",], 
  +     genotypeFile = genotypeFilePath, mapFile = mapFilePath)
[1] "Calculation % SNP in ROH"
[1] "Chromosome founds:  5"
|================================================================================================================================================| 100%
[1] "Calculation % SNP in ROH finish"
[1] "Manhattan plot: START"
[1] "Processing Groups: Tobacco"
[1] "Creating Manhattan plot for  Tobacco"
[1] "Manhattan plot created for  Tobacco"
> plot_manhattanRuns(
  +     runs = slidingRuns[slidingRuns$group=="Peach",], 
  +     genotypeFile = genotypeFilePath, mapFile = mapFilePath)
[1] "Calculation % SNP in ROH"
[1] "Chromosome founds:  5"
|================================================================================================================================================| 100%
[1] "Calculation % SNP in ROH finish"
[1] "Manhattan plot: START"
[1] "Processing Groups: Peach"
[1] "Creating Manhattan plot for  Peach"
[1] "Manhattan plot created for  Peach"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==6,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  6"
[1] "N. of runs: 391"
[1] "N.of SNP is 107289"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==5,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  5"
[1] "N. of runs: 395"
[1] "N.of SNP is 111460"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==4,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  4"
[1] "N. of runs: 718"
[1] "N.of SNP is 196028"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==3,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  3"
[1] "N. of runs: 843"
[1] "N.of SNP is 245038"
> plot_SnpsInRuns(
  +     runs = slidingRuns[slidingRuns$chrom==2,], genotypeFile = genotypeFilePath, 
  +     mapFile = mapFilePath)
[1] "Chromosome is:  2"
[1] "N. of runs: 1340"
[1] "N.of SNP is 272307"
> summaryList
$summary_ROH_count_chr
Peach Tobacco
2  1030     310
3   628     215
4   537     181
5   286     109
6   283     108

$summary_ROH_percentage_chr
Peach   Tobacco chrom
2 0.3726483 0.3358613     2
3 0.2272069 0.2329361     3
4 0.1942836 0.1960997     4
5 0.1034732 0.1180932     5
6 0.1023878 0.1170098     6

$summary_ROH_count
Peach Tobacco
0-6    2752     923
6-12      9      NA
12-24     3      NA

$summary_ROH_percentage
Peach Tobacco CLASS
0-6   0.995658466       1   0-6
6-12  0.003256151      NA  6-12
12-24 0.001085384      NA 12-24

$summary_ROH_mean_chr
chrom     Peach   Tobacco
1     2 0.5755856 0.4471223
2     3 0.6602661 0.5271188
3     4 0.5617847 0.4779004
4     5 0.4873528 0.4649841
5     6 0.5415353 0.4166562

$summary_ROH_mean_class
CLASS      Peach   Tobacco
1   0-6  0.5429476 0.4703365
2  6-12  7.4203329        NA
3 12-24 13.6137053        NA

$result_Froh_genome_wide
id   group       sum Froh_genome
1  HFH5FBCX2_MP-DNAillumina Tobacco  16122610 0.058682179
2                  LIB15046 Tobacco  13556008 0.049340404
3                  LIB18337   Peach  38711516 0.140900022
4                  LIB18342 Tobacco  17762675 0.064651596
5                  LIB18343 Tobacco  19667941 0.071586277
6                  LIB18344 Tobacco  63533246 0.231244773
7                  LIB18346 Tobacco  15682929 0.057081852
8                  LIB18347 Tobacco  14276987 0.051964583
9                  LIB34498   Peach  30334684 0.110410495
10                 LIB34499   Peach  33369030 0.121454738
11                 LIB34500   Peach  25431991 0.092565946
12                 LIB34503 Tobacco  14964506 0.054466976
13                 LIB34504   Peach  30921771 0.112547341
14                 S101_Al6   Peach   2308953 0.008403999
15             S12_IT418PBT   Peach  33275438 0.121114087
16             S13_IT418PHR   Peach  34894834 0.127008275
17             S15_IT518PRH   Peach  33883101 0.123325825
18              S16_SP518PP   Peach  41455245 0.150886494
19              S18_FR618PE   Peach  30976577 0.112746821
20               S19_FR618P   Peach  12368279 0.045017374
21                 S2_4824J   Peach  40355877 0.146885075
22             S23_GR516PNe   Peach   7464589 0.027169196
23                 S31_13HH Tobacco  29520267 0.107446225
24                   S34_48 Tobacco  14686387 0.053454694
25                   S35_49 Tobacco   5596397 0.020369454
26                   S36_52 Tobacco  16330646 0.059439377
27                  S38_195 Tobacco  31605485 0.115035885
28                   S4_SPN   Peach  42397007 0.154314267
29                   S41_64 Tobacco  17162313 0.062466432
30                   S5_FRC   Peach  52045508 0.189432344
31               S52_GPeTy2   Peach  41497337 0.151039698
32               S53_GPeTy7   Peach  40286769 0.146633540
33               S54_GPeTy3   Peach  42796521 0.155768396
34               S55_GPeTy4   Peach  39080410 0.142242701
35               S56_GPeTy8   Peach  39507419 0.143796905
36               S57_GPeTy5   Peach  31174880 0.113468593
37               S58_GPeTy1   Peach  15978999 0.058159471
38               S59_GToKa1 Tobacco  12956747 0.047159247
39                 S6_5524H   Peach 167198555 0.608559996
40               S60_GToKa3 Tobacco   2342362 0.008525599
41               S61_GToKa4 Tobacco  13707001 0.049889979
42               S62_GPeAl1   Peach  41726376 0.151873341
43               S63_GToKe1 Tobacco  12713810 0.046275018
44               S64_GToKe2 Tobacco   1479418 0.005384703
45               S65_GPePl1   Peach  27414863 0.099783093
46               S66_GPePl2   Peach  30800639 0.112106452
47               S67_GPeKa1   Peach  43088610 0.156831525
48               S68_GPeLe1   Peach  28002100 0.101920485
49               S69_GPeNa1   Peach  34056183 0.123955800
50               S70_GPeMe1   Peach  15539514 0.056559858
51                 S73_HBYT   Peach   8481911 0.030871988
52             S74_USOxford Tobacco  16339730 0.059472440
53                S75_USLab Tobacco  16164288 0.058833876
54                S78_SpRSA   Peach  44832375 0.163178384
55                S79_SpRSB   Peach  43764946 0.159293215
56                   S8_114   Peach   1761824 0.006412589
57                S80_SpSSA   Peach  45652782 0.166164455
58                S81_SpSSB   Peach  24776826 0.090181312
59              S84_Chilpea   Peach  54622313 0.198811255
60             S85_Chilpea2   Peach  53701223 0.195458723
61             S86_Chilpea3   Peach  58379034 0.212484759
62             S87_Chilpea4   Peach  70907870 0.258086519
63             S88_Chilpea5   Peach  55096025 0.200535446
64                  S89_Lab Tobacco   8123108 0.029566036
65                   S9_144   Peach   5972863 0.021739694
66                  S90_Lab Tobacco  10554525 0.038415773
67                S91_Field Tobacco  12102684 0.044050676
68                S92_Field Tobacco  21429705 0.077998648
69                S93_Field Tobacco   1992971 0.007253905
70                S94_Field Tobacco  13745802 0.050031205
71                S97_Tun11   Peach   5522442 0.020100277

$result_Froh_chromosome_wide
id   group       Chr_2       Chr_3       Chr_4      Chr_5       Chr_6
1  HFH5FBCX2_MP-DNAillumina Tobacco 0.058098880 0.043618313 0.067532957 0.08802672 0.048553597
2                  LIB15046 Tobacco 0.061819421 0.053428280 0.031962327 0.03256914 0.054856040
3                  LIB18337   Peach 0.108728251 0.099059519 0.157696005 0.13485711 0.306213295
4                  LIB18342 Tobacco 0.063609961 0.057746569 0.048876078 0.08653436 0.093005148
5                  LIB18343 Tobacco 0.065023999 0.074675695 0.075422573 0.08952073 0.057558924
6                  LIB18344 Tobacco 0.227750263 0.228497325 0.186418159 0.30494528 0.261819658
7                  LIB18346 Tobacco 0.071120994 0.056242317 0.042212501 0.06684531 0.037727483
8                  LIB18347 Tobacco 0.057810153 0.052721679 0.053874786 0.03256914 0.049092264
9                  LIB34498   Peach 0.135073837 0.114272587 0.061327191 0.13255059 0.104256937
10                 LIB34499   Peach 0.165078404 0.096532171 0.057747642 0.16077582 0.139556590
11                 LIB34500   Peach 0.139105982 0.104105838 0.054881437 0.05125275 0.046513002
12                 LIB34503 Tobacco 0.060358402 0.056048465 0.053023941 0.04199070 0.049125709
13                 LIB34504   Peach 0.101909542 0.044296150 0.165894098 0.16159692 0.149011249
14                 S101_Al6   Peach 0.016561288 0.007639657          NA 0.01146532          NA
15             S12_IT418PBT   Peach 0.159554182 0.136944169 0.125904855 0.06367668 0.020715663
16             S13_IT418PHR   Peach 0.173156068 0.081230626 0.098770672 0.11363253 0.170269966
17             S15_IT518PRH   Peach 0.181334856 0.142204482 0.066800701 0.04888636 0.097587678
18              S16_SP518PP   Peach 0.248069570 0.131062829 0.089762574 0.07371227 0.114331666
19              S18_FR618PE   Peach 0.096216445 0.112873652 0.125048936 0.05468281 0.195249400
20               S19_FR618P   Peach 0.085166030 0.024998946 0.038153878 0.02414601 0.010188901
21                 S2_4824J   Peach 0.196289312 0.095387274 0.096087304 0.20936887 0.161742322
22             S23_GR516PNe   Peach 0.026798773 0.057364870 0.012877293         NA 0.012927053
23                 S31_13HH Tobacco 0.092260533 0.075079410 0.209354769 0.07239556 0.061699815
24                   S34_48 Tobacco 0.034203303 0.093582337 0.053484050 0.04669211 0.021605858
25                   S35_49 Tobacco 0.019330735 0.018742983 0.013699011 0.02930308 0.031372257
26                   S36_52 Tobacco 0.052535070 0.056115513 0.048736668 0.08338653 0.084255807
27                  S38_195 Tobacco 0.121498884 0.170896345 0.028188092 0.10670136 0.144987331
28                   S4_SPN   Peach 0.149749950 0.181384164 0.158338630 0.09035543 0.160768902
29                   S41_64 Tobacco 0.060978353 0.057943465 0.050256151 0.08653436 0.077206534
30                   S5_FRC   Peach 0.338549599 0.138177514 0.132623368 0.03923018 0.141552906
31               S52_GPeTy2   Peach 0.150531984 0.172500825 0.190213130 0.10241513 0.073646495
32               S53_GPeTy7   Peach 0.251645145 0.151189236 0.071738514 0.04892499 0.077910672
33               S54_GPeTy3   Peach 0.204104706 0.089061419 0.226812830 0.11966432 0.068361178
34               S55_GPeTy4   Peach 0.133771888 0.145027798 0.147133423 0.15024661 0.142500745
35               S56_GPeTy8   Peach 0.193428382 0.126421096 0.100675120 0.09045154 0.180019591
36               S57_GPeTy5   Peach 0.170193212 0.084273583 0.099658204 0.09268608 0.065713170
37               S58_GPeTy1   Peach 0.105382022 0.039287973 0.016968755 0.06776556 0.037078727
38               S59_GToKa1 Tobacco 0.061298150 0.044266830 0.038894578 0.03256914 0.044034886
39                 S6_5524H   Peach 0.613449823 0.701567282 0.467810946 0.39007476 0.875975947
40               S60_GToKa3 Tobacco          NA 0.022180262 0.008291555 0.01008141          NA
41               S61_GToKa4 Tobacco 0.028131746 0.069918867 0.027617666 0.13084940 0.027788087
42               S62_GPeAl1   Peach 0.167319256 0.221408487 0.092876021 0.09902095 0.113445588
43               S63_GToKe1 Tobacco 0.059670679 0.049131677 0.031356288 0.03256914 0.044034886
44               S64_GToKe2 Tobacco 0.009155401 0.009855656          NA         NA          NA
45               S65_GPePl1   Peach 0.130151394 0.135293127 0.046711451 0.07049509 0.062511612
46               S66_GPePl2   Peach 0.125218799 0.163551640 0.073087552 0.11685213 0.024997591
47               S67_GPeKa1   Peach 0.195034506 0.157008903 0.150314864 0.07221241 0.144135542
48               S68_GPeLe1   Peach 0.138643455 0.082790746 0.091700151 0.08034089 0.082345145
49               S69_GPeNa1   Peach 0.146616134 0.112576585 0.122583544 0.07890153 0.133369096
50               S70_GPeMe1   Peach 0.063195088 0.091061508 0.020704891 0.05083233 0.032691839
51                 S73_HBYT   Peach 0.023352554 0.032810425 0.046261062         NA 0.049082645
52             S74_USOxford Tobacco 0.057317982 0.043577970 0.067500713 0.08782047 0.058524176
53                S75_USLab Tobacco 0.058098880 0.043618313 0.065268637 0.08217555 0.060399638
54                S78_SpRSA   Peach 0.171040933 0.151004791 0.219036798 0.08513405 0.137655850
55                S79_SpRSB   Peach 0.147202744 0.161884558 0.181276516 0.18605055 0.117592791
56                   S8_114   Peach 0.011986305 0.005951818 0.005297975         NA          NA
57                S80_SpSSA   Peach 0.148285859 0.178652757 0.264046200 0.10099439 0.060982617
58                S81_SpSSB   Peach 0.099377529 0.074159672 0.072800867 0.13672087 0.088348404
59              S84_Chilpea   Peach 0.184955431 0.221925439 0.195264392 0.27534078 0.113796037
60             S85_Chilpea2   Peach 0.181566450 0.213704984 0.194474168 0.27533644 0.113556926
61             S86_Chilpea3   Peach 0.237584881 0.231889243 0.180061951 0.10205909 0.270158173
62             S87_Chilpea4   Peach 0.295517089 0.355860861 0.196060250 0.16061919 0.140348036
63             S88_Chilpea5   Peach 0.186313424 0.223702656 0.198948246 0.27610065 0.113557297
64                  S89_Lab Tobacco 0.033981247 0.027131085 0.034201877 0.03343464 0.009331982
65                   S9_144   Peach 0.038060420 0.020563617 0.015785736         NA 0.010899957
66                  S90_Lab Tobacco 0.059425839 0.027984247 0.053047928 0.01171962          NA
67                S91_Field Tobacco 0.035893911 0.025298172 0.049387821 0.01037629 0.135740700
68                S92_Field Tobacco 0.074658511 0.093156721 0.091085957 0.04783078 0.056677233
69                S93_Field Tobacco 0.006136560 0.017104894 0.004544728         NA          NA
70                S94_Field Tobacco 0.076152825 0.051592521 0.038341364 0.03447923 0.009265429
71                S97_Tun11   Peach 0.035276301 0.015065634 0.005574394 0.02598057 0.010606983

$result_Froh_class
id   group Sum_Class_0 Froh_Class_0 Sum_Class_6 Froh_Class_6 Sum_Class_12 Froh_Class_12
1  HFH5FBCX2_MP-DNAillumina Tobacco    16122610  0.058682179          NA           NA           NA            NA
2                  LIB15046 Tobacco    13556008  0.049340404          NA           NA           NA            NA
3                  LIB18337   Peach    38711516  0.140900022          NA           NA           NA            NA
4                  LIB18342 Tobacco    17762675  0.064651596          NA           NA           NA            NA
5                  LIB18343 Tobacco    19667941  0.071586277          NA           NA           NA            NA
6                  LIB18344 Tobacco    63533246  0.231244773          NA           NA           NA            NA
7                  LIB18346 Tobacco    15682929  0.057081852          NA           NA           NA            NA
8                  LIB18347 Tobacco    14276987  0.051964583          NA           NA           NA            NA
9                  LIB34498   Peach    30334684  0.110410495          NA           NA           NA            NA
10                 LIB34499   Peach    33369030  0.121454738          NA           NA           NA            NA
11                 LIB34500   Peach    25431991  0.092565946          NA           NA           NA            NA
12                 LIB34503 Tobacco    14964506  0.054466976          NA           NA           NA            NA
13                 LIB34504   Peach    30921771  0.112547341          NA           NA           NA            NA
14                 S101_Al6   Peach     2308953  0.008403999          NA           NA           NA            NA
15             S12_IT418PBT   Peach    33275438  0.121114087          NA           NA           NA            NA
16             S13_IT418PHR   Peach    34894834  0.127008275          NA           NA           NA            NA
17             S15_IT518PRH   Peach    33883101  0.123325825          NA           NA           NA            NA
18              S16_SP518PP   Peach    41455245  0.150886494          NA           NA           NA            NA
19              S18_FR618PE   Peach    30976577  0.112746821          NA           NA           NA            NA
20               S19_FR618P   Peach    12368279  0.045017374          NA           NA           NA            NA
21                 S2_4824J   Peach    40355877  0.146885075          NA           NA           NA            NA
22             S23_GR516PNe   Peach     7464589  0.027169196          NA           NA           NA            NA
23                 S31_13HH Tobacco    29520267  0.107446225          NA           NA           NA            NA
24                   S34_48 Tobacco    14686387  0.053454694          NA           NA           NA            NA
25                   S35_49 Tobacco     5596397  0.020369454          NA           NA           NA            NA
26                   S36_52 Tobacco    16330646  0.059439377          NA           NA           NA            NA
27                  S38_195 Tobacco    31605485  0.115035885          NA           NA           NA            NA
28                   S4_SPN   Peach    42397007  0.154314267     6494040   0.02363665           NA            NA
29                   S41_64 Tobacco    17162313  0.062466432          NA           NA           NA            NA
30                   S5_FRC   Peach    52045508  0.189432344          NA           NA           NA            NA
31               S52_GPeTy2   Peach    41497337  0.151039698          NA           NA           NA            NA
32               S53_GPeTy7   Peach    40286769  0.146633540          NA           NA           NA            NA
33               S54_GPeTy3   Peach    42796521  0.155768396          NA           NA           NA            NA
34               S55_GPeTy4   Peach    39080410  0.142242701          NA           NA           NA            NA
35               S56_GPeTy8   Peach    39507419  0.143796905          NA           NA           NA            NA
36               S57_GPeTy5   Peach    31174880  0.113468593          NA           NA           NA            NA
37               S58_GPeTy1   Peach    15978999  0.058159471          NA           NA           NA            NA
38               S59_GToKa1 Tobacco    12956747  0.047159247          NA           NA           NA            NA
39                 S6_5524H   Peach   167198555  0.608559996    95006326   0.34579874     40841116     0.1486512
40               S60_GToKa3 Tobacco     2342362  0.008525599          NA           NA           NA            NA
41               S61_GToKa4 Tobacco    13707001  0.049889979          NA           NA           NA            NA
42               S62_GPeAl1   Peach    41726376  0.151873341          NA           NA           NA            NA
43               S63_GToKe1 Tobacco    12713810  0.046275018          NA           NA           NA            NA
44               S64_GToKe2 Tobacco     1479418  0.005384703          NA           NA           NA            NA
45               S65_GPePl1   Peach    27414863  0.099783093          NA           NA           NA            NA
46               S66_GPePl2   Peach    30800639  0.112106452     6123746   0.02228887           NA            NA
47               S67_GPeKa1   Peach    43088610  0.156831525          NA           NA           NA            NA
48               S68_GPeLe1   Peach    28002100  0.101920485          NA           NA           NA            NA
49               S69_GPeNa1   Peach    34056183  0.123955800          NA           NA           NA            NA
50               S70_GPeMe1   Peach    15539514  0.056559858          NA           NA           NA            NA
51                 S73_HBYT   Peach     8481911  0.030871988          NA           NA           NA            NA
52             S74_USOxford Tobacco    16339730  0.059472440          NA           NA           NA            NA
53                S75_USLab Tobacco    16164288  0.058833876          NA           NA           NA            NA
54                S78_SpRSA   Peach    44832375  0.163178384          NA           NA           NA            NA
55                S79_SpRSB   Peach    43764946  0.159293215          NA           NA           NA            NA
56                   S8_114   Peach     1761824  0.006412589          NA           NA           NA            NA
57                S80_SpSSA   Peach    45652782  0.166164455          NA           NA           NA            NA
58                S81_SpSSB   Peach    24776826  0.090181312          NA           NA           NA            NA
59              S84_Chilpea   Peach    54622313  0.198811255          NA           NA           NA            NA
60             S85_Chilpea2   Peach    53701223  0.195458723          NA           NA           NA            NA
61             S86_Chilpea3   Peach    58379034  0.212484759          NA           NA           NA            NA
62             S87_Chilpea4   Peach    70907870  0.258086519          NA           NA           NA            NA
63             S88_Chilpea5   Peach    55096025  0.200535446          NA           NA           NA            NA
64                  S89_Lab Tobacco     8123108  0.029566036          NA           NA           NA            NA
65                   S9_144   Peach     5972863  0.021739694          NA           NA           NA            NA
66                  S90_Lab Tobacco    10554525  0.038415773          NA           NA           NA            NA
67                S91_Field Tobacco    12102684  0.044050676          NA           NA           NA            NA
68                S92_Field Tobacco    21429705  0.077998648          NA           NA           NA            NA
69                S93_Field Tobacco     1992971  0.007253905          NA           NA           NA            NA
70                S94_Field Tobacco    13745802  0.050031205          NA           NA           NA            NA
71                S97_Tun11   Peach     5522442  0.020100277          NA           NA           NA            NA

$SNPinRun
SNP_NAME CHR POSITION COUNT BREED PERCENTAGE
1          .   2    38338     8 Peach   18.18182
2          .   2    39017     8 Peach   18.18182
3          .   2    39075     8 Peach   18.18182
4          .   2    39152     8 Peach   18.18182
5          .   2    40164     8 Peach   18.18182
6          .   2    41088     8 Peach   18.18182
7          .   2    41152     8 Peach   18.18182
8          .   2    41189     8 Peach   18.18182
9          .   2    41344     8 Peach   18.18182
10         .   2    41365     8 Peach   18.18182
11         .   2    42507     8 Peach   18.18182
12         .   2    43315     8 Peach   18.18182
13         .   2    43404     8 Peach   18.18182
14         .   2    43490     8 Peach   18.18182
15         .   2    43784     8 Peach   18.18182
16         .   2    44917     8 Peach   18.18182
17         .   2    45089     8 Peach   18.18182
18         .   2    46015     8 Peach   18.18182
19         .   2    46366     8 Peach   18.18182
20         .   2    46508     8 Peach   18.18182
21         .   2    46775     8 Peach   18.18182
22         .   2    46906     8 Peach   18.18182
23         .   2    46947     8 Peach   18.18182
24         .   2    47249     8 Peach   18.18182
25         .   2    47295     8 Peach   18.18182
26         .   2    47807     8 Peach   18.18182
27         .   2    48133     8 Peach   18.18182
28         .   2    48181     8 Peach   18.18182
29         .   2    48726     8 Peach   18.18182
30         .   2    48730     8 Peach   18.18182
31         .   2    48816     8 Peach   18.18182
32         .   2    50003     8 Peach   18.18182
33         .   2    50656     8 Peach   18.18182
34         .   2    52848     8 Peach   18.18182
35         .   2    52957     8 Peach   18.18182
36         .   2    53255     8 Peach   18.18182
37         .   2    53327     8 Peach   18.18182
38         .   2    53467     8 Peach   18.18182
39         .   2    53603     8 Peach   18.18182
40         .   2    53618     8 Peach   18.18182
41         .   2    53746     8 Peach   18.18182
42         .   2    54569     8 Peach   18.18182
43         .   2    54853     8 Peach   18.18182
44         .   2    55020     9 Peach   20.45455
45         .   2    55027     9 Peach   20.45455
46         .   2    55299     9 Peach   20.45455
47         .   2    55641     9 Peach   20.45455
48         .   2    55904    11 Peach   25.00000
49         .   2    56128    11 Peach   25.00000
50         .   2    56169    11 Peach   25.00000
51         .   2    56202    11 Peach   25.00000
52         .   2    56467    11 Peach   25.00000
53         .   2    56872    11 Peach   25.00000
54         .   2    57022    11 Peach   25.00000
55         .   2    57028    11 Peach   25.00000
56         .   2    57115    11 Peach   25.00000
57         .   2    58387    11 Peach   25.00000
58         .   2    58706    12 Peach   27.27273
59         .   2    58846    12 Peach   27.27273
60         .   2    59909    12 Peach   27.27273
61         .   2    61770    12 Peach   27.27273
62         .   2    61939    12 Peach   27.27273
63         .   2    62173    12 Peach   27.27273
64         .   2    62233    12 Peach   27.27273
65         .   2    62239    12 Peach   27.27273
66         .   2    62303    12 Peach   27.27273
67         .   2    63398    12 Peach   27.27273
68         .   2    64859    12 Peach   27.27273
69         .   2    69205    12 Peach   27.27273
70         .   2    70710    12 Peach   27.27273
71         .   2    70871    12 Peach   27.27273
72         .   2    70902    12 Peach   27.27273
73         .   2    70921    12 Peach   27.27273
74         .   2    71450    12 Peach   27.27273
75         .   2    71547    13 Peach   29.54545
76         .   2    71926    14 Peach   31.81818
77         .   2    71970    15 Peach   34.09091
78         .   2    72249    15 Peach   34.09091
79         .   2    72747    15 Peach   34.09091
80         .   2    73117    15 Peach   34.09091
81         .   2    73142    15 Peach   34.09091
82         .   2    73291    15 Peach   34.09091
83         .   2    73340    15 Peach   34.09091
84         .   2    74103    15 Peach   34.09091
85         .   2    74781    15 Peach   34.09091
86         .   2    74972    15 Peach   34.09091
87         .   2    77724    15 Peach   34.09091
88         .   2    81306    15 Peach   34.09091
89         .   2    82103    16 Peach   36.36364
90         .   2    83130    16 Peach   36.36364
91         .   2    83427    16 Peach   36.36364
92         .   2    84319    18 Peach   40.90909
93         .   2    84935    18 Peach   40.90909
94         .   2    91759    18 Peach   40.90909
95         .   2    92076    18 Peach   40.90909
96         .   2   112344    18 Peach   40.90909
97         .   2   115080    18 Peach   40.90909
98         .   2   117663    18 Peach   40.90909
99         .   2   117987    18 Peach   40.90909
100        .   2   118841    18 Peach   40.90909
101        .   2   118916    18 Peach   40.90909
102        .   2   119016    18 Peach   40.90909
103        .   2   123336    18 Peach   40.90909
104        .   2   124659    18 Peach   40.90909
105        .   2   124932    18 Peach   40.90909
106        .   2   125247    18 Peach   40.90909
107        .   2   125336    18 Peach   40.90909
108        .   2   125493    18 Peach   40.90909
109        .   2   125753    18 Peach   40.90909
110        .   2   125929    18 Peach   40.90909
111        .   2   127293    18 Peach   40.90909
112        .   2   127412    18 Peach   40.90909
113        .   2   127462    18 Peach   40.90909
114        .   2   127812    18 Peach   40.90909
115        .   2   127885    18 Peach   40.90909
116        .   2   127939    18 Peach   40.90909
117        .   2   128471    18 Peach   40.90909
118        .   2   128709    18 Peach   40.90909
119        .   2   128861    18 Peach   40.90909
120        .   2   128882    18 Peach   40.90909
121        .   2   128954    18 Peach   40.90909
122        .   2   129105    18 Peach   40.90909
123        .   2   129271    18 Peach   40.90909
124        .   2   129588    18 Peach   40.90909
125        .   2   129620    18 Peach   40.90909
126        .   2   131219    18 Peach   40.90909
127        .   2   131693    18 Peach   40.90909
128        .   2   131721    18 Peach   40.90909
129        .   2   134585    18 Peach   40.90909
130        .   2   136348    18 Peach   40.90909
131        .   2   136796    18 Peach   40.90909
132        .   2   137397    18 Peach   40.90909
133        .   2   137881    18 Peach   40.90909
134        .   2   138671    18 Peach   40.90909
135        .   2   144638    18 Peach   40.90909
136        .   2   146463    18 Peach   40.90909
137        .   2   146681    18 Peach   40.90909
138        .   2   150672    18 Peach   40.90909
139        .   2   151025    18 Peach   40.90909
140        .   2   157973    18 Peach   40.90909
141        .   2   163029    18 Peach   40.90909
142        .   2   163665    18 Peach   40.90909
143        .   2   164392    18 Peach   40.90909
144        .   2   165869    18 Peach   40.90909
145        .   2   166128    18 Peach   40.90909
146        .   2   170623    18 Peach   40.90909
147        .   2   171247    18 Peach   40.90909
148        .   2   174242    18 Peach   40.90909
149        .   2   175583    18 Peach   40.90909
150        .   2   175701    18 Peach   40.90909
151        .   2   179618    18 Peach   40.90909
152        .   2   186974    18 Peach   40.90909
153        .   2   191270    18 Peach   40.90909
154        .   2   191273    18 Peach   40.90909
155        .   2   191282    18 Peach   40.90909
156        .   2   195521    19 Peach   43.18182
157        .   2   198118    19 Peach   43.18182
158        .   2   198213    19 Peach   43.18182
159        .   2   198633    19 Peach   43.18182
160        .   2   198719    19 Peach   43.18182
161        .   2   198828    19 Peach   43.18182
162        .   2   199136    19 Peach   43.18182
163        .   2   204275    19 Peach   43.18182
164        .   2   204320    19 Peach   43.18182
165        .   2   204682    19 Peach   43.18182
166        .   2   204722    19 Peach   43.18182
[ reached 'max' / getOption("max.print") -- omitted 1864078 rows ]

> summaryList$$result_Froh_genome_wide
Error: unexpected '$' in "summaryList$$"
> summaryList$result_Froh_genome_wide
id   group       sum Froh_genome
1  HFH5FBCX2_MP-DNAillumina Tobacco  16122610 0.058682179
2                  LIB15046 Tobacco  13556008 0.049340404
3                  LIB18337   Peach  38711516 0.140900022
4                  LIB18342 Tobacco  17762675 0.064651596
5                  LIB18343 Tobacco  19667941 0.071586277
6                  LIB18344 Tobacco  63533246 0.231244773
7                  LIB18346 Tobacco  15682929 0.057081852
8                  LIB18347 Tobacco  14276987 0.051964583
9                  LIB34498   Peach  30334684 0.110410495
10                 LIB34499   Peach  33369030 0.121454738
11                 LIB34500   Peach  25431991 0.092565946
12                 LIB34503 Tobacco  14964506 0.054466976
13                 LIB34504   Peach  30921771 0.112547341
14                 S101_Al6   Peach   2308953 0.008403999
15             S12_IT418PBT   Peach  33275438 0.121114087
16             S13_IT418PHR   Peach  34894834 0.127008275
17             S15_IT518PRH   Peach  33883101 0.123325825
18              S16_SP518PP   Peach  41455245 0.150886494
19              S18_FR618PE   Peach  30976577 0.112746821
20               S19_FR618P   Peach  12368279 0.045017374
21                 S2_4824J   Peach  40355877 0.146885075
22             S23_GR516PNe   Peach   7464589 0.027169196
23                 S31_13HH Tobacco  29520267 0.107446225
24                   S34_48 Tobacco  14686387 0.053454694
25                   S35_49 Tobacco   5596397 0.020369454
26                   S36_52 Tobacco  16330646 0.059439377
27                  S38_195 Tobacco  31605485 0.115035885
28                   S4_SPN   Peach  42397007 0.154314267
29                   S41_64 Tobacco  17162313 0.062466432
30                   S5_FRC   Peach  52045508 0.189432344
31               S52_GPeTy2   Peach  41497337 0.151039698
32               S53_GPeTy7   Peach  40286769 0.146633540
33               S54_GPeTy3   Peach  42796521 0.155768396
34               S55_GPeTy4   Peach  39080410 0.142242701
35               S56_GPeTy8   Peach  39507419 0.143796905
36               S57_GPeTy5   Peach  31174880 0.113468593
37               S58_GPeTy1   Peach  15978999 0.058159471
38               S59_GToKa1 Tobacco  12956747 0.047159247
39                 S6_5524H   Peach 167198555 0.608559996
40               S60_GToKa3 Tobacco   2342362 0.008525599
41               S61_GToKa4 Tobacco  13707001 0.049889979
42               S62_GPeAl1   Peach  41726376 0.151873341
43               S63_GToKe1 Tobacco  12713810 0.046275018
44               S64_GToKe2 Tobacco   1479418 0.005384703
45               S65_GPePl1   Peach  27414863 0.099783093
46               S66_GPePl2   Peach  30800639 0.112106452
47               S67_GPeKa1   Peach  43088610 0.156831525
48               S68_GPeLe1   Peach  28002100 0.101920485
49               S69_GPeNa1   Peach  34056183 0.123955800
50               S70_GPeMe1   Peach  15539514 0.056559858
51                 S73_HBYT   Peach   8481911 0.030871988
52             S74_USOxford Tobacco  16339730 0.059472440
53                S75_USLab Tobacco  16164288 0.058833876
54                S78_SpRSA   Peach  44832375 0.163178384
55                S79_SpRSB   Peach  43764946 0.159293215
56                   S8_114   Peach   1761824 0.006412589
57                S80_SpSSA   Peach  45652782 0.166164455
58                S81_SpSSB   Peach  24776826 0.090181312
59              S84_Chilpea   Peach  54622313 0.198811255
60             S85_Chilpea2   Peach  53701223 0.195458723
61             S86_Chilpea3   Peach  58379034 0.212484759
62             S87_Chilpea4   Peach  70907870 0.258086519
63             S88_Chilpea5   Peach  55096025 0.200535446
64                  S89_Lab Tobacco   8123108 0.029566036
65                   S9_144   Peach   5972863 0.021739694
66                  S90_Lab Tobacco  10554525 0.038415773
67                S91_Field Tobacco  12102684 0.044050676
68                S92_Field Tobacco  21429705 0.077998648
69                S93_Field Tobacco   1992971 0.007253905
70                S94_Field Tobacco  13745802 0.050031205
71                S97_Tun11   Peach   5522442 0.020100277
> pop_Froh <- summaryList$result_Froh_genome_wide
> head(pop_Froh)
id   group      sum Froh_genome
1 HFH5FBCX2_MP-DNAillumina Tobacco 16122610  0.05868218
2                 LIB15046 Tobacco 13556008  0.04934040
3                 LIB18337   Peach 38711516  0.14090002
4                 LIB18342 Tobacco 17762675  0.06465160
5                 LIB18343 Tobacco 19667941  0.07158628
6                 LIB18344 Tobacco 63533246  0.23124477
> library(ggplot2)
> ggplot(pop_Froh, aes(x=group, y=Froh_genome, fill=group)) + geom_violin(trim=FALSE)
> 