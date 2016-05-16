# Study distribution of properties

geo = c(2,3,5,6,8,9,11,12,13)
prod = c(15,16,17,18,19,20,23,24,26,27,29,31:38)

geoF = names(Grantha_1)[geo]
prodF = names(Grantha_1)[prod]

## hist
for(f in c(geoF,prodF))
{
  par(mfrow=c(2,3))
  for(s in scripts)
  {
    f1 = with(get(paste(s,"1",sep="_")),get(f))
    f2 = with(get(paste(s,"2",sep="_")),get(f))
    f3 = with(get(paste(s,"3",sep="_")),get(f))
    f4 = with(get(paste(s,"4",sep="_")),get(f))
    f5 = with(get(paste(s,"5",sep="_")),get(f))
    f6 = with(get(paste(s,"6",sep="_")),get(f))
    
    fAll = c(f1,f2,f3,f4,f5,f6)
    
    rangeF = max(fAll) - min(fAll)
  
    for(i in 1:6)
    {
      hist(get(paste("f",i,sep="")),main=paste(s,i,sep=" "),xlab=f,ylab="freq")
    }
  }
}


