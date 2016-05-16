# Change Python arrays to vectors

vectorize <-function(strng)
{
  strng = gsub('\\[','',strng)
  strng = gsub('\\]','',strng)
  strng = gsub('\\|','',strng)
  strng = unlist(lapply(strsplit(strng,' ')[[1]],as.numeric))
  
  return(strng)
}

meanNull <-function(vale)
{
  valeM = mean(vale)
  
  if(is.na(valeM))
    return(0)
  else
    return(valeM)
}

meanFeat <- function(s,f)
{
  meanF = c(mean(with(get(paste(s,"1",sep="_")),get(f))),
    mean(with(get(paste(s,"2",sep="_")),get(f))),
    mean(with(get(paste(s,"3",sep="_")),get(f))),
    mean(with(get(paste(s,"4",sep="_")),get(f))),
    mean(with(get(paste(s,"5",sep="_")),get(f))),
    mean(with(get(paste(s,"6",sep="_")),get(f))))
  
  return(meanF)
}