setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("dplyr", quietly = TRUE)) {
	install.packages("dplyr", repos="http://cran.us.r-project.org")
}
library(dplyr)
if (!requireNamespace("readr", quietly = TRUE)) {
	install.packages("readr", repos="http://cran.us.r-project.org")
}
library(readr)
if (!requireNamespace("stringr", quietly = TRUE)) {
	install.packages("stringr", repos="http://cran.us.r-project.org")
}
library(stringr)


print('option_list')
option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")
)


opt = parse_args(OptionParser(option_list=option_list))

var_serialization <- function(var){
    if (is.null(var)){
        print("Variable is null")
        exit(1)
    }
    tryCatch(
        {
            var <- fromJSON(var)
            print("Variable deserialized")
            return(var)
        },
        error=function(e) {
            print("Error while deserializing the variable")
            print(var)
            var <- gsub("'", '"', var)
            var <- fromJSON(var)
            print("Variable deserialized")
            return(var)
        },
        warning=function(w) {
            print("Warning while deserializing the variable")
            var <- gsub("'", '"', var)
            var <- fromJSON(var)
            print("Variable deserialized")
            return(var)
        }
    )
}

print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)


print("Running the cell")
w <- 0
x <- 1
y <- 2
z <- 3
param_p <- 'abc'
# capturing outputs
print('Serialization of w')
file <- file(paste0('/tmp/w_', id, '.json'))
writeLines(toJSON(w, auto_unbox=TRUE), file)
close(file)
print('Serialization of x')
file <- file(paste0('/tmp/x_', id, '.json'))
writeLines(toJSON(x, auto_unbox=TRUE), file)
close(file)
print('Serialization of y')
file <- file(paste0('/tmp/y_', id, '.json'))
writeLines(toJSON(y, auto_unbox=TRUE), file)
close(file)
