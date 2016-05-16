dirP = "~/Dropbox/Handwriting_Model_Data"
options(stringsAsFactors = FALSE)

dirsName = list.dirs(path = dirP)

parName = c("t","d","mu","sig","ths","the")

## Read all ANA data

for(dirsN in dirsName)
{
  charsName = list.files(path=dirsN,pattern="*.anaN")
  
  prefN = tail(strsplit(dirsN,"/")[[1]],1)
  
  if(prefN == "K1_K2")
    charAllK = c()
  
  if(prefN == "T1_T2")
    charAllT = c()  
  
  for(charsN in charsName)
  {
    charN = strsplit(charsN,'.anaN')[[1]]  
    varName = paste(charN,"_",prefN,sep="")
    
    assign(varName,
           read.csv(paste(dirsN,"/",charsN,sep=""),
                    na.strings="N/A",h=F,sep=","))
    rowNS = paste("colnames(",varName,")<-parName",sep="")
    
    if(prefN == "K1_K2")
      charAllK = c(charAllK,varName)
    
    if(prefN == "T1_T2")
      charAllT = c(charAllT,varName)
    
    eval(parse(text=rowNS))
  }
  
}

## Change NA_1 to NA_2; and NA_2 to NA_1 in the source
## As of now, .anaN files have been changed

## Find differences

charNamesK = c()

## Kannada
for(charA in charAllK)
{
  charParts = strsplit(charA,"_")[[1]]
  
  charN = charParts[1]
  
  charNamesK = c(charNamesK,charN)
  
  fromS = charParts[2]
  scriptI = charParts[3]
  scriptF = charParts[4]
  
  if(fromS == '2')
  {
    print(charN)
    try(
    assign(paste(charN,'_D_2K',sep=""),
           get(paste(charN,'_K2',sep="")) - get(paste(charN,'_2_K1_K2',sep="")))
    )
  }
  
  else
  {
    print(charN)
    
  try(
    assign(paste(charN,'_D_1K',sep=""),
           get(paste(charN,'_1_K1_K2',sep="")) - get(paste(charN,'_K1',sep="")))
  )
  
  }
 
}

## Tamil
charNamesT = c()
for(charA in charAllT)
{
  charParts = strsplit(charA,"_")[[1]]
  
  charN = charParts[1]
  
  charNamesT = c(charNamesT,charN)
  
  fromS = charParts[2]
  scriptI = charParts[3]
  scriptF = charParts[4]
  
  if(fromS == '2')
  {
    print(charN)
    try(
      assign(paste(charN,'_D_2T',sep=""),
             get(paste(charN,'_T2',sep="")) - get(paste(charN,'_2_T1_T2',sep="")))
    )
  }
  
  else
  {
    print(charN)
    
    try(
      assign(paste(charN,'_D_1T',sep=""),
             get(paste(charN,'_1_T1_T2',sep="")) - get(paste(charN,'_T1',sep="")))
    )
    
  }
  
}
