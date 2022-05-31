%{
    #include "parser.c"
%}

%option noyywrap

%%

[\t\r\n\f] ; /*ignore whitespace*/
[0-9]+        { yylval.intVal = atoi(yytext); return INTEGER_LITERAL; } /*integer values*/
[0-9]+.[0-9]+ { yylval.floatVal = atof(yytext); return FLOAT_LITERAL; } /*float values*/
"+"           { return PLUS; }
"-"           { return MINUS; }
"*"           { return MULT; }
"/"           { return DIV; }
";"           { return SEMI; }
"("           { return LP; }
")"           { return RP; }
"{"           { return LB; }
"}"           { return RB; }
"["           { return LBRACKET; }
"]"           { return RBRACKET; }
"if"          { return IF; }
"else"        { return ELSE; }
"elseif"     { return ELSEIF; }
