setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("numpy as np", quietly = TRUE)) {
	install.packages("numpy as np", repos="http://cran.us.r-project.org")
}
library(numpy as np)


print('option_list')
option_list = list(

make_option(c("--a"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--b"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--c"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_h"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_i"), action="store", default=NA, type="numeric", help="my description"), 
make_option(c("--param_j"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_k"), action="store", default=NA, type="character", help="my description")
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

print("Retrieving a")
var = opt$a
print(var)
var_len = length(var)
print(paste("Variable a has length", var_len))

a = opt$a
print("Retrieving b")
var = opt$b
print(var)
var_len = length(var)
print(paste("Variable b has length", var_len))

b <- gsub("\"", "", opt$b)
print("Retrieving c")
var = opt$c
print(var)
var_len = length(var)
print(paste("Variable c has length", var_len))

c = opt$c
print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)
print("Retrieving param_h")
var = opt$param_h
print(var)
var_len = length(var)
print(paste("Variable param_h has length", var_len))

param_h = opt$param_h
print("Retrieving param_i")
var = opt$param_i
print(var)
var_len = length(var)
print(paste("Variable param_i has length", var_len))

param_i = opt$param_i
print("Retrieving param_j")
var = opt$param_j
print(var)
var_len = length(var)
print(paste("Variable param_j has length", var_len))

print("------------------------Running var_serialization for param_j-----------------------")
print(opt$param_j)
param_j = var_serialization(opt$param_j)
print("---------------------------------------------------------------------------------")

print("Retrieving param_k")
var = opt$param_k
print(var)
var_len = length(var)
print(paste("Variable param_k has length", var_len))

print("------------------------Running var_serialization for param_k-----------------------")
print(opt$param_k)
param_k = var_serialization(opt$param_k)
print("---------------------------------------------------------------------------------")


conf_l = 1

print("Running the cell")
conf_l = 1
print(param_string)
print(param_string_with_comment)
print(param_int)
print(param_float)
# capturing outputs
print('Serialization of e')
file <- file(paste0('/tmp/e_', id, '.json'))
writeLines(toJSON(e, auto_unbox=TRUE), file)
close(file)
print('Serialization of f')
file <- file(paste0('/tmp/f_', id, '.json'))
writeLines(toJSON(f, auto_unbox=TRUE), file)
close(file)
print('Serialization of g')
file <- file(paste0('/tmp/g_', id, '.json'))
writeLines(toJSON(g, auto_unbox=TRUE), file)
close(file)
