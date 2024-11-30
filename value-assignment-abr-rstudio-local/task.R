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

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)





w <- 0
x <- 1
y <- 2
z <- 3
param_p <- 'abc'



# capturing outputs
file <- file(paste0('/tmp/w_', id, '.json'))
writeLines(toJSON(w, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/x_', id, '.json'))
writeLines(toJSON(x, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/y_', id, '.json'))
writeLines(toJSON(y, auto_unbox=TRUE), file)
close(file)
