## Run Lines 9 - 20 in multi-variate.R before running this.

## Geometric

parcoord(rbind(GG1,GG2,GG3,GG4,GG5,GG6),
         col=c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
         var.label=TRUE,main="Grantha")

parcoord(rbind(DG1,DG2,DG3,DG4,DG5,DG6),
         col=c(rep(1,38),rep(2,38),rep(3,38),rep(4,38),rep(5,38),rep(6,38)),
         var.label=TRUE,main="Devanagari")

parcoord(rbind(KG1,KG2,KG3,KG4,KG5,KG6),
         col=c(rep(1,39),rep(2,39),rep(3,39),rep(4,39),rep(5,39),rep(6,39)),
         var.label=TRUE,main="Kannada")

parcoord(rbind(TG1,TG2,TG3,TG4,TG5,TG6),
         col=c(rep(1,21),rep(2,21),rep(3,21),rep(4,21),rep(5,21),rep(6,21)),
         var.label=TRUE,main="Tamil")

parcoord(rbind(rbind(GG1,GG2,GG3,GG4,GG5,GG6),
         rbind(DG1,DG2,DG3,DG4,DG5,DG6),
         rbind(KG1,KG2,KG3,KG4,KG5,KG6),
         rbind(TG1,TG2,TG3,TG4,TG5,TG6)),
         col=c(c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
         c(rep(7,38),rep(8,38),rep(9,38),rep(10,38),rep(11,38),rep(12,38)),
         c(rep(13,39),rep(14,39),rep(15,39),rep(16,39),rep(17,39),rep(18,39)),
         c(rep(19,21),rep(20,21),rep(21,21),rep(22,21),rep(23,21),rep(24,21))),
         var.label=TRUE,main="All")

## Production

parcoord(rbind(GP1,GP2,GP3,GP4,GP5,GP6),
         col=c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
         var.label=TRUE,main="Grantha")

parcoord(rbind(DP1,DP2,DP3,DP4,DP5,DP6),
         col=c(rep(1,38),rep(2,38),rep(3,38),rep(4,38),rep(5,38),rep(6,38)),
         var.label=TRUE,main="Devanagari")

parcoord(rbind(KP1,KP2,KP3,KP4,KP5,KP6),
         col=c(rep(1,39),rep(2,39),rep(3,39),rep(4,39),rep(5,39),rep(6,39)),
         var.label=TRUE,main="Kannada")

parcoord(rbind(TP1,TP2,TP3,TP4,TP5,TP6),
         col=c(rep(1,21),rep(2,21),rep(3,21),rep(4,21),rep(5,21),rep(6,21)),
         var.label=TRUE,main="Tamil")

parcoord(rbind(rbind(GP1,GP2,GP3,GP4,GP5,GP6),
               rbind(DP1,DP2,DP3,DP4,DP5,DP6),
               rbind(KP1,KP2,KP3,KP4,KP5,KP6),
               rbind(TP1,TP2,TP3,TP4,TP5,TP6)),
         col=c(c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
               c(rep(7,38),rep(8,38),rep(9,38),rep(10,38),rep(11,38),rep(12,38)),
               c(rep(13,39),rep(14,39),rep(15,39),rep(16,39),rep(17,39),rep(18,39)),
               c(rep(19,21),rep(20,21),rep(21,21),rep(22,21),rep(23,21),rep(24,21))),
         var.label=TRUE,main="All")

## All

parcoord(rbind(GA1,GA2,GA3,GA4,GA5,GA6),
         col=c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
         var.label=TRUE,main="Grantha")

parcoord(rbind(DA1,DA2,DA3,DA4,DA5,DA6),
         col=c(rep(1,38),rep(2,38),rep(3,38),rep(4,38),rep(5,38),rep(6,38)),
         var.label=TRUE,main="Kannada")

parcoord(rbind(KA1,KA2,KA3,KA4,KA5,KA6),
         col=c(rep(1,39),rep(2,39),rep(3,39),rep(4,39),rep(5,39),rep(6,39)),
         var.label=TRUE,main="Kannada")

parcoord(rbind(TA1,TA2,TA3,TA4,TA5,TA6),
         col=c(rep(1,21),rep(2,21),rep(3,21),rep(4,21),rep(5,21),rep(6,21)),
         var.label=TRUE,main="Tamil")

parcoord(rbind(rbind(GA1,GA2,GA3,GA4,GA5,GA6),
               rbind(DA1,DA2,DA3,DA4,DA5,DA6),
               rbind(KA1,KA2,KA3,KA4,KA5,KA6),
               rbind(TA1,TA2,TA3,TA4,TA5,TA6)),
         col=c(c(rep(1,40),rep(2,40),rep(3,40),rep(4,40),rep(5,40),rep(6,40)),
               c(rep(7,38),rep(8,38),rep(9,38),rep(10,38),rep(11,38),rep(12,38)),
               c(rep(13,39),rep(14,39),rep(15,39),rep(16,39),rep(17,39),rep(18,39)),
               c(rep(19,21),rep(20,21),rep(21,21),rep(22,21),rep(23,21),rep(24,21))),
         var.label=TRUE,main="All")