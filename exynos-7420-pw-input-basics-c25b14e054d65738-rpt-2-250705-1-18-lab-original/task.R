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
basic <- list(
  "this" = list(
    "title" = "Exynos 7420 Power Curves",
    "author" = "Andy",
    "date" = "2024-12"
  ),
  "src" = list(
    "page_title" = "CPU Power Consumption",
    "title" = "The Samsung Exynos 7420 Deep Dive - Inside A Modern 14nm SoC",
    "author" = "Andrei Frumusanu",
    "date" = "2015-06-29 6:00 EST",
    "site" = "AnandTech",
    "URL" = "https://www.anandtech.com/show/9330/exynos-7420-deep-dive/5"
  )
)
# capturing outputs
print('Serialization of basic')
file <- file(paste0('/tmp/basic_', id, '.json'))
writeLines(toJSON(basic, auto_unbox=TRUE), file)
close(file)
