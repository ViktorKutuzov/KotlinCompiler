%option c++
%option noyywrap
%option never-interactive

%{
#include <bits/stdc++.h>
using std::cout; using std::endl;

#define PRINT_OPERATOR() cout << "Found operator: " << yytext << endl;
#define PRINT_HARD_KEYWORD() cout << "Found hard keyword: " << yytext << endl;
%}

%%

//Операторы
+ { PRINT_OPERATOR(); }
- { PRINT_OPERATOR(); }
* { PRINT_OPERATOR(); }
/ { PRINT_OPERATOR(); }
% { PRINT_OPERATOR(); }
= { PRINT_OPERATOR(); }
+= { PRINT_OPERATOR(); }
-= { PRINT_OPERATOR(); }
*= { PRINT_OPERATOR(); }
/= { PRINT_OPERATOR(); }
%= { PRINT_OPERATOR(); }
++ { PRINT_OPERATOR(); }
-- { PRINT_OPERATOR(); }
&& { PRINT_OPERATOR(); }
|| { PRINT_OPERATOR(); }
! { PRINT_OPERATOR(); }
== { PRINT_OPERATOR(); }
!= { PRINT_OPERATOR(); }
=== { PRINT_OPERATOR(); }
!== { PRINT_OPERATOR(); }
< { PRINT_OPERATOR(); }
> { PRINT_OPERATOR(); }
<= { PRINT_OPERATOR(); }
>= { PRINT_OPERATOR(); }
[ { PRINT_OPERATOR(); }
] { PRINT_OPERATOR(); }
!! { PRINT_OPERATOR(); }
?. { PRINT_OPERATOR(); }
?: { PRINT_OPERATOR(); }
:: { PRINT_OPERATOR(); }
.. { PRINT_OPERATOR(); }
..< { PRINT_OPERATOR(); }
: { PRINT_OPERATOR(); }
? { PRINT_OPERATOR(); }
-> { PRINT_OPERATOR(); }
@ { PRINT_OPERATOR(); }
; { PRINT_OPERATOR(); }
$ { PRINT_OPERATOR(); }
_ { PRINT_OPERATOR(); }

//Ключевые слова

//Жесткие ключевые слова
as { PRINT_HARD_KEYWORD(); }
as? { PRINT_HARD_KEYWORD(); }
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

%%