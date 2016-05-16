Tamil_1MDS = read.csv("/users/vinodhrajan/dropbox/Similarities_Corrected_Static/Grantha_1Grantha_1TrueFalseSim.csv1",h=T,row.names=1,na.strings="N/A")
Tamil_1MDS = Tamil_1MDS[,1:nrow(Tamil_1MDS)]

Tamil_1MDS = cmdscale(Tamil_1MDS)

Tamil_1M = Grantha_1
Tamil_1M['MDS1'] = Tamil_1MDS[,1]
Tamil_1M['MDS2'] = Tamil_1MDS[,2]
print(cor(Tamil_1M[c(geo,'MDS1','MDS2')]))

#Tamil_1MDS = read.csv("/users/vinodhrajan/dropbox/Similarities_Corrected_Static/Grantha_2Grantha_2TrueFalseSim.csv1",h=T,row.names=1,na.strings="N/A")
#Tamil_1MDS = Tamil_1MDS[,1:nrow(Tamil_1MDS)]

#Tamil_1MDS = cmdscale(Tamil_1MDS)

#Tamil_1M = Grantha_2
#Tamil_1M['MDS1'] = Tamil_1MDS[,1]
#Tamil_1M['MDS2'] = Tamil_1MDS[,2]
#print(cor(Tamil_1M[c(geo,'MDS1','MDS2')]))