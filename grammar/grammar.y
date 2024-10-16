%token VAL
%token VAR
%token ID

%token INT_KEYWORD
%token CHAR_KEYWORD
%token DOUBLE_KEYWORD
%token STRING_KEYWORD

%token INT_LITERAL
%token CHAR_LITERAL
%token DOUBLE_LITERAL
%token STRING_LITERAL
%token TRUE_LITERAL
%token FALSE_LITERAL

%token IF
%token ELSE
%token WHILE
%token DO
%token FUNC
%token FOR
%token IN

%token CLASS
%token PRIVATE
%token PROTECTED
%token INTERNAL
%token PUBLIC
%token OPEN
%token THIS
%token SUPER
%token OVERRIDE
%token CONSTRUCTOR

%nonassoc INCREMENT
%nonassoc DECREMENT
%nonassoc '('
%nonassoc ')'
%nonassoc '['
%nonassoc ']'

%start program

%%

program: type
    ;

type: INT_KEYWORD
    | CHAR_KEYWORD
    | DOUBLE_KEYWORD
    | STRING_KEYWORD
    ;

literal: INT_LITERAL
    | CHAR_LITERAL
    | DOUBLE_LITERAL
    | STRING_LITERAL
    | TRUE_LITERAL
    | FALSE_LITERAL
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

varDecl: VAR ID ':' type
    | VAR ID '=' expr
    ;

varDeclList: varDecl
    | varDeclList ',' varDecl
    ;

valDecl : VAL ID ':' type;
    | VAL ID '=' expr;

valDeclList: valDecl
    | valDeclList ',' valDecl
    ;

funcArg: ID ':' type
    ;

funcArgList: funcArg
    | funcArgList ',' funcArg
    ;

funcArgListE: funcArgList
    |/*empty*/
    ;

funcDecl: FUNC ID '(' funcArgListE ')' blockStmt
    | FUNC ID '(' funcArgListE ')' ':' type blockStmt
    ;

classMemberType: varDecl
    | valDecl
    | funcDecl;
    ;

classMember: classMemberType
    | classMemberMods classMemberType
    ;

classMemberMods: PRIVATE
    | PROTECTED
    | INTERNAL
    | PUBLIC
    | OVERRIDE
    ;

classMemberList: classMember
    | classMemberList classMember
    ;

classMemberListE: classMemberList
    |/*empty*/
    ;

%%