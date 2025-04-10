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
serialized_JSON <- '
{
  "A53": {
    "freq": [ 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500 ],
    "1 core": [ 0.035, 0.046, 0.066, 0.089, 0.116, 0.123, 0.142, 0.182, 0.235, 0.277, 0.322, 0.367 ],
    "2 cores": [ 0.066, 0.078, 0.103, 0.140, 0.166, 0.212, 0.249, 0.319, 0.389, 0.451, 0.531, 0.606 ],
    "3 cores": [ 0.068, 0.097, 0.129, 0.165, 0.209, 0.273, 0.326, 0.415, 0.490, 0.597, 0.707, 0.863 ],
    "4 cores": [ 0.104, 0.132, 0.172, 0.225, 0.270, 0.340, 0.391, 0.491, 0.606, 0.699, 0.859, 1.026 ]
  },
  "A57": {
    "freq": [ 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100 ],
    "1 core": [ 0.26, 0.30, 0.33, 0.38, 0.46, 0.52, 0.62, 0.66, 0.78, 0.87, 1.05, 1.24, 1.48, 1.62 ],
    "2 cores": [ 0.45, 0.52, 0.61, 0.72, 0.83, 0.98, 1.17, 1.31, 1.55, 1.69, 1.90, 2.28, 2.63, 2.97 ],
    "3 cores": [ 0.68, 0.75, 0.90, 1.03, 1.26, 1.40, 1.67, 1.85, 2.12, 2.33, 2.77, 3.25, 3.69, 4.19 ],
    "4 cores": [ 0.843, 0.969, 1.153, 1.330, 1.590, 1.793, 1.964, 2.254, 2.621, 3.089, 3.641, 4.111, 4.781, 5.481 ]
  }
}
'
dat <- jsonlite::fromJSON(serialized_JSON)
# capturing outputs
print('Serialization of dat')
file <- file(paste0('/tmp/dat_', id, '.json'))
writeLines(toJSON(dat, auto_unbox=TRUE), file)
close(file)
