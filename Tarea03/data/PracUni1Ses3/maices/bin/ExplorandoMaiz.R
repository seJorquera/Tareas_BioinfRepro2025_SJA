## Samuel Jorquera Acevedo
## Este script entrega estadística descriptiva básica de "../meta/maizteocintle_SNP50k_meta_extended.txt"

#paquetes
library(dplyr)

#Limpiar data
rm(list=ls())

#Cargar data
data <- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")


##1. ¿Qué tipo de objeto creamos al cargar la base?

datatype <- class(data)
print(paste0("data type: ", datatype))


##2. ¿Cómo se ven las primeras 6 líneas del archivo?
print("Primeras 6 líneas:")
head(data, n=6L)

##3. ¿Cuántas muestras hay?

nrows <- nrow(data)
print(paste0("Numero de muestras: ", nrows))

##4. ¿De cuántos estados se tienen muestras?

#Transformar $estado a factor
data$Estado_factor <- as.factor(data$Estado)

#niveles
estados <- levels(data$Estado_factor)

print(paste0("Cantidad de estados incluidos en estudio: ", length(estados)))

print("Los estados son:")
for(estado in estados){
  print(estado)
}


##5. ¿Cuántas muestras fueron colectadas antes de 1980?
n_1980 <- nrow(data[data$A.o._de_colecta<1980,])
print(paste0("Se tomaron ", n_1980, " muestras antes de 1980"))


##6. ¿Cuántas muestras hay de cada raza?

print("Muestras por raza:")

count_raza <- data %>% group_by(Raza) %>% count()
count_raza <- as.data.frame(count_raza)
count_raza


##7. En promedio ¿a qué altitud fueron colectadas las muestras?

print(paste0("En promedio se colectaron a la altitud de ", round(mean(data$Altitud)), " m.s.n.m"))

##8. ¿Y a qué altitud máxima y mínima fueron colectadas?

print(paste0("La altitud mínima de recolección fue: ", min(data$Altitud), " m.s.n.m"))
print(paste0("La altitud máxima de recolección fue: ", max(data$Altitud), " m.s.n.m"))


##9 Crea una nueva df de datos sólo con las muestras de la raza Olotillo

data_olotillo <- data[data$Raza == "Olotillo",]

##10 Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho

data_rja <- data[data$Raza == "Reventador"|data$Raza =="Jala"|data$Raza =="Ancho",]

##11 Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
write.csv(data_rja, file = "submat.csv")




