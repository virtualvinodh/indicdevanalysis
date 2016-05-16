## Perhaps group strokes based on Character in the Visualization

p = 2

# For Scripts derived from 1

delT1 = c()
delT12 = c()
delD1T = c()

delT2 = c()
delT21 = c()
delD2T = c()

chars1T = c()
chars2T = c()

namesChar1T = c()
namesChar2T = c()

delK1 = c()
delK12 = c()
delD1K = c()

delK2 = c()
delK21 = c()
delD2K = c()

chars1K = c()
chars2K = c()

namesChar1K = c()
namesChar2K = c()


## Add code to ignore rows with D = 0
for(char in charNamesK)
{
  
  if(exists(paste(char,"_D_1K",sep="")))
  {
    
    chars1K = c(chars1K,char)
    
    char_1 = get(paste(char,"_K1",sep=""))      
    char_12 = get(paste(char,"_1_K1_K2",sep=""))
    char_D1 = get(paste(char,"_D_1K",sep=""))
    
    char_1 <- char_1[char_12$d >0,]
    char_12 <- char_12[char_12$d > 0,]
    char_D1 <- char_D1[char_12$d > 0,]
    
    print(char)
    
    #ordering based on t
    #char_1 = char_1[order(char_1$t),]
    
    print(char_1)
    
    delK1 = c(delK1,(char_1[,p]))
    print(length(delT1))
    delK12 = c(delK12,(char_12[,p]))
    print(length(delT12))
    delD1K = c(delD1K,(char_12[,p]-char_1[,p]))
    
    namesChar1K = c(namesChar1K,paste(char,1:(length(char_1[,1])),sep="_"))
    print(length(namesChar1K))
    
  }
  
  else 
  {
    chars2K = c(chars2K,char)
    
    char_2 = get(paste(char,"_K2",sep=""))  
    char_21 = get(paste(char,"_2_K1_K2",sep=""))
    char_D2 = get(paste(char,"_D_2K",sep=""))
    
    char_2 <- char_2[char_21$d >0,]
    char_21 <- char_21[char_21$d > 0,]
    char_D2 <- char_D2[char_21$d > 0,]
    
    print(char)
    
    #ordering based on t
    #char_1 = char_1[order(char_1$t),]
    
    print(char_2)
    print(char_21)
    
    delK2 = c(delK2,(char_2[,p]))
    print(length(delK2))
    delK21 = c(delK21,(char_21[,p]))
    print(length(delK21))
    delD2K = c(delD2K,(char_2[,p]-char_21[,p]))
    
    namesChar2K = c(namesChar2K,paste(char,1:(length(char_2[,p])),sep="_"))
    print(length(namesChar2K))
    
  }
  
  
}

delV12K = data.frame(T1=delK1,T2=delK12,T3=delD1K)
rownames(delV12K) = namesChar1K
#barplot(t(as.matrix(delV12)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)

delV21K = data.frame(T1=delK2,T2=delK21,T3=delD2K)
rownames(delV21K) = namesChar2K
#barplot(t(as.matrix(delV21)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)

## Perhaps, don't display 

delVK = rbind(delV12K,delV21K)
#barplot(t(as.matrix(delVK)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5,main="Stroke Length")

barplot(c(delD1K,delD2K),main="Kannada Distance 2")
