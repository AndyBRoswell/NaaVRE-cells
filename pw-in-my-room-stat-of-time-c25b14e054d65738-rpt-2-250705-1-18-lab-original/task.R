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
make_option(c("--t_s"), action="store", default=NA, type="character", help="my description")
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



print("Running the cell")
seconds_to_hms <- function(seconds) {
  sprintf("%d:%02d:%02d", as.integer(seconds %/% 3600), as.integer((seconds %% 3600) %/% 60), as.integer(seconds %% 60))
}
print(paste0('duration of run: ', seconds_to_hms(t_s[[length(t_s)]])))
delta_t_s <- diff(t_s)
print(paste0('avg sample interval (s): ', mean(delta_t_s)))
print(paste0('med sample interval (s): ', median(delta_t_s)))
print(paste0('min sample interval (s): ', min(delta_t_s)))
print(paste0('max sample interval (s): ', max(delta_t_s)))
