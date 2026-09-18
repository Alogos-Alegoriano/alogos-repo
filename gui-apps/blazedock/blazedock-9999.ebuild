# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo git-r3

DESCRIPTION="A modern, native Wayland dock built with Rust and GTK4"
HOMEPAGE="https://github.com/RavenRepo/blaze-dock"

EGIT_REPO_URI="https://github.com/RavenRepo/blaze-dock.git"

LICENSE="GPL-3"
SLOT="0"
PROPERTIES="live"

BDEPEND="
	dev-util/pkgconf
	dev-lang/rust
	dev-libs/glib:2
"

RDEPEND="
	>=gui-libs/gtk-4.10
	>=gui-libs/gtk4-layer-shell-1.0
"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
