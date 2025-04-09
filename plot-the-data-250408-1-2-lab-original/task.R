setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)


print('option_list')
option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--x"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--x_values"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--y"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--y_values"), action="store", default=NA, type="character", help="my description")
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
print("Retrieving x")
var = opt$x
print(var)
var_len = length(var)
print(paste("Variable x has length", var_len))

print("------------------------Running var_serialization for x-----------------------")
print(opt$x)
x = var_serialization(opt$x)
print("---------------------------------------------------------------------------------")

print("Retrieving x_values")
var = opt$x_values
print(var)
var_len = length(var)
print(paste("Variable x_values has length", var_len))

print("------------------------Running var_serialization for x_values-----------------------")
print(opt$x_values)
x_values = var_serialization(opt$x_values)
print("---------------------------------------------------------------------------------")

print("Retrieving y")
var = opt$y
print(var)
var_len = length(var)
print(paste("Variable y has length", var_len))

print("------------------------Running var_serialization for y-----------------------")
print(opt$y)
y = var_serialization(opt$y)
print("---------------------------------------------------------------------------------")

print("Retrieving y_values")
var = opt$y_values
print(var)
var_len = length(var)
print(paste("Variable y_values has length", var_len))

print("------------------------Running var_serialization for y_values-----------------------")
print(opt$y_values)
y_values = var_serialization(opt$y_values)
print("---------------------------------------------------------------------------------")



print("Running the cell")
data <- data.frame(x=x_values, y=y_values)
ggplot(data, aes(x = x, y = y)) +
  geom_line() +
  geom_point() + # Optional: add points to the line
  labs(title = "Line Graph of Y vs X", x = "X Values", y = "Y Values")
