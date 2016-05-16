# Discriminant Analysis
library("MASS", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")

fAll = c(geo,prod)

### Subset with required Features
scripts = c("Grantha","Devanagari","Kannada","Tamil")

for(s in scripts)
{
  sI = substr(s,1,1)
  assFA = paste(sI,"A",1:6,"=",s,"_",1:6,"[,fAll]",sep="",collapse=";")
  eval(parse(text=assFA))
  
  assFA = paste(sI,"G",1:6,"=",s,"_",1:6,"[,geo]",sep="",collapse=";")
  eval(parse(text=assFA))
  
  assFA = paste(sI,"P",1:6,"=",s,"_",1:6,"[,prod]",sep="",collapse=";")
  eval(parse(text=assFA))
}

## Add Script Tag

modes = c("G","P","A")
scriptsI = c("G","D","K","T")

for(m in modes)
{
  for(s in scriptsI)
  {
    if(s == "G")
      n=1:6
    else
      n=2:6
    
    lhs = paste(s,m,1:6,"[,'script']",sep="")
    rhs = paste("rep('",s,1:6,"',nrow(",s,m,1:6,'))',sep="")
    eq = paste(paste(lhs, rhs, sep="<-"), collapse=";")
    eval(parse(text=eq))    
  }
}

for(s in scripts)
{
  sI = substr(s,1,1)
  
  sLP = paste(paste(sI,"P",sep=""),1:6,sep="",collapse=",")
  sLG = paste(paste(sI,"G",sep=""),1:6,sep="",collapse=",")
  sLA = paste(paste(sI,"A",sep=""),1:6,sep="",collapse=",")
  
  scrptAllP = paste(sI,"All.p=rbind(",sLP,")",sep="")
  scrptAllG = paste(sI,"All.g=rbind(",sLG,")",sep="")
  scrptAllA = paste(sI,"All.a=rbind(",sLA,")",sep="")
  
  eval(parse(text=scrptAllP)) 
  eval(parse(text=scrptAllG)) 
  eval(parse(text=scrptAllA)) 
  
  factorsP = paste(paste(sI,"All.p$",prod,sep=""),collapse="+")
  ldaExpr = paste(s,".lda.p = lda(",sI,"All.p","$script~",factorsP,")",sep="")
  eval(parse(text=ldaExpr))
  
  factorsG = paste(paste(sI,"All.g$",geo,sep=""),collapse="+")
  ldaExpr = paste(s,".lda.g = lda(",sI,"All.g","$script~",factorsG,")",sep="")
  eval(parse(text=ldaExpr))
  
  factorsA = paste(paste(sI,"All.a$",fAll,sep=""),collapse="+")
  ldaExpr = paste(s,".lda.a = lda(",sI,"All.a","$script~",factorsA,")",sep="")
  eval(parse(text=ldaExpr))  
  
}

GlyphAll.p = rbind(GP1,GP2,GP3,GP4,GP5,GP6,
                 DP2,DP3,DP4,DP5,DP6,
                 KP2,KP3,KP4,KP5,KP6,
                 TP2,TP3,TP4,TP5,TP6)

GlyphAll.g = rbind(GG1,GG2,GG3,GG4,GG5,GG6,
                   DG2,DG3,DG4,DG5,DG6,
                   KG2,KG3,KG4,KG5,KG6,
                   TG2,TG3,TG4,TG5,TG6)

GlyphAll.gini = rbind(GG2,DG2,KG2,TG2)
GlyphAll.gG = rbind(GG3,DG4,KG5,TG6)
GlyphAll.gK = rbind(KG3,KG4,KG5,KG6)
GlyphAll.gD = rbind(DG3,DG4,DG5,DG6)
GlyphAll.gT = rbind(TG3,TG4,TG5,TG6)

GlyphAll.a = rbind(GA1,GA2,GA3,GA4,GA5,GA6,
                   DA2,DA3,DA4,DA5,DA6,
                   KA2,KA3,KA4,KA5,KA6,
                   TA2,TA3,TA4,TA5,TA6)

factorsP = paste(paste("GlyphAll.p$",prod,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.p = lda(","GlyphAll.p","$script~",factorsP,",prior=rep(1/21,21))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.g$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.g = lda(","GlyphAll.g","$script~",factorsG,",prior=rep(1/21,21))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.gini$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.gini = lda(","GlyphAll.gini","$script~",factorsG,",prior=rep(1/4,4))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.gG$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.gG = lda(","GlyphAll.gG","$script~",factorsG,",prior=rep(1/4,4))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.gD$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.gD = lda(","GlyphAll.gD","$script~",factorsG,",prior=rep(1/4,4))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.gK$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.gK = lda(","GlyphAll.gK","$script~",factorsG,",prior=rep(1/4,4))",sep="")
eval(parse(text=ldaExpr))

factorsG = paste(paste("GlyphAll.gT$",geo,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.gT = lda(","GlyphAll.gT","$script~",factorsG,",prior=rep(1/4,4))",sep="")
eval(parse(text=ldaExpr))

factorsA = paste(paste("GlyphAll.a$",fAll,sep=""),collapse="+")
ldaExpr = paste("GlyphAll.lda.a = lda(","GlyphAll.a","$script~",factorsA,",prior=rep(1/21,21))",sep="")
eval(parse(text=ldaExpr)) 

###### Principal Component Analysis
for(s in scripts)
{
  sI = substr(s,1,1)
  assign(paste(s,".pca.g",sep=""),princomp(get(paste(sI,"All.g",sep=""))[1:9],scores=T,cor=T))
  assign(paste(s,".pca.p",sep=""),princomp(get(paste(sI,"All.p",sep=""))[1:12],scores=T,cor=T))
  assign(paste(s,".pca.a",sep=""),princomp(get(paste(sI,"All.a",sep=""))[1:21],scores=T,cor=T))
  
  pcaIndiG = paste(sI,"G",1:6,".pca=","princomp(",sI,"G",1:6,"[1:9],scores=T,cor=T)",sep="",collapse=";")
  pcaIndiP = paste(sI,"P",1:6,".pca=","princomp(",sI,"P",1:6,"[1:12],scores=T,cor=T)",sep="",collapse=";")
  pcaIndiA = paste(sI,"A",1:6,".pca=","princomp(",sI,"A",1:6,"[1:21],scores=T,cor=T)",sep="",collapse=";")

  eval(parse(text=pcaIndiG)) 
  eval(parse(text=pcaIndiP)) 
  eval(parse(text=pcaIndiA)) 
}

GlyphAll.pca.g = princomp(GlyphAll.g[1:9],scores=T,cor=T) 
GlyphAll.pca.p = princomp(GlyphAll.p[1:12],scores=T,cor=T)
GlyphAll.pca.a = princomp(GlyphAll.a[1:21],scores=T,cor=T)