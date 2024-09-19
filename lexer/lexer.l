%option c++
%option noyywrap
%option never-interactive

%{
#include <bits/stdc++.h>
using std::cout; using std::endl;

#define PRINT_OPERATOR() cout << "Found operator: " << yytext << endl;
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

%%