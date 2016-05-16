setwd("~/Dropbox/Script_Data")

options(stringsAsFactors = FALSE)

for ( i in 1:7)
{
  scripts = c("Tamil","Grantha","Kannada","Devanagari")
  
  for (s in scripts)
  {
    scriptID = paste(s,i,sep='_')
    scriptFile = paste(scriptID,"csv1",sep=".")
    try(assign(scriptID,read.csv(scriptFile,h=T,row.names=1,na.strings="N/A",)))
  }
}

Devanagari_1 = Grantha_1
Devanagari_1 = Devanagari_1[!rownames(Devanagari_1) %in% c("II",'O'),]
Kannada_1 = Grantha_1
Kannada_1 = Kannada_1[!rownames(Kannada_1) %in% c("U"),]

