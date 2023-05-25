grammar Parser;

programa: bloco;

bloco: '{' codigos '}';

codigos:codigo+;

codigo: func
      | loop
      | comparador
      | decl
      | list
      | print
      | comment;

comment: '//' var;

returnStatement: 'return' var;

func: type STRING '(' var ')' bloco returnStatement
    | type STRING '(' var (',' var)* ')' bloco returnStatement
    | type STRING '(' ')' bloco returnStatement
    | STRING '(' var ')';

type: 'int'
    | 'real'
    | 'string'
    | 'bool';

var: INT
   | REAL
   | STRING
   | BOOL;

INT: [0-9]+;

REAL: [0-9]+;

STRING: [a-zA-Z_][a-zA-Z0-9_]*;

BOOL: 'TRUE' | 'FALSE';

loop: whileLoop
    | forLoop;

whileLoop: 'while' '(' cond ')' bloco;

forLoop: 'for' '(' init ';' cond ';' inc ')' bloco;

init: type decl;

cond: expr
    | list;

inc: var '=' expr_mat;

expr: var '<' var
    | var '>' var
    | var '==' var
    | var '<=' var
    | var '>=' var
    | var '!=' var
    | var '%' var;

expr_mat: var '+' var
        | var '–' var
        | var '*' var
        | var '/' var;

decl: var '=' func
    | var '=' var
    | inc 
    | type var;

comparador: ifStatement
          | ifElseStatement
          | ifElseIfStatement
          | ifElseIfElseStatement;

ifStatement: 'If' '(' cond ')' bloco;

ifElseStatement: 'if' '(' cond ')' bloco 'else' bloco;

ifElseIfStatement: 'if' '(' cond ')' bloco 'else' 'if' '(' cond ')' bloco;

ifElseIfElseStatement: 'if' '(' cond ')' bloco 'else' 'if' '(' cond ')' bloco 'else' bloco;

list: type STRING '[]' '=' '(' var ')'
    | type STRING '[]' '=' '(' var ',' var*')'
    | type STRING '[]' '=' '(' var ',' var+')'
    | type STRING '[]' '=' '(' var ',' var+')'*
    | type STRING '[]' '=' '(' var (',' var)* ')'
    | var '[' var ']' '=' var;

print: 'print' '(' var ')'
     | 'print' '(' var (',' var)* ')'
     | 'print' '(' var '+' var ')'
     | 'print' '(' var '+' var (',' var)* ')';

// Ignorar espaços em branco e quebras de linha
WS: [ \t\r\n]+ -> skip;
