# shellcheck shell=bash

task.default() {
	./bake package && ./bake link
}

task.package() {
	bake.assert_cmd 'zip'

	rm -f './out/foxxy.sublime-package'
	zip --recurse-paths --exclude='.git/*' --exclude='out/*' './out/foxxy.sublime-package' .
}

task.link() {
	ln -fs "$PWD/out/foxxy.sublime-package" "${XDG_CONFIG_HOME:-"$HOME/.config"}/sublime-text-3/Installed Packages/Local Sublime Text Foxxy.sublime-package"
}
