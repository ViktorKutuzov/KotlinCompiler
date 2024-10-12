%token VAL
%token VAR
%token ID
%token INT
%token CHAR
%token DOUBLE
%token STRING
%token TRUE
%token FALSE

%token IF
%token ELSE
%token WHILE
%token DO
%token FUNC
%token FOR

%nonassoc INCREMENT
%nonassoc DECREMENT
%nonassoc '('
%nonassoc ')'
%nonassoc '['
%nonassoc ']'

type: INT
    | CHAR
    | DOUBLE
    | STRING
    ;

expr: type
    | ID
    | '(' expr ')'
    | expr '.' ID
    | expr '+' expr
    | expr '-' expr
    | expr '+' expr
    | expr '*' expr
    | expr '/' expr
    | expr '=' expr
    | expr '<' expr
    | expr '>' expr
    | expr '&' expr
    | expr '|' expr
    | '-' expr %prec UMINUS
    | '+' expr %prec UPLUS
    | '!' expr
    ;
