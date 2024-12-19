setwd('/app')
library(optparse)
library(jsonlite)

if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("readr", quietly = TRUE)) {
	install.packages("readr", repos="http://cran.us.r-project.org")
}
library(readr)
if (!requireNamespace("scales", quietly = TRUE)) {
	install.packages("scales", repos="http://cran.us.r-project.org")
}
library(scales)
if (!requireNamespace("stringr", quietly = TRUE)) {
	install.packages("stringr", repos="http://cran.us.r-project.org")
}
library(stringr)
if (!requireNamespace("tidyr", quietly = TRUE)) {
	install.packages("tidyr", repos="http://cran.us.r-project.org")
}
library(tidyr)


print('option_list')
option_list = list(

make_option(c("--examples"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--freq"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--max_dB"), action="store", default=NA, type="numeric", help="my description"), 
make_option(c("--min_dB"), action="store", default=NA, type="numeric", help="my description"), 
make_option(c("--param_digits"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_seed"), action="store", default=NA, type="integer", help="my description")
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

print("Retrieving examples")
var = opt$examples
print(var)
var_len = length(var)
print(paste("Variable examples has length", var_len))

examples = opt$examples
print("Retrieving freq")
var = opt$freq
print(var)
var_len = length(var)
print(paste("Variable freq has length", var_len))

print("------------------------Running var_serialization for freq-----------------------")
print(opt$freq)
freq = var_serialization(opt$freq)
print("---------------------------------------------------------------------------------")

print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)
print("Retrieving max_dB")
var = opt$max_dB
print(var)
var_len = length(var)
print(paste("Variable max_dB has length", var_len))

max_dB = opt$max_dB
print("Retrieving min_dB")
var = opt$min_dB
print(var)
var_len = length(var)
print(paste("Variable min_dB has length", var_len))

min_dB = opt$min_dB
print("Retrieving param_digits")
var = opt$param_digits
print(var)
var_len = length(var)
print(paste("Variable param_digits has length", var_len))

param_digits = opt$param_digits
print("Retrieving param_seed")
var = opt$param_seed
print(var)
var_len = length(var)
print(paste("Variable param_seed has length", var_len))

param_seed = opt$param_seed


print("Running the cell")
library(stringr)

L_N <- function(L_f, alpha_f, L_U, T_f) {
  return(100 / 3 * log10((10 ^ (alpha_f * (L_f + L_U) / 10) - 10 ^ (alpha_f * (T_f + L_U) / 10)) / (4e-10 ^ (0.3 - alpha_f)) + 10 ^ 0.072))
}

set.seed(param_seed)
sound <- cbind(
  sample(freq, size=examples, replace=TRUE),
  round(runif(examples, min=min_dB, max=max_dB), digits=param_digits)
)

for (row in 1:nrow(sound)) {
  f <- sound[row, 1]
  p <- sound[row, 2]
  idx <- which(freq == f)
  print(stringr::str_interp("A sound (${f} Hz, ${p} dB), is ${round(p + 40 - reshaped_results[['40']][[idx]], digits=param_digits)} dBA, ${round(p + 70 - reshaped_results[['70']][[idx]], digits=param_digits)} dBB, ${round(p + 100 - reshaped_results[['100']][[idx]], digits=param_digits)} dBC, and ${round(L_N(p, alpha_f(f), L_U(f), T_f(f)), digits=param_digits)} Phon."))
}
