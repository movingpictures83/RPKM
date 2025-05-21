# BOXPLOTS

#projectPath = "/Users/stebliankin/Desktop/GWI_2022/experiment_runs/03-25-2022-bwt2_ABR/"
#setwd(projectPath)
library(ggpubr)
library(gplots)
library(viridis)
library(hrbrthemes)
library(ggsci)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
source("RIO.R")

##### Stacked Bar Plot ABR ########

input <- function(inputfile) {
   parameters <<- readParameters(inputfile);
   assay <<- read.table(paste(prefix(), parameters["csvfile", 2], sep="/"), header = TRUE, sep=',');

# Color blind friedndly colors: https://www.datanovia.com/en/blog/ggplot-colors-best-tricks-you-will-love/
#cbp1 <- c("#999999", "#E69F00", "#56B4E9", "#009E73",
#          "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
levels_updated<<- readSequential(paste(prefix(), parameters["levels", 2], sep="/"));
}

run <- function() {

}

output <- function(outputfile) {
gplot<-ggplot(assay, aes(fill=factor(ABR, levels=levels_updated), y=RPKM, x=Group)) + scale_fill_brewer(palette = "Paired") +
  geom_bar(position="stack", stat="identity") 
gplot
ggsave(outputfile, plot=gplot, device = "png", dpi = 700)
write.csv(assay$RPKN, paste(outputfile, "csv", sep="."))
}


