%{
    extern "C" {
        int yylex(void);
        void yyerror(char *s);
        int yyparse();
    }

    #include <iostream>

    using namespace std;
%}

%union{
    int intVal;
    float floatVal;
}

%start program

%token <intVal> INTEGER_LITERAL
%token <floatVal> FLOAT_LITERAL
%token SEMI
%type <floatVal> exp
%type <floatVal> statement
%left PLUS MINUS
%left MULT DIV

 %%
    program:
        | program statement { cout << "Result: " << $2 << endl; }
        ;

    statement: exp SEMI

    exp:
        INTEGER_LITERAL { $$ = $1; }
        | FLOAT_LITERAL { $$ = $1; }
        | exp PLUS exp  { $$ = $1 + $3; }
        | exp MINUS exp { $$ = $1 - $3; }
        | exp MULT exp  { $$ = $1 * $3; }
        | exp DIV exp   { $$ = $1 / $3; }
        ;

%%

int main(int argc, char **argv) {
    if (argc < 2) {
        cout << "Provide a filename to parse!" << endl;
        exit(1);
    }

    FILE *sourceFile = fopen(argv[1], "r");

    if (!sourceFile) {
        cout << "Could not open source file " << argv[1] << endl;
        exit(1);
    }

    yyin = sourceFile;
    yyparse();
}

void yyerror(char *s) {
    cerr << s << endl;
}
