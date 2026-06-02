%pointer
%option noyywrap

%{
enum tokens {
    NUMBER = 258,
    IDENT = 259
};
int yylval;
%}

letra           [a-zA-Z_]
digito          [0-9]

%%

{digito}+   { yylval = atoi(yytext); printf("TOKEN NUMBER (258) valor=%d\n", yylval); return NUMBER; }
"+"         { printf("TOKEN '+'\n"); return '+'; }
"-"         { printf("TOKEN '-'\n"); return '-'; }
""         { printf("TOKEN ''\n"); return '*'; }
"/"         { printf("TOKEN '/'\n"); return '/'; }
{letra}({letra}|{digito})*  { printf("TOKEN IDENT (259) lexema=%s\n", yytext); return IDENT; }
[ \t\n]     { }
.           { }

%%

int main(void) {
    while(yylex());
    return 0;
}