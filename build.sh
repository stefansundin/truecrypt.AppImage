#!/bin/bash -e

if [[ ! -d dependencies ]]; then
  echo "Run ./download.sh first!"
  exit 1
fi

find dependencies -type d -name data | while read path; do
  echo
  echo "Copying $path"
  echo
  cp -rpv "$path"/* truecrypt.AppDir
done

cp truecrypt.AppDir/usr/share/pixmaps/truecrypt.xpm truecrypt.AppDir

echo
echo "Building AppImage"
echo

./appimagetool-aarch64.AppImage truecrypt.AppDir TrueCrypt-7.1a-16-arm64.AppImage
