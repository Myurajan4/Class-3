# install the package affy

source("https://bioconductor.org/biocLite.R")
biocLite("affy")

source("https://bioconductor.org/biocLite.R")
biocLite("SpikeInSubset")

#Loading this package
library(SpikeInSubset)
library(affy)

#Load data
data(spikein95)

# check the chips
image(spikein95)

# collect the gene ids from this dataset and put it into an object 
ids <- geneNames (spikein95)

#perform Mas 5.0 normalization 
Mas <- mas5(spikein95)

#Box plot for the raw data, and boxplot for the normalized data on log fold 
boxplot(spikein95) 
mas_log <- log2 (exprs(Mas))
x11()
boxplot(mas_log) 

#Density plot
density <- density(mas_log[,1])
plot(density, main="Mas normalization", col="yellow")

density2 <-density(mas_log[,2])
lines(density2, col="red")

density3 <- density (mas_log[,3])
lines(density3, col="blue")