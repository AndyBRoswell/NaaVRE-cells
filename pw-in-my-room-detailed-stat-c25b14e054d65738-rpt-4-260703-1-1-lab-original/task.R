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
make_option(c("--t_s"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--V"), action="store", default=NA, type="character", help="my description")
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
print("Retrieving t_s")
var = opt$t_s
print(var)
var_len = length(var)
print(paste("Variable t_s has length", var_len))

print("------------------------Running var_serialization for t_s-----------------------")
print(opt$t_s)
t_s = var_serialization(opt$t_s)
print("---------------------------------------------------------------------------------")

print("Retrieving V")
var = opt$V
print(var)
var_len = length(var)
print(paste("Variable V has length", var_len))

print("------------------------Running var_serialization for V-----------------------")
print(opt$V)
V = var_serialization(opt$V)
print("---------------------------------------------------------------------------------")



print("Running the cell")
for (i in 1:length(V)) {
  l <- list(t_s[[i]], V[[i]])
  print(paste0('<t', i, ', s', i, '> ', l[[1]], ' s, ', l[[2]], ' V'))
}
