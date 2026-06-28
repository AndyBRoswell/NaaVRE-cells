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
make_option(c("--t_ms"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
t_ms = fromJSON(opt$t_ms)





t_s <- sapply(t_ms, function(t) { return(t / 1000) })



# capturing outputs
file <- file(paste0('/tmp/t_s_', id, '.json'))
writeLines(toJSON(t_s, auto_unbox=TRUE), file)
close(file)
