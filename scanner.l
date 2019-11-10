%{
#include<stdio.h>
#include "parser.tab.h" 
%}
%option yylineno

const_hexa			 0[xX][0-9a-fA-F]+
const_decimal		 [1-9][0-9]*
const_octal 		 0[0-7]*
const_real			 [0-9]*\.[0-9]+
caracter			 "\'"[a-zA-Z]"\'"
literal_cadena		 [caracter]{2,99}
identificador		 [_a-zA-Z]+[_a-zA-Z0-9]*
tipo_dato			 "int"|"double"|"char"|"float"|"const"|"long"
espacio              [[:space:]]
				
%option noyywrap

%%

\t+				      ;
\n+                  {return '\n';}
"="					 {printf("**Operador: %s\n",yytext);return '=';}
"-"					 {printf("**Operador: %s\n",yytext);return '-';}
"+"					 {printf("**Operador: %s\n",yytext);return '+';}
"/"					 {printf("**Operador: %s\n",yytext);return '/';}
"*"					 {printf("**Operador: %s\n",yytext);return '*';}
"&"					 {printf("**Operador: %s\n",yytext);return '&';}
"%"					 {printf("**Operador: %s\n",yytext);return '%';}
">"					 {printf("**Operador: %s\n",yytext);return '>';}
"<"					 {printf("**Operador: %s\n",yytext);return '<';}
"!"					 {printf("**Operador: %s\n",yytext);return '!';}
"~"					 {printf("**Operador: %s\n",yytext);return '~';}
"["					 {printf("**Operador: %s\n",yytext);return '[';}
"]"					 {printf("**Operador: %s\n",yytext);return ']';}
"("					 {printf("**Operador: %s\n",yytext);return '(';}
")"					 {printf("**Operador: %s\n",yytext);return ')';}
"^"					 {printf("**Operador: %s\n",yytext);return '^';}
"||"				 {printf("**Operador: %s\n",yytext);return OPER_OR;}
"&&"				 {printf("**Operador: %s\n",yytext);return OPER_AND;}
"=="				 {printf("**Operador: %s\n",yytext);return OPER_IGUALDAD;}
"!="				 {printf("**Operador: %s\n",yytext);return OPER_DESIGUALDAD;}
"+="				 {printf("**Operador: %s\n",yytext);return OPER_SUMA_IGUAL;}
"-="				 {printf("**Operador: %s\n",yytext);return OPER_RESTA_IGUAL;}
"*="				 {printf("**Operador: %s\n",yytext);return OPER_MULTI_IGUAL;}
"/="				 {printf("**Operador: %s\n",yytext);return OPER_DIV_IGUAL;}
"++"				 {printf("**Operador: %s\n",yytext);return OPER_INCREMENTO;}
"--"				 {printf("**Operador: %s\n",yytext);return OPER_DECREMENTO;}
">="				 {printf("**Operador: %s\n",yytext);return OPER_MAY_IGUAL;}
"<="				 {printf("**Operador: %s\n",yytext);return OPER_MEN_IGUAL;}
","                  {printf("**Signo de puntuacion: %s\n",yytext);return ',';}
";"					 {printf("**Signo de puntuacion: %s\n",yytext);return ';';}
"}"					 {printf("**Signo de puntuacion: %s\n",yytext);return '}';}
"{"					 {printf("**Signo de puntuacion: %s\n",yytext);return '{';}
"if"				 {printf("**Palabra Reservada para sentencia de Seleccion: %s\n",yytext);return IF;}
"switch"			 {printf("**Palabra Reservada para sentencia de Seleccion: %s\n",yytext);return SWITCH;}
"else"				 {printf("**Palabra Reservada para sentencia de Seleccion: %s\n",yytext);return ELSE;}
"while"				 {printf("**Palabra Reservada para sentencia de Iteracion: %s\n",yytext);return WHILE;}
"do"				 {printf("**Palabra Reservada para sentencia de Iteracion: %s\n",yytext);return DO;}
"for"				 {printf("**Palabra Reservada para sentencia de Iteracion: %s\n",yytext);return FOR;}
"return"			 {printf("**Palabra Reservada para sentencia de Salto: %s\n",yytext);return RETURN;}
"sizeof"			 {printf("**Funcion tamaño : %s\n",yytext);return SIZEOF;}
{tipo_dato}			 {printf("**Tipo de dato: %s\n",yytext);return TIPO_DATO;}
{caracter}			 {printf("**Caracter: %s\n",yytext);return CARACTER;}
{literal_cadena}	 {printf("**Literal cadena: %s\n",yytext);return   LITERAL_CADENA;}
{const_hexa} 		 {printf("**Constante Hexadecimal: %s\n",yytext);return CONSTANTE;}
{const_octal} 		 {printf("**Constante Octal: %s\n",yytext);return CONSTANTE;}
{const_decimal} 	 {printf("**Constante Decimal: %s\n",yytext);return CONSTANTE;}
{const_real} 		 {printf("**Constante Real: %s\n",yytext);return CONSTANTE;}
{identificador}		 {printf("**Identificador: %s\n",yytext);return IDENTIFICADOR;}
{espacio}+            ;
.					{printf("**Error lexico detectado: %s \n",yytext);}
%%
