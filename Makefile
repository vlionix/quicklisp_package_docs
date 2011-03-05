# builds docummentation.
all: quicklisp_documentation.html


quicklisp_documentation.html: quicklisp_documentation.txt
	perl emit-html.pl quicklisp_documentation.txt quicklisp_documentation.html

clean:
	rm quicklisp_documentation.html