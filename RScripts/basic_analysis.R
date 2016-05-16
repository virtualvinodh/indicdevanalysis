# Extract Geometric Data

geoF = c(2,3,5,6,8,9,11,12,13)

GG1 = Grantha_1[,geoF]
GG2 = Grantha_2[,geoF]
GG3 = Grantha_3[,geoF]
GG4 = Grantha_4[,geoF]
GG5 = Grantha_5[,geoF] 
GG6 = Grantha_6[,geoF]

DG1 = Devanagari_1[,geoF]
DG2 = Devanagari_2[,geoF]
DG3 = Devanagari_3[,geoF]
DG4 = Devanagari_4[,geoF]
DG5 = Devanagari_5[,geoF]
DG6 = Devanagari_6[,geoF]
DG7 = Devanagari_7[,geoF]

KG1 = Kannada_1[,geoF]
KG2 = Kannada_2[,geoF]
KG3 = Kannada_3[,geoF]
KG4 = Kannada_4[,geoF]
KG5 = Kannada_5[,geoF]
KG6 = Kannada_6[,geoF]

TG1 = Tamil_1[,geoF]
TG2 = Tamil_2[,geoF]
TG3 = Tamil_3[,geoF]
TG4 = Tamil_4[,geoF]
TG5 = Tamil_5[,geoF]
TG6 = Tamil_6[,geoF]

features = names(Grantha_1)[geoF]
scripts = c("Grantha","Devanagari","Kannada","Tamil")

colors = c("red","blue","black")

### Box Plots

for(f in features)
{
  par(mfrow=c(2,2))
  for(s in scripts)
  {
    boxplot(with(get(paste(s,"1",sep="_")),get(f)),
            with(get(paste(s,"2",sep="_")),get(f)),
            with(get(paste(s,"3",sep="_")),get(f)),
            with(get(paste(s,"4",sep="_")),get(f)),
            with(get(paste(s,"5",sep="_")),get(f)),
            with(get(paste(s,"6",sep="_")),get(f)),
            ylab=f,
            main=s)
  }
  
}

par(mfrow=c(1,1))
### Line Plots 

par(mfrow=c(3,3))
for(f in features)
{
  fetAll = paste("featAll=c(",paste("mean(",rep(scripts,6)[order(rep(scripts,6))],"_",1:6,"[,'",f,"'])",sep="",collapse=","),")",sep="")
  eval(parse(text=fetAll))
  
  s = scripts[1]
  
  plot(c(mean(with(get(paste(s,"1",sep="_")),get(f))),
         mean(with(get(paste(s,"2",sep="_")),get(f))),
         mean(with(get(paste(s,"3",sep="_")),get(f))),
         mean(with(get(paste(s,"4",sep="_")),get(f))),
         mean(with(get(paste(s,"5",sep="_")),get(f))),
         mean(with(get(paste(s,"6",sep="_")),get(f)))),
       type='o',
       ylab='',
       xlab='Script Stage',
      ylim=c(min(featAll),max(featAll)),
       lty = 1,
       main=f)  
  
  i = 1
  
 for(s in scripts[2:4])
 {
   lines(c(mean(with(get(paste(s,"1",sep="_")),get(f))),
          mean(with(get(paste(s,"2",sep="_")),get(f))),
          mean(with(get(paste(s,"3",sep="_")),get(f))),
          mean(with(get(paste(s,"4",sep="_")),get(f))),
          mean(with(get(paste(s,"5",sep="_")),get(f))),
          mean(with(get(paste(s,"6",sep="_")),get(f)))),
        type='o',
         lty = i+1)  
   
   i = i + 1
 }
  
}
par(mfrow=c(1,1))

### Parallell plots

geoParallel = rbind(sapply(GG1,mean),
                    sapply(GG2,mean),
                    sapply(GG3,mean),
                    sapply(GG4,mean),
                    sapply(GG5,mean),
                    sapply(GG6,mean),
                    
                    sapply(DG1,mean),
                    sapply(DG2,mean),
                    sapply(DG3,mean),
                    sapply(DG4,mean),
                    sapply(DG5,mean),
                    sapply(DG6,mean),
                    
                    sapply(KG1,mean),
                    sapply(KG2,mean),
                    sapply(KG3,mean),
                    sapply(KG4,mean),
                    sapply(KG5,mean),
                    sapply(KG6,mean),
                    
                    sapply(TG1,mean),
                    sapply(TG2,mean),
                    sapply(TG3,mean),
                    sapply(TG4,mean), 
                    sapply(TG5,mean), 
                    sapply(TG6,mean)
                    
                    )

library("MASS", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
parcoord(geoParallel,col=c(rep(1,6),rep(2,6),rep(3,6),rep(4,6)),var.label=TRUE)

### Transposed Parallel Plot

### Distribution over characters

for(f in features)
{
  par(mfrow=c(2,2))
  for(s in scripts)
  {
    s1 = get(paste(s,1,sep='_'))
    s2 = get(paste(s,2,sep='_'))
    s3 = get(paste(s,3,sep='_'))
    s4 = get(paste(s,4,sep='_'))
    s5 = get(paste(s,5,sep='_'))
    s6 = get(paste(s,6,sep='_'))
    
   # CommonG = Reduce(intersect,list(row.names(s4),
  #                                  row.names(s3),
  #                                  row.names(s2),
  #                                  row.names(s1))) 
    
    plot(with(s6,get(f)),type='o',col='red',ylab=f,main=s)
    lines(with(s5,get(f)),type='o',col='magenta')
    lines(with(s4,get(f)),type='o',col='cyan')
    lines(with(s3,get(f)),type='o',col='yellow')
    lines(with(s2,get(f)),type='o',col='green')
    lines(with(s1,get(f)),type='o',col='black')
    
  }
}
par(mfrow=c(1,1))

## Transpose Parallel Plot

                                          