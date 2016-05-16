print('Tamil Stroke Lengths')

######
par_d_t = getDiff("Tamil",1,TRUE,FALSE) #
par_d_k = getDiff("Kannada",1,TRUE,FALSE) #
######

## The percentage of Stroke change is lower because we ignore stroke augmentations
## These only explain the strokes changes that were originally present in the character
#

plot_var_t <- ggplot(par_d_t, aes(y=diff,x=seq(1,length(diff))))
plot_var_t <- plot_var_t + facet_grid(~lab, scales = "free_x", space="free") 
#plot_var_t <- plot_var_t + geom_bar(stat="identity",position = "identity")
plot_var_t <- plot_var_t + geom_point()
plot_var_t <- plot_var_t + labs(x="Strokes",y="Difference")
plot_var_t <- plot_var_t + theme(axis.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.ticks=element_blank(),axis.text.x=element_blank())
plot_var_t <- plot_var_t + geom_hline(yintercept = 0)
print(plot_var_t)

plot_var_t <- ggplot(par_d_k, aes(y=diff,x=seq(1,length(diff))))
plot_var_t <- plot_var_t + facet_grid(~lab, scales = "free_x", space="free") 
#plot_var_t <- plot_var_t + geom_bar(stat="identity",position = "identity")
plot_var_t <- plot_var_t + geom_point()
#plot_var_t <- plot_var_t + geom_point(aes(colour = lab))
plot_var_t <- plot_var_t + labs(x="Strokes",y="Difference")
plot_var_t <- plot_var_t + theme(axis.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(axis.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.text = element_text(size=rel(2)))
plot_var_t <- plot_var_t + theme(legend.title = element_text(size=rel(2)))
plot_var_t <- plot_var_t + geom_hline(yintercept = 0)

plot_var_t <- plot_var_t + theme(axis.ticks=element_blank(),axis.text.x=element_blank())
#plot_var_t <- plot_var_t + guides(col = guide_legend(title="Character"))
print(plot_var_t)

par_d = rbind(par_d_k,par_d_t)

plot_var_t <- ggplot(par_d, aes(y=diff,x=seq(1,length(diff))))
plot_var_t <- plot_var_t + geom_point(aes(colour = Script))
#print(plot_var_t)

#####################



