####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio Gonz�lez Sierra (DCEA - UAEH)
Materia: Complejidad Econ�mica

# Laboratorio - Gesti�n de datos de red - curadur�a de datos

# Objetivo: Explorar la organizaci�n de los datos
# ------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar nuestra matriz hipot�tica de datos
# 2. Transformar la matriz en un dataframe
# 3. Conventir un dataframe en matriz


########################################
# LABORATORIO: Gesti�n de datos de red #
########################################


# Gesti�n de datos de red
# 1. Transformar la matriz en un dataframe

library (EconGeo)

M = as.matrix(
  read.csv("https://raw.githubusercontent.com/PABalland/ON/master/amz.csv" , 
           sep = ",", 
           header = T, 
           row.names = 1))

Visualizar Matriz de VCR
M

#ejemplo de una matriz de RCA con personas y productos/ paises y productos-industrias
Explica lo que es la VCR y entender la matriz
?RCA


Vamos a transformar la matriz de datos en un DATAFRAME
El es exlist

EL = get.list (M)
colnames (EL) = c("customer" , "Product", "Count")


# La forma m�s usual de encontrar los datos
EL


MM = get.matrix(EL)
# convertir un dataframe(lista) en matriz
MM



# edge list (lista de aristas(source-target----adyacentes-mis 3 columnas)
EL

# Matriz de adyancencia
get.matrix(EL)

#Buscar Andrea (con filtro en la matriz EL)
x = subset (EL, Product =="Tie")
x

Hice la prueba con los libros, a la nueva tabla la titule como "y"
y = subset (EL, Product =="Book")
y
