# Multi Dimensional Scaling

# https://books.google.co.uk/books?id=q7FYBQAAQBAJ&pg=PA316&lpg=PA316&dq=which+distance+measure+to+use+canberra+manhattan&source=bl&ots=TR2ChecXd8&sig=ppSzbw52kojieR4pabiUNddiwbM&hl=en&sa=X&ei=66_QVMDwDYGy7Qbct4GYBw&redir_esc=y#v=onepage&q=which%20distance%20measure%20to%20use%20canberra%20manhattan&f=false

## MDS Scaling - Geometric Features

p <- par(
  oma=c(0,0,0,2), # Room for the title and legend
  mfrow=c(2,3)
)
for(s in scripts)
{
  plotMDS=paste("mds = cmdscale(dist(",s,'_',1:6,"[c(geo)],method=\"euclidean\",upper=TRUE,diag=TRUE));",
             "plot(mds[,1],mds[,2],type=\"n\",main=\"",s,'_',1:6,"\");",
             "text(mds[,1],mds[,2],rownames(mds),cex=0.6);",
             "abline(h = 0, col = \"black\");","abline(v = 0, col = \"black\");",
             sep="",collapse="");
  
  eval(parse(text=plotMDS))
}