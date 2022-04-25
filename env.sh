#!/usr/bin/bash
set -euxo pipefail

ROOT_DIR=$(cd $(dirname $0); cd ../; pwd)
SRC_ENVNAME=dev
SRC_IP_KEY='10.73'
SRC_HOSTNAME_KEY='KC'
DEST_ENVNAME=prod
DEST_IP_KEY='10.74'
DEST_HOSTNAME_KEY='PC'

TARGET=("inventories")
for target_dirname in "${TARGET[@]}"
do
  src_dir=${ROOT_DIR}/${target_dirname}/${SRC_ENVNAME}
  dest_dir=${ROOT_DIR}/${target_dirname}/${DEST_ENVNAME}

  if [[ -d ${dest_dir} ]]; then
    rm -rf ${dest_dir}
  fi
  cp -rp ${src_dir} ${dest_dir}

  cd ${dest_dir}/host_* && \
  ls -1 | sed -E "s/${SRC_HOSTNAME_KEY}(.*)/mv & ${DEST_HOSTNAME_KEY}\1/g" | bash && \
  cd ../

  for file in $(fgrep -r "10.73" . | awk -F':' '{print $1}')
  do
    sed -i -E "s/${SRC_IP_KEY}/${DEST_IP_KEY}/g" ${file}
  done

  for file in $(fgrep -r "${SRC_HOSTNAME_KEY}" . | awk -F':' '{print $1}')
  do
    sed -i -E "s/${SRC_HOSTNAME_KEY}/${DEST_HOSTNAME_KEY}/g" ${file}
  done
done
