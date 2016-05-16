boxplotFeat <- function(features)
{
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
}

