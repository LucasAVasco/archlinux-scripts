#!/bin/bash

source ../../libs/install.sh

# LibreOffice
install_mark_gui_packages libreoffice-fresh
install_mark_gui_deps jdk-openjdk libmythes # 'libreoffice-fresh' dependencies
install_mark_gui_packages hunspell hunspell-en_us # Spell checking
install_mark_gui_packages hyphen hyphen-en # Hyphenation
install_mark_gui_packages mythes mythes-en # Spell checking

# Scribus
install_mark_gui_packages scribus
