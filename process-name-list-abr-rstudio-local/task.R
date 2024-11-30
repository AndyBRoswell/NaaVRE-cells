setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("dplyr", quietly = TRUE)) {
	install.packages("dplyr", repos="http://cran.us.r-project.org")
}
library(dplyr)
if (!requireNamespace("stats", quietly = TRUE)) {
	install.packages("stats", repos="http://cran.us.r-project.org")
}
library(stats)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--names"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_p"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--x"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--y"), action="store", default=NA, type="integer", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
names = fromJSON(opt$names)
x = opt$x
y = opt$y

param_p = opt$param_p




for (name in names) {
  print(paste0('Hello, ', name))
}
t <- x + y
m <- stats::median(c(1, 2))
print(Sys.getenv())
print(param_p)



# capturing outputs
file <- file(paste0('/tmp/t_', id, '.json'))
writeLines(toJSON(t, auto_unbox=TRUE), file)
close(file)
