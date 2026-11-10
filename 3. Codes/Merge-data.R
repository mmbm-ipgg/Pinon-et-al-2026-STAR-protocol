#-----#Comparison number of pixels Low and high WSS regions

#Chemin d'acces
path <- rstudioapi::getActiveDocumentContext()$path
Encoding(path) <- "UTF-8"
setwd(dirname(path))

#Packages
library(ggplot2)
library(scales)
library(cowplot)
library(MASS)
library(plyr)
library(sm)
library(beeswarm)
library(ggsignif)
library(wesanderson)
library(ggpubr)
library(rstatix)


#Creer une liste avec tous les fichiers .txt exportes par ImageJ
#file_list <- as.vector(t(read.table("FileList.txt", header=F, sep="\n")));
file_list = list.files(pattern = ".*.txt")

for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.table(file, header=TRUE, sep="\t")
    index <- match(file, file_list)
    index_1 = 0
    dataset$Replica_number=index_1
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    index <- match(file, file_list)
    index_1 = index_1+1
    temp_dataset$Replica_number=index_1
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
}

#Merging
dataset = dataset[-which(dataset$Replica_number==0), ]
dataset$Replica_number <- NULL

#Saving
write.table(
  dataset, 
  file = paste0("results_tumor_", dataset$Tumor[1], "_", dataset$Drug[1], ".txt"), 
  append = FALSE, 
  sep = "\t", 
  row.names = FALSE, 
  col.names = TRUE, 
  quote = FALSE
)
