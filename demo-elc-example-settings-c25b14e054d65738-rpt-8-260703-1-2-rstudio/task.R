setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("readr", quietly = TRUE)) {
	install.packages("readr", repos="http://cran.us.r-project.org")
}
library(readr)
if (!requireNamespace("scales", quietly = TRUE)) {
	install.packages("scales", repos="http://cran.us.r-project.org")
}
library(scales)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("tidyr", quietly = TRUE)) {
	install.packages("tidyr", repos="http://cran.us.r-project.org")
}
library(tidyr)
if (!requireNamespace("stringr", quietly = TRUE)) {
	install.packages("stringr", repos="http://cran.us.r-project.org")
}
library(stringr)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)





param_seed <- 0
examples <- 10
min_dB <- 0
max_dB <- 150
param_digits <- 1



# capturing outputs
file <- file(paste0('/tmp/examples_', id, '.json'))
writeLines(toJSON(examples, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/min_dB_', id, '.json'))
writeLines(toJSON(min_dB, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/max_dB_', id, '.json'))
writeLines(toJSON(max_dB, auto_unbox=TRUE), file)
close(file)
