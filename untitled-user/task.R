setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("knitr", quietly = TRUE)) {
	install.packages("knitr", repos="http://cran.us.r-project.org")
}
library(knitr)
if (!requireNamespace("magrittr", quietly = TRUE)) {
	install.packages("magrittr", repos="http://cran.us.r-project.org")
}
library(magrittr)
if (!requireNamespace("remotes", quietly = TRUE)) {
	install.packages("remotes", repos="http://cran.us.r-project.org")
}
library(remotes)
if (!requireNamespace("parsermd", quietly = TRUE)) {
	install.packages("parsermd", repos="http://cran.us.r-project.org")
}
library(parsermd)
if (!requireNamespace("dplyr", quietly = TRUE)) {
	install.packages("dplyr", repos="http://cran.us.r-project.org")
}
library(dplyr)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)





knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(magrittr)



