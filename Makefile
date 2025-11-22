
.PHONY:
clean:
	rm -f download build

build : hi.f
	sfk64 hi gild program build bye

download : url2file.f build
	./build url2file.f


simple: simple.f
	sf simple.f
