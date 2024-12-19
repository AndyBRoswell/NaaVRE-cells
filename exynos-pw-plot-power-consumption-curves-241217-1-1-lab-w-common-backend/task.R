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

make_option(c("--color"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--dat"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_annotation_off_x"), action="store", default=NA, type="integer", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

color = fromJSON(opt$color)
dat = fromJSON(opt$dat)
id <- gsub('"', '', opt$id)

param_annotation_off_x = opt$param_annotation_off_x




library(ggplot2)
p <- ggplot() +
  geom_line(aes(x = dat[['A53']][['freq']], y = dat[['A53']][['1 core']]), color = color[['1 core']]) +
  geom_line(aes(x = dat[['A53']][['freq']], y = dat[['A53']][['2 cores']]), color = color[['2 cores']]) +
  geom_line(aes(x = dat[['A53']][['freq']], y = dat[['A53']][['3 cores']]), color = color[['3 cores']]) +
  geom_line(aes(x = dat[['A53']][['freq']], y = dat[['A53']][['4 cores']]), color = color[['4 cores']]) +
  labs(
    title = "Exynos 7420 Power Consumption Curves (Cortex-A53)",
    x = "Frequency (MHz)", y = "Power Consumption (W)",
    color = "Active Cores"
  ) +
  theme_minimal() +
  annotate("text", x = 1500 + param_annotation_off_x, y = 0.367, label = "1 core", color = color[['1 core']]) +
  annotate("text", x = 1500 + param_annotation_off_x, y = 0.606, label = "2 cores", color = color[['2 cores']]) +
  annotate("text", x = 1500 + param_annotation_off_x, y = 0.863, label = "3 cores", color = color[['3 cores']]) +
  annotate("text", x = 1500 + param_annotation_off_x, y = 1.026, label = "4 cores", color = color[['4 cores']])
q <- ggplot() +
  geom_line(aes(x = dat[['A57']][['freq']], y = dat[['A57']][['1 core']]), color = color[['1 core']]) +
  geom_line(aes(x = dat[['A57']][['freq']], y = dat[['A57']][['2 cores']]), color = color[['2 cores']]) +
  geom_line(aes(x = dat[['A57']][['freq']], y = dat[['A57']][['3 cores']]), color = color[['3 cores']]) +
  geom_line(aes(x = dat[['A57']][['freq']], y = dat[['A57']][['4 cores']]), color = color[['4 cores']]) +
  labs(
    title = "Exynos 7420 Power Consumption Curves (Cortex-A57)",
    x = "Frequency (MHz)", y = "Power Consumption (W)",
    color = "Active Cores"
  ) +
  theme_minimal() +
  annotate("text", x = 2100 + param_annotation_off_x, y = 1.62, label = "1 core", color = color[['1 core']]) +
  annotate("text", x = 2100 + param_annotation_off_x, y = 2.97, label = "2 cores", color = color[['2 cores']]) +
  annotate("text", x = 2100 + param_annotation_off_x, y = 4.19, label = "3 cores", color = color[['3 cores']]) +
  annotate("text", x = 2100 + param_annotation_off_x, y = 5.481, label = "4 cores", color = color[['4 cores']])
print(p)
print(q)



