setwd('/app')

# retrieve input parameters

library(optparse)
library(jsonlite)


option_list = list(

make_option(c("--diameteroffieldofview"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--diameterofsedimentationchamber"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--dilutionfactor"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--id"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--numberofcountedfields"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--numberoftransects"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_biovolume"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_cellcarboncontent"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_CountingStrategy"), action="store", default=NA, type="character", help="my description"), 
make_option(c("--param_density"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_surfacearea"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_surfacevolumeratio"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_totalbiovolume"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--param_totalcarboncontent"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--settlingvolume"), action="store", default=NA, type="integer", help="my description"), 
make_option(c("--transectcounting"), action="store", default=NA, type="integer", help="my description")

)

# set input parameters accordingly
opt = parse_args(OptionParser(option_list=option_list))

diameteroffieldofview = opt$diameteroffieldofview
diameterofsedimentationchamber <- gsub('"', '', opt$diameterofsedimentationchamber)
dilutionfactor = opt$dilutionfactor
id <- gsub('"', '', opt$id)
numberofcountedfields = opt$numberofcountedfields
numberoftransects = opt$numberoftransects
param_biovolume = opt$param_biovolume
param_cellcarboncontent = opt$param_cellcarboncontent
param_surfacearea = opt$param_surfacearea
param_surfacevolumeratio = opt$param_surfacevolumeratio
param_totalbiovolume = opt$param_totalbiovolume
param_totalcarboncontent = opt$param_totalcarboncontent
settlingvolume = opt$settlingvolume
transectcounting = opt$transectcounting

param_CountingStrategy = opt$param_CountingStrategy
param_density = opt$param_density





print(param_biovolume)
param_totalbiovolume
param_surfacearea
param_surfacevolumeratio
param_cellcarboncontent
param_totalcarboncontent

print(diameterofsedimentationchamber)
diameterofsedimentationchamber
diameteroffieldofview
transectcounting
numberofcountedfields
numberoftransects
settlingvolume
dilutionfactor



