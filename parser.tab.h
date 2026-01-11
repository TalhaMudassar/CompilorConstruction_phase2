/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    NUMBER_INTEGER = 259,          /* NUMBER_INTEGER  */
    NUMBER_FLOAT = 260,            /* NUMBER_FLOAT  */
    NUMBER_EXPONENT = 261,         /* NUMBER_EXPONENT  */
    STRING_LITERAL = 262,          /* STRING_LITERAL  */
    CHAR_LITERAL = 263,            /* CHAR_LITERAL  */
    KW_fher = 264,                 /* KW_fher  */
    KW_nahiTa = 265,               /* KW_nahiTa  */
    KW_jadTak = 266,               /* KW_jadTak  */
    KW_likh = 267,                 /* KW_likh  */
    KW_dass = 268,                 /* KW_dass  */
    KW_morjaa = 269,               /* KW_morjaa  */
    KW_kaam = 270,                 /* KW_kaam  */
    KW_chakkar = 271,              /* KW_chakkar  */
    KW_rok = 272,                  /* KW_rok  */
    KW_jaari = 273,                /* KW_jaari  */
    KW_nava = 274,                 /* KW_nava  */
    KW_class = 275,                /* KW_class  */
    KW_dekh = 276,                 /* KW_dekh  */
    KW_halat = 277,                /* KW_halat  */
    KW_mukao = 278,                /* KW_mukao  */
    KW_int = 279,                  /* KW_int  */
    KW_float = 280,                /* KW_float  */
    KW_char = 281,                 /* KW_char  */
    OP_ADDASSIGN = 282,            /* OP_ADDASSIGN  */
    OP_ASSIGN_PUNJ = 283,          /* OP_ASSIGN_PUNJ  */
    OP_EQUAL = 284,                /* OP_EQUAL  */
    OP_NOTEQ = 285,                /* OP_NOTEQ  */
    OP_INC = 286,                  /* OP_INC  */
    OP_PLUS = 287,                 /* OP_PLUS  */
    OP_MINUS = 288,                /* OP_MINUS  */
    OP_MULT = 289,                 /* OP_MULT  */
    OP_DIV = 290,                  /* OP_DIV  */
    OP_MOD = 291,                  /* OP_MOD  */
    OP_AND = 292,                  /* OP_AND  */
    OP_OR = 293,                   /* OP_OR  */
    OP_LT = 294,                   /* OP_LT  */
    OP_GT = 295,                   /* OP_GT  */
    OP_SHIFT_LEFT = 296,           /* OP_SHIFT_LEFT  */
    OP_SHIFT_RIGHT = 297,          /* OP_SHIFT_RIGHT  */
    PUNC_LBLOCK = 298,             /* PUNC_LBLOCK  */
    PUNC_RBLOCK = 299,             /* PUNC_RBLOCK  */
    PUNC_END = 300,                /* PUNC_END  */
    PUNC_SEP = 301,                /* PUNC_SEP  */
    LPAREN = 302,                  /* LPAREN  */
    RPAREN = 303,                  /* RPAREN  */
    COMMA = 304,                   /* COMMA  */
    DOT = 305                      /* DOT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
