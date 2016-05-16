# Tamil Letter Frequency Data

options(digits=1)

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

Tamil_1f = Tamil_1
Tamil_1f['freq'] = cFreqT

Tamil_2f = Tamil_2
Tamil_2f['freq'] = cFreqT

Tamil_3f = Tamil_3
Tamil_3f['freq'] = cFreqT

Tamil_4f = Tamil_4
Tamil_4f['freq'] = cFreqT

Tamil_5f = Tamil_5
Tamil_5f['freq'] = cFreqT

Tamil_6f = Tamil_6
Tamil_6f['freq'] = cFreqT

print("Geometric Features correlated with Frequency of letters")
cat("Tamil 1\n")
print(cor(Tamil_1f[c(geo,'freq')])[,'freq'])
cat("Tamil 2\n")
print(cor(Tamil_2f[c(geo,'freq')])[,'freq'])
cat("Tamil 3\n")
print(cor(Tamil_3f[c(geo,'freq')])[,'freq'])
cat("Tamil 4\n")
print(cor(Tamil_4f[c(geo,'freq')])[,'freq'])
cat("Tamil 5\n")
print(cor(Tamil_5f[c(geo,'freq')])[,'freq'])
cat("Tamil 6\n")
print(cor(Tamil_6f[c(geo,'freq')])[,'freq'])

print("Production Features correlated with Frequency of letters")
cat("Tamil 1\n")
print(cor(Tamil_1f[c(prod,'freq')])[,'freq'])
cat("Tamil 2\n")
print(cor(Tamil_2f[c(prod,'freq')])[,'freq'])
cat("Tamil 3\n")
print(cor(Tamil_3f[c(prod,'freq')])[,'freq'])
cat("Tamil 4\n")
print(cor(Tamil_4f[c(prod,'freq')])[,'freq'])
cat("Tamil 5\n")
print(cor(Tamil_5f[c(prod,'freq')])[,'freq'])
cat("Tamil 6\n")
print(cor(Tamil_6f[c(prod,'freq')])[,'freq'])

# Grantha

freqG = read.csv("/users/vinodhrajan/desktop/research_data/syllablesSyll.csv",h=F)

Grantha_1f = Grantha_1[1:39,]
Grantha_1f['freq'] = freqG[,2]

Grantha_2f = Grantha_2[1:39,]
Grantha_2f['freq'] = freqG[,2]

Grantha_3f = Grantha_3[1:39,]
Grantha_3f['freq'] = freqG[,2]

Grantha_4f = Grantha_4[1:39,]
Grantha_4f['freq'] = freqG[,2]

Grantha_5f = Grantha_5[1:39,]
Grantha_5f['freq'] = freqG[,2]

Grantha_6f = Grantha_6[1:39,]
Grantha_6f['freq'] = freqG[,2]

print("Geometric Features correlated with Frequency of letters")
cat("Grantha 1\n")
print(cor(Grantha_1f[c(geo,'freq')])[,'freq'])
cat("Grantha 2\n")
print(cor(Grantha_2f[c(geo,'freq')])[,'freq'])
cat("Grantha 3\n")
print(cor(Grantha_3f[c(geo,'freq')])[,'freq'])
cat("Grantha 4\n")
print(cor(Grantha_4f[c(geo,'freq')])[,'freq'])
cat("Grantha 5\n")
print(cor(Grantha_5f[c(geo,'freq')])[,'freq'])
cat("Grantha 6\n")
print(cor(Grantha_6f[c(geo,'freq')])[,'freq'])

print("Production Features correlated with Frequency of letters")
cat("Grantha 1\n")
print(cor(Grantha_1f[c(prod,'freq')])[,'freq'])
cat("Grantha 2\n")
print(cor(Grantha_2f[c(prod,'freq')])[,'freq'])
cat("Grantha 3\n")
print(cor(Grantha_3f[c(prod,'freq')])[,'freq'])
cat("Grantha 4\n")
print(cor(Grantha_4f[c(prod,'freq')])[,'freq'])
cat("Grantha 5\n")
print(cor(Grantha_5f[c(prod,'freq')])[,'freq'])
cat("Grantha 6\n")
print(cor(Grantha_6f[c(prod,'freq')])[,'freq'])


Grantha_26 = rbind(Grantha_2f,Grantha_3f,Grantha_4f,Grantha_5f,Grantha_6f)
Tamil_26 = rbind(Tamil_2f,Tamil_3f,Tamil_4f,Tamil_5f,Tamil_6f)
Script_26 = rbind(Grantha_26,Tamil_26)

print("Grantha Overall Prod")
print(cor(Grantha_26[c(prod,'freq')])[,'freq'])
print("Grantha Overall Geo")
print(cor(Grantha_26[c(geo,'freq')])[,'freq'])
print("Tamil Overall Prod")
print(cor(Tamil_26[c(prod,'freq')])[,'freq'])
print("Tamil Overall Geo")
print(cor(Tamil_26[c(geo,'freq')])[,'freq'])
