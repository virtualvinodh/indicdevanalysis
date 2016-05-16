scores = as.data.frame(GlyphAll.pca.g$scores)
scores[,'script'] = GlyphAll.g[,'script']

#sI = c("G","D","K","T")
par(mfrow=c(4,6))

# PC plot combinations 
cmb = combn(1:4,2)
for(c in 1:6)
    {
    for(sI in scripts)
    {
      s = substr(sI,0,1)
      i = cmb[1,c]
      j = cmb[2,c]
      if(s == "G")
      {
        plotMult = paste("plot(scores[which(scores$script == \"",s,1:6,"\"),i],scores[which(scores$script == \"",s,1:6,"\"),j],
                     type=\"n\",main=\"",sI," ",1:6,"\",xlab=\"PC",i,"\",ylab=\"PC",j,"\");",
                         "text(scores[which(scores$script == \"",s,1:6,"\"),i],scores[which(scores$script == \"",s,1:6,"\"),j],
                     labels=gsub(\"\\\\d\",\"\",row.names(scores[which(scores$script == \"",s,1:6,"\"),])));",
                         "abline(h = 0, col = \"black\");","abline(v = 0, col = \"black\")",
                         sep="",collapse=";")  
        
        eval(parse(text=plotMult))
    
      }
      else {    
        
        plotMult = paste("plot(scores[which(scores$script == \"","G",1,"\"),i],scores[which(scores$script == \"","G",1,"\"),j],
                     type=\"n\",main=\"",sI," ",1,"\",xlab=\"PC",i,"\",ylab=\"PC",j,"\");",
                         "text(scores[which(scores$script == \"","G",1,"\"),i],scores[which(scores$script == \"","G",1,"\"),j],
                     labels=gsub(\"\\\\d\",\"\",row.names(scores[which(scores$script == \"","G",1,"\"),])));",
                         "abline(h = 0, col = \"black\");","abline(v = 0, col = \"black\")",
                         sep="",collapse=";")  
        
        eval(parse(text=plotMult))
        
        plotMult = paste("plot(scores[which(scores$script == \"",s,2:6,"\"),i],scores[which(scores$script == \"",s,2:6,"\"),j],
                     type=\"n\",main=\"",sI," ",2:6,"\",xlab=\"PC",i,"\",ylab=\"PC",j,"\");",
                         "text(scores[which(scores$script == \"",s,2:6,"\"),i],scores[which(scores$script == \"",s,2:6,"\"),j],
                     labels=gsub(\"\\\\d\",\"\",row.names(scores[which(scores$script == \"",s,2:6,"\"),])));",
                         "abline(h = 0, col = \"black\");","abline(v = 0, col = \"black\")",
                         sep="",collapse=";")  
        
        eval(parse(text=plotMult))
        
      }
      
    }
}
