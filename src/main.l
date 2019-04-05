
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

CARACTER [^\"]
DIGITO [0-9]


%%

(["]{CARACTER}*["]) {
    return STRING;
}

{DIGITO}+([.]{DIGITO}+)? {
    return NUMERO;
}

[(true)|(false)] {
    return BOOLEANO;
}

(null) {
    return NULO;
}

\[ {
    return ACOLCHETE;
}

\] {
    return FCOLCHETE;
}

[,] {
    return VIRGULA;
}

[{] {
    return ACHAVE;
}

[}] {
    return FCHAVE;
}

[:] {
    return PONTOS;
}

[[:space:]]+ ;
[[:^space:]] ;



%%

int yywrap() {
  return 1;
}
