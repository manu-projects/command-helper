CURRENT_DIRECTORY=$(shell pwd)

APP_AUTHOR=neverkas
APP_NAME=command-helper

BASH_ALIAS_SYMBOL= ?
BASH_ALIASES_FILE=~/.bash_aliases

RUST_CARGO_BIN=/.cargo/bin
RUST_CARGO_PATH="PATH=$${PATH}:$${HOME}$(RUST_CARGO_BIN)"

BASH_ALIAS="alias $(BASH_ALIAS_SYMBOL)='make --no-print-directory -C $(CURRENT_DIRECTORY)' \
	CURRENT_TTY_PATH=$$(pwd) \
	APP_AUTHOR=$(APP_AUTHOR)"

BASH_ALIAS_ESCAPE_SLASH=$(subst /,\/,$(BASH_ALIAS))

POPUP_EDIT = sh ./scripts/edit-popup.sh $(TEXT_EDITOR)

APP_INSTALLED=$(shell grep -q "^alias ?='make.*APP_AUTHOR=neverkas" ~/.bash_aliases && echo true)

# es necesario el slash invertido '\' para escapar el caracter '/'
# porque se utiliza en linux-create-doc en el comando sed
DATE_NOW_FORMAT=$(shell date +"%d\/%m\/%Y")

# es necesario el slash invertido '\'  para escapar el caracter '#' porque GNU Make interpreta los # como comentarios
PATTERN_METADATA_DATE=(\#\# ACTUALIZADO:) ([[:digit:]]{1,2}\/[[:digit:]]{1,2}\/[[:digit:]]{4})
UPDATE_METADATA_DATE=sed -i -E 's/$(PATTERN_METADATA_DATE)/\1 $(DATE_NOW_FORMAT)/i'

# es necesario el slash invertido '\'  para escapar el caracter '#' porque GNU Make interpreta los # como comentarios
LINE_METADATA_OBSERVACIONES=$(shell grep -n '\#\# OBSERVACIONES:' $(DOC_COMMANDS_LINUX_DIRECTORY)/.template | cut --delimiter=':' --fields=1)
