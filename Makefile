# builds docummentation.
all: quicklisp_documentation.html


quicklisp_documentation.html: quicklisp_documentation.txt
	perl emit-html.pl