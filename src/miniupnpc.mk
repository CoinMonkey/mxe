# This file is part of MXE.
# See index.html for further information.

PKG             := miniupnpc
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.9.20151026
$(PKG)_CHECKSUM := f3cf9a5a31588a917d4d9237e5bc50f84d00c5aa48e27ed50d9b88dfa6a25d47
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://miniupnp.free.fr/files/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && cmake . \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DUPNPC_BUILD_SHARED=FALSE

    $(MAKE) -C '$(1)' -j '$(JOBS)' install VERBOSE=1
endef
