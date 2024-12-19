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






param_density = 1

if (param_density == 1) {
    param_CountingStrategy = 'density0'
}

diameterofsedimentationchamber = 'diameterofsedimentationchamber'



# capturing outputs
file <- file(paste0('/tmp/diameterofsedimentationchamber_', id, '.json'))
writeLines(toJSON(diameterofsedimentationchamber, auto_unbox=TRUE), file)
close(file)
