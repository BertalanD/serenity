#!/usr/bin/env -S bash ../.port_include.sh
port=distcc
version=3.4
useconfigure="true"
files="https://github.com/distcc/distcc/releases/download/v${version}/distcc-${version}.tar.gz distcc-${version}.tar.gz 2b99edda9dad9dbf283933a02eace6de7423fe5650daa4a728c950e5cd37bd7d"
auth_type="sha256"
configopts+=("--without-libiberty")
use_fresh_config_sub=true

export CFLAGS="-Wno-error"
