# Tamil Letter Frequency Data

cNamesT = c("A","I","II","U","E","AI","O",
           "KA","NGA",
           "CA","NJA",
           "TTA","NNA",
           "TA","NA",
           "PA","MA",
           "YA","RA","LA","VA")

cFreqT = c(1.75,1.22,0.07,0.83,1.21,0.07,0.48,
          10.83,1.16,
          3.36,0.38,
          5.24,2.54,
          11.04,4.01,
          6.68,8.48,
          5.04,6.82,5.65,5.97)
          
names(cFreqT) = cNamesT

p <- par(
  oma=c(0,0,0,2),# Room for the title and legend
  mfrow=c(3,3)
)

for(feat in geo)
{
  if(feat == "openness")
  {
    plot(Tamil_1[,feat][order(cFreqT)],type='o',xaxt='n',ylim=c(0,1),col="red",main=feat)
  }
  else{
     plot(Tamil_1[,feat][order(cFreqT)],type='o',xaxt='n',col="red", main=feat)
  }
  lines(Tamil_2[,feat][order(cFreqT)],type='o',xaxt='n',col="green")
  lines(Tamil_3[,feat][order(cFreqT)],type='o',xaxt='n',col="blue")
  lines(Tamil_4[,feat][order(cFreqT)],type='o',xaxt='n',col="brown")
  lines(Tamil_5[,feat][order(cFreqT)],type='o',xaxt='n',col="darkorchid")
  lines(Tamil_6[,feat][order(cFreqT)],type='o',xaxt='n',col="darksalmon")
  axis(1,at=1:length(cNamesT),labels=names(sort(cFreqT)))
}

p <- par(
  oma=c(0,0,0,2),# Room for the title and legend
  mfrow=c(3,4)
)

for(feat in prod)
{
  if(feat == "openness")
  {
    plot(Tamil_1[,feat][order(cFreqT)],type='o',xaxt='n',ylim=c(0,1),col="red",main=feat)
  }
  else{
    plot(Tamil_1[,feat][order(cFreqT)],type='o',xaxt='n',col="red", main=feat)
  }
  lines(Tamil_2[,feat][order(cFreqT)],type='o',xaxt='n',col="green")
  lines(Tamil_3[,feat][order(cFreqT)],type='o',xaxt='n',col="blue")
  lines(Tamil_4[,feat][order(cFreqT)],type='o',xaxt='n',col="brown")
  lines(Tamil_5[,feat][order(cFreqT)],type='o',xaxt='n',col="darkorchid")
  lines(Tamil_6[,feat][order(cFreqT)],type='o',xaxt='n',col="darksalmon")
  axis(1,at=1:length(cNamesT),labels=names(sort(cFreqT)))
}
