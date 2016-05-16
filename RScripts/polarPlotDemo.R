library("plotrix", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")


## Draw Quadrants
## Check how many angles have changed magnitude
## Difference between starting and ending angles

## Multivariate Visualization

angleS1_T = c() 
angleS12_T = c()
angleD_T = c()

for(char in charNamesT)
{
  if(exists(paste(char,"_D_1T",sep="")))
  { 
    char_1 = get(paste(char,"_T1",sep=""))      
    char_12 = get(paste(char,"_1_T1_T2",sep=""))
    
    char_1 <- char_1[char_12$d >0,]
    char_12 <- char_12[char_12$d > 0,]
    
    angleS1_T = c(angleS1_T,char_1[,'ths'])
    angleS12_T = c(angleS12_T,char_12[,'ths'])        
  }
  
  else if(exists(paste(char,"_D_2T",sep="")))
  { 
    char_1 = get(paste(char,"_T2",sep=""))      
    char_12 = get(paste(char,"_2_T1_T2",sep=""))
    
    char_1 <- char_1[char_12$d > 0,]
    char_12 <- char_12[char_12$d > 0,]
    
    angleS1_T = c(angleS1_T,char_1[,'ths'])
    angleS12_T = c(angleS12_T,char_12[,'ths'])    
  }
  
}

#angleS1_T = angleS1_T * (180/pi)
#angleS12_T = angleS12_T * (180/pi)

delS_T = (angleS1_T - angleS12_T)

#print(length(delS_T))
#delS_T = delS_T[abs(delS_T) > 5]
# print(length(delS_T))

angleS1_T = angleS1_T[abs(delS_T) > 0.1]
angleS12_T = angleS12_T[abs(delS_T) > 0.1]
k
print(angleS1_T[10] * (180/pi)) 
print(angleS12_T[10] * (180/pi)) 

print(length(angleS1_T))
print(length(angleS12_T))

len1 = c(0,rep(2,length(angleS1_T[1])))

par(mfrow=c(2,2))

for(i in 1:10)

{

  polar.plot(len1,c(0,angleS1_T[i]),
                   start=90,clockwise=TRUE,lwd=3,line.col=4,main=i)

  polar.plot(len1,c(0,angleS12_T[i]),
                   start=90,clockwise=TRUE,lwd=3,line.col='red',main=i)

}