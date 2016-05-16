scriptNJ = read.csv("/users/vinodhrajan/dropbox/Script_Data_full/scriptStrokeNJ",head=T)

par(mfrow=c(1,1))

plot(scriptNJ[,'Grantha'],type='o',ylim=c(00,70),col="red",xlab="Scipt Stage",ylab="Disjoint Stroke Count",
    )
lines(scriptNJ[,'Devanagari'],type='o',col="darkgreen")
lines(scriptNJ[,'Kannada'],type='o',col="blue")
lines(scriptNJ[,'Tamil'],type='o',col="black")

legend('topright',c('Grantha','Devanagari','Kannada','Tamil'),lty=1,
       col=c('red','darkgreen','blue','black'),bty='n',cex=0.75)

script = read.csv("/users/vinodhrajan/dropbox/Script_Data_full/scriptStroke",head=T)

par(mfrow=c(1,1))

plot(script[,'Grantha'],type='o',ylim=c(00,70),col="red",xlab="Scipt Stage",ylab="Primitive Stroke Count")
lines(script[,'Devanagari'],type='o',col="darkgreen")
lines(script[,'Kannada'],type='o',col="blue")
lines(script[,'Tamil'],type='o',col="black")

legend('topright',c('Grantha','Devanagari','Kannada','Tamil'),lty=1,
       col=c('red','darkgreen','blue','black'),bty='n',cex=0.75)