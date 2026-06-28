setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("foreach", quietly = TRUE)) {
	install.packages("foreach", repos="http://cran.us.r-project.org")
}
library(foreach)


option_list = list(

make_option(c("--basic"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

basic = fromJSON(opt$basic)
id <- gsub('"', '', opt$id)





print('This doc:')
print(basic[['this']])
print('Source:')
print(basic[['src']])



