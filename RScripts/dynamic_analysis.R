# Extract Geometric Data

prodF = c(15,16,17,18,19,20,23,24,26,27,29,31:38)

GP1 = Grantha_1[,prodF]
GP2 = Grantha_2[,prodF]
GP3 = Grantha_3[,prodF]
GP4 = Grantha_4[,prodF]
GP5 = Grantha_5[,prodF] 
GP6 = Grantha_6[,prodF]

DP1 = Devanagari_1[,prodF]
DP2 = Devanagari_2[,prodF]
DP3 = Devanagari_3[,prodF]
DP4 = Devanagari_4[,prodF]
DP5 = Devanagari_5[,prodF]
DP6 = Devanagari_6[,prodF]

KP1 = Kannada_1[,prodF]
KP2 = Kannada_2[,prodF]
KP3 = Kannada_3[,prodF]
KP4 = Kannada_4[,prodF]
KP5 = Kannada_5[,prodF]
KP6 = Kannada_6[,prodF]

TP1 = Tamil_1[,prodF]
TP2 = Tamil_2[,prodF]
TP3 = Tamil_3[,prodF]
TP4 = Tamil_4[,prodF]
TP5 = Tamil_5[,prodF]
TP6 = Tamil_6[,prodF]

features = names(Grantha_1)[prodF]
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

par(mfrow=c(4,3))
for(f in features)
{
  print(f)
  s = scripts[1]
  
  plot(c(mean(with(get(paste(s,"1",sep="_")),get(f))),
         mean(with(get(paste(s,"2",sep="_")),get(f))),
         mean(with(get(paste(s,"3",sep="_")),get(f))),
         mean(with(get(paste(s,"4",sep="_")),get(f))),
         mean(with(get(paste(s,"5",sep="_")),get(f))),
         mean(with(get(paste(s,"6",sep="_")),get(f)))),
       type='o',
       ylab='value',
       col = 'green',
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
          ylab='value',
          col = colors[i],
          main=f)  
    
    i = i + 1
  }
  
}
par(mfrow=c(1,1))

### Parallell plots

geoParallel = rbind(sapply(GP1,mean),
                    sapply(GP2,mean),
                    sapply(GP3,mean),
                    sapply(GP4,mean),
                    sapply(GP5,mean),
                    sapply(GP6,mean),
                    
                    sapply(DP1,mean),
                    sapply(DP2,mean),
                    sapply(DP3,mean),
                    sapply(DP4,mean),
                    sapply(DP5,mean),
                    sapply(DP6,mean),
                    
                    sapply(KP1,mean),
                    sapply(KP2,mean),
                    sapply(KP3,mean),
                    sapply(KP4,mean),
                    sapply(KP5,mean),
                    sapply(KP6,mean),
                    
                    sapply(TP1,mean),
                    sapply(TP2,mean),
                    sapply(TP3,mean),
                    sapply(TP4,mean), 
                    sapply(TP5,mean), 
                    sapply(TP6,mean)
                    
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

features = names(Grantha_1)[prodF]
names = row.names(Grantha_1)

par(mfrow=c(4,3))
for(f in features)
{
  
  k = NULL
  for(s in scripts)
  {
    characters=row.names(get(paste(s,'_1',sep='')))
    
    for(c in characters)
    {
      cf = c()
      for(i in 1:5)
      {
        feat = try(get(paste(s,i,sep='_'))[c,f])
        if(is.numeric(feat))
        {
          cf = c(cf,feat)
        }
        else
        {
          cf = c(cf,NA)
        }
      }
      k = rbind(k,cf)         
    }
  }
  parcoord(k,main=f,var.label=T,col=1+(1:160)%/%40)
}
par(mfrow=c(1,1))
