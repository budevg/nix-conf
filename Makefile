ifeq ($(DRY),1)
DRY_RUN_FLAG := "--dry-run"
endif

ALL :=  dev-utils \
	ripgrep \
	go godef goimports \
	docker-edge kvm-gtk \
	jrePlugin

.PHONY: all
all:
	nix-env -i $(addprefix -A nixpkgs., $(ALL)) $(DRY_RUN_FLAG)

.PHONY: help
help:
	@echo "Packages: $(ALL)"
