C = gcc

all: bison_file flex_file parser execute_parse

# Compiles the bison file
bison_file:
	@echo "Compiling bison file"
	bison -dv parser.y

# Compiles the flex file
flex_file:
	@echo "Compiling flex file"
	flex parser.l

# Generates the executable file "parser"
parser:
	@echo ""
	@echo "Generating executable.."
	$(C) -o parser lex.yy.c parser.tab.c -ly -ll

# Executes the executable "parser" / creating a new text file
execute_parse:
	@echo ""
	@echo "Executing Parser"
	./parser

# This will clean up the executable and extra files created by
# flex and bison, also removes parsed text file
clean:
	@echo "Now removing 'parser' executable and any extra files"
	rm parser lex.yy.c parser.tab.c parser.tab.h parsed.txt parser.output
