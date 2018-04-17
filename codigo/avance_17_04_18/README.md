## Implementación de Descenso en Gradiente Secuencial  

Ejemplo de Regresión Lineal utilizando los datos de Boston Housing  

### Contenido
Esta carpeta contiene el código de la implementación de descenso en gradiente en modo secuencial.  
Para compilar el código se requieren los siguientes archivos:  
  
* definiciones.h  
  
* funciones.c  
  
* descenso_gradiente_secuencial.c  
  
Para probar la correcta ejecución del código se utilizaron los datos de Boston Housing descargados de (Kaggle)[https://www.kaggle.com/c/boston-housing].  

El procesamiento de estos datos se ejecuta con el archivo preproc.sh. Este procesamineto consiste en los siguientes pasos:  
  
1. A través de R, eliminar la primera columna (consiste en un ID) y escalar los datos para tener una mejor convergencia. Además, separa los datos en entrenamiento (66%) y validación(33%).   
  
2. Separar los datos en covariables (X) y objetivo (y), separar los datos en espacios y eliminar los nombres de las columnas.  

3. Agregar columna de 1's a la tabla de X para considerar los sesgos de la regresión.  
  
4. Crear una tabla para los coeficientes (b), con valores iniciales de 0.1.  

Este 'preprocesador' se puede ejecutar con el comando ./preproc.sh en la terminal, requiere el archivo con los datos (train.csv) y el escalador (scaler.R).  
 

### Compilado y Ejecución  
Para compilar el programa se ejecuta la siguiente instrucción en la consola:  
  
* gcc -Wall descenso_gradiente_secuencial.c funciones.c -o programa.out -lblas -lm

La ejecucución del programa se hace de la siguiente forma:  

* ./programa.out <renglones_entrenamiento> <columnas_entrenamiento> <renglones_validación> <columnas_validación> <iteraciones> <-tasa_aprendizaje> 
  
Se encontró que los siguientes parámetros obtienen un buen resultado con estos datos, demostrando el aprendizaje del modelo de regresión y antes de sobreajustar:  

* ./programa.out 222 14 111 14 25 -0.0002


