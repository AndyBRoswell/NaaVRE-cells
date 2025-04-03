setwd('/app')
library(optparse)
library(jsonlite)



print('option_list')
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

print("Retrieving diameteroffieldofview")
var = opt$diameteroffieldofview
print(var)
var_len = length(var)
print(paste("Variable diameteroffieldofview has length", var_len))

diameteroffieldofview = opt$diameteroffieldofview
print("Retrieving diameterofsedimentationchamber")
var = opt$diameterofsedimentationchamber
print(var)
var_len = length(var)
print(paste("Variable diameterofsedimentationchamber has length", var_len))

diameterofsedimentationchamber <- gsub("\"", "", opt$diameterofsedimentationchamber)
print("Retrieving dilutionfactor")
var = opt$dilutionfactor
print(var)
var_len = length(var)
print(paste("Variable dilutionfactor has length", var_len))

dilutionfactor = opt$dilutionfactor
print("Retrieving id")
var = opt$id
print(var)
var_len = length(var)
print(paste("Variable id has length", var_len))

id <- gsub("\"", "", opt$id)
print("Retrieving numberofcountedfields")
var = opt$numberofcountedfields
print(var)
var_len = length(var)
print(paste("Variable numberofcountedfields has length", var_len))

numberofcountedfields = opt$numberofcountedfields
print("Retrieving numberoftransects")
var = opt$numberoftransects
print(var)
var_len = length(var)
print(paste("Variable numberoftransects has length", var_len))

numberoftransects = opt$numberoftransects
print("Retrieving param_biovolume")
var = opt$param_biovolume
print(var)
var_len = length(var)
print(paste("Variable param_biovolume has length", var_len))

param_biovolume = opt$param_biovolume
print("Retrieving param_cellcarboncontent")
var = opt$param_cellcarboncontent
print(var)
var_len = length(var)
print(paste("Variable param_cellcarboncontent has length", var_len))

param_cellcarboncontent = opt$param_cellcarboncontent
print("Retrieving param_CountingStrategy")
var = opt$param_CountingStrategy
print(var)
var_len = length(var)
print(paste("Variable param_CountingStrategy has length", var_len))

param_CountingStrategy <- gsub("\"", "", opt$param_CountingStrategy)
print("Retrieving param_density")
var = opt$param_density
print(var)
var_len = length(var)
print(paste("Variable param_density has length", var_len))

param_density = opt$param_density
print("Retrieving param_surfacearea")
var = opt$param_surfacearea
print(var)
var_len = length(var)
print(paste("Variable param_surfacearea has length", var_len))

param_surfacearea = opt$param_surfacearea
print("Retrieving param_surfacevolumeratio")
var = opt$param_surfacevolumeratio
print(var)
var_len = length(var)
print(paste("Variable param_surfacevolumeratio has length", var_len))

param_surfacevolumeratio = opt$param_surfacevolumeratio
print("Retrieving param_totalbiovolume")
var = opt$param_totalbiovolume
print(var)
var_len = length(var)
print(paste("Variable param_totalbiovolume has length", var_len))

param_totalbiovolume = opt$param_totalbiovolume
print("Retrieving param_totalcarboncontent")
var = opt$param_totalcarboncontent
print(var)
var_len = length(var)
print(paste("Variable param_totalcarboncontent has length", var_len))

param_totalcarboncontent = opt$param_totalcarboncontent
print("Retrieving settlingvolume")
var = opt$settlingvolume
print(var)
var_len = length(var)
print(paste("Variable settlingvolume has length", var_len))

settlingvolume = opt$settlingvolume
print("Retrieving transectcounting")
var = opt$transectcounting
print(var)
var_len = length(var)
print(paste("Variable transectcounting has length", var_len))

transectcounting = opt$transectcounting


print("Running the cell")

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
