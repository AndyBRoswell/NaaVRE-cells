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

make_option(c("--breaks"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--freq"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--Loudness"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--Phon"), action="store", default=NA, type="character", help="my description")
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

print("Retrieving breaks")
var = opt$breaks
print(var)
var_len = length(var)
print(paste("Variable breaks has length", var_len))

print("------------------------Running var_serialization for breaks-----------------------")
print(opt$breaks)
breaks = var_serialization(opt$breaks)
print("---------------------------------------------------------------------------------")

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
print("Retrieving Loudness")
var = opt$Loudness
print(var)
var_len = length(var)
print(paste("Variable Loudness has length", var_len))

print("------------------------Running var_serialization for Loudness-----------------------")
print(opt$Loudness)
Loudness = var_serialization(opt$Loudness)
print("---------------------------------------------------------------------------------")

print("Retrieving Phon")
var = opt$Phon
print(var)
var_len = length(var)
print(paste("Variable Phon has length", var_len))

print("------------------------Running var_serialization for Phon-----------------------")
print(opt$Phon)
Phon = var_serialization(opt$Phon)
print("---------------------------------------------------------------------------------")



print("Running the cell")
library(ggplot2)
library(tidyr)

L_f <- function(L_N, alpha_f, L_U, T_f) {
  return(10 / alpha_f * log10(4e-10 ^ (0.3 - alpha_f) * (10 ^ (0.03 * L_N) - 10 ^ 0.072) + 10 ^ (alpha_f * (T_f + L_U) / 10)) - L_U)
}

results <- data.frame(freq = freq)

for (p in Phon) {
  results[[as.character(p)]] <- sapply(freq, function(f) L_f(p, alpha_f(f), L_U(f), T_f(f)))
}

reshaped_results <- as.list(results)

results_long <- pivot_longer(results, cols = -freq, names_to = "Phon", values_to = "Loudness")

results_long[['Phon']] <- factor(results_long[['Phon']], levels=as.character(Phon))

chart <- ggplot(results_long, aes(x = `freq`, y = `Loudness`, color = `Phon`)) +
  geom_line() +
  scale_x_log10(breaks=breaks[['x']]) +
  scale_y_continuous(breaks=breaks[['y']])
  labs(title = "Equal Loudness Curves (ISO 226:2023)", x = "Frequency (Hz)", y = "Loudness Level (dB)", color = "Phon") +
  theme_minimal()
print(chart)
