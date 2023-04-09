ifeq ($(CSVIEW_TOOL), true)
install-utils: install-bat install-rust-cargo install-mimic3
configure-utils: configure-rust-cargo
else
install-utils: install-bat install-mimic3
configure-utils:
endif

install-bat:
ifeq ("$(shell which bat)","")
	@sudo aptitude install -y bat
endif

install-rust-cargo:
ifeq ("$(shell which cargo)","")
	@sudo aptitude install -y cargo \
	&& cargo install csview
endif

# TODO: contemplar en el remove
configure-rust-cargo:
	echo $(RUST_CARGO_PATH) >> $(BASH_ALIASES_FILE) \
	&& chmod u+x $(UTILS_DIRECTORY)/update-bash-aliases \
	&& $(UTILS_DIRECTORY)/update-bash-aliases

# TODO: validar dependencias python3-env ó python3.8-venv (puede fallar según la distro de linux)
install-mimic3-dependencies:
	sudo aptitude install libespeak-ng1 python3-pip python3-env

# TODO: validar en otros entornos
install-mimic3: install-mimic3-dependencies
	cd `mktemp --directory` \
	&& git clone https://github.com/mycroftAI/mimic3.git \
	&& ./install.sh

ri re-install: remove install

check-installed:
ifeq ($(APP_INSTALLED), true)
	$(error La aplicación ya está instalada)
endif

i install: check-installed install-utils configure-utils ## Instalar aplicación
	@$(BOX_CONFIRM_INSTALL) \
	&& test $(EXIT_STATUS) -eq $(EXIT_STATUS_SUCCESS) \
	&& (echo $(BASH_ALIAS) >> $(BASH_ALIASES_FILE) \
		&& chmod u+x $(UTILS_DIRECTORY)/update-bash-aliases \
		&& $(UTILS_DIRECTORY)/update-bash-aliases) \
	|| true

r remove: ## Desinstalar aplicación
	@$(BOX_CONFIRM_UNINSTALL) \
	&& test $(EXIT_STATUS) -eq $(EXIT_STATUS_SUCCESS) \
	&& sed -i "/^alias $(BASH_ALIAS_SYMBOL)='make.*APP_AUTHOR=$(APP_AUTHOR)/d" $(BASH_ALIASES_FILE) \
	&& $(UTILS_DIRECTORY)/update-bash-aliases \
	|| true
