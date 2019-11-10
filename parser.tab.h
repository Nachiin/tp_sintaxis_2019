/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    OPER_SUMA_IGUAL = 258,
    OPER_RESTA_IGUAL = 259,
    OPER_MULTI_IGUAL = 260,
    OPER_DIV_IGUAL = 261,
    OPER_OR = 262,
    OPER_AND = 263,
    OPER_IGUALDAD = 264,
    OPER_DESIGUALDAD = 265,
    OPER_MAY_IGUAL = 266,
    OPER_MEN_IGUAL = 267,
    OPER_INCREMENTO = 268,
    OPER_DECREMENTO = 269,
    CONSTANTE = 270,
    LITERAL_CADENA = 271,
    TIPO_DATO = 272,
    CARACTER = 273,
    IDENTIFICADOR = 274,
    IF = 275,
    ELSE = 276,
    SWITCH = 277,
    WHILE = 278,
    DO = 279,
    FOR = 280,
    RETURN = 281,
    SIZEOF = 282
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);
/* "%code provides" blocks.  */
#line 6 "parser.y" /* yacc.c:1909  */

int yylex(void);
extern int yylineno;
extern int yylexerrs;
extern char *yytext;
void yyerror(const char *);

#line 97 "parser.tab.h" /* yacc.c:1909  */

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
