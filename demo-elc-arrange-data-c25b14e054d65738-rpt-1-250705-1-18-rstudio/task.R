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

make_option(c("--dat"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

dat = fromJSON(opt$dat)
id <- gsub('"', '', opt$id)





index_by_numeric_key <- function(S, k) { return(S[[as.character(k)]]) }
freq <- dat[['freq']]
alpha_f_ <- setNames(dat[['alpha_f']], freq)
alpha_f <- function(freq) { return(index_by_numeric_key(alpha_f_, freq)) }
L_U_ <- setNames(dat[['L_U']], freq)
L_U <- function(freq) { return(index_by_numeric_key(L_U_, freq)) }
T_f_ <- setNames(dat[['T_f']], freq)
T_f <- function(freq) { return(index_by_numeric_key(T_f_, freq)) }



