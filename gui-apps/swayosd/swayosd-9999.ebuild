EAPI=8

inherit cargo git-r3 meson

DESCRIPTION="GTK-based OSD for volume, brightness, media playback and lock keys"
HOMEPAGE="https://github.com/ErikReider/SwayOSD"

EGIT_REPO_URI="https://github.com/ErikReider/SwayOSD.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	dev-libs/glib
	dev-libs/libinput
	dev-build/meson
	gui-libs/gtk
	gui-libs/gtk-layer-shell
	media-libs/libpulse
	sys-apps/dbus
	sys-apps/systemd
	sys-auth/polkit
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-util/cargo-c
	dev-build/meson
	virtual/pkgconfig
	dev-lang/rust
"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}
