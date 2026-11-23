#!/bin/bash
#
# Clear pacman cache.

set -euo pipefail

sudo paccache -r
sudo paccache -ruk0
