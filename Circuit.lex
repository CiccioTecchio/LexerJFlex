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

%%

										// Now for the actual tokens and assocated actions
{keyword}	{ return new Symbol(CircuitSym.KEYWORD); }
{whitespace} { /* ignore */ }
[^]			{ return new Symbol(CircuitSym.error);}
//separator 	{ return new Symbol(CircuitSym.SEPARATOR,yytext()); }
<<EOF>> {return new Symbol(CircuitSym.EOF);} 

