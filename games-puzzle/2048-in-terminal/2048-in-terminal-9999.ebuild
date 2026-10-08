# Copyright 2026 Gentoo Authors
# Distributed under the terms of the MIT License

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Animated console version of the 2048 game in C"
HOMEPAGE="https://github.com/alewmoose/2048-in-terminal"
EGIT_REPO_URI="https://github.com/alewmoose/2048-in-terminal.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="sys-libs/ncurses:="
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_compile() {
	emake CC="$(tc-getCC)" NCURSES_LIB="ncurses"
}

src_install() {
	dodir /usr/bin
	emake install PREFIX="${ED}/usr"
}
