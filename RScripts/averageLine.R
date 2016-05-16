averageFeatureLine <- function(features,rw,cl)
{  
  op <- par(
    oma=c(0,0,0,2),# Room for the title and legend
    mfrow=c(rw,cl)
  )
  for(f in features)
  {
    fetAll = paste("featAll=c(",paste("mean(",rep(scripts,6)[order(rep(scripts,6))],"_",1:6,"[,'",f,"'])",sep="",collapse=","),")",sep="")
    eval(parse(text=fetAll))
    
    s = scripts[1]
    
    plot(meanFeat(s,f),
         type='o',
         ylab='',
         xlab='Script Stage',
         ylim=c(min(featAll),max(featAll)),
         lty = 1,
         lwd = 2,
         cex.main = 2,
         cex.axis = 1.5,
         main=f)  
    
    i = 1
    
    for(s in scripts[2:4])
    {
      lines(meanFeat(s,f),
            type='o',
            lwd=2,
            lty = i+1)  
      
      i = i + 1
    }
    
  }
  
  par(op)
  op <- par(usr=c(0,1,0,1), # Reset the coordinates
            xpd=NA)         # Allow plotting outside the plot region
  
 # legend(locator(1), # Find suitable coordinates by trial and error
#        scripts, lty=1:4, lwd=2,box.col=1,cex=0.6, horiz=T)
  
}
