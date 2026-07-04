setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)


option_list = list(

make_option(c("--a_list"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

a_list = fromJSON(opt$a_list)
id <- gsub('"', '', opt$id)






b_list = c()
for (elem in a_list) {
    b_list[[length(b_list) + 1]] = elem + 32
}



# capturing outputs
file <- file(paste0('/tmp/b_list_', id, '.json'))
writeLines(toJSON(b_list, auto_unbox=TRUE), file)
close(file)
