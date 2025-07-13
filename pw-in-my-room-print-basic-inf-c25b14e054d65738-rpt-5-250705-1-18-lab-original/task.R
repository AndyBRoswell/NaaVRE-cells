setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)


print('option_list')
option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_date"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_loc"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--t_ms"), action="store", default=NA, type="character", help="my description")
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
print("Retrieving param_date")
var = opt$param_date
print(var)
var_len = length(var)
print(paste("Variable param_date has length", var_len))

param_date <- gsub("\"", "", opt$param_date)
print("Retrieving param_loc")
var = opt$param_loc
print(var)
var_len = length(var)
print(paste("Variable param_loc has length", var_len))

param_loc <- gsub("\"", "", opt$param_loc)
print("Retrieving t_ms")
var = opt$t_ms
print(var)
var_len = length(var)
print(paste("Variable t_ms has length", var_len))

print("------------------------Running var_serialization for t_ms-----------------------")
print(opt$t_ms)
t_ms = var_serialization(opt$t_ms)
print("---------------------------------------------------------------------------------")



print("Running the cell")
print(paste0('location: ', param_loc))
print(paste0('date: ', param_date))
print(paste0('samples: ', length(t_ms)))
