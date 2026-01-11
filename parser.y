%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yylineno;
extern char *yytext;

void yyerror(const char *s);

/* Result file */
FILE *result_file;
%}

%define parse.error verbose

/* Tokens */
%token IDENTIFIER
%token NUMBER_INTEGER NUMBER_FLOAT NUMBER_EXPONENT
%token STRING_LITERAL CHAR_LITERAL

%token KW_fher KW_nahiTa KW_jadTak KW_likh KW_dass KW_morjaa
%token KW_kaam KW_chakkar KW_rok KW_jaari KW_nava
%token KW_class KW_dekh KW_halat KW_mukao

%token KW_int KW_float KW_char

%token OP_ADDASSIGN OP_ASSIGN_PUNJ OP_EQUAL OP_NOTEQ OP_INC
%token OP_PLUS OP_MINUS OP_MULT OP_DIV OP_MOD
%token OP_AND OP_OR OP_LT OP_GT
%token OP_SHIFT_LEFT OP_SHIFT_RIGHT

%token PUNC_LBLOCK PUNC_RBLOCK PUNC_END PUNC_SEP
%token LPAREN RPAREN COMMA DOT

%left OP_OR
%left OP_AND
%left OP_EQUAL OP_NOTEQ
%left OP_LT OP_GT
%left OP_PLUS OP_MINUS
%left OP_MULT OP_DIV OP_MOD

%%

program:
    KW_class IDENTIFIER PUNC_LBLOCK stmt_list PUNC_RBLOCK
    {
        printf("\n----------------------------------\n");
        printf("Syntax analysis successful!\n");
        printf("----------------------------------\n");

        fprintf(result_file,
                "\n----------------------------------\n"
                "Syntax analysis successful!\n"
                "----------------------------------\n");
    }
    ;

stmt_list:
    stmt stmt_list
    |
    ;

stmt:
      declaration
    | assignment
    | if_stmt
    | loop_stmt
    | io_stmt
    | block_stmt
    ;

declaration:
    type IDENTIFIER PUNC_END
    ;

type:
    KW_int | KW_float | KW_char
    ;

assignment:
    IDENTIFIER OP_ASSIGN_PUNJ expression PUNC_END
    | IDENTIFIER OP_ADDASSIGN expression PUNC_END
    ;

if_stmt:
    KW_fher LPAREN condition RPAREN block_stmt else_part
    ;

else_part:
    KW_nahiTa block_stmt
    |
    ;

loop_stmt:
    KW_jadTak LPAREN condition RPAREN block_stmt
    ;

block_stmt:
    PUNC_LBLOCK stmt_list PUNC_RBLOCK
    ;

io_stmt:
    KW_dass OP_SHIFT_LEFT expression PUNC_END
    | KW_likh OP_SHIFT_RIGHT IDENTIFIER PUNC_END
    ;

condition:
    expression OP_EQUAL expression
    | expression OP_NOTEQ expression
    | expression OP_LT expression
    | expression OP_GT expression
    ;

expression:
    expression OP_PLUS expression
    | expression OP_MINUS expression
    | expression OP_MULT expression
    | expression OP_DIV expression
    | expression OP_MOD expression
    | LPAREN expression RPAREN
    | IDENTIFIER
    | NUMBER_INTEGER
    | NUMBER_FLOAT
    | STRING_LITERAL
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr,
            "Line %d: SYNTAX ERROR -> %s at token '%s'\n",
            yylineno, s, yytext);

    fprintf(result_file,
            "Line %d: SYNTAX ERROR -> %s at token '%s'\n",
            yylineno, s, yytext);
}

int main(int argc, char **argv) {
    extern FILE *yyin;

    result_file = fopen("results.txt", "w");
    if (!result_file) {
        perror("results.txt");
        return 1;
    }

    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror(argv[1]);
            return 1;
        }
    } else {
        printf("Usage: %s <input_file>\n", argv[0]);
        fprintf(result_file, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyparse();
    fclose(result_file);
    return 0;
}
