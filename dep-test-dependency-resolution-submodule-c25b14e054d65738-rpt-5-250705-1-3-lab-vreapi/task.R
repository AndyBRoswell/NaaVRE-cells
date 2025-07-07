setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)





library(ggplot2)

x_values = c(1, 2, 3, 4, 5)
y_values = c(2, 4, 6, 8, 10)



# capturing outputs
file <- file(paste0('/tmp/x_values_', id, '.json'))
writeLines(toJSON(x_values, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/y_values_', id, '.json'))
writeLines(toJSON(y_values, auto_unbox=TRUE), file)
close(file)
