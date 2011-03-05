# builds docummentation.
all: quicklisp_documentation.html


quicklisp_documentation.html: quicklisp_documentation.txt
	perl emit-html.pl quicklisp_documentation.txt quicklisp_documentation.html

release: 
	rm -f quicklisp_documentation.html
	perl emit-html.pl quicklisp_documentation.txt quicklisp_documentation.html
	git checkout gh-pages
	git add quicklisp_documentation.html
	git commit -m "Release build"
#git push
	git checkout master	

clean:
	rm quicklisp_documentation.html