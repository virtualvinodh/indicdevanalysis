f = "size"

fMG = meanFeat("Grantha",f)
fMD = meanFeat("Devanagari",f)
fMK = meanFeat("Kannada",f)
fMT = meanFeat("Tamil",f)
x=1:6

par(mfrow=c(1,1))
plot(rep(c(1:6),4),c(fMG,fMD,fMK,fMT))
logG = lm(fMG ~ log(x))
logD = lm(fMD ~ log(x))
logK = lm(fMK ~ log(x))
logT = lm(fMT ~ log(x))
lines(x,predict(logG),col="red")
lines(x,predict(logD),col="green")
lines(x,predict(logK),col="blue")
lines(x,predict(logT),col="black")

