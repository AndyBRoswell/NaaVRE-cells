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
make_option(c("--param_date"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_loc"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--t_ms"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
t_ms = fromJSON(opt$t_ms)

param_date = opt$param_date
param_loc = opt$param_loc




print(paste0('location: ', param_loc))
print(paste0('date: ', param_date))
print(paste0('samples: ', length(t_ms)))



