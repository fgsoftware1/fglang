%{
	#include <stdio.h>
	#include <string.h>

	#include "functions.h"
	#include "validators.h"

	extern char Data_Type[50];

	extern void yyerror();
	extern int yylex();
	extern char* yytext;
	extern int yylineno;

	void storeDataType(char*);
	int isDuplicate(char*, char*);
	void storeIdentifier(char*,char*);
	void DuplicateIdentifierError(char*);
	char* retrieveDataType();
	void clearBuffers();
	int isValidAssignment(char*);
	void AssignmentError(char*);
	char* extractIdentifier(char[]);

	int noOfArrayIdentifiers=0;
	char extractedIdentifier[50][50];
%}

%define parse.lac full
%define parse.error verbose

%union {
	int intVal;
	char* dataType;
	char* strVal;
	float floatVal;
	char charVal;
}

%token	COMMA SQ SC EQUALS
%token 	BO BC CBO CBC BBO BBC

%token <charVal>  CHARACTER_VALUE
%token <intVal>   INTEGER_VALUE
%token <floatVal> FLOAT_VALUE
%token <strVal> STRING_VALUE


%token <intVal> INT
%token <floatVal> FLOAT
%token <strVal> STRING
%token <dataType> DATA_TYPE
%token <strVal> IDENTIFIER   ARRAY_IDENTIFIER
%token <strVal> STRUCT

%type <strVal> DECLARATION
%type <strVal> EXPRESSION
%type <strVal> FUNCTION_DECLARATION

%%

DECLARATION : EXPRESSION  SC                              { clearBuffers(); }
	|   FUNCTION_DECLARATION SC
	| STRUCT  IDENTIFIER  STRUCTURE_DEFINITION  SC
	| STRUCT  IDENTIFIER  STRUCTURE_DEFINITION  IDENTIFIER_LIST   SC
	| DECLARATION EXPRESSION  SC                        { clearBuffers(); }
	| DECLARATION FUNCTION_DECLARATION SC
	| DECLARATION   STRUCT  IDENTIFIER  STRUCTURE_DEFINITION  SC
	| DECLARATION   STRUCT  IDENTIFIER  STRUCTURE_DEFINITION  IDENTIFIER_LIST   SC

	| error '>'                     {/* ' > ' stops execution all together */}
	;

EXPRESSION  : DATA_TYPE IDENTIFIER              {
								  if(!isDuplicate($2,retrieveDataType())){
									storeIdentifier($2,retrieveDataType());
									storeDataType($1);
								  }else{
									DuplicateIdentifierError($2);
								  }
								}

	  | EXPRESSION  EQUALS  NUMBER            {;}

	  | EXPRESSION  COMMA IDENTIFIER          {
								  if(!isDuplicate($3,retrieveDataType())){
									storeIdentifier($3,retrieveDataType());
								  }else{
									DuplicateIdentifierError($3);
								  }
								}

	  | DATA_TYPE   ARRAY_IDENTIFIER            {

								  strcpy(extractedIdentifier[noOfArrayIdentifiers],extractIdentifier($2));
								  if(!isDuplicate(extractedIdentifier[noOfArrayIdentifiers],retrieveDataType())){
									storeIdentifier(extractedIdentifier[noOfArrayIdentifiers],retrieveDataType());
									storeDataType($1);
								  }else{
									DuplicateIdentifierError(extractedIdentifier[noOfArrayIdentifiers]);
								  }
								  noOfArrayIdentifiers++;
								}

	  | EXPRESSION  EQUALS  CBO  PARAMETER_LIST CBC

	  | EXPRESSION COMMA ARRAY_IDENTIFIER             {
									strcpy(extractedIdentifier[noOfArrayIdentifiers],extractIdentifier($3));
									if(!isDuplicate(extractedIdentifier[noOfArrayIdentifiers],retrieveDataType())){
									  storeIdentifier(extractedIdentifier[noOfArrayIdentifiers],retrieveDataType());
									}else{
									  DuplicateIdentifierError(extractedIdentifier[noOfArrayIdentifiers]);
									}
									noOfArrayIdentifiers++;
								  }

	  | error '>'                   {/* no need to call yyerror cuz of line 1570 of y.tab.c*/}
	  ;

NUMBER    : INTEGER_VALUE                 {if(!isValidAssignment("int")){ AssignmentError(itoa($1));}}
	  | FLOAT_VALUE                   {if(!isValidAssignment("float")){ AssignmentError(ftoa($1));}}
	  | CHARACTER_VALUE                 {if(!isValidAssignment("char")){ AssignmentError(ctoa($1));}   }
	  | STRING_VALUE                  {if(!isValidAssignment("char*")){ AssignmentError($1);} }
	  ;

PARAMETER_LIST  : NUMBER
		| PARAMETER_LIST  COMMA   NUMBER
		  |   NUMBER EQUALS NUMBER                        { yyerror("Two or more equal signs are not allowed in C");}
		  |   error '>'
		;

STRUCTURE_DEFINITION  : CBO  DECLARATION  CBC
			;

FUNCTION_DECLARATION : DATA_TYPE IDENTIFIER BO DATA_TYPE_LIST BC {

										  if(!isDuplicate($2,retrieveDataType())){
											storeIdentifier($2,retrieveDataType());
											storeDataType($1);
										  }else{
											DuplicateIdentifierError($2);
										  }

										}
		  ;

IDENTIFIER_LIST     : IDENTIFIER
			| IDENTIFIER_LIST   COMMA   IDENTIFIER
			;

DATA_TYPE_LIST      : DATA_TYPE
			| DATA_TYPE_LIST  COMMA DATA_TYPE
			;

%%

int main(){
	yyparse();
	printf("No Errors!\n");
	return 0;
}
