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

exprList: expr
    | exprList ',' expr
    ;

exprListE : exprList
    | /*empty*/
    ;

stmt: expr
    | expr ';'
    ; /* Будут добавлены позже*/

stmtList: stmt
    | stmtList stmt
    ;

blockStmt: '{' stmtList'}'
    | '{' '}'
    ;

ifStmt: IF '(' expr ')' expr
    | IF '(' expr ')' blockStmt
    | IF '(' expr ')' ELSE blockStmt
    ;

whileStmt: WHILE '(' expr ')' expr
     | WHILE '(' expr ')' blockStmt
     ;

doWhileStmt: DO stmt WHILE '(' expr ')'
    | DO blockStmt WHILE '(' expr ')'
    ;

forStmt: FOR '(' ID IN expr ')' stmt
    | FOR '(' ID IN expr ')' blockStmt
    ;
