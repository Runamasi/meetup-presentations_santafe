##############################################################################
#             Taller de RMarkdown - R Ladies                  #
##############################################################################

# �Te anim�s a convertir este scrip en un archivo de rmarkdown?
#  La idea es tener algunos gr�ficos, # tablas # y otros resultados para ver 
# como quedar�an en un archivo final luego de compilarlo con Knitr. 
# Abajo te dejamos algunos tips que tal vez te ayuden.
# 
# 
# 1. Cuando elijas el tipo de archivo final, record� que si no ten�s instalado 
#     Latex no funcionar� la opci�n PDF. El tipo de archivo final se puede 
#     cambiar en cualquier momento!
# 2. Record� que el c�digo debe ir dentro de uno o m�s chunks, pod�s crearlos 
#     desde la opci�n Insertar, escribiendo ```{r} ``` o con el atajo 
#     Ctrl+Alt+i. Para correr el c�digo pod�s usar el atajo Ctrl+Shift+Enter.
# 3. El texto plano es todo lo que queda por fuera de los chunks, si te anim�s
#     pod�s usar algo de markdown para darle estilo!
# 4. Importante: una de las herramientas �tiles de este formato es poder 
#     insertar c�digo de R en el texto plano para que al compilar aparezca el
#     resultado directamente. Se hace usando `r codigo que quiero usar`, �te
#     anim�s a probar?
# 5. En este link hay una hoja de referecia con m�s informaci�n:
#     https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-spanish.pdf
#     pero Google tambi�n es una gran opci�n.
# 6. Para compilarlo podes usar el atajo Ctrl+Shift+k o el bot�n que dice Knit.
#     Est� bueno hacer esto seguido para que los errores no aparezcan todos
#     juntos al final!
#     
# Ahora si, el c�digo

# Vamos a usar la base de datos "Diamonds" que contiene informaci�n sobre 
# 54.000 diamantes incluyendo el precio, el color, el corte y otros
# Al cargar la librer�a ggplot2 tendremos disponible la base de datos.

library(ggplot2)

# Veamos que pinta tiene esta base de datos:
head(diamonds)

# �C�mo queda esta tabla al compilar? 
# Tip: hay muchas opciones para darle formato a las tablas. Una posibilidad 
# usar la funci�n kable del paquete knitr!

# Mira que diferencias hay entre ejecutar esta linea de codigo
summary(iris)
# y esta otra
knitr::kable(summary(iris))

#�Como se ven las salidas al compilar?



# Podr�a ser interesante ver como var�a el precio de los diamantes para las
# diferentes caracter�sticas. 
ggplot(diamonds, aes(price)) + 
  geom_histogram(binwidth = 500, aes(fill = ..count..)) +
  scale_fill_distiller(name = "Frecuencia", palette = "Dark2") +
  xlab("Precio en d�lares") +
  ylab("Frecuencia") +
  theme_minimal()

# Ojo con los histogramas! Son tramposos cuando cambias el binwidth.

# Ser�a interesante saber cual es el diamante m�s caro en la base de datos. 
# �Te anim�s a obtener esa informaci�n y ponerla dentro del texto? Algo como 
# "El d�amante m�s caro es ..." 
# Tip: para esto puede servirte la funci�n max()


# �C�mo var�a el precio para cada calidad de corte (variable cut)? �Realmente 
# el precio depende de esa variable?

ggplot(diamonds, aes(price, color = cut)) + 
  geom_freqpoly(binwidth = 500) +
  scale_color_brewer(name = "Corte", palette = "Dark2") +
  xlab("Precio en d�lares") +
  ylab("Frecuencia") +
  theme_minimal()


#Esta es una tabla con un subset de datos y pie de figura

knitr::kable(
  head(mtcars[, 1:8], 10),
  caption = 'Tabla de las primeras 10 filas del set de datos mtcars.'
)
#si se incluye out.width=c('50%', '50%'), fig.show='hold' en las opciones de bloque de codigo pueden incluirse 2 figuras como las siguientes
plot(pressure, pch = 19, type = "b")
plot(cars, pch = 19)


 

# Si tienen ganas de seguir complejizando el asunto pueden probar agregando 
# ep�grafes a las figuras, cambiarles el tama�o, agregarle m�s formato al texto
# o cambiar el tipo de archivo de salida, las opciones son infinitas!
