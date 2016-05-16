overallDistSOld = read.csv("/users/vinodhrajan/dropbox/Similarities_Corrected_Static/overallStaticSimilarity.csv",h=T,row.names=1,na.strings="N/A")
newcolnamesS = colnames(overallDistSOld)[1:nrow(overallDistSOld)+1]
overallDistSNew = overallDistSOld[,1:nrow(overallDistSOld)]
colnames(overallDistSNew) = newcolnamesS

overallDistDOld = read.csv("/users/vinodhrajan/dropbox/Similarities_Corrected_Dynamic/overallDynamicSimilarity.csv",h=T,row.names=1,na.strings="N/A")
newcolnamesD = colnames(overallDistDOld)[1:nrow(overallDistDOld)+1]
overallDistDNew = overallDistDOld[,1:nrow(overallDistDOld)]
colnames(overallDistDNew) = newcolnamesD

i=1
j=1
for(rowD in rownames(overallDistDNew)) #Change for Static/Dynamic and run again
{
  print(i)
  for(colD in colnames(overallDistDNew))
  {
    print(j)
    nameAR = unlist(strsplit(rowD,"_"))
    nameAC = unlist(strsplit(colD,"_"))
    
    nameR = nameAR[1]
    nameC = nameAC[1]
    
    scriptR = paste(nameAR[2],"_",nameAR[3],sep="")
    scriptC = paste(nameAC[2],"_",nameAC[3],sep="")
    
    print(scriptR)
    print(scriptC)
    
    scriptD = paste("scriptDataR=",scriptR,sep="")
    eval(parse(text=scriptD))
    scriptD = paste("scriptDataC=",scriptC,sep="")
    eval(parse(text=scriptD))
    
    print(overallDistDNew[rowD,colD])
    overallDistDNew[rowD,colD] = overallDistDNew[rowD,colD] / (max(scriptDataR[nameR,'length'],scriptDataC[nameC,'length'])) 
    print(overallDistDNew[rowD,colD])
    
    j=j+1
  }
  i=i+1
}

#Change Static/Dynamic and run again
write.table(overallDistDNew,"/users/vinodhrajan/dropbox/Similarities_Corrected_Dynamic/overallDynamicSimilarityNorm.csv",sep=",")
