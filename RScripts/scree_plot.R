NMDS.scree<-function(x) 
  {
  plot(rep(1,10),replicate(10,metaMDS(x,autotransform=F,k=1)$stress/100),xlim=c(1,nrow(x)),ylim=c(0,0.5),xlab="# of Dimensions",ylab="Stress",main="NMDS stress plot")
  for (i in 1:(nrow(x)-2)) {
    points(rep(i+1,10),replicate(10,metaMDS(x,autotransform=F,k=i+1)$stress/100))
  }
}
