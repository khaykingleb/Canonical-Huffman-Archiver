#!/bin/bash

BUILD_TYPE=$1

if [ -z "$BUILD_TYPE" ]
then
    # Default to Release if no build type was specified
    BUILD_TYPE=Release
fi

# Check if the specified build type is valid
VALID_BUILD_TYPES=("Release" "Debug" "RelWithDebInfo" "MinSizeRel")
if ! [[ " ${VALID_BUILD_TYPES[@]} " =~ " ${BUILD_TYPE} " ]]; then
    echo "Invalid build type. Use one of: ${VALID_BUILD_TYPES[@]}"
    exit 1
fi

echo "Building with $BUILD_TYPE configuration."

poetry run conan install . \
    --build=missing \
    --profile=conanprofile.txt \
    --settings=compiler.cppstd=gnu20 \
    --settings=build_type=$BUILD_TYPE

cd build
source $BUILD_TYPE/generators/conanbuild.sh
cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=$BUILD_TYPE/generators/conan_toolchain.cmake \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build .
source $BUILD_TYPE/generators/deactivate_conanbuild.sh
