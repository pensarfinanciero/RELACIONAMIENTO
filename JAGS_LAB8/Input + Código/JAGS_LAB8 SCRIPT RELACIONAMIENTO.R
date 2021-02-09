####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio Gonzalez Sierra (DCEA - UAEH)
# LABORATORIO - RELACIONAMIENTO "CASO HIPOT�TICO" 

# Objetivo: Estimar el relacionamiento (relatedness, proximidad, métrica de distancia entre productos)
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipotética de datos
# 2. Calcular co ocurrencias entre personas y productos 
# 3. Estimar el relacionamiento, teniendo como input las co ocurrencias
# 4. Graficar

#######################################
#LABORATORIO: Relacionamiento (r)     #
#######################################


library (EconGeo)

# 1.Cómo se mide la proximidad (relatedness) para crear el espacio producto
# Material: Balland, P.A. (2017) Economic Geography in R: Introduction to the EconGeo Package, Papers in Evolutionary Economic Geography, 17 (09): 1-75 
# Para instalar: https://www.paballand.com/install-r




M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))




co.occurrence(M)
# co-ocurrencia entre personas/paises/estados



c=co.occurrence(t(M))
# co-ocurrencia entre productos t es transpuesta
c



r= relatedness(c)
r
# estima el relacionamiento o proximidad pero normalizado, para asegurar que el numero de co ocurrencias que observamos
# es mayor al numero de co ocurrencias probables (probailidad condicional)
#tie and Surfboard puede que no esten tan relacionados, abajo de  1 no es relacionado mientras que mayor a 1 si es relacionado

function (mat, method = "prob")

r[r<1] = 0
r[r>1] = 1

library (igraph)

> g1 = graph_from_adjacency_matrix(r, mode = "undirected")
plot(g1)