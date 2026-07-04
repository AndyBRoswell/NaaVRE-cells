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
t_s <- sapply(t_ms, function(t) { return(t / 1000) })
# capturing outputs
print('Serialization of t_s')
file <- file(paste0('/tmp/t_s_', id, '.json'))
writeLines(toJSON(t_s, auto_unbox=TRUE), file)
close(file)
