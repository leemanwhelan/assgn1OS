%{
<<<<<<< HEAD
	# define YY_DECL char **yylex()
	int _numargs = 10;
	char *_args[10];
	int _argcount = 0;
=======
# define YY_DECL char **yylex()
int _numargs = 10;
char *_args[10];
int _argcount = 0;
>>>>>>> 91bf46bb72b25eca50cb2caac941eae4032419e5
%}

WORD [a-zA-Z0-9\/\.-]+
SPECIAL [()><|&;*]

%%
	_argcount = 0; _args[0] = NULL;

{WORD}|{SPECIAL} {
	if (_argcount < _numargs) {
		_args[_argcount++] = (char *)strdup(yytext);
		_args[_argcount] = NULL;
	}
   }

\n return _args;

[ \t]+

.

%%

char **getline() { return yylex(); }
