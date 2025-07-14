setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("readr", quietly = TRUE)) {
	install.packages("readr", repos="http://cran.us.r-project.org")
}
library(readr)
if (!requireNamespace("scales", quietly = TRUE)) {
	install.packages("scales", repos="http://cran.us.r-project.org")
}
library(scales)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("tidyr", quietly = TRUE)) {
	install.packages("tidyr", repos="http://cran.us.r-project.org")
}
library(tidyr)
if (!requireNamespace("stringr", quietly = TRUE)) {
	install.packages("stringr", repos="http://cran.us.r-project.org")
}
library(stringr)


option_list = list(

make_option(c("--examples"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--freq"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--max_dB"), action="store", default=NA, type="numeric", help="my description"), 
make_option(c("--min_dB"), action="store", default=NA, type="numeric", help="my description"), 
make_option(c("--param_digits"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_seed"), action="store", default=NA, type="integer", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

examples = opt$examples
freq = fromJSON(opt$freq)
id <- gsub('"', '', opt$id)
max_dB = opt$max_dB
min_dB = opt$min_dB

param_digits = opt$param_digits
param_seed = opt$param_seed




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



