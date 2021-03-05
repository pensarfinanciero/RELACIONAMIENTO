####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio González Sierra (DCEA - UAEH)

# Laboratorio - MAPA DE CALOR -TÉRMICO- with pheatmap
# DATOS GENETICOS TOMADOS DE Sahir Bhatnagar.
# PRACTICA DE CODERS

# Objetivo: Realizar un heatmap con datos geneticos 
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos y dataframes adicionales
# 2. Realizar varios heatmaps

#Un mapa de calor es una representación gráfica de datos que utiliza un sistema de 
#codificación de colores para representar diferentes valores


#Heatmaps with pheatmap 
#Simulated data created by Sahir Bhatnagar.

#possible data pre-processing - normalization - quantile, median, etc., log transform
#not necessary here - we have log fold change data that has already been normalized

#Calculating your distance matrix (see dist objects):
#compute how similar or different you values are
#parametric - distance measures based on Pearson correlation 
#non parametric - spearman rank - replace by ranks and calculate correlation, Kendall's - relative ordering
#euclidean - shortest distance between values (has to be normalized), takes magnitude into account
#city block/Manhattan - sum of distances along each dimension
#distance 1-correlation - of all pairs of items to be clustered

#Cluster your samples (see hclust objects):
#hierarchical, organizes into a tree structure based on similarity - short branches if similar and longer branches as similarity decreases
#repeated cycles where the 2 closest remaining items (smallest distance) get joined by a branch with the length of the branch reflecting the distance between them, the distance between this item and all other remaining items are computed until only one object remains
#single linkage clustering - distance between 2 items is the minimum of all pairwise distances between items contained in x and y - fast b/c no other calculations need to be performed once you have your distance matrix
#complete linkage is the maximum of all paiwise distances between x and y 
#average linkage - mean of all pairwise distances between items contained in x and y
#k-means organize into clusters (self-chosen number) - items are randomly assigned to a cluster - the mean vector fo rall items in each hcluster is computed, items are reassigned to the cluster whose center is closest to them - random starting points so will not always get the same answer, number of trial done to deal with the randomness
#self organizing maps



#install.packages("pheatmap")
library(pheatmap)

# importar datos
file.choose()
genes <- as.matrix(
  read.csv("/cloud/project/heatmap_data.csv",
           sep = "," ,
           header = T,
           row.names = 1))

annotation_col <- read.csv("/cloud/project/annotation_col.csv",
           header = T,
           row.names = 1)


annotation_row <- read.csv("/cloud/project/annotation_row.csv",
                           header = T,
                           row.names = 1)

#Plotting with pheatmap!
pheatmap(genes)

#change font
pheatmap(genes, fontsize = 6)


#default is clustering rows and columns 



#cluster by gene - groups of similar genes----LOS GENES ESTAN EN LOS RENGLONES (clusteo por default pero lo podemos quitar tanto en pacientes como genes)
#POR DEFAULT CLUSTEA LOS RENGLONES
pheatmap(genes, fontsize = 6, cluster_rows = T, cluster_cols = F)


#cluster by patient - groups of similar patients 
#DEBES HACER QUE LAS COLUMNAS SE TRANFOMEN A RENGLONES
pheatmap(genes, fontsize = 6, cluster_rows = F, cluster_cols = T)

#usually order by both
pheatmap(genes, fontsize = 6, cluster_rows = T, cluster_cols = T)

#seeing some patterns emerge - but what do they mean? Great time to add annotation to our plot
pheatmap(genes, fontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row)


#add to row first, see that genes are clustering according to the pathways they belong to
pheatmap(genes, fontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col)

#now have information about the drug and condition 

#GRAFICO COMPLETO G1
pheatmap(genes, fontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética")

#GRAFICO QUITANDO CLUSTERS (ARBOLES DE AGRUPACIÓN-DENDOGRAMAS)


#take a smaller subset submatriz
sub <- genes [c(1:5, 55:60), c(1:5, 20:35, 55:60)]

#con subset 1 (COPIAR G1)
pheatmap(sub, fontsize = 6, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética")

# con subset 2 -- DESPLEGAR VALORES
pheatmap(sub, fontsize = 8, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética", annotation_legend = FALSE, display_numbers = TRUE, fontsize_number = 6)

# Instalas viridis, magma, plasma, cividis, inferno
install.packages("viridis")
library(viridis)

# con color
pheatmap(sub, fontsize = 8, cluster_rows = T, cluster_cols = T, annotation_row = annotation_row, annotation_col = annotation_col, treeheight_row = 0, treeheight_col = 0, main = "Expresión Genética", annotation_legend = FALSE, display_numbers = TRUE, fontsize_number = 6, col = viridis_pal(option = "magma") (6))


# elementos adicionales 
Distancias entre los elementos
dist(sub)

Correlación pacientes
pheatmap(cor(sub))

Correlación genes
trans <- t(sub)
pheatmap(cor(trans))

#####################################################################################################################

## slightly artificial with color bar, without and with ordering:
cc <- rainbow(nrow(Ca))
heatmap(Ca, Rowv = FALSE, symm = TRUE, RowSideColors = cc, ColSideColors = cc,
        margins = c(6,6))
heatmap(Ca,		symm = TRUE, RowSideColors = cc, ColSideColors = cc,
        margins = c(6,6))
