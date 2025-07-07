setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
	install.packages("ggplot2", repos="http://cran.us.r-project.org")
}
library(ggplot2)


option_list = list(

make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--x"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--x_values"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--y"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--y_values"), action="store", default=NA, type="character", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

id <- gsub('"', '', opt$id)
x = opt$x
x_values = fromJSON(opt$x_values)
y = opt$y
y_values = fromJSON(opt$y_values)





data <- data.frame(x=x_values, y=y_values)
ggplot(data, aes(x = x, y = y)) +
  geom_line() +
  geom_point() + # Optional: add points to the line
  labs(title = "Line Graph of Y vs X", x = "X Values", y = "Y Values")



