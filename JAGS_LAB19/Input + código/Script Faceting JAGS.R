####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Juan Antonio Gnzález Sierra (DCEA - UAEH)


# LABORATORIO - Gráficos en R con ggplot2 
# faceting (romper un gráfica en varias dentro de una cuadrícula)



#instalando paquete 
install.packages("ggplot2")


# cargar libreria ggplot2 
library(ggplot2)


#buscar df
file.choose("/cloud/project/PARA FACETING.csv")

# leer base
Densidad_verde <- read.csv("/cloud/project/PARA FACETING.csv")

#ver nombres
names(Densidad_verde)

# colocando grafica base
p <- ggplot(data = Densidad_verde,
            mapping = aes(x = DENSITY,
                          y = PCI.2018,
                          color = Region)) +
  geom_point()

# crear objeto p
p

# facet_wrap (recomendado con una variable)
p + facet_wrap(~ Region)

# manipulando número de filas
p + facet_wrap(~ Region, nrow = 3)

# manipulando número de columnas
p + facet_wrap(~ Region, ncol = 5)
