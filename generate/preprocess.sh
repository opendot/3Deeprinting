#!/bin/bash

input="$1"
if [ -z "$input" ]; then
    echo preprocess: specify the stl filename
    exit 1
fi
base_dir=$(realpath $(dirname "$input"))
file_name=$(basename "$input")
base_name=${file_name%%.*}
extension=${file_name##*.}
image=$(cat image.conf)

exec docker run --rm -it -v "$base_dir":/data "$image" python scripts/preprocess.py --input_txt "/data/${base_name}.${extension}" --output_h5 "/data/${base_name}.h5" --output_json "/data/${base_name}.json"
