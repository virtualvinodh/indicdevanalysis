pathB = "/users/vinodhrajan/dropbox/Similarity_Data/Similarities_Corrected_Dynamic/" ## Repeat for Static
typeTraj = "FalseTrueSim.csv1" ## Change for Static

for(s in scripts)
{
  for(i in 1:6)
  {
    scriptN = paste(s,"_",i,sep="")
    print(scriptN)
    scriptFile = paste(pathB,scriptN,scriptN,typeTraj,sep="")
    
    scriptDiffOld = read.csv(scriptFile,h=T,row.names=1,na.strings="N/A")
    scriptDiff = scriptDiffOld[,1:nrow(scriptDiffOld)]
    
    for(rowD in rownames(scriptDiff))
    {
      for(colD in colnames(scriptDiff))
      {
        nameR = unlist(strsplit(rowD,"_"))[1]
        nameC = unlist(strsplit(colD,"_"))[1]
        
        scriptD = paste("scriptData=",scriptN,sep="")
        eval(parse(text=scriptD))
        
        scriptDiff[rowD,colD] = scriptDiff[rowD,colD] / (max(scriptData[nameR,'length'],scriptData[nameC,'length'])) 
      }
    }
    
    scriptFileN = paste(pathB,scriptN,scriptN,"Norm",typeTraj,sep="")
    write.table(scriptDiff,scriptFileN,sep=",")
    
  }
}