%{
    #include <stdlib.h>
    #include <stdio.h>
    int yydebug=1;
    extern int yylex();
    int yywrap(void) {};
    int yyerror(char *s) {
        printf("%s\n",s);
    }
    FILE * inputFile;
%}

%token        tMAIN tFIN tCONST tVOID tINT tCHAR tFLOAT tPRINTF tEQ tADD tSUB tMUL tDIV tVIRG tPTvirg tPARo tPARf tACCo tACCf tVAR tNULL tREAL tNOM tNB

%left tADD tSUB
%left tDIV tMUL
%right tPOW
%start S;

%%
S: MAIN;
MAIN: TYPE tMAIN tPARo VARS tPARf tACCo BODY tACCf { fprintf(inputFile,"main"); } ;
TYPE:
        tINT    { fprintf(inputFile,"INT\n"); }
    |   tFLOAT  { fprintf(inputFile,"FLOAT\n"); }
    |   tCHAR   { fprintf(inputFile,"CHAR\n"); }
    |   tVOID   { fprintf(inputFile,"VOID\n"); }
    ;
BODY: DECLARATION INSTRUCT ;
VARS: 
                
    |   tVAR LVARS 
    ;
LVARS: 
    
    | tVIRG tVAR LVARS      
    ;
DECLARATION:

    |   TYPE tVAR tPTvirg 
    |   TYPE tVAR tEQ VAL tPTvirg 
    ;
INSTRUCT: 

    | tVAR tEQ EXPRESSION tPTvirg 
    ;

EXPRESSION:
        tNB { fprintf(inputFile,"NB"); }
    |   EXPRESSION tADD EXPRESSION { fprintf(inputFile,"ADD %d %d \n", $1 ,$3); }
    |   EXPRESSION tSUB EXPRESSION { fprintf(inputFile,"SUB %d %d \n", $1 ,$3); }
    |   EXPRESSION tMUL EXPRESSION { fprintf(inputFile,"MUL %d %d \n", $1 ,$3); } 
    |   EXPRESSION tDIV EXPRESSION { fprintf(inputFile,"DIV %d %d \n", $1 ,$3); }
    |   tSUB EXPRESSION %prec tMUL { fprintf(inputFile,"MOINS %d \n", $2); }
    ;

VAL:  
        tNB
    |   tREAL
    |   tVAR
    ;

%%
int main(){
    printf("Début\n");   
    inputFile= fopen( "asm.txt", "w" ); 
    if ( inputFile == NULL ) {
        printf( "Cannot open file %s\n", "ASM" );
        exit( 0 );
    }
    yyparse();
    fclose( inputFile );
    printf("FIN\n");
    return 0;
}