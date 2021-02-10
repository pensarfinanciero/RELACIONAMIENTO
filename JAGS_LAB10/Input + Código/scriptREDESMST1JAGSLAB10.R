####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio Gonz�lez Sierra (DCEA-UAEH)
Materia: Complejidad Econ�mica
# T1_04_REDES COMPLEJAS(1) - Visión de redes complejas - parte 1

# Objetivo: Estimar el Maximum Spanning Tree -árbol de expansión máxima- (asegurar una visión clara del espacio-producto)
# Red troncal: Estructura general de la red: vamos a poder v. redes complejas

# Regla 1: mantener n-1 conexiones como máximo
# Regla 2: Quitar las conexiones con el peso más bajo, nos vamos quedar con las del peso máximo (menos conexiones)
# Regla 3: No crear nodos aislados
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Usar un matriz hipotetica de datos
# 2. Graficar sus próximos adyacentes


##################################################################
# practica 3: Visión clara del espacio-producto: CASO HIPOTÉTICO #
##################################################################

# 1)la visualización del espacio - producto sea una red conectada: evitar islas de productos aislados. 
# 2)PROBLEMA: tratar de visualizar demasiados enlaces puede crear una complejidad visual innecesaria 
# donde se obstruirán las conexiones más relevantes.
#calculamos el árbol de expansión máxima (MST) de la matriz de proximidad. 
# MST es el conjunto de enlaces que conecta todos los nodos de la red utilizando un número mínimo de conexiones
# y la suma máxima posible de proximidades. 
#Calculamos el MST usando el algoritmo de Kruskal: Básicamente, el algoritmo clasifica los valores de la matriz
# de proximidad en orden descendente y luego incluye enlaces en el MST si y solo si conectan un producto aislado. 
#Por definición, el MST incluye todos los productos, pero el número de enlaces es el mínimo posible.
#Después de seleccionar los enlaces utilizando los criterios mencionados anteriormente, 
# construimos una visualización utilizando un algoritmo de diseño dirigido por la fuerza. 

M <- matrix(runif(200*200, min=0, max=100), ncol=200)
diag(M) <- 0
head(M[,1:6])
dim(M)
#crear una matriz aleatoria de 200*200


install.packages("igraph")

library (igraph)


g <- graph.adjacency(M, mode = "undirected" , weighted = TRUE)
plot (g)
#grafica la matriz



M <- -M
head (M[,1:6])
#Transforma la matriz en en NEGATIVA y para identificar los máximos


g <- graph.adjacency(M, mode="undirected" , weighted = TRUE)
MST <- minimum.spanning.tree(g)
plot (MST, vertex.shapes="none", vertex.label.cex=.7)
#grafica nueva con matriz negativa, ver el espacio-producto, tecnológico 


A <- get.adjacency(MST, sparse = F)
# matriz de adyacencias (nuevo relacionamiento)
# ver las aristas que hay entre los nodos


head(A)
#VER LAS ARISTAS(PESOS)

write.graph(MST,file="g.gml", format="gml")
#nodos n-1

write.csv(A, file="Adyacentes.csv")
#exportar resultados para cytoscape o gephi