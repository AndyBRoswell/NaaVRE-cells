setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("foreach", quietly = TRUE)) {
	install.packages("foreach", repos="http://cran.us.r-project.org")
}
library(foreach)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)


print('option_list')
option_list = list(

make_option(c("--core_config"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--dat"), action="store", default=NA, type="character", help="my description"), 
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

print("Retrieving core_config")
var = opt$core_config
print(var)
var_len = length(var)
print(paste("Variable core_config has length", var_len))

core_config <- gsub("\"", "", opt$core_config)
print("Retrieving dat")
var = opt$dat
print(var)
var_len = length(var)
print(paste("Variable dat has length", var_len))

print("------------------------Running var_serialization for dat-----------------------")
print(opt$dat)
dat = var_serialization(opt$dat)
print("---------------------------------------------------------------------------------")

print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)


print("Running the cell")
library(foreach)
core_configs <- c("1 core", "2 cores", "3 cores", "4 cores")
model <- list()
for (core_config in core_configs) {
  pos <- length(model) + 1
  model[[pos]] <- summary(lm(dat[['A53']][[core_config]] ~ dat[['A53']][['freq']]))
  model[[pos + 1]] <- summary(lm(dat[['A57']][[core_config]] ~ dat[['A57']][['freq']]))
}
print(model)
