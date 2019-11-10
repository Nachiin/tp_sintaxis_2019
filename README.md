# tp_sintaxis_2019
## tp grupal, compilador de C (con flex y bison)


**desde la consola pongan:**

si modificaron algo del scanner(donde reconoce los tokens): **flex scanner.l** 

si modificaron algo del parser(donde va la gramatica): **bison parser.y**

para crear el ejecutable: **gcc lex.yy.c parser.tab.c -o ejecutable**

para abrirlo y pasarle un archivo para que analize: **./ejecutable <pruebas.txt**


**importante:** si usan windows tienen que meter todos los archivos en un proyecto codeblock y compilar desde ahi
