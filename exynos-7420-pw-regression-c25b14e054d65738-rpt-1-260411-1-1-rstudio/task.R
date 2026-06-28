setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("foreach", quietly = TRUE)) {
	install.packages("foreach", repos="http://cran.us.r-project.org")
}
library(foreach)


option_list = list(

make_option(c("--core_config"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--dat"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

core_config = fromJSON(opt$core_config)
dat = fromJSON(opt$dat)
id <- gsub('"', '', opt$id)





library(foreach)
core_configs <- c("1 core", "2 cores", "3 cores", "4 cores")
model <- list()
for (core_config in core_configs) {
  pos <- length(model) + 1
  model[[pos]] <- summary(lm(dat[['A53']][[core_config]] ~ dat[['A53']][['freq']]))
  model[[pos + 1]] <- summary(lm(dat[['A57']][[core_config]] ~ dat[['A57']][['freq']]))
}
print(model)



