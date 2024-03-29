####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio Gonz醠ez Sierra (DCEA-UAEH)
Materia: Complejidad Econ髆ica
##########################################################################################
# LABORATORIO 4: Visi贸n clara del espacio-producto: CASO REAL_exportaciones hidalguenses #
#########################################################################################

# Objetivo: Estimar el Maximum Spanning Tree -脕rbol de expansi贸n m谩xima- (asegurar una visi贸n clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder ver redes complejas

# Regla 1: mantener n-1 conexiones como m谩ximo
# Regla 2: Quitar las conexiones con el peso m谩s bajo, nos vamos quedar con las del peso m谩ximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------


# 1.C贸mo crear una Visi贸n clara del espacio-producto: 谩rbol de expansi贸n m谩xima (MST) 
# Paquete: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r

install.packages("visNetwork")
install.packages("htmlwidgets")
install.packages("igraph")
install.packages("reshape")
install.packages("Matrix")
install.packages("RSiena")
install.packages("networkD3")
install.packages("curl")
install.packages("devtools")
library(devtools)
devtools::install_github("PABalland/EconGeo", force = T)

library(EconGeo)
#cargar paquete


file.choose()
# ubicar archivo

M = as.matrix(
  read.csv("/cloud/project/relatednessbinario.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

head (M[,1:10])
dim (M)

#Importar matriz "relatednessbinario.csv"


install.packages("igraph")
library (igraph)

red_hidalgo1 <- graph.adjacency(M, mode="undirected" , weighted = TRUE)
plot(red_hidalgo1)
#grafica la matriz de proximidades natural



M <- -M
head (M[,1:6])
#Transforma la matriz en en NEGATIVA y para identificar los m谩ximos


red_hidalgo2 <- graph.adjacency(M, mode="undirected" , weighted = TRUE)
MST <- minimum.spanning.tree(red_hidalgo2)
plot (MST, vertex.shapes="none", vertex.label.cex=.7)
#grafica la nueva matriz negativa con MST




write.graph(MST,file="redhidalgo2.gml", format="gml")
#nodos n-1



A <- get.adjacency(MST, sparse = F)
# matriz de proximos adyacentes (nuevo relacionamiento)





#exportar LISTA DE EDGE

write.csv(A, file="AdyacentesesCorMST.csv")
#exportar matriz de proximos adyacentes