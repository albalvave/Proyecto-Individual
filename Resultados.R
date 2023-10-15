source("teoriadecision_funciones_incertidumbre.R")
#1.Problema 1:

#Somos un inversor que debe tomar decisiones sobre cuatro posibles inversiones, 
#representadas como decisiones (d1, d2, d3, d4), con cuatro eventos (E1, E2, E3, E4). 
#Aplicar los criterios de decision bajo incertidumbre tanto en el caso favorable (beneficios), 
#como en el caso desfavorable (costos).


 #| E1 | E2 | E3 | E4 |
  
 # d1| 30 | -5 | 20 | 28 |
 # d2| 20 | 22 | 25 | -8 |
  #d3|  5 | 18 | 12 | 14 |
  #d4| 25 | 24 | 0  | 26 |
  
tabla=crea.tablaX(c(30,-5,20,28,20,22,25,-8,5,18,12,14,25,24,0,26),numalternativas=4,numestados=4)
tabla  

##Vamos a hacerlo en el caso favorable:

criterio.Wald(tabla,T)
##

criterio.Optimista(tabla,T)
##

criterio.Hurwicz(tabla,T) 
##

criterio.Savage(tabla,T)
##

criterio.Laplace(tabla,T)
##

criterio.PuntoIdeal(tabla,T)
##


##Vamos a hacerlo en el caso desfavorable

criterio.Wald(tabla,F)
##

criterio.Optimista(tabla,F)
##

criterio.Hurwicz(tabla,F) 
##

criterio.Savage(tabla,F)
##

criterio.Laplace(tabla,F)
##

criterio.PuntoIdeal(tabla,F)
##
  


  #2.Problema 2: 
  
  
  #Lyre quiere unirse a un gimnasio y ha investigado tres opciones de membresía.Cada membresía tiene sus propias condiciones y costos asociados:
  
  
  #Membresía "Basic Fit": Requiere un pago mensual de 20 euros, pero no cubre todas las 
#instalaciones y clases de gimnasio hasta después de seis meses. Durante los primeros seis meses, solo tiene acceso limitado.

#Membresía "Fitness Plus": Ofrece acceso completo a todas las instalaciones y clases
#desde el primer día, pero con una cuota mensual de 40 euros.

#Membresía "Gym Pro": Requiere un pago mensual de 30 euros y cubre todas las instalaciones
#y clases, excepto las clases de natación.

#Lyre planea mantener su membresía de gimnasio durante un año, pero no está segura si usará
#todas las instalaciones y clases desde el principio debido a su apretado horario en la universidad o si esperará 
#los primeros seis meses antes de hacerlo.

#El costo de acceso a las instalaciones y clases de gimnasio es de 15 euros por mes. Si Lyre
#quiere evaluar el costo total durante el primer año, ¿qué membresía de gimnasio le recomendarías?


#Vamos a resolverlo

#Lyre debe elegir entre tres alternativas de membresía de gimnasio: "Basic Fit," "Fitness Plus," y "Gym Pro.

#desicion: Lyre

#Costos:.

#Alternativas: 
#1.Basic Fit
#2.Fitness Pluss
#3.Gym Pro


#Estados de la naturaleza:
#1.Usar desde el primer dia 
#2.Esperar los primeros 6 meses 

# Matriz de decisión(costos)

md11 = 20 * 6 + (20 + 15) * 6  # Basic Fit, usar desde el primer día
md12 = 20 * 6 + (20 + 15) * 6  # Basic Fit, esperar los primeros seis meses
md21 = 40 * 12  # Fitness Plus, usar desde el primer día
md22 = 40 * 12  # Fitness Plus, esperar los primeros seis meses
md31 = 30 * 12 + 15 * 12  # Gym Pro, usar desde el primer día
md32 = 30 * 6 + 15 * 6  # Gym Pro, esperar los primeros seis meses


#Resolvemos el problema

tabla1= crea.tablaX(c(330,330,480,480,540,270),3,2)
tabla1
res=criterio.Todos(tabla1,alfa = 0.5,F)
knitr::kable(res) 

#por lo tanto la mejor decision es la primera, que es seria inscribirse en Basic Fit
