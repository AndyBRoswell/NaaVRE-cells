setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("jsonlite", quietly = TRUE)) {
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
}
library(jsonlite)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)
if (!requireNamespace("foreach", quietly = TRUE)) {
	install.packages("foreach", repos="http://cran.us.r-project.org")
}
library(foreach)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)





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
file <- file(paste0('/tmp/basic_', id, '.json'))
writeLines(toJSON(basic, auto_unbox=TRUE), file)
close(file)
