# This file is part of MXE.
# See index.html for further information.

PKG             := db
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 5.3.28.NC
$(PKG)_CHECKSUM := 76a25560d9e52a198d37a31440fd07632b5f1f8f9f2b6d5438f4bc3e7c9013ef
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := http://download.oracle.com/berkeley-db/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    echo 'TODO: write update script for $(PKG).' >&2;
    echo $($(PKG)_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)/build_unix' && ../dist/configure \
        $(MXE_CONFIGURE_OPTS) \
        --enable-mingw \
        --enable-cxx
    $(SED) -i 's/WinIoCtl.h/winioctl.h/' '$(1)/src/dbinc/win_db.h'
    $(MAKE) -C '$(1)/build_unix' -j '$(JOBS)'
    $(MAKE) -C '$(1)/build_unix' -j '$(JOBS)' install
endef
