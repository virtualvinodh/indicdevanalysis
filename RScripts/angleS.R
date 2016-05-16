negmod <- function(x,y=360)
{
  reslt <- 0
  
  if(x >= 0 )
    reslt <- (x%%y)
  else
    reslt <- -(-x%%y)
  
  return(reslt)
}


p = 5

# For Scripts derived from 1

delT1 = c()
delT12 = c()
delD1 = c()

delT2 = c()
delT21 = c()
delD2 = c()

chars1 = c()
chars2 = c()

namesChar1 = c()
namesChar2 = c()

## Add code to ignore rows with D = 0
for(char in charNames)
{
  
  if(exists(paste(char,"_D_1",sep="")))
  {
    
    chars1 = c(chars1,char)
    
    char_1 = get(paste(char,"_T1",sep=""))  
    
    char_12 = get(paste(char,"_1_T1_T2",sep=""))
    char_D1 = get(paste(char,"_D_1",sep=""))
    
    print(char)
    
    #ordering based on t
    char_1 = char_1[order(char_1$t),]
    
    print(char_1)
    
    delT1 = c(delT1,(char_1[,p]))
    print(length(delT1))
    delT12 = c(delT12,(char_12[,p]))
    print(length(delT12))
    delD1 = c(delD1,(char_12[,p]-char_1[,p]))
    
    namesChar1 = c(namesChar1,paste(char,1:(length(char_1[,1])),sep="_"))
    print(length(namesChar1))
    
  }
  
  else
    
  {
    
    chars2 = c(chars2,char)
    
    char_2 = get(paste(char,"_T2",sep=""))  
    char_21 = get(paste(char,"_2_T1_T2",sep=""))
    char_D2 = get(paste(char,"_D_2",sep=""))
    
    char_2 <- char_2[char_21$d >0,]
    char_21 <- char_21[char_21$d > 0,]
    char_D2 <- char_D2[char_21$d > 0,]
    
    print(char)
    
    #ordering based on t
    #char_1 = char_1[order(char_1$t),]
    
    print(char_2)
    print(char_21)
    
    delT2 = c(delT2,(char_2[,p]))
    print(length(delT2))
    delT21 = c(delT21,(char_21[,p]))
    print(length(delT21))
    delD2 = c(delD2,(char_2[,p]-char_21[,p]))
    
    namesChar2 = c(namesChar2,paste(char,1:(length(char_2[,p])),sep="_"))
    print(length(namesChar2))
    
  }
  
  
}

delT1 <- sapply(delT1*(180/pi),negmod)
delT12 <- sapply(delT12*(180/pi),negmod)
delD1 <- sapply(delD1*(180/pi),negmod)

delT2 <- sapply(delT2*(180/pi),negmod)
delT21 <- sapply(delT21*(180/pi),negmod)
delD2 <- sapply(delD2*(180/pi),negmod)

delV12 = data.frame(T1=delT1,T2=delT12,T3=delD1)
rownames(delV12) = namesChar1
#barplot(t(as.matrix(delV12)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)

delV21 = data.frame(T1=delT2,T2=delT21,T3=delD2)
rownames(delV21) = namesChar2
#barplot(t(as.matrix(delV21)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)

delV = rbind(delV12,delV21)
barplot(t(as.matrix(delV)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5,main="Stroke Starting Angle")
