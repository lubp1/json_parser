

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
int t = 0;
%}

%token STRING NUMERO BOOLEANO NULO ACOLCHETE FCOLCHETE VIRGULA ACHAVE FCHAVE PONTOS

%%

PROGRAMA:
        PROGRAMA OBJETO { t=1; }
        |
        ;

OBJETOIN:
        OBJETOIN VIRGULA OBJETOIN { }
        |
        STRING PONTOS VALOR { printf("a"); }
        ;

OBJETO:
        ACHAVE OBJETOIN FCHAVE{ }
        ;

VALOR:
        STRING { printf("b");}
        |
        NUMERO { printf("b");}
        |
        OBJETO { }
        |
        ARRAY { }
        |
        BOOLEANO { }
        |
        NULO { }
        ;

ARRAYIN:
        ARRAYIN VIRGULA ARRAYIN { }
        |
        VALOR { }
        ;

ARRAY:
        ACOLCHETE FCOLCHETE { }
        |
        ACOLCHETE ARRAYIN FCOLCHETE { }
        ;


%%

void yyerror(char *s) {
}

int main() {
  yyparse();
    if(t == 1) {
      printf("VALIDO\n");
    } else {
      printf("INVALIDO\n");
    }
    return 0;
}
