build:
	swift build --configuration release

clean:
	swift package clean

install: clean build
	cp -f ".build/release/mdpp" "/usr/local/bin/mdpp"

uninstall:
	rm "/usr/local/bin/mdpp"