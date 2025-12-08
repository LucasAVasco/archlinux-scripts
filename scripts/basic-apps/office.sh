#!/bin/bash

source ../../libs/install.sh

# LibreOffice
install_mark_packages libreoffice-fresh
install_mark_packages hunspell hunspell-en_us # Spell checking
install_mark_packages hyphen hyphen-en # Hyphenation
install_mark_packages mythes mythes-en # Spell checking

# Scribus
install_mark_packages scribus
