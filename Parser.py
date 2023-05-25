#!/usr/bin/env python3

import antlr4
import sys
from ParserLexer import ParserLexer
from ParserParser import ParserParser

# Nome do arquivo
fileName = "exemplo1.txt"; # Exemplos: exemplo1.txt, exemplo2.txt, exemplo3.txt

if len(sys.argv) > 1:
    fileName = sys.argv[1]

# Mostra o arquivo que esta sendo testado
print(f"Arquivo sendo testado: {fileName}\n\n")

# Cria um stream de caracteres a partir do código-fonte
input_stream = antlr4.FileStream(fileName)

# Cria um lexer a partir do stream de caracteres
lexer = ParserLexer(input_stream)

# Cria um stream de tokens a partir do lexer
token_stream = antlr4.CommonTokenStream(lexer)

# Cria um parser a partir do stream de tokens
parser = ParserParser(token_stream)

# Chama a regra de produção inicial do seu arquivo.g4
tree = parser.programa() # Exemplo: parser.programa()

# Imprime a árvore de análise sintática gerada
print(tree.toStringTree())