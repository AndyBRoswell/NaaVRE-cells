setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)






a_list = c('a', 'b', 'c', 'd')



# capturing outputs
file <- file(paste0('/tmp/a_list_', id, '.json'))
writeLines(toJSON(a_list, auto_unbox=TRUE), file)
close(file)
