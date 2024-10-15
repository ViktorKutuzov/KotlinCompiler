%option noyywrap
%option never-interactive
%option yylineno
%option stack

%x STRING
%x MULTILINE_COMMENT

%{
#include <stdio.h>
#include <string.h>
#include <limits.h>

#define PRINT_UNSUPPORTED() printf("This language option is not supported at line %d: %s\n", yylineno, yytext)
#define PRINT_ERROR(_errorMsg) printf("Found error in line %d: %s - %s\n", yylineno, yytext, _errorMsg)
#define PRINT_OPERATOR() printf("Found operator: %s\n", yytext)
#define PRINT_HARD_KEYWORD() printf("Found hard keyword: %s\n", yytext)
#define PRINT_SOFT_KEYWORD() printf("Found soft keyword: %s\n", yytext)
#define PRINT_MODIFIER_KEYWORD() printf("Found modifier keyword: %s\n", yytext)
#define PRINT_IDENTIFIER() printf("Found identifier: %s\n", yytext)
#define PRINT_DECIMAL_INTEGER() printf("Found decimal integer: %d\n", _integerNumber)
#define PRINT_BINARY_INTEGER() printf("Found binary integer: %d\n", _integerNumber)
#define PRINT_HEXADECIMAL_INTEGER() printf("Found hexadecimal integer: %d\n", _integerNumber)
#define PRINT_FLOATING_POINT_NUMBER() printf("Found double number: %f\n", _doubleNumber)
#define PRINT_STRING_LITERAL() printf("Found string literal: %s\n", stresc)
#define PRINT_SINGLE_LINE_COMMENT() printf("Found single line comment: %s\n", yytext)
#define PRINT_MULTILINE_COMMENT() printf("Found multi line comment: %s\n", stresc)
#define PRINT_START_OF_INTERPOLATION() printf("Interpolation starts\n", yytext)
#define PRINT_END_OF_INTERPOLATION() printf("Interpolation ends\n", yytext)
#define PRINT_VARIABLE_INTERPOLATION() printf("Variable interpolation: %s\n", yytext)

void removeUnderscores(char* str);

%}

%%

%{
    int stack_size = 0;
    char _string[SHRT_MAX];
    long long _integerNumber;
    double _doubleNumber;
    char stresc[1024];
    int stresc_len = 0;
%}

\" {
    BEGIN(STRING);
    stresc_len = 0;
    stresc[0] = '\0';
}

<STRING>\$\{ {
    yy_push_state(INITIAL);
    ++stack_size;
    PRINT_START_OF_INTERPOLATION();
}
<STRING>$[A-Za-z_][A-Za-z0-9_]* {
    PRINT_VARIABLE_INTERPOLATION();
}
<STRING>[^\"\\\n${]+ {
    if (stresc_len + yyleng < sizeof(stresc) - 1) {
        strcat(stresc, yytext);
        stresc_len += yyleng;
    }
}
<STRING>\\n {
    if (stresc_len < sizeof(stresc) - 1) {
        stresc[stresc_len++] = '\n';
    }
}
<STRING>\\\" {
    if (stresc_len < sizeof(stresc) - 1) {
        stresc[stresc_len++] = '\"';
    }
}
<STRING>\\\\ {
    if (stresc_len < sizeof(stresc) - 1) {
        stresc[stresc_len++] = '\\';
    }
}
<STRING>\" {
    PRINT_STRING_LITERAL();
    BEGIN(INITIAL);
}

\+ { PRINT_OPERATOR(); }
\- { PRINT_OPERATOR(); }
\* { PRINT_OPERATOR(); }
\/ { PRINT_OPERATOR(); }
\% { PRINT_OPERATOR(); }
\= { PRINT_OPERATOR(); }
\+\= { PRINT_OPERATOR(); }
\-\= { PRINT_OPERATOR(); }
\*\= { PRINT_OPERATOR(); }
\/\= { PRINT_OPERATOR(); }
\%\= { PRINT_OPERATOR(); }
\+\+ { PRINT_OPERATOR(); }
\-\- { PRINT_OPERATOR(); }
\&\& { PRINT_OPERATOR(); }
\|\| { PRINT_OPERATOR(); }
\! { PRINT_OPERATOR(); }
\=\= { PRINT_OPERATOR(); }
\!\= { PRINT_OPERATOR(); }
\=\=\= { PRINT_OPERATOR(); }
\!\=\= { PRINT_OPERATOR(); }
\< { PRINT_OPERATOR(); }
\> { PRINT_OPERATOR(); }
\<\= { PRINT_OPERATOR(); }
\>\= { PRINT_OPERATOR(); }
\[ { PRINT_OPERATOR(); }
\] { PRINT_OPERATOR(); }
\!\! { PRINT_OPERATOR(); }
\?\. { PRINT_OPERATOR(); }
\?\: { PRINT_OPERATOR(); }
\:\: { PRINT_OPERATOR(); }
\.\. { PRINT_OPERATOR(); }
\.\.\< { PRINT_OPERATOR(); }
\: { PRINT_OPERATOR(); }
\? { PRINT_OPERATOR(); }
\-\> { PRINT_OPERATOR(); }
\@ { PRINT_OPERATOR(); }
\; { PRINT_OPERATOR(); }
\$ { PRINT_OPERATOR(); }
\_ { PRINT_OPERATOR(); }


as { PRINT_HARD_KEYWORD(); }
as\? { PRINT_UNSUPPORTED(); }
break { PRINT_HARD_KEYWORD(); }
class { PRINT_HARD_KEYWORD(); }
continue { PRINT_HARD_KEYWORD(); }
do { PRINT_HARD_KEYWORD(); }
else { PRINT_HARD_KEYWORD(); }
false { PRINT_HARD_KEYWORD(); }
for { PRINT_HARD_KEYWORD(); }
fun { PRINT_HARD_KEYWORD(); }
if { PRINT_HARD_KEYWORD(); }
in { PRINT_HARD_KEYWORD(); }
!in { PRINT_HARD_KEYWORD(); }
interface { PRINT_HARD_KEYWORD(); }
is { PRINT_HARD_KEYWORD(); }
!is { PRINT_HARD_KEYWORD(); }
null { PRINT_HARD_KEYWORD(); }
object { PRINT_HARD_KEYWORD(); }
package { PRINT_HARD_KEYWORD(); }
return { PRINT_HARD_KEYWORD(); }
super { PRINT_HARD_KEYWORD(); }
this { PRINT_HARD_KEYWORD(); }
throw { PRINT_HARD_KEYWORD(); }
true { PRINT_HARD_KEYWORD(); }
try { PRINT_HARD_KEYWORD(); }
typealias { PRINT_UNSUPPORTED(); }
typeof { PRINT_UNSUPPORTED(); }
val { PRINT_HARD_KEYWORD(); }
var { PRINT_HARD_KEYWORD(); }
when { PRINT_HARD_KEYWORD(); }
while { PRINT_HARD_KEYWORD(); }


by { PRINT_UNSUPPORTED(); }
catch { PRINT_SOFT_KEYWORD(); }
constructor { PRINT_SOFT_KEYWORD(); }
delegate { PRINT_UNSUPPORTED(); }
dynamic { PRINT_UNSUPPORTED(); }
field { PRINT_UNSUPPORTED(); }
file { PRINT_SOFT_KEYWORD(); }
finally { PRINT_SOFT_KEYWORD(); }
get { PRINT_SOFT_KEYWORD(); }
import { PRINT_SOFT_KEYWORD(); }
init { PRINT_SOFT_KEYWORD(); }
param { PRINT_SOFT_KEYWORD(); }
property { PRINT_UNSUPPORTED(); }
receiver { PRINT_UNSUPPORTED(); }
set { PRINT_SOFT_KEYWORD(); }
setparam { PRINT_SOFT_KEYWORD(); }
value { PRINT_SOFT_KEYWORD(); }
where { PRINT_SOFT_KEYWORD(); }


abstract { PRINT_MODIFIER_KEYWORD(); }
actual { PRINT_UNSUPPORTED(); }
annotation { PRINT_UNSUPPORTED(); }
companion { PRINT_UNSUPPORTED(); }
const { PRINT_MODIFIER_KEYWORD(); }
crossinline { PRINT_UNSUPPORTED(); }
data { PRINT_UNSUPPORTED(); }
enum { PRINT_MODIFIER_KEYWORD(); }
expect { PRINT_UNSUPPORTED(); }
external { PRINT_UNSUPPORTED(); }
final { PRINT_MODIFIER_KEYWORD(); }
infix { PRINT_UNSUPPORTED(); }
inline { PRINT_UNSUPPORTED(); }
inner { PRINT_UNSUPPORTED(); }
internal { PRINT_MODIFIER_KEYWORD(); }
lateinit { PRINT_UNSUPPORTED(); }
noinline { PRINT_UNSUPPORTED(); }
open { PRINT_MODIFIER_KEYWORD(); }
operator { PRINT_MODIFIER_KEYWORD(); }
out { PRINT_UNSUPPORTED(); }
override { PRINT_MODIFIER_KEYWORD(); }
private { PRINT_MODIFIER_KEYWORD(); }
protected { PRINT_MODIFIER_KEYWORD(); }
public { PRINT_MODIFIER_KEYWORD(); }
reified { PRINT_UNSUPPORTED(); }
sealed { PRINT_UNSUPPORTED(); }
suspend { PRINT_UNSUPPORTED(); }
tailrec { PRINT_UNSUPPORTED(); }
vararg { PRINT_UNSUPPORTED(); }

[A-Za-z_][A-Za-z0-9_]* { PRINT_IDENTIFIER(); }

[0-9](\_*[0-9])* { _string[0] = 0;
    strcat(_string, yytext);
    if (_string[0] == '0' && strlen(_string) > 1)
    {
        PRINT_ERROR("Leading zero in integer type");
        return -1;
    }
    else
    {
        removeUnderscores(_string);
        _integerNumber = strtoll(_string, NULL, 10);
        PRINT_DECIMAL_INTEGER();
    }
}

0[bB][0-9](_*[0-9]+)* {
    PRINT_ERROR("Incorrent binary number");
}

0[bB][0-1](_*[0-1]+)* { _string[0] = 0;
    strcat(_string, yytext);
    removeUnderscores(_string);
    int _integerNumber = strtoll(_string + 2, NULL, 2);
    PRINT_BINARY_INTEGER();
}

0[bB]\_* {
    PRINT_ERROR("Binary number cant start with leading underscore");
    return -1;
}

0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)* {
    _string[0] = 0;
    strcat(_string, yytext);
    removeUnderscores(_string);
    _integerNumber = strtoll(_string + 2, NULL, 16);
    PRINT_HEXADECIMAL_INTEGER();
}

0[xX][0-9a-zA-Z](_*[0-9a-zA-Z]+)* {
    PRINT_ERROR("Incorrent Hexadecimal number");
}

0[xX]\_* {
    PRINT_ERROR("Hexadecimal number cant start with leading underscore");
    return -1;
}

(([0-9](\_*[0-9])*)?\.)?[0-9](\_*[0-9])*((e|E)(\+|\-)?[0-9](\_*[0-9])*)?(f|F)? {
    _string[0] = 0;
    strcat(_string, yytext);
    removeUnderscores(_string);
    _doubleNumber = atof(_string);
    PRINT_FLOATING_POINT_NUMBER();
}

\/\/.* {
    PRINT_SINGLE_LINE_COMMENT();
}

"/*" {
    BEGIN(MULTILINE_COMMENT);
    stresc[0] = '\0';
}

<MULTILINE_COMMENT>[^*]*(\*+[^*/][^*]*)* {
    strcat(stresc, yytext);
}

<MULTILINE_COMMENT>"*/" {
    PRINT_MULTILINE_COMMENT();
    BEGIN(INITIAL);
}

<MULTILINE_COMMENT><<EOF>> {
    PRINT_ERROR("no closing */ in multiline comment");
    BEGIN(INITIAL);
}

"{" {
    printf("{\n");
}

"}" {
    if (stack_size && yy_top_state() == STRING) {
        PRINT_END_OF_INTERPOLATION();
        yy_pop_state();
        --stack_size;
    } else {
        printf("}\n");
    }
}

. {}

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

void removeUnderscores(char* str) {
        int src = 0;
        int dst = 0;
        while (str[src] != '\0')
        {
            if (str[src] != '_')
            {
                str[dst] = str[src];
                ++dst;
            }
            ++src;
        }
        str[dst] = '\0';
}