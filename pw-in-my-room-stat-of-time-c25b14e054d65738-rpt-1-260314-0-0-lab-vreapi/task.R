setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--t_s"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
t_s = fromJSON(opt$t_s)





seconds_to_hms <- function(seconds) {
  sprintf("%d:%02d:%02d", as.integer(seconds %/% 3600), as.integer((seconds %% 3600) %/% 60), as.integer(seconds %% 60))
}
print(paste0('duration of run: ', seconds_to_hms(t_s[[length(t_s)]])))
delta_t_s <- diff(t_s)
print(paste0('avg sample interval (s): ', mean(delta_t_s)))
print(paste0('med sample interval (s): ', median(delta_t_s)))
print(paste0('min sample interval (s): ', min(delta_t_s)))
print(paste0('max sample interval (s): ', max(delta_t_s)))



