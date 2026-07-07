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
make_option(c("--t_ms"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--V"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
t_ms = fromJSON(opt$t_ms)
V = fromJSON(opt$V)





library(jsonlite)
print(jsonlite::toJSON(list('V'=V, 't (ms)'=t_ms)))



