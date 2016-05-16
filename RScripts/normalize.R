scripts = c("Grantha","Devanagari","Kannada","Tamil")

for(s in scripts)
{
  for(i in 1:6)
  {
    assign(paste(s,'c',i,sep="_"),row.names(get(paste(s,i,sep='_'))))  
  }  
  for(i in 2:6)
  {
    assign(paste(s,'c','miss',i,sep="_"),
           setdiff(get(paste(s,'c',1,sep="_")),get(paste(s,'c',i,sep="_"))))  
  }
}

# Grantha
Grantha_2['TTHA',] = Grantha_1['TTHA',] 
Grantha_3['TTHA',] = Grantha_2['TTHA',] 

Grantha_4['TTA',] = Grantha_3['TTA',]
Grantha_4['TTHA',] = Grantha_3['TTHA',]
Grantha_4['YA',] = Grantha_3['YA',]

for(c in Grantha_c_miss_5)
{
  Grantha_5[c,] = Grantha_4[c,] 
}

for(c in Grantha_c_miss_6)
{
  Grantha_6[c,] = Grantha_5[c,] 
}

# Kannada
Kannada_4['TTHA',] = Kannada_3['TTHA',]

for(c in Kannada_c_miss_5)
{
  Kannada_5[c,] = Kannada_4[c,] 
}

for(c in Kannada_c_miss_6)
{
  Kannada_6[c,] = Kannada_5[c,] 
}

# Devanagari
Devanagari_3['DDHA',] = Devanagari_2['DDHA',]
Devanagari_4['DDHA',] = Devanagari_3['DDHA',]

for(c in Devanagari_c_miss_5)
{
  Devanagari_5[c,] = Devanagari_4[c,] 
}

for(c in Devanagari_c_miss_6)
{
  Devanagari_6[c,] = Devanagari_5[c,] 
}

# Tamil

for(c in Tamil_c_miss_4)
{
  Tamil_4[c,] = Tamil_3[c,] 
}

for(c in Tamil_c_miss_5)
{
  Tamil_5[c,] = Tamil_4[c,] 
}

for(c in Tamil_c_miss_6)
{
  Tamil_6[c,] = Tamil_5[c,] 
}

### Vector Fields - Add Average and Total

vectorF = c("strokeLengths","majorLengths","strokeAngles","disjointAngles")

for(s in scripts)
{
  for(i in 1:6)
  {
     sn = get(paste(s,i,sep="_"))
     for(f in vectorF)
     {
       sn[,paste(f,"Mean",sep="")] = sapply(sapply(sn[,f],vectorize),meanNull)
       sn[,paste(f,"Sum",sep="")] = sapply(sapply(sn[,f],vectorize),sum)
     }
     assign(paste(s,i,sep="_"),sn)
  }
}


