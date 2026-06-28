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

make_option(c("--freq"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

freq = fromJSON(opt$freq)
id <- gsub('"', '', opt$id)





library(scales)
Phon <- seq(from = 0, to = 140, by = 5)
breaks <- list(x=breaks_log(n=length(freq)), y=seq(0, 150, by=10))



# capturing outputs
file <- file(paste0('/tmp/Phon_', id, '.json'))
writeLines(toJSON(Phon, auto_unbox=TRUE), file)
close(file)
file <- file(paste0('/tmp/breaks_', id, '.json'))
writeLines(toJSON(breaks, auto_unbox=TRUE), file)
close(file)
