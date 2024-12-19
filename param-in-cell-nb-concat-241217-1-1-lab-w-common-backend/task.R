setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)


option_list = list(

make_option(c("--b_list"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

b_list = fromJSON(opt$b_list)
id <- gsub('"', '', opt$id)






res = ''
for (elem in b_list) {
    res = paste0(res, elem)
}



