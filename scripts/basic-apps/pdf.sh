#!/bin/bash

source ../../libs/install.sh

# PDF viewer
install_mark_gui_packages zathura okular
install_mark_gui_packages zathura-pdf-mupdf # Zathura backend
install_mark_gui_deps tesseract-data-eng # 'mupdf' dependency

# Edit PDF
install_mark_packages pdftk
install_mark_deps jdk-openjdk # 'pdftk' dependency
