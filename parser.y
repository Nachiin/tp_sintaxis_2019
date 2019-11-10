%code top{
#include <stdio.h>
#define YYERROR_VERBOSE			
}

%code provides{
int yylex(void);
extern int yylineno;
extern int yylexerrs;
extern char *yytext;
void yyerror(const char *);
}


%define parse.error verbose 

%token OPER_SUMA_IGUAL OPER_RESTA_IGUAL OPER_MULTI_IGUAL OPER_DIV_IGUAL OPER_OR OPER_AND OPER_IGUALDAD OPER_DESIGUALDAD OPER_MAY_IGUAL OPER_MEN_IGUAL OPER_INCREMENTO  OPER_DECREMENTO  CONSTANTE LITERAL_CADENA TIPO_DATO CARACTER IDENTIFICADOR IF ELSE SWITCH WHILE DO FOR RETURN SIZEOF

%right    '=' OPER_SUMA_IGUAL OPER_RESTA_IGUAL OPER_MULTI_IGUAL OPER_DIV_IGUAL
%right    '?' ':'
%left 	  OPER_OR OPER_AND 
%left 	  OPER_DESIGUALDAD OPER_IGUALDAD
%left	  '<' '>' OPER_MAY_IGUAL OPER_MEN_IGUAL
%left     '+' '-' 
%left     '*' '/' '%'
%right	  OPER_DECREMENTO OPER_INCREMENTO 



%start programa
%%


programa: 						listaSentencias	
								|error '\n' {yyerrok;}	
								;

listaSentencias:				sentencia listaSentencias
								|sentencia '\n' listaSentencias
								|/*cadena vacia*/ 				
								;

sentencia:						sentDeclaracion  	{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA DE DECLARACION**\n");} 
								|sentCompuesta 		{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA COMPUESTA**\n");}
								|sentExpresion 		{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA DE EXPRESION**\n");}
								|sentSeleccion 		{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA DE SELECCION**\n");}
								|sentIteracion 		{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA DE ITERACION**\n");}
								|sentSalto     		{printf("\t\t\t\t\t\t\t\t\t\tSENTENCIA DE SALTO**\n");}
								;

sentDeclaracion:				listaDeclaraciones
								|declaracionFuncion
								;
sentCompuesta: 					'{'listaDeclaraciones'}'	
								|'{'listaSentencias'}'

sentExpresion:  				expresion ';'
								|expresion ','sentExpresion
								|/*cadena vacia*/
								;
listaDeclaraciones:				declaracionVar listaDeclaraciones
								|/*cadena vacia*/
								;

sentSeleccion:					IF '('expresion')' sentencia
								|IF '('expresion')' sentencia ELSE sentencia
								|SWITCH'('expresion')' sentencia
								;
sentIteracion:					WHILE'('expresion')'sentencia
								|DO sentencia WHILE '('expresion')' ';'
								|FOR'('expresion';'expresion';'expresion')' listaSentencias
								;
sentSalto: 						RETURN 	expresion ';'
								;

expresion: 						expAsignacion   
								;
								

declaracionVar: 				TIPO_DATO listaVarSimples 

								;
listaVarSimples: 				unaVarSimple ';'
                				|unaVarSimple ',' listaVarSimples
               					 ;

unaVarSimple: 					IDENTIFICADOR '=' valorInicial
								; 
valorInicial:					|CONSTANTE
								|CARACTER
								|LITERAL_CADENA
								;

declaracionFuncion:				TIPO_DATO IDENTIFICADOR '('sentDeclaracion')' 


expAsignacion:  				expCondicional						
			   					|expUnaria operAsignacion expAsignacion 
			   					;
operAsignacion: 				'=' 			
								|OPER_SUMA_IGUAL
								|OPER_RESTA_IGUAL		
								|OPER_MULTI_IGUAL		
								|OPER_DIV_IGUAL		
								;
expCondicional:  				expOr 					
							 	|expOr '?' expresion ':' expCondicional  
							 	;
expOr: 							 expAnd 							
	   							|expOr OPER_OR expAnd 			
	  							;
expAnd:  						expIgualdad 					
								|expAnd OPER_AND expIgualdad 	
								;
expIgualdad:					expRelacional								
     							|expIgualdad OPER_IGUALDAD expRelacional 	
   		   						|expIgualdad OPER_DESIGUALDAD expRelacional 
     							;
expRelacional:  				expAditiva
								|expRelacional '<' expAditiva 
			   					|expRelacional '>' expAditiva 
			   					|expRelacional OPER_MAY_IGUAL expAditiva 
			   					|expRelacional OPER_MEN_IGUAL expAditiva 


			 					;
expAditiva: 					expMultiplicativa
								|expAditiva '+' expMultiplicativa 
					            |expAditiva '-' expMultiplicativa 
								;
expMultiplicativa: 				expUnaria
					 			|expMultiplicativa '*' expUnaria
					 			|expMultiplicativa '/' expUnaria
					 			;
expUnaria: 						 expPostfijo
							    |OPER_INCREMENTO expUnaria
							    |expUnaria OPER_INCREMENTO 
							    |OPER_DECREMENTO expUnaria
							    |expUnaria OPER_DECREMENTO 
							    |operUnario expUnaria
							    |SIZEOF '('TIPO_DATO')'
							    ;

operUnario: 				    '&'
								|'*' 
								|'-' 
								|'!'
								;

expPostfijo:			         expPrimaria
					            |expPostfijo '[' expresion ']'
					            |expPostfijo '('listaArgumentos')'
								;

listaArgumentos: 				expresion
								|listaArgumentos ',' expresion
								;

expPrimaria: 					IDENTIFICADOR			
								|CONSTANTE							
								|LITERAL_CADENA				
								;
%%   

int main()
{	
	printf("\t\t\t*****Tp. Final Sintaxis y Semantica de los lenguajes*****\n\n");
	printf("Se reconocio los siguientes lexemas: \n\n");
	switch(yyparse() ){
	case 0:
		printf("**Todas las salidas Pertenecen al LIC :3 **\n\n"); return 0; 
	case 1:
        printf("Alguna entrada no pertenece al LIC \n\n" );
        printf("se han encontrado en total %d errores sintacticos \n\n",yynerrs);
        return 1;
	case 2:
		printf("Memoria insuficiente"); return 2;
	}
	return 0;
}

void yyerror(const char *msg_error){
	printf("\n\n***línea #%d: %s\n", yylineno, msg_error);
}
