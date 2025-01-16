#!/bin/bash -e

if [[ ! -f appimagetool-x86_64.AppImage ]]; then
  echo "Downloading appimagetool"
  wget https://github.com/AppImage/appimagetool/releases/download/1.9.0/appimagetool-x86_64.AppImage
  chmod +x appimagetool-x86_64.AppImage
fi

mkdir -p dependencies
cd dependencies

cat ../dependencies.txt | while read url filename; do
  if [[ "$url" == "" || "${url:0:1}" == "#" ]]; then
    continue
  fi

  if [[ -z "$filename" ]]; then
    filename=$(basename "$url")
  fi

  if [[ ! -f "$filename" ]]; then
    echo
    echo "Downloading $url"
    echo
    wget "$url"
  fi

  dirname=$(basename "$filename" .deb)

  if [[ ! -d "$dirname" ]]; then
    echo
    echo "Extracting $filename"
    echo
    mkdir -p "$dirname/data"
    ar x --output="$dirname" "$filename"
    tar --use-compress-program=unzstd -xvf "$dirname/data.tar.zst" -C "$dirname/data"
  fi
done
