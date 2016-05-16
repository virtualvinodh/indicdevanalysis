scriptPerplexity = read.csv("/users/vinodhrajan/dropbox/Script_Data_full/scriptPerp_old",head=T)

plot(scriptPerplexity[,'Grantha'],type='o',ylim=c(5.5,9.5),col="red",xlab="Script Stage",ylab="Perplexity")
lines(scriptPerplexity[,'Devanagari'],type='o',col="darkgreen")
lines(scriptPerplexity[,'Kannada'],type='o',col="blue")
lines(scriptPerplexity[,'Tamil'],type='o',col="black")

legend('topright',c('Grantha','Devanagari','Kannada','Tamil'),lty=1,
       col=c('red','darkgreen','blue','black'),bty='n',cex=0.75)