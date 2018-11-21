// Circuit.lex
//
// Description of lexer for circuit description language.
//
// Ian Stark

import java_cup.runtime.Symbol; 		//This is how we pass tokens to the parser

%%

										// Declarations for JFlex
%unicode 								// We wish to read text files
%cupsym CircuitSym
%cup 									// Declare that we expect to use Java CUP

										// Abbreviations for regular expressions
whitespace = [ \r\n\t\f]
keyword = if|then|else|double|float|null|int
relop = <|>|>=|<=|<>|=|<--
sign = "+"|"-"
nconst = 0?|{sign}?[1-9][0-9]*
rconst = 0?|{sign}?[1-9]+.0*[1-9]+
//7.83E+09
econst = {rconst}E{sign}0*[1-9]+
id = [:jletter:][:jletterdigit:]*
separator = "{"|"}"|"["|"]"|"("|")"|";"|","|"."
%%

										// Now for the actual tokens and assocated actions
{keyword}	{ return new Symbol(CircuitSym.KEYWORD); }
{relop}		{ return new Symbol(CircuitSym.RELOP); }
{nconst}	{ return new Symbol(CircuitSym.NCONST); }
{rconst}	{ return new Symbol(CircuitSym.RCONST); }
{id}		{ return new Symbol(CircuitSym.ID); }
{separator}	{ return new Symbol(CircuitSym.SEPARATOR); }
{sign}		{ return new Symbol(CircuitSym.SIGN); }
{econst}	{ return new Symbol(CircuitSym.ECONST); }
{whitespace} { /* ignore */ }
[^]			{ return new Symbol(CircuitSym.error);}
//separator 	{ return new Symbol(CircuitSym.SEPARATOR,yytext()); }
<<EOF>> {return new Symbol(CircuitSym.EOF);} 

