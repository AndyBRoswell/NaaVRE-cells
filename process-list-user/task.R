setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("dplyr", quietly = TRUE)) {
	install.packages("dplyr", repos="http://cran.us.r-project.org")
}
library(dplyr)
if (!requireNamespace("stringr", quietly = TRUE)) {
	install.packages("stringr", repos="http://cran.us.r-project.org")
}
library(stringr)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--names"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_p"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
names = fromJSON(opt$names)

param_p = opt$param_p




library(stringr)
for (name in names) {
  print(paste0('Hello, ', name))
}
x <- 1
print(param_p)

print(stringr::str_interp('p = ${param_p}'))



# capturing outputs
file <- file(paste0('/tmp/x_', id, '.json'))
writeLines(toJSON(x, auto_unbox=TRUE), file)
close(file)
