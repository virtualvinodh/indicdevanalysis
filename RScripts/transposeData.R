# Change in features character wise

features = names(Grantha_1)[c(2,3,5,6,8,9,11,12,13)]
scripts = c("Grantha","Devanagari","Kannada","Tamil")

names = row.names(Grantha_1)

for (f in features)
{
  print(f)
  par(mfrow=c(2,2))
  for(s in scripts)
  {
    j = 0
    for(n in names)
    {
      featC = c()
      for(i in 1:6)
      {
        featC = try(c(featC,with(get(paste(s,i,sep='_'))[n,],get(f))))
      }
      if(j==0)
      {
        j=j+1
        plot(featC,type='o',main=s,ylab=f,col=j)
      }
      else
      {
        j=j+1
        lines(featC,type='o',main=s,ylab=f,col=j)
      }
    }
  }
}
par(mfrow=c(1,1))

## Add Script Tag

GG1[,'script'] <- rep('G1',nrow(GG1))
GG2[,'script'] <- rep('G1',nrow(GG2))
GG3[,'script'] <- rep('G1',nrow(GG3))
GG2[,'script'] <- rep('G2',nrow(GG2))
GG3[,'script'] <- rep('G3',nrow(GG3))
GG4[,'script'] <- rep('G4',nrow(GG4))
GG5[,'script'] <- rep('G5',nrow(GG5))
GG6[,'script'] <- rep('G6',nrow(GG6))

DG1[,'script'] <- rep('D1',nrow(DG1))
DG2[,'script'] <- rep('D2',nrow(DG2))
DG3[,'script'] <- rep('D3',nrow(DG3))
DG4[,'script'] <- rep('D4',nrow(DG4))
DG5[,'script'] <- rep('D5',nrow(DG5))
DG6[,'script'] <- rep('D6',nrow(DG6))

KG1[,'script'] <- rep('K1',nrow(KG1))
KG2[,'script'] <- rep('K2',nrow(KG2))
KG3[,'script'] <- rep('K3',nrow(KG3))
KG4[,'script'] <- rep('K4',nrow(KG4))
KG5[,'script'] <- rep('K5',nrow(KG5))
KG6[,'script'] <- rep('K6',nrow(KG6))
