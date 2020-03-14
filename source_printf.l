%%
" "                                     { }
"   "                                   { }
"main"                                  { printf(" tMAIN");}
"const"                                 { printf(" tCONST");}
"void"                                  { printf(" tVOID");}
"int"                                   { printf(" tINT");}
"char"                                  { printf(" tCHAR");}
"float"                                 { printf(" tFLOAT");}
"printf"                                { printf(" tPRINTF");}
"="                                     { printf(" tEQ");}
"+"                                     { printf(" tADD");}
"-"                                     { printf(" tSUB");}
[0-9]*                                  { printf(" tNB");}
[0-9]*("."[0-9]*)                       { printf(" tREAL");}
"*"                                     { printf(" tMUL");}
"^"                                     { printf(" tPOW");}    
"/"                                     { printf(" tDIV");}
"\n"                                    { printf(" tFIN");}
";"                                     { printf(" tPTvirg");}
"("                                     { printf(" tPARo");}
")"                                     { printf(" tPARf");}
"{"                                     { printf(" tACCo");}
"}"                                     { printf(" tACCf");}
"NULL"                                  { printf(" tNULL");}
([a-zA-Z]|_)(([0-9]|[a-zA-Z])|_)*       { printf(" tVAR");}
 
%%
int yywrap(void) {}

int main(void) {
    printf("Début\n");
    yylex();
    return 0;
}


