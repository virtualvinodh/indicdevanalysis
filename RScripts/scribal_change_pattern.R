

par_t_k = getDiff("Kannada",8,FALSE,FALSE) ## Original stroke time (t0)
par_d_k = getDiff("Kannada",2,FALSE,FALSE)
par_s_k = getDiff("Kannada",5,FALSE,FALSE)
par_e_k = getDiff("Kannada",6,FALSE,FALSE)
par_td_k = getDiff("Kannada",7,FALSE,FALSE) ## Difference in angle delta-theta


para_c_k = data.frame(t0 = par_t_k$diff, D = par_d_k$diff, Ts = par_s_k$diff, Te = par_e_k$diff, Td =par_td_k$diff,  char = par_s_k$lab,
                      script = par_s_k$Script)

gpd_k <- ggparcoord(data = para_c_k,columns = c(1:5),scale="center",groupColumn = 6,order=c(1,2,3,4,5))
#print(gpd_k)

par_t_t = getDiff("Tamil",8,FALSE,FALSE)
par_d_t = getDiff("Tamil",2,FALSE,FALSE)
par_s_t = getDiff("Tamil",5,FALSE,FALSE)
par_e_t = getDiff("Tamil",6,FALSE,FALSE)
par_td_t = getDiff("Tamil",7,FALSE,FALSE)

para_c_t = data.frame(t0 = par_t_t$diff, D = par_d_t$diff, Ts = par_s_t$diff, Te = par_e_t$diff,  Td =par_td_t$diff, char = par_s_t$lab,
                      script = par_s_t$Script)

gpd_t <- ggparcoord(data = para_c_t,columns = c(1:5),scale="center",groupColumn = 6,order=c(1,2,3,4,5))
#print(gpd_t)

para_c = rbind(para_c_k,para_c_t)

gpd <- ggparcoord(data = para_c,columns = c(1,2,3,4,5),scale="center",groupColumn = 7)
print(gpd)

library(rgl) 
para_c["col"] = c(rep(1,254),rep(2,328-254))
#plot3d(para_c$t0,para_c$D,para_c$Td,col = para_c$col,xlab="Stroke Time",ylab="Distance",
#       zlab="Curvature Angle")

plot_var_t <- ggplot(para_c, aes(y=para_c$D,x=para_c$Td))
plot_var_t <- plot_var_t + geom_point(aes(colour = script))
plot_var_t <- plot_var_t + labs(x="Curvature Angle",y="Length")
plot_var_t <- plot_var_t + geom_point(aes(colour = script))
plot_var_t <- plot_var_t + theme(axis.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + scale_color_discrete(name="Script")
print(plot_var_t)

plot_var_t <- ggplot(para_c, aes(y=para_c$t0,x=para_c$D))
plot_var_t <- plot_var_t + geom_point(aes(colour = script))
plot_var_t <- plot_var_t + labs(x="Length",y="Stroke Time")
plot_var_t <- plot_var_t + geom_point(aes(colour = script))
plot_var_t <- plot_var_t + theme(axis.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + scale_color_discrete(name="Script")
print(plot_var_t)

plot_var_t <- ggplot(para_c, aes(y=para_c$t0,x=para_c$Td))
plot_var_t <- plot_var_t + geom_point(aes(colour = script))
plot_var_t <- plot_var_t + theme(axis.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.title = element_text(size=rel(2)))

plot_var_t <- plot_var_t + scale_color_discrete(name="Script")
plot_var_t <- plot_var_t + labs(x="Cuvature Angle",y="Stroke Time")

print(plot_var_t)

### Do regression as well if possible ###
