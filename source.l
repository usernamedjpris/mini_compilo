%{
    #include "y.tab.h"
%}
%%
" "
"   "
"\n"
"main"                                   		                      return(tMAIN);
"const"                                  		                      return(tCONST);
"void"                                   		                      return(tVOID);
"int"                                    		                      return(tINT);
"char"                                   		                      return(tCHAR);
"float"                                  		                      return(tFLOAT);
"printf"                                 		                      return(tPRINTF);
"="                                      		                      return(tEQ);
"+"                                      		                      return(tADD);
"-"                                      		                      return(tSUB);
[0-9]*                                   		                      yylval.nb=atof(yytext) ; return(tNB);
[0-9]*("."[0-9]*)                        		                      return(tREAL);
"*"                                      		                      return(tMUL);
"^"                                      		                      return(tPOW);
"/"                                      		                      return(tDIV);
";"                                      		                      return(tPTvirg);
"("                                      		                      return(tPARo);
")"                                      		                      return(tPARf);
"{"                                      		                      return(tACCo);
"}"                                      		                      return(tACCf);
"NULL"                                   		                      return(tNULL);
([a-zA-Z]|_)(([0-9]|[a-zA-Z])|_)*                                 yylval.var=strdup(yytext) ; return(tVAR);

%%



/*int main(void) {
    printf("Début\n");
    yylex();
    return 0;
}*/
/*%{
#include "global.h"
#include "gram.h"
#include <stdlib.h>
%}*/
