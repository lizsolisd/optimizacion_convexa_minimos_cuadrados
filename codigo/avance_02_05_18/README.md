
## Base de datos de prueba  

Dado que la base de Boston únicamente tenía 333 observaciones, se decidió cambiar por la base de flights, que tiene más de 5,000,000 de observaciones.  Se modificó para que pudiera ser utilizada con los modelos. El archivo con las instrucciones de preprocesamiento es el preproc_flights.sh, que está en esta carpeta. Entre estos, se convierten algunas variables categoricas en dummies, la variable dependiente es el retraso del vuelo. Las columnas originales de la base eran:  

`YEAR,MONTH,DAY,DAY_OF_WEEK,AIRLINE,FLIGHT_NUMBER,TAIL_NUMBER,ORIGIN_AIRPORT,DESTINATION_AIRPORT,SCHEDULED_DEPARTURE,DEPARTURE_TIME,DEPARTURE_DELAY,TAXI_OUT,WHEELS_OFF,SCHEDULED_TIME,ELAPSED_TIME,AIR_TIME,DISTANCE,WHEELS_ON,TAXI_IN,SCHEDULED_ARRIVAL,ARRIVAL_TIME,ARRIVAL_DELAY,DIVERTED,CANCELLED,CANCELLATION_REASON,AIR_SYSTEM_DELAY,SECURITY_DELAY,AIRLINE_DELAY,LATE_AIRCRAFT_DELAY,WEATHER_DELAY`  

Después del procesamiento tenemos las siguientes:  

` "TAXI_OUT"       "SCHEDULED_TIME" "ELAPSED_TIME"   "AIR_TIME"       "DISTANCE"       "MONTH..1"       "MONTH.10"       "MONTH.11"       "MONTH.12"      
"MONTH..2"       "MONTH..3"       "MONTH..4"       "MONTH..5"       "MONTH..6"       "MONTH..7"       "MONTH..8"       "MONTH..9"       "DAY_OF_WEEK.1" 
"DAY_OF_WEEK.2"  "DAY_OF_WEEK.3"  "DAY_OF_WEEK.4"  "DAY_OF_WEEK.5"  "DAY_OF_WEEK.6"  "DAY_OF_WEEK.7"  "AIRLINE.AA"     "AIRLINE.AS"     "AIRLINE.B6"    
"AIRLINE.DL"     "AIRLINE.EV"     "AIRLINE.F9"     "AIRLINE.HA"     "AIRLINE.MQ"     "AIRLINE.NK"     "AIRLINE.OO"     "AIRLINE.UA"     "AIRLINE.US"    
"AIRLINE.VX"     "AIRLINE.WN" `

## 1.Implementación de Descenso en Gradiente Estocástico Secuencial 

Se corrigió el código que teníamos la semana anterior con el cambio de Erick y se pudo confirmar el correcto funcionamineto del programa con la nueva base. El archivo tiene el nombre 'SGD_secuencial_f.c'.  

Para compilar el programa se ejecuta la siguiente instrucción en la consola:  
  
`gcc -Wall SGD_secuencial_f.c funciones.c -o programa.out -lblas -lm`

La ejecución del programa se hace de la siguiente forma:  

`./programa.out <renglones_entrenamiento> <columnas_entrenamiento> <renglones_validación> <tamaño_del_batch> <iteraciones> <-tasa_aprendizaje>`
  
Se encontró que los siguientes parámetros obtienen un buen movimiento en el error, sin embargo, falta hacer pruebas con más iteraciones:  

`./programa.out 3999805 39 1714203 65536 200 -0.000001`  

  
**Evidencia**  
![Inicio Script](evidencia/sgd1.png)
  
![Fin Script](evidencia/sgd2.png)

## 2. Implementación de Algorítmo de ADAM

El código para el algorítmo de SGD con ADAM se encuentra en el archivo 'SGD_adam_f.c'.  

Para compilar el programa se ejecuta la siguiente instrucción en la consola:  
  
`gcc -Wall SGD_adam.c funciones.c -o programa.out -lblas -lm`

La ejecución del programa se hace de la siguiente forma:  

`./programa.out <renglones_entrenamiento> <columnas_entrenamiento> <renglones_validación> <tamaño_del_batch> <iteraciones> <tasa_aprendizaje> <Beta1> <Beta2> <epsilon>` 
  
Se experimentó con los parámetros, sin embargo, es necesario realizar más pruebas para encontrar buenos parámetros. Un ejemplo de parámetros con los que lo ejecutamos son los siguientes:  

`./programa.out 3999805 39 1714203 16384 10 0.00001 0.9 0.999 0.00000001`  

**Evidencia**  
![Inicio Script](evidencia/sgd_adam.png)

## 3. Implementación de Algorítmo de AMSGrad

El código para el algorítmo de SGD con AMSGrad se encuentra en el archivo 'SGD_AMSGRad_f.c'.  

Para compilar el programa se ejecuta la siguiente instrucción en la consola:  
  
`gcc -Wall SGD_AMSGrad_f.c funciones.c -o programa.out -lblas -lm`

La ejecución del programa se hace de la siguiente forma:  

`./programa.out <renglones_entrenamiento> <columnas_entrenamiento> <renglones_validación> <tamaño_del_batch> <iteraciones> <tasa_aprendizaje> <Beta1> <Beta2> <epsilon>` 
  
Se experimentó con los parámetros, sin embargo, es necesario realizar más pruebas para encontrar buenos parámetros. Un ejemplo de parámetros con los que lo ejecutamos son los siguientes:  

`./programa.out 3999805 39 1714203 16384 10 0.00001 0.9 0.999 0.00000001`


**Evidencia**  
![Inicio Script](evidencia/amsgrad.png)

Esta carpeta tiene el código en C de la implementación de los programas. Para evitar la sobrecarga del repositorio de la clase creamos un repositorio paralelo que contiene los archivos adicionales.  
<br />
En especifico, los archivos requeridos para ejecutar este programa se encuentran en la siguiente liga: https://github.com/lizsolisd/optimizacion_convexa_minimos_cuadrados/tree/master/codigo/avance_02_05_18