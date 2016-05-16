# Libraries
library("MASS", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
library("sm", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")

# Initial Load files
source('~/Desktop/RScripts/load_files.R')

# Define functions for Normalization, Charts
source('~/Desktop/RScripts/PyArray2RVector.R')
source('~/Desktop/RScripts/averageLine.R')
source('~/Desktop/RScripts/otherPlots.R')

# Normalize Data : Make sure all the scripts contain equal amount of data
source('~/Desktop/RScripts/normalize.R')

# Define Scripts, Features
scripts = c("Grantha","Devanagari","Kannada","Tamil")
geo = c("length","size","LBIndex","circularity","rectangularity","divergence",
             "openness","avgCurv","compactness")

prod = c("penC","disjointC","retraceC","disfluency",
         "up","down","changeability","entropy",
         "disjointAnglesSum","disjointAnglesMean",
         "strokeLengthsMean", "majorLengthsMean")

feats = c(geo,prod)

# Removed PrimitiveC as PrimitiveC = Disfluence + 1
# Removed PenDrag as PenC and PenDrag give nearly equal profiles
# NIV seperately not needed I guess

# Both NIV/Disfluency/PrimitiveC show lograthmic growth
# Many quantities show logarthmic growth
# Any relation to human cognition?
# Quantify Stroke count etc.. how they've changed - upperbound/lower bound
# Logarathmic growth explains why there was burst of scripts in the initial period.. and then 
# things got a bit stabilized.

## Brahmi appears to be constructed! (May be true?)

## Should check log growth using Dynamic time warping.. if it works
## How to do it

## How shapes have changes as compared to others
## For instance, TTHA hasn't changed a lot

## Apply and overlay linguistic data(!!!)

## Compare Visual Diff Cost Vs Prod Diff Cost

featAll = c(geo,prod)

## FeatureWise Dataframes
## GG1, DG1 etc

featG =  paste(sort(rep(substr(scripts,0,1),6)),"G",1:6,
               "=",
               sort(rep(scripts,6)),"_",1:6,
               "[,geo]",
               sep="",collapse=";")

eval(parse(text=featG))

# Average Features Plot
averageFeatureLine(geo,3,3)
averageFeatureLine(prod,3,4)

# Box Plot
#boxplotFeat(geo) 

# Parallel Plot
geoP = paste("geoP = rbind(",
             paste("sapply(",sort(rep(substr(scripts,0,1),6)),"G",1:6,",mean)",sep="",collapse=","),
             ")",
             sep="")
eval(parse(text=geoP))
par(mfrow=c(1,1))
parcoord(geoP,col=c(rep(1,6),rep(2,6),rep(3,6),rep(4,6)),var.label=TRUE)