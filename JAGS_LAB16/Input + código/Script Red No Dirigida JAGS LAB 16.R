*Hecho con gusto por Juan Antonio Gonzalez Sierra (DCEA-UAEH)
*Materia: Complejidad Económica

*Laboratorio Análisis de redes en R - Indicadores básicos globales


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

Cargar data
EL = read.csv("https://raw.githubusercontent.com/PABalland/ON/master/lesmis-el.csv")

*Ver encabezado
head(EL)

*Transformar a una matriz
MM <- get.matrix(EL)
 
*Matriz smetrica, red no dirigida

library(igraph)

g <- graph_from_data_frame(d=EL, directed = F)
g

plot(g)

EL$Weight = NULL
head (EL)

library(networkD3)
simpleNetwork((EL))
