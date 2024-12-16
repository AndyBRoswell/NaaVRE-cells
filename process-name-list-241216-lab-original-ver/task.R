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

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--names"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_p"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--x"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--y"), action="store", default=NA, type="character", help="my description")
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
print("Retrieving names")
var = opt$names
print(var)
var_len = length(var)
print(paste("Variable names has length", var_len))

names = opt$names
print("Retrieving param_p")
var = opt$param_p
print(var)
var_len = length(var)
print(paste("Variable param_p has length", var_len))

param_p = opt$param_p
print("Retrieving x")
var = opt$x
print(var)
var_len = length(var)
print(paste("Variable x has length", var_len))

x = opt$x
print("Retrieving y")
var = opt$y
print(var)
var_len = length(var)
print(paste("Variable y has length", var_len))

y = opt$y


print("Running the cell")
library(readr)
library(stringr)
for (name in names) {
  print(paste0('Hello, ', name))
}
t <- x + y
print(Sys.getenv())
print(param_p)
# capturing outputs
print('Serialization of t')
file <- file(paste0('/tmp/t_', id, '.json'))
writeLines(toJSON(t, auto_unbox=TRUE), file)
close(file)
