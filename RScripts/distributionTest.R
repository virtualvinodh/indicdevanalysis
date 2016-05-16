## http://www.graphpad.com/guides/prism/6/statistics/index.htm?stat_choosing_between_the_mann-whit.htm
## http://www.ohio.edu/plantbio/staff/mccarthy/quantmet/lectures/Nonparm.pdf

significant <- function(p)
{
  if(p < 0.5)
    return("Diff")
  else
    return("Same")
}

for(f in fAll)
{
  cat("\n")
  cat(f)
  cat(" :\n\n")
  
  for(s in scripts)
  {
    cat("\t")
    if(s=="Tamil")
    {
      cat(s)
      cat("\t")
    }
    else
      cat(s)
    cat(" :")
    cat("\t1-2 : ")
    sig = paste("cat(significant(ks.test(",s,"_1[,'",f,"'],",s,"_2[,'",f,"'])$p.value))",sep="")
    eval(parse(text=sig))
    cat("\t2-3:   ")
    sig = paste("cat(significant(ks.test(",s,"_2[,'",f,"'],",s,"_3[,'",f,"'])$p.value))",sep="")
    eval(parse(text=sig))
    cat("\t3-4:   ")
    sig = paste("cat(significant(ks.test(",s,"_3[,'",f,"'],",s,"_4[,'",f,"'])$p.value))",sep="")
    eval(parse(text=sig))
    cat("\t4-5:   ")
    sig = paste("cat(significant(ks.test(",s,"_4[,'",f,"'],",s,"_5[,'",f,"'])$p.value))",sep="")
    eval(parse(text=sig))
    cat("\t5-6:   ")
    sig = paste("cat(significant(ks.test(",s,"_5[,'",f,"'],",s,"_6[,'",f,"'])$p.value))",sep="")
    eval(parse(text=sig))
    cat("\n")
  }
}