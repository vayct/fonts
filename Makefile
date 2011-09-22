fonts=6x10 6x10B 7x13 7x13B 7x13O 7x13BO
files=$(fonts:=.pcf.gz)
dir=/usr/share/fonts/dylex

all: $(files)

%.pcf: %.bdf
	bdftopcf -t -o $@ $<

%.pcf.gz: %.pcf
	gzip -f $<

install: all
	install $(files) $(dir)
	mkfontdir $(dir)

clean:
	rm -f *.pcf.gz *.pcf
