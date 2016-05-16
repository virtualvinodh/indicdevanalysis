## Perhaps get the actual value from the pogram to get a better graph
stroke_changes = c(35,30,55,25,25,30)
parameters = c("Length","Time","Curvature")
scripts = c("Tamil","Tamil","Tamil","Kannada","Kannada","Kannada")

overall_factor_num = data.frame(diff=stroke_changes,parameters=parameters,scripts=scripts)

overall_bar <- ggplot(data=overall_factor_num, aes(y=diff, x=parameters))
overall_bar <- overall_bar + geom_bar(stat="identity",position = "identity")
overall_bar <- overall_bar + facet_grid(~scripts, scales = "free_x", space="free") 
overall_bar <- overall_bar + theme(axis.title = element_text(size=rel(2.5)))
overall_bar <- overall_bar + theme(axis.text = element_text(size=rel(2.5)))
overall_bar <- overall_bar + theme(strip.text = element_text(size=rel(2.5)))
overall_bar <- overall_bar + labs(x="Factors",y= "% Strokes Influenced")
print(overall_bar)

## Showin the increase and decrease
stroke_changes = c(0.17*0.55,-0.17*0.45,0.2*.55,-0.2*.45,0.3*.45,0.3*-.55,0.25*.45,0.25*-0.55,0.55*0.5,0.55*-0.5,0.3*0.45,-0.3*0.45)
parameters = c("Length+","Length-","Time+","Time-","Curvature+","Curvature-")
scripts = c("Tamil","Tamil","Tamil","Tamil","Tamil","Tamil","Kannada","Kannada","Kannada","Kannada","Kannada","Kannada")

overall_factor_num = data.frame(diff=stroke_changes,parameters=parameters,scripts=scripts)

overall_bar <- ggplot(data=overall_factor_num, aes(y=diff, x=parameters))
overall_bar <- overall_bar + geom_bar(stat="identity",position = "identity")
overall_bar <- overall_bar + facet_grid(~scripts, scales = "free_x", space="free") 
#print(overall_bar)
