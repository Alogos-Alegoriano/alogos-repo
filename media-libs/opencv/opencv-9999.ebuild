# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..15} )
inherit cmake flag-o-matic git-r3 python-single-r1

DESCRIPTION="Open Source Computer Vision Library"
HOMEPAGE="https://opencv.org https://github.com/opencv/opencv"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/opencv/opencv.git"
else
	SRC_URI="https://github.com/opencv/opencv/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="live-opencv"
IUSE="cuda ffmpeg onnx python qt6 v4l"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/protobuf:=
	ffmpeg? ( media-video/ffmpeg:= )
	onnx? ( sci-libs/onnxruntime:= )
	python? ( ${PYTHON_DEPS} )
	qt6? ( dev-qt/qtbase:6[gui,widgets] )
	v4l? ( media-libs/libv4l )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/cmake
	virtual/pkgconfig
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	cmake_src_prepare

	einfo "Fijando el nivel de log por defecto de OpenCV a SILENT"
	sed -i -e 's/getConfigurationParameterString("OPENCV_LOG_LEVEL", "")/getConfigurationParameterString("OPENCV_LOG_LEVEL", "SILENT")/' \
		modules/core/src/logger.cpp || die "Error al fijar el nivel de log por defecto"
}

src_configure() {
	append-cppflags -DCV_LOG_STRIP_LEVEL=0

	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
		-DBUILD_TESTS=OFF
		-DBUILD_PERF_TESTS=OFF
		-DWITH_FFMPEG=$(usex ffmpeg)
		-DWITH_V4L=$(usex v4l)
		-DWITH_CUDA=$(usex cuda)
		-DWITH_ONNXRUNTIME=$(usex onnx)
		-DWITH_PYTHON=$(usex python)
		-DWITH_QT=$(usex qt6 6 OFF)
		-DOPENCV_GENERATE_PKGCONFIG=ON
		-DENABLE_CONFIG_VERIFICATION=ON
		-DWITH_VTK=OFF
		-DWITH_IPP=OFF
		-DWITH_JASPER=OFF
		-DWITH_OPENCLAMDFFT=OFF
		-DWITH_OPENCLAMDBLAS=OFF
		-DWITH_UNIFONT=OFF
	)

	cmake_src_configure
}
