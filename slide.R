# install_github('ramnathv/slidify', ref = github_pull(425)) 
# for the stringr 0.6 version issue

library(devtools)

library(slidify)
library(knitr)

# author("Pitch")

slidify('index.Rmd')

browseURL('index.html')


publish(title = 'Food Safety Courseara', 'index.html', host = 'rpubs')

pkgs <- c("slidify", "slidifyLibraries", "rCharts")
devtools::install_github(pkgs, "ramnathv", ref = "dev")
