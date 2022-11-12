THEMES  = $(shell cd themes && ls -1)

build:
	#(cd "themes/$$THEME" && ( test -h Thruk || ln -sfn $(OMD_ROOT)/share/thruk Thruk ) );
	set -e; \
	for THEME in $(THEMES); do \
		make -C "themes/$$THEME" build; \
	done

clean:
	rm -f base.css
	for THEME in $(THEMES); do \
		make -C "themes/$$THEME" clean; \
	done
