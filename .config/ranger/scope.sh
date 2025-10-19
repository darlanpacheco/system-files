#!/usr/bin/env bash

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$"\n"

FILE_PATH="${1}"
PV_WIDTH="${2}"
MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

handle_mime() {
  local mimetype="${1}"
  if [[ "${mimetype}" == text/* ]]; then
    cat "${FILE_PATH}" && exit 2
  elif [[ "${mimetype}" == image/* ]]; then
    chafa --size="${PV_WIDTH}x${PV_WIDTH}" --colors=256 --symbols=all "${FILE_PATH}"
  fi
}

handle_mime "${MIMETYPE}"
file --dereference --brief -- "${FILE_PATH}" && exit 5
exit 1
