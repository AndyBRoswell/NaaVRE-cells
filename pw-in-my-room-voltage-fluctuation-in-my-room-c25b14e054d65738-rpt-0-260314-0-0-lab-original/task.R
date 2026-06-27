setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)


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
param_loc <- 'my home in Guangzhou'
param_date <- '2015-07-27'
V <- c(
  227.4, 225.2, 226.8, 224.3, 226.4,
  228.2, 229.5, 227.7, 226.1, 224.9,
  223.8, 225.5, 224.7, 226.3, 225.8,
  227.0, 225.5, 224.8, 223.9, 224.0,
  224.2, 226.5, 225.4, 225.9, 226.1
)
t_ms <- c(
  7736, 23475, 42865, 60725, 71670,
  82597, 97533, 117407, 127786, 145281,
  163265, 183213, 198228, 215035, 226516,
  238519, 251346, 270956, 282424, 302031,
  318219, 334929, 348604, 361086, 371988
)
# capturing outputs
print('Serialization of V')
file <- file(paste0('/tmp/V_', id, '.json'))
writeLines(toJSON(V, auto_unbox=TRUE), file)
close(file)
print('Serialization of t_ms')
file <- file(paste0('/tmp/t_ms_', id, '.json'))
writeLines(toJSON(t_ms, auto_unbox=TRUE), file)
close(file)
