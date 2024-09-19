%option c++
%option noyywrap
%option never-interactive

%{
#include <bits/stdc++.h>
using std::cout; using std::endl;

#define PRINT_OPERATOR() cout << "Found operator: " << yytext << endl;
#define PRINT_HARD_KEYWORD() cout << "Found hard keyword: " << yytext << endl;
#define PRINT_SOFT_KEYWORD() cout << "Found soft keyword: " << yytext << endl;
#define PRINT_MODIFIER_KEYWORD() cout << "Found modifier keyword: " << yytext << endl;
%}

%%

//Операторы
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

//------------------------------Ключевые слова------------------------------//
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

//Мягкие ключевые слова
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

//Ключевы слов - модификаторы
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
//------------------------------Ключевые слова------------------------------//

%%