# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

DESCRIPTION="Aplicación biopass instalada desde paquete binario"
HOMEPAGE="https://github.com/TickLabVN/biopass/"
SRC_URI="biopass_1.4.1_amd64.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="network-sandbox strip"
QA_PREBUILT="*"

S="${WORKDIR}"

src_install() {
	# Copia la estructura del paquete directo al directorio de instalación
	cp -a "${WORKDIR}"/* "${ED}"/ || die "Falló la instalación de biopass"
}

pkg_postinst() {
	# Se ejecuta automáticamente en el sistema real justo después de instalar el paquete
	if [[ -f "${EROOT}/usr/share/com.ticklab.biopass/download_models.sh" ]]; then
		einfo "Descargando modelos automáticamente para biopass..."
		bash "${EROOT}/usr/share/com.ticklab.biopass/download_models.sh" || ewarn "Falló la descarga automática de modelos."
	fi
}
