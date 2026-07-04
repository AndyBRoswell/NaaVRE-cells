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
make_option(c("--V"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
V = fromJSON(opt$V)





print('min max: ')
print(range(V))
print(paste0('avg: ', mean(V)))
print(paste0('med: ', median(V)))
print(paste0('\\sigma^2: ', var(V)))
print('quantile: ')
print(quantile(V))



