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





some_list = range(1, 5)

msg = '1'



# capturing outputs
file <- file(paste0('/tmp/msg_', id, '.json'))
writeLines(toJSON(msg, auto_unbox=TRUE), file)
close(file)
