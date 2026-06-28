setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--t_s"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--V"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
t_s = fromJSON(opt$t_s)
V = fromJSON(opt$V)





for (i in 1:length(V)) {
  l <- list(t_s[[i]], V[[i]])
  print(paste0('<t', i, ', s', i, '> ', l[[1]], ' s, ', l[[2]], ' V'))
}



