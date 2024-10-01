%option noyywrap
%option never-interactive
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <limits.h>

#define PRINT_ERROR() printf("Found error in line: %d\n", yytext)
#define PRINT_OPERATOR() printf("Found operator: %s\n", yytext)
#define PRINT_HARD_KEYWORD() printf("Found hard keyword: %s\n", yytext)
#define PRINT_SOFT_KEYWORD() printf("Found soft keyword: %s\n", yytext)
#define PRINT_MODIFIER_KEYWORD() printf("Found modifier keyword: %s\n", yytext)
#define PRINT_IDENTIFIER() printf("Found identifier: %s\n", yytext)
#define PRINT_DECIMAL_INTEGER() printf("Found decimal integer: %d\n", _integerNumber)
#define PRINT_BINARY_INTEGER() printf("Found binary integer: %d\n", _integerNumber)
#define PRINT_HEXADECIMAL() printf("Found hexadecimal integer: %d\n", _integerNumber)
%}

%%

%{
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
%}

%{
    char _string[SHRT_MAX];
    long long _integerNumber;
    double _doubleNumber;
%}

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
as\? { PRINT_HARD_KEYWORD(); }
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
typealias { PRINT_HARD_KEYWORD(); }
typeof { PRINT_HARD_KEYWORD(); }
val { PRINT_HARD_KEYWORD(); }
var { PRINT_HARD_KEYWORD(); }
when { PRINT_HARD_KEYWORD(); }
while { PRINT_HARD_KEYWORD(); }


by { PRINT_SOFT_KEYWORD(); }
catch { PRINT_SOFT_KEYWORD(); }
constructor { PRINT_SOFT_KEYWORD(); }
delegate { PRINT_SOFT_KEYWORD(); }
dynamic { PRINT_SOFT_KEYWORD(); }
field { PRINT_SOFT_KEYWORD(); }
file { PRINT_SOFT_KEYWORD(); }
finally { PRINT_SOFT_KEYWORD(); }
get { PRINT_SOFT_KEYWORD(); }
import { PRINT_SOFT_KEYWORD(); }
init { PRINT_SOFT_KEYWORD(); }
param { PRINT_SOFT_KEYWORD(); }
property { PRINT_SOFT_KEYWORD(); }
receiver { PRINT_SOFT_KEYWORD(); }
set { PRINT_SOFT_KEYWORD(); }
setparam { PRINT_SOFT_KEYWORD(); }
value { PRINT_SOFT_KEYWORD(); }
where { PRINT_SOFT_KEYWORD(); }


abstract { PRINT_MODIFIER_KEYWORD(); }
actual { PRINT_MODIFIER_KEYWORD(); }
annotation { PRINT_MODIFIER_KEYWORD(); }
companion { PRINT_MODIFIER_KEYWORD(); }
const { PRINT_MODIFIER_KEYWORD(); }
crossinline { PRINT_MODIFIER_KEYWORD(); }
data { PRINT_MODIFIER_KEYWORD(); }
enum { PRINT_MODIFIER_KEYWORD(); }
expect { PRINT_MODIFIER_KEYWORD(); }
external { PRINT_MODIFIER_KEYWORD(); }
final { PRINT_MODIFIER_KEYWORD(); }
infix { PRINT_MODIFIER_KEYWORD(); }
inline { PRINT_MODIFIER_KEYWORD(); }
inner { PRINT_MODIFIER_KEYWORD(); }
internal { PRINT_MODIFIER_KEYWORD(); }
lateinit { PRINT_MODIFIER_KEYWORD(); }
noinline { PRINT_MODIFIER_KEYWORD(); }
open { PRINT_MODIFIER_KEYWORD(); }
operator { PRINT_MODIFIER_KEYWORD(); }
out { PRINT_MODIFIER_KEYWORD(); }
override { PRINT_MODIFIER_KEYWORD(); }
private { PRINT_MODIFIER_KEYWORD(); }
protected { PRINT_MODIFIER_KEYWORD(); }
public { PRINT_MODIFIER_KEYWORD(); }
reified { PRINT_MODIFIER_KEYWORD(); }
sealed { PRINT_MODIFIER_KEYWORD(); }
suspend { PRINT_MODIFIER_KEYWORD(); }
tailrec { PRINT_MODIFIER_KEYWORD(); }
vararg { PRINT_MODIFIER_KEYWORD(); }

[A-Za-z_][A-Za-z0-9_]* { PRINT_IDENTIFIER(); }

[0-9](\_?[0-9])* { _string[0] = 0;
    strcat(_string, yytext);
    if (_string[0] == '0' && strlen(_string) > 1)
    {
        PRINT_ERROR();
        printf("Leading zero in integer type");
    }
    else
    {
        removeUnderscores(_string);
        _integerNumber = strtoll(_string);
        PRINT_DECIMAL_INTEGER();
    }
}

0(b|B)[0-1](_?[0-1]+)* { _string[0] = 0;
    strcat(_string, yytext);
    removeUnderscores(_string);
    int _integerNumber = strtoll(_string + 2, NULL, 2);
    PRINT_BINARY_INTEGER();
}

0(x|X)[0-9a-fA-F](_?[0-9a-fA-F]+)* {
    _string[0] = 0;
    strcat(_string, yytext);
    removeUnderscores(_string);
    _integerNumber = strtoll(_string + 2, NULL, 16);
    PRINT_HEXADECIMAL_INTEGER();
}

. {}
%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}