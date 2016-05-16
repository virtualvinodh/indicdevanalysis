colors = c("red","green","blue","cyan","brown","purple")
sI = c("G","D","K","T")

p <- par(
  oma=c(0,0,0,2),# Room for the title and legend
  mfrow=c(2,3)
)

par(mfrow=c(1,1))
for(f in feats)
{
  pdens = paste("sm.density.compare(",sI,"All.a$",f,",factor(",sI,"All.a$script),model=\"none\",
                       col=colors,lty=rep(1,6),lwd=2,
                       xlab=\"",f,"\");",
                "title(main=\"",scripts,"\");",
                "legend(\"topright\",levels(factor(",sI,"All.a$script)),lty=1,lwd=2,col=colors,ncol=1,cex=0.5)",       
                sep="",collapse=";")  
  eval(parse(text=pdens))
}
