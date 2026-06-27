setwd('/app')
library(optparse)
library(jsonlite)



print('option_list')
option_list = list(

make_option(c("--a_list"), action="store", default=NA, type="character", help="my description"), 
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

print("Retrieving a_list")
var = opt$a_list
print(var)
var_len = length(var)
print(paste("Variable a_list has length", var_len))

print("------------------------Running var_serialization for a_list-----------------------")
print(opt$a_list)
a_list = var_serialization(opt$a_list)
print("---------------------------------------------------------------------------------")

print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)


print("Running the cell")

b_list = c()
for (elem in a_list) {
    b_list[[length(b_list) + 1]] = elem + 32
}
# capturing outputs
print('Serialization of b_list')
file <- file(paste0('/tmp/b_list_', id, '.json'))
writeLines(toJSON(b_list, auto_unbox=TRUE), file)
close(file)
