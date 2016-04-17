
runApp(display.mode = "showcase")
deployApp(appName="APPNAME")

raw = read.csv('fda with urban.csv')

View(raw)
head(raw)
names(raw)

library(googleVis)
require(datasets)

state.abb = c(state.abb, 'DC')
state.name = c(state.name, 'Washington')

total = aggregate( X ~ State, raw[,c(1, 6, 13)], FUN = length)
total[,1] = state.name[match(total[,1], state.abb)]
colnames(total) = c("State", "Total")

count = aggregate( X ~ State+District.Decision, raw[,c(1, 6, 13)], FUN = length)
count[,1] = state.name[match(count[,1], state.abb)]
colnames(count) = c("State", "Decision", "Count")

ratio = count
ratio[,3] = ratio[,3]/total[match(ratio[,1], total[,1]),2]
colnames(ratio) = c("State", "Decision", "Ratio")

saveRDS(count, file='count.rds')

saveRDS(ratio, file='ratio.rds')

decision = 'NAI'

ak = gvisGeoChart(subset(count, District.Decision==decision),
                  locationvar = "State",  colorvar="Count",
                  options=list(region="US", 
                                 displayMode="regions", 
                                 resolution="provinces",
                                 width=600, height=400))
plot(ak)


library(rCharts)
library(plyr)

urban = aggregate( X ~ urban + District.Decision, raw, FUN = length) 
urban[,1] = revalue(as.factor(urban[,1]), c('0'='Rural', '1'='urban'))

saveRDS(urban, "urban.rds")

n1 <- nPlot(X ~ District.Decision, group = 'urban',
            type = 'multiBarChart', data = urban)


n1$save('fig/n1.html', cdn = TRUE)
cat('<iframe src="fig/n1.html" width=100%, height=400></iframe>')

library(ggplot2)
library(reshape2)
library(grid)
library(png)
library(manipulate)

geodata = raw[,c(13, 16, 17)]

img2 = readPNG("Blank2.png") 


g = ggplot(geodata, aes(x=longitude, y=latitude, color= District.Decision))
g =g+ annotation_custom(rasterGrob(img, width=unit(1,"npc"), height=unit(1,"npc")), 
                        -Inf,Inf,-Inf,Inf) +
  scale_x_continuous(expand=c(0.05, 0.05)) +
  scale_y_continuous(expand=c(0.05, 0.05))
g =g+ geom_point(alpha=0.5, shape=4) 
g




myplot = function(a, b, c, d){
g = ggplot(geodata[,], aes(x=longitude, y=latitude, color= District.Decision))
g =g+ annotation_custom(rasterGrob(img, width=unit(1,"npc"), height=unit(1,"npc")), 
                        -Inf,Inf,-Inf,Inf) +
  scale_x_continuous(expand=c(a, b)) +
  scale_y_continuous(expand=c(c, d))
g =g+ geom_point(alpha=0.5, shape=1) 
return(g)
}

manipulate(myplot(a, b, c, d), a= slider(0, 1.2), b= slider(0, 1.2), c= slider(0, 1.2), d= slider(0, 1.2))



