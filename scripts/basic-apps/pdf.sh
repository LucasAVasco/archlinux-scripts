#!/bin/bash

source ../../libs/install.sh

# PDF viewer
install_mark_packages zathura okular
install_mark_packages zathura-pdf-mupdf # Zathura backend
install_mark_deps tesseract-data-eng # 'mupdf' dependency

# Edit PDF
install_mark_packages pdftk
