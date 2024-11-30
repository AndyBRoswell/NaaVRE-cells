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
make_option(c("--w"), action="store", default=NA, type="integer", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
w = opt$w





library(dplyr)
param_a = '`'
print(w)
names <- c('Alice', 'Bob')



# capturing outputs
file <- file(paste0('/tmp/names_', id, '.json'))
writeLines(toJSON(names, auto_unbox=TRUE), file)
close(file)
