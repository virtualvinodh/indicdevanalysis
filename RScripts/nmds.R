# Non Metric MDS

overallDistSOld = read.csv("/users/vinodhrajan/dropbox/Similarity_Data/Similarities_Corrected_Static/overallStaticSimilarityNorm.csv",h=T,row.names=1,na.strings="N/A")
newcolnamesS = colnames(overallDistSOld)[1:nrow(overallDistSOld)]
overallDistSNew = overallDistSOld[,1:nrow(overallDistSOld)]
colnames(overallDistSNew) = newcolnamesS

library('vegan')
nmdsS = metaMDS(comm = overallDistSNew, distance = "euclidean", k = 6, trymax = 20) 
#nmdsD = metaMDS(comm = overallDistD, distance = "euclidean", k = 6, trymax = 100) 

### Check for distinctiveness of seperation

nmds = nmdsD

par(mfrow=c(2,2))
cmb = combn(1:6,2)

for(c in 1:15)
{
  for(sI in scripts)
  {
    i = cmb[1,c]
    j = cmb[2,c]
    
    limx = c(min(nmds$points[grepl(paste(sI,sep=""),rownames(nmds$points)),i]),
             max(nmds$points[grepl(paste(sI,sep=""),rownames(nmds$points)),i]))

    limy = c(min(nmds$points[grepl(paste(sI,sep=""),rownames(nmds$points)),j]),
             max(nmds$points[grepl(paste(sI,sep=""),rownames(nmds$points)),j]))
    
    plot(nmds$points[grepl(paste(sI,"_1",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_1",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI),col="red",
         xlim=limx,ylim=limy)
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    points(nmds$points[grepl(paste(sI,"_2",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_2",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),col="blue")
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    points(nmds$points[grepl(paste(sI,"_3",sep=""),rownames(nmds$points)),i],
           nmds$points[grepl(paste(sI,"_3",sep=""),rownames(nmds$points)),j],
           xlab=paste("MDS",i),ylab=paste("MDS",j),col="green")
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    points(nmds$points[grepl(paste(sI,"_4",sep=""),rownames(nmds$points)),i],
           nmds$points[grepl(paste(sI,"_4",sep=""),rownames(nmds$points)),j],
           xlab=paste("MDS",i),ylab=paste("MDS",j),col="magenta")
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")

    points(nmds$points[grepl(paste(sI,"_5",sep=""),rownames(nmds$points)),i],
           nmds$points[grepl(paste(sI,"_5",sep=""),rownames(nmds$points)),j],
           xlab=paste("MDS",i),ylab=paste("MDS",j),col="deeppink")
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    points(nmds$points[grepl(paste(sI,"_6",sep=""),rownames(nmds$points)),i],
           nmds$points[grepl(paste(sI,"_6",sep=""),rownames(nmds$points)),j],
           xlab=paste("MDS",i),ylab=paste("MDS",j),col="black")
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
  }
}

### Check what the points tend to : Similar to PCA

par(mfrow=c(4,6))

for(c in 1:15)
{
  for(sI in scripts)
  {
    i = cmb[1,c]
    j = cmb[2,c]
    
    plot(nmds$points[grepl(paste(sI,"_1",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_1",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"1"))
        
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    plot(nmds$points[grepl(paste(sI,"_2",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_2",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"2"))
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    plot(nmds$points[grepl(paste(sI,"_3",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_3",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"3"))
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    plot(nmds$points[grepl(paste(sI,"_4",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_4",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"4"))
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    plot(nmds$points[grepl(paste(sI,"_5",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_5",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"5"))
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
    plot(nmds$points[grepl(paste(sI,"_6",sep=""),rownames(nmds$points)),i],
         nmds$points[grepl(paste(sI,"_6",sep=""),rownames(nmds$points)),j],
         xlab=paste("MDS",i),ylab=paste("MDS",j),main=paste(sI,"6"))
    
    abline(h = 0, col = "black")
    abline(v = 0, col = "black")
    
  }
}
