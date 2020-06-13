Autor: Felipe Rojas

Correo: Felipe.rojasg@alumnos.uv.cl

Explicación del diseño:

En el problema 1 se abarco como un arreglo el cual con un comando find seleccionaría todos los archivos
executionSummary.txt que existieran independientemente de donde uno este ubicado. En donde se recorre el
contenido del arreglo uno por uno para ir analizando las 3 columnas que interesan de los archivos
(timeExecMakeAgents”,“timeExecCal”, “timeExecSim” ) los cuales se irán sumando por cada iteración y
llevado a un archivo temporal en el cual se almacenaran las sumas parciales de cada simulación. Posteriormente
la variable (repositorio) almacenará el contenido del archivo temporal suma.txt dado un awk que cumplirá la
función de sacar el tiempo máximo, mínimo y promedio de cada simulación. Realizando el mismo
procedimiento para hallar la memoria utilizada por el simulador, donde todo esto se guardará en dos variables
repositorio y repositorio2 para llevar su contenido a un archivo metrics.txt con la estructura mencionada
anteriormente. Para cumplir con las observaciones detalladas en el informe se eliminarán los dos txt temporales
que se utilizaron en el proceso.


En el problema 2 se creará un segundo arreglo el cual cumplirá la función del almacenar todos los archivos
Summary.txt que existan gracias al comando find. Luego se va a recorrer el arreglo por cada archivo Summary
que corresponde a cada simulación determinada y se analizaran los campos importantes para resolver el
problema como son el “responseTime” para determinar el tiempo de todas las personas simuladas gracias al
awk. Junto con esto se invoca a una función llamada Operaciones que su objetivo es sacar el promedio, máximo
y mínimo de todas las personas simuladas y llevar esos datos a un archivo temporal llamado evacuation.txt.
Como siempre eliminando los archivos intermedios como es el suma2.txt, el cual se ocupará para las siguientes
métricas de desempeño a analizar en los distintos grupos de personas cómo son solo los residentes, solo
visitantes tipo1, solo residentes separados por grupo etario y solo visitantes tipo 1 separados por grupo etario.
En todos estos grupos de personas se realizará el mismo procedimiento mencionado para todas las personas
simuladas solo con una leve diferencia que al momento de recorrer el arreglo se tendrá que someter el contenido
del archivo a un condicional con respecto al campo (model), el cual si es igual a cero serian de los solo residentes
y se realizaría todo el proceso normal, pero si el campo es igual a 1 seria de solo los visitantes 1. De esta manera
para diferenciar el tipo de modelo de persona y el grupo etario al que pertenece se realiza un condicional con
respecto al contenido del archivo en el campo (model) que sea igual a cero (solo residentes) y el campo
(groupAge) con todas las posibilidades, lo cual abarcara a todos los residentes con respecto al grupo etario. Lo
mismo se debe hacer para los visitantes tipo1 en relación con el grupo etario, la única diferencia es que el campo
(model) será igual a 1 lo que indica que es visitante tipo1, de este mismo modo realizando todo el procedimiento
y las operaciones ya mencionadas anteriormente.


El problema 3 igualmente se piensa como un arreglo en donde el comando find selecciona todos los archivos
llamados usePhone.txt que se encuentran en el servidor dejándolos ordenados por nombre en un arreglo.
Cumpliendo el mismo procedimiento que en los otros 2 problemas donde se recorre el arreglo mostrando el
contenido de cada archivo mediante ocurre la iteración cortando los campos importantes para resolver el
problema como son (timeStamp, usePhone) y guardándolos en otro arreglo llamado MedicionTiempo. Donde
se realizará otro ciclo para recorrer el contenido del arreglo MedicionTiempo y almacenarlo en un archivo
temporal llamado movil.txt donde las columnas queden puestas como filas es decir realizar la transpuesta de
esa matriz.
Al tener las columnas puestas como filas en una matriz se podrá recorrer más fácilmente ya que se tiene que
analizar el tiempo promedio de uso de teléfonos para los instantes de tiempos especificados. Donde se ira
comparando cada tiempo de medición (timeStamp) con respecto a la cantidad de personas que usaron el móvil
(usePhone) y se podrá llamar a la función Operaciones que realiza el promedio, máximo y mínimo de ese tiempo
en específico. Para finalmente guardar todo el contenido en usePhone-stats.txt y eliminar los archivos
temporales.

