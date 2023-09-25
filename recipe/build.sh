#!/usr/bin/env bash
set -e

BUILD_DIR="build"

cd ${SRC_DIR}

mkdir -p ${BUILD_DIR}

cmake ${CMAKE_ARGS} -S osmium-tool \
 -B ${BUILD_DIR} \
 -G "Ninja" \
 -D CMAKE_BUILD_TYPE=Release \
 -D OSMIUM_INCLUDE_DIR=libosmium/include \
 -D PROTOZERO_INCLUDE_DIR=protozero/include \
 -D CMAKE_INSTALL_PREFIX="${PREFIX}"

cmake --build ${BUILD_DIR} --target all

cmake --build ${BUILD_DIR} --target install
