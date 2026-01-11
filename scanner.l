%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.tab.h"

void report_error(const char *msg);
%}

DIGIT       [0-9]
LETTER      [A-Za-z]
ID_START    [A-Za-z_]
ID_CONT     [A-Za-z0-9_]

INT         {DIGIT}+
FLOAT       {INT}"."{DIGIT}+
EXPONENT    {INT}(\.{DIGIT}+)?[eE][+-]?{INT}

PUNC_LBLOCK  ":::"
PUNC_RBLOCK  ":::;"
PUNC_END     "~>"
PUNC_SEP     "<>"

OP_ADDASSIGN "<+>"
OP_EQUAL     "<->"
OP_NOTEQ     "<!>"
OP_INC       "++>"
OP_GREATER   "+>"
OP_LESS      "<+"
OP_ASSIGN_PUNJ "<-"

OP_PLUS       "\+"
OP_MINUS      "-"
OP_MULT       "\*"
OP_DIV        "/"
OP_MOD        "%"
OP_AND        "&&"
OP_OR         "\|\|"
OP_LT         "<"
OP_GT         ">"

OP_EQ_C        "=="
OP_NEQ_C       "!="
OP_INC_C       "\+\+"
OP_ADDASSIGN_C "\+="

SHIFT_LEFT    "<<"
SHIFT_RIGHT   ">>"

%%

[ \t\r]+      { }
\n            { }

"//".*        { }

"/*"([^*]|\*+[^*/])*\*+\/ {
    char *p;
    for (p = yytext; *p; p++)
        if (*p == '\n') yylineno++;
}

"/*"([^*]|\*+[^*/])*$ {
    report_error("Unterminated block comment");
}

"fher"       { return KW_fher; }
"nahiTa"     { return KW_nahiTa; }
"jadTak"     { return KW_jadTak; }
"likh"       { return KW_likh; }
"dass"       { return KW_dass; }
"morjaa"     { return KW_morjaa; }
"kaam"       { return KW_kaam; }
"chakkar"    { return KW_chakkar; }
"rok"        { return KW_rok; }
"jaari"      { return KW_jaari; }
"nava"       { return KW_nava; }
"class"      { return KW_class; }
"dekh"       { return KW_dekh; }
"halat"      { return KW_halat; }
"mukao"      { return KW_mukao; }

"int"        { return KW_int; }
"float"      { return KW_float; }
"char"       { return KW_char; }

"if"         { report_error("Use 'fher'"); }
"else"       { report_error("Use 'nahiTa'"); }
"while"      { report_error("Use 'jadTak'"); }
"for"        { report_error("Use 'kaam'"); }
"do"         { report_error("Use 'chakkar'"); }
"break"      { report_error("Use 'rok'"); }
"continue"   { report_error("Use 'jaari'"); }
"new"        { report_error("Use 'nava'"); }
"switch"     { report_error("Use 'dekh'"); }
"case"       { report_error("Use 'halat'"); }
"default"    { report_error("Use 'mukao'"); }
"return"     { report_error("Use 'morjaa'"); }
"cin"        { report_error("Use 'likh'"); }
"cout"       { report_error("Use 'dass'"); }

{SHIFT_LEFT}  { return OP_SHIFT_LEFT; }
{SHIFT_RIGHT} { return OP_SHIFT_RIGHT; }

{OP_ADDASSIGN}    { return OP_ADDASSIGN; }
{OP_ASSIGN_PUNJ}  { return OP_ASSIGN_PUNJ; }
{OP_EQUAL}        { return OP_EQUAL; }
{OP_NOTEQ}        { return OP_NOTEQ; }
{OP_INC}          { return OP_INC; }

{OP_PLUS}         { return OP_PLUS; }
{OP_MINUS}        { return OP_MINUS; }
{OP_MULT}         { return OP_MULT; }
{OP_DIV}          { return OP_DIV; }
{OP_MOD}          { return OP_MOD; }
{OP_AND}          { return OP_AND; }
{OP_OR}           { return OP_OR; }
{OP_LT}           { return OP_LT; }
{OP_GT}           { return OP_GT; }

{OP_EQ_C}         { report_error("Use '<->'"); }
{OP_NEQ_C}        { report_error("Use '<!>'"); }
{OP_INC_C}        { report_error("Use '++>'"); }

{PUNC_LBLOCK}     { return PUNC_LBLOCK; }
{PUNC_RBLOCK}     { return PUNC_RBLOCK; }
{PUNC_END}        { return PUNC_END; }
{PUNC_SEP}        { return PUNC_SEP; }

"("               { return LPAREN; }
")"               { return RPAREN; }
","               { return COMMA; }
"."               { return DOT; }

"{"               { report_error("Use ':::'"); }
"}"               { report_error("Use ':::;'"); }
";"               { report_error("Use '~>'"); }
":"               { report_error("Not allowed ':'"); }

\"([^\\\n\"]|\\.)*\" { return STRING_LITERAL; }
\'([^\\\n\']|\\.)\'  { return CHAR_LITERAL; }

\"([^\\\n\"]|\\.)* { report_error("Unterminated string"); }
\'([^\\\n\']|\\.)* { report_error("Unterminated char"); }

{EXPONENT}         { return NUMBER_EXPONENT; }
{FLOAT}            { return NUMBER_FLOAT; }
{INT}              { return NUMBER_INTEGER; }

{ID_START}{ID_CONT}* { return IDENTIFIER; }

[@#\$][A-Za-z0-9_]* { report_error("Invalid identifier"); }

. { report_error("Invalid token"); }

%%

void report_error(const char *msg) {
    fprintf(stderr,
            "Line %d: LEXICAL ERROR -> %s : %s\n",
            yylineno, msg, yytext);
}
