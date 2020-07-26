#R HDF5 packages

#Para Utilizar el formato de archivo h5,
#se debe instalar paquetes desde Bioconductor


#Utilizar para version de R < 3.5.0
#source("http://bioconductor.org/biocLite.R")
#biocLite("rhdf5")

#Utilizar para version de R >= 3.5.0
install.packages("BiocManager")
BiocManager::install("rhdf5")

#Crear Directorio o archivo
library(rhdf5)
created = h5createFile("example.h5")
created

#crear Grupos  // Create groups
created = h5createGroup("example.h5","foo")
created = h5createGroup("example.h5","baa")
created = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

#Escribir en los grupos  //write to group

A = matrix(1:10, nr=5, nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1,2.0, by = 0.1), dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")

#escribir un conjunto de datos// write a data set
df = data.frame(1L:5L, seq(0,1, length.out = 5),
                c("ab","cde","fghi", "a","s"), stringsAsFactors = FALSE)
h5write(df,"example.h5","df")
h5ls("example.h5")

#Lectura de datos // Reading data
readA = h5read("example.h5","foo/A")
readB = h4read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5","df")
readA
