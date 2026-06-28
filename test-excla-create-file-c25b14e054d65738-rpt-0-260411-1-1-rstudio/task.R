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



conf_data_folder <- file.path('/tmp', 'data')


conf_data_folder <- file.path('/tmp', 'data')
L = 'a\nb\nc\n'
file_path = file.path(conf_data_folder, 'hello.txt')
fp <- file(file_path, 'w')
writeLines(L, fp)
close(fp)



# capturing outputs
file <- file(paste0('/tmp/file_path_', id, '.json'))
writeLines(toJSON(file_path, auto_unbox=TRUE), file)
close(file)
