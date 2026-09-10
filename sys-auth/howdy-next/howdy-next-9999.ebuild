# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="C++ rewrite of Howdy facial-recognition authentication on Linux"
HOMEPAGE="https://codeberg.org/nathawat/howdy-next"
EGIT_REPO_URI="https://codeberg.org/nathawat/howdy-next.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="
	dev-libs/yyjson
	dev-libs/inih
	dev-libs/libevdev
	dev-libs/openssl:=
	media-libs/opencv:=
	sys-libs/pam
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/cmake
	sys-devel/gettext
"
