## Cleanup Data
## Find pattern in Scribal patterns : Without Evolution
##### Just use T1, T2, K1, K2 files individually and try to find sribal patterns
## Find patterns with evolutions
#### Do both

## Use Tamil NNNA & AA for Kannada
## Fix it in the files

## Perhaps group strokes based on Character in the Visualization

## Zeroed length values are not taken into considerations
## They're probably augmented strokes (they need to be taken into account manually)

## Perhaps analyze what is the % of change. 
## Analyze what % of strokes were increasing/decreasing

## Instead of absolute values - analyze the percentage of change

## How to calculate stroke augmentations

## Stroke Change with increase is less beause we ignored Stroke augmentations

## Kannada Data Checked and cleaned
## Tamil Checked: T1->T2 (5) AI, KA, NA, NGA, O (All fine)
## Tamil Checked: T2->T1 
### Fixed: CA, MA, NJA, NNA, PA, U, VA, YA

### Compare changing for stroke length in successive oarder
##### S1->S2->S3
## Compare Starting Angle - Ending Angle
## Do other analysis
## Trying to get Scribal style

## Use histogram

## Line plots???

parameters=c("Stroke Time","Distance","Mu","Sigma","Start Angle","End Angle","Curvature Angle")

negmod <- function(x,y=2*pi)
{
  reslt <- 0
  if(x >= 0 )
    reslt <- (x%%y)
  else
    reslt <- -(-x%%y)
  
  return(reslt)
}


library('reshape')
library('ggplot2')
library('GGally')

p = 2
script="Tamil"

getDiff = function(script,p,ignoreZero=TRUE,showPercent=TRUE) 
{
  
  if(script == "Kannada")
  {
    V_S1 = "_K1"
    V_1_S1_S2 = "_1_K1_K2"
    V_D_1S = "_D_1K"
    
    V_S2 = "_K2"
    V_2_S1_S2 = "_2_K1_K2"
    V_D_2S = "_D_2K"
    
    charNames = charNamesK
    
  }
  
  if(script == "Tamil")
  {
    V_S1 = "_T1"
    V_1_S1_S2 = "_1_T1_T2"
    V_D_1S = "_D_1T"
    
    V_S2 = "_T2"
    V_2_S1_S2 = "_2_T1_T2"
    V_D_2S = "_D_2T"
    
    charNames = charNamesT
    
  }
  
  
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
  
  charsLab1 = c()
  charsLab2 = c()
  
  count = 0
  
  ## Add code to ignore rows with D = 0
  #charNames = c("LA")
  for(char in charNames)
  {
    if(exists(paste(char,V_D_1S,sep="")))
    {
      chars1T = c(chars1T,char)
      
      #cat("1")
      
      char_1 = get(paste(char,V_S1,sep=""))      
      char_12 = get(paste(char,V_1_S1_S2,sep=""))
      char_D1 = get(paste(char,V_D_1S,sep=""))
      
      char_1['delth'] = char_1$the - char_1$ths
      char_12['delth'] = char_12$the - char_12$ths
      char_D1['delth'] = char_D1$the - char_D1$ths
      
      ### Adding Column 8 to check 
      
      char_1['torig'] = char_1['t']
      char_12['torig'] = char_12['t']
      char_D1['torig'] = char_D1['t']  
      
      if(p==5 || p ==6)
      {
        char_1[,p] = sapply(char_1[,p],negmod)
        char_12[,p] = sapply(char_12[,p],negmod)
      }
      
      #char_1 <- char_1[char_12$d >0,]
      #char_12 <- char_12[char_12$d > 0,]
      #char_D1 <- char_D1[char_12$d > 0,]
      
      #ordering based on t
      char_1_t = char_1[order(char_1$t),]
      char_12_t = char_12[order(char_12$t),]
      
      if(!all(char_12$sig == char_1$sig) && all(char_12_t$sig == char_1_t$sig))
      {
        #count = count + 1
        #cat("1")
        #print(char)
        #print(char_1)
        #print(char_12)
        
        char_12 <- char_12[match(char_1$sig,char_12$sig),]
      }
      
      if(all(char_1_t$sig[order(char_1_t$sig)] == char_12_t$sig[order(char_12_t$sig)]))
        char_12 <- char_12[match(char_1$sig,char_12$sig),]
      
      else if(all(char_1_t$mu[order(char_1_t$mu)] == char_12_t$mu[order(char_12_t$mu)]))
        char_12 <- char_12[match(char_1$mu,char_12$mu),]
      
      if(!all(char_12$sig == char_1$sig))# && all(char_12_t$sig == char_1_t$sig))
      {
        
        #cat("1")
        
        #count = count+1
        
        #print(char)
        #print(char_1)
        #print(char_12)
      }
      
      
      
      delT1 = c(delT1,(char_1[,p]))
      #print(length(delT1))
      delT12 = c(delT12,(char_12[,p]))
      #print(length(delT12))
      #print(length(delD1T))
      if(!showPercent)
      {
        if(p==1)
        {
          if(length(char_12[,p] > 1))
            delD1T = c(delD1T,(diff(char_12[,p])-diff(char_1[,p]))) #Absolute values
        }
        else
          delD1T = c(delD1T,(char_12[,p]-char_1[,p])) #Absolute values
      }
      else
      {
        if(p==1)
        {
         if(length(char_12[,p]) > 1)
            delD1T = c(delD1T,((diff(char_12[,p])-diff(char_1[,p]))/diff(char_1[,p])))  #Percentage
        }
        else
          delD1T = c(delD1T,((char_12[,p]-char_1[,p])/char_1[,p]))  #Percentage
      }
      
      #print(length(charsLab1))
      
      if(p==1)
      {
        if(length(char_12[,p]) > 1)
        {
          namesChar1T = c(namesChar1T,paste(char,1:(length(diff(char_1[,p]))),sep="_"))
          charsLab1 = c(charsLab1,rep(char,length(diff(char_1[,p]))))
        }
        
      }
      else
      {
        namesChar1T = c(namesChar1T,paste(char,1:(length(char_1[,p])),sep="_"))
        charsLab1 = c(charsLab1,rep(char,length(char_1[,p])))
      }
      #print(char)
      #print(char_12[,p])
      #print(length(char_12[,p]))
      #print(length(delD1T))
      #print(length(namesChar1T))
      
    }
    
    else 
    {
      chars2T = c(chars2T,char)
      
      char_2 = get(paste(char,V_S2,sep=""))  
      char_21 = get(paste(char,V_2_S1_S2,sep=""))
      char_D2 = get(paste(char,V_D_2S,sep=""))
      
      char_2['delth'] = char_2$the - char_2$ths
      char_21['delth'] = char_21$the - char_21$ths
      char_D2['delth'] = char_D2$the - char_D2$ths     
      
      char_2['torig'] = char_2['t']
      char_21['torig'] = char_21['t']
      char_D2['torig'] = char_D2['t']  
      
      if(p==5 || p ==6)
      {
        char_2[,p] = sapply(char_2[,p],negmod)
        char_21[,p] = sapply(char_21[,p],negmod)
      }
      
      
      char_2 <- char_2[char_21$d > 0,]
      char_21 <- char_21[char_21$d > 0,]
      char_D2 <- char_D2[char_21$d > 0,]
      
      #ordering based on t
      char_2_t = char_2[order(char_2$t),]
      char_21_t = char_21[order(char_21$t),]
      
      if(!all(char_21$sig == char_2$sig) && all(char_21_t$sig == char_2_t$sig))
      {
        #count  = count + 1
        #print(char)
        #print(char_2)
        #print(char_21)
        
        char_21 <- char_21[match(char_2$sig,char_21$sig),]
      }
      
      if(all(char_2_t$sig[order(char_2_t$sig)] == char_21_t$sig[order(char_21_t$sig)]))
        char_21 <- char_21[match(char_2$sig,char_21$sig),]
      
      else if(all(char_2_t$mu[order(char_2_t$mu)] == char_21_t$mu[order(char_21_t$mu)]))
        char_21 <- char_21[match(char_2$mu,char_21$mu),]
      
      if(!all(char_21$sig == char_2$sig))# && all(char_21_t$sig == char_2_t$sig))
      {
        #count = count + 1        
        
        #cat("2")
        #print(char)
        #print(char_2)
        #print(char_21)
        
      }
      
      delT2 = c(delT2,(char_2[,p]))
      #print(length(delT2))
      delT21 = c(delT21,(char_21[,p]))
      #print(length(delT21))
      
      
      if(!showPercent)
      {
        if(p==1)
          {
          if(length(char_2[,p]) >1)  
            delD2T = c(delD2T,(diff(char_2[,p])-diff(char_21[,p]))) #Absolute Values
          }
        else
          delD2T = c(delD2T,(char_2[,p]-char_21[,p])) #Absolute Values
      }
      else
      {
        if(p==1)
        {
          if(length(char_2[,p]) >1)
            delD2T = c(delD2T,((diff(char_2[,p])-diff(char_21[,p]))/diff(char_2[,p]))) #Percentage
        }
        else
          delD2T = c(delD2T,((char_2[,p]-char_21[,p])/char_2[,p])) #Percentage
      }
      
      if(p==1)
      {
        if(length(char_2[,p]) >1)
        {
          charsLab2 = c(charsLab2,rep(char,length(diff(char_2[,p]))))
          namesChar2T = c(namesChar2T,paste(char,1:(length(diff(char_2[,p]))),sep="_"))
        }
      }
      else
      {
        charsLab2 = c(charsLab2,rep(char,length(char_2[,p])))
        namesChar2T = c(namesChar2T,paste(char,1:(length(char_2[,p])),sep="_"))
      }
  #    print("here")
  #    print(length(delD2T))
  #    print(length(namesChar2T))
      
    }
    
    
  }
  
  #delV12T = data.frame(T1=delT1,T2=delT12,T3=delD1T,Char=charsLab1,Stroke=namesChar1T)
  #rownames(delV12T) = namesChar1T
  #barplot(t(as.matrix(delV12)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)
  
  #delV21T = data.frame(T1=delT2,T2=delT21,T3=delD2T,Char=charsLab2,Stroke=namesChar2T)
  #rownames(delV21T) = namesChar2T
  #barplot(t(as.matrix(delV21)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5)
  
  ## Perhaps, don't display 
  
  #delVT = rbind(delV12T,delV21T)
  #delVT = delVT[abs(delVT$T3) > 5,]
  
  ##
  
  #delVT = melt(delVT,id=c("Char","Stroke"))
  
  #delVT_G <- ggplot(data=delVT,aes(y=value,x=Stroke,fill=variable))+
   # geom_bar(stat="identity",position = "dodge")
  
  #delVT_G <- delVT_G + facet_grid(~Char, scales = "free_x", space="free") 
  
  #T1->T2 & T2->T1 must be sperated.
  #Bargraph is wrong -> has T1,T2,T3 as barplot order even with glyphs T2 -> T1
  #It should be the otherway round : T2,T1,T3 for T2 -> T1
  
  #print(delVT_G)
  #barplot(t(as.matrix(delVT)),beside=TRUE,col=c('blue','green','red'),cex.names=0.5,main="Stroke Length")
  
  delS_T = data.frame(diff=c(delD1T,delD2T),lab=c(charsLab1,charsLab2),chars=c(namesChar1T,namesChar2T))
  #print(nrow(delS_T))
  delS_T_O = delS_T
  if(ignoreZero)
  {
    if(p!=2)
      delS_T = delS_T[abs(delS_T$diff) > 0.04,] # Absolute limit for angles

    if(showPercent && p==2) ## For length
    {
      delS_T = delS_T[abs(delS_T$diff) > 0.05,]
      #delS_T = delS_T[abs(delS_T$diff) < 1,] # Ignoring very high value in the plot
    }
    
    if(!showPercent && p==2)
      delS_T = delS_T[abs(delS_T$diff) > 5,] # To calculate the significant change in stroke length
                                              # To calculate all changes change it to 5
    
    if(showPercent && p==1) ## For Time
    {
      delS_T = delS_T[abs(delS_T$diff) > 0,]
      #delS_T = delS_T[abs(delS_T$diff) < 1,] # Ignoring very high value in the plot
    }
    if(!showPercent && p==1)
      delS_T = delS_T[abs(delS_T$diff) > 0.1,]     
  }
  #print(delS_T_O)
  #print(nrow(delS_T))
  
  delS_T_G <- ggplot(data=delS_T, aes(y=diff, x=chars))#, fill=lab)) +
  delS_T_G <- delS_T_G + geom_bar(stat="identity",position = "identity")
  #barplot(delS_T,main="Tamil Distance")
  
  delS_T_G <- delS_T_G + facet_grid(~lab, scales = "free_x", space="free") 
  #Adding mean line
  #delS_T_G <- delS_T_G + geom_hline(yintercept = mean(delS_T$diff[delS_T$diff > 0]))
  #delS_T_G <- delS_T_G + geom_hline(yintercept = mean(delS_T$diff[delS_T$diff < 0]))
  delS_T_G <- delS_T_G + ggtitle(paste(script,parameters[p],sep=": "))
  if(p==2 && showPercent)
    delS_T_G <- delS_T_G + coord_cartesian(ylim=c(-1,1))
  if(p==1 && showPercent)
    delS_T_G <- delS_T_G + coord_cartesian(ylim=c(-1,1))  
  
  #print(delS_T_G)
  
  ## 15 is for strokes that were augmented
  
  #Strokes Unchanged
  #print("Stroke with Change")
  #print(nrow(delS_T)/nrow(delS_T_O))
  #print("Stroke without Change")
  #print(1-nrow(delS_T)/nrow(delS_T_O))
  #print("Strokes with Increase")
  #print((nrow(delS_T[delS_T$diff > 0,]))/(nrow(delS_T)))
  #print((length(delS_T[delS_T > 0])+15)/(length(delS_T)+15))
  
  #print("Strokes with Decrease")
  #print(nrow(delS_T[delS_T$diff < 0,])/(nrow(delS_T)))
  
  delS_T$Script = rep(script,nrow(delS_T))
  
  return(delS_T)
  
}


getStrokeChange <- function(par)
{
  
  
}