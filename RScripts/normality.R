# Testing change in normality

for(f in features[1:8])
{
  j = 0
  for(s in scripts)
  {
    normC = c()
    for(i in 1:6)
    {
      norm = shapiro.test(with(get(paste(s,i,sep="_")),get(f)))$p.value
      normC = c(normC,norm)
    }
    print(normC)
    if(j == 0)
    {
      j = j+1
      plot(normC,type='o',col=j,main=f,ylim=c(0,1)) 
    }
    else
    {
      j = j+1
      lines(normC,type='o',col=j,main=f)
    }
  }
}
