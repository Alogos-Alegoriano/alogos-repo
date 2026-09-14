EAPI=8

inherit cargo git-r3

DESCRIPTION="A Wayland desktop shell with bar, notifications, OSD, wallpaper and device controls"
HOMEPAGE="https://wayle.app/"
EGIT_REPO_URI="https://github.com/wayle-rs/wayle.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-libs/glib
	dev-libs/libgudev
	dev-libs/wayland
	gui-libs/gtk:4
	gui-libs/gtk4-layer-shell
	gui-libs/gtksourceview:5
	sci-libs/fftw
	media-libs/libpulse
	media-video/pipewire
	sys-apps/systemd
	sys-libs/libudev-compat
	x11-libs/cairo
	x11-libs/gdk-pixbuf
"

RDEPEND="
	${DEPEND}
	net-misc/networkmanager
	sys-power/upower
	sys-power/power-profiles-daemon
"

BDEPEND="
	dev-util/pkgconf
	llvm-core/clang
	dev-lang/rust
"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install --path wayle
	cargo_src_install --path crates/wayle-settings
}
