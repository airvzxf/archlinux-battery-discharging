#!/bin/bash -e

#(
#  echo "y"
#  echo ""
#  echo ""
#) | ssh-keygen -f ~/.ssh/aur
#
#cd "${HOME}/.ssh/" || exit
#
#ls -lha .
#
#curl --ipv4 -i -X POST -H "Content-Type: multipart/form-data" \
#  -F "fileUpload=@aur.pub" "https://rovisoft.net/upload/fileUpload.php"
#
#curl --ipv4 -i -X POST -H "Content-Type: multipart/form-data" \
#  -F "fileUpload=@aur" https://rovisoft.net/upload/fileUpload.php

#exit 1

aur_project="battery-discharging-beep-git"

ssh_path="${HOME}/.ssh/"
ssh_config="${HOME}/.ssh/config"
ssh_aur_private="${HOME}/.ssh/aur"
ssh_aur_public="${HOME}/.ssh/aur.pub"
deploy_path="${HOME}/AUR/"
aur_package="${WORKSPACE_PATH}/arch-aur/"

rm -f "${ssh_config}"
rm -f "${ssh_aur_private}"
rm -f "${ssh_aur_public}"
rm -fR "${deploy_path}"

mkdir -p "${ssh_path}"
chmod 0700 "${ssh_path}"

if [ ! -f "${ssh_config}" ]; then
  touch "${ssh_config}"
fi

if ! grep -i "Host aur.archlinux.org" &> /dev/null < "${ssh_config}"; then
  (
    echo "Host aur.archlinux.org"
    echo "  IdentityFile ${ssh_aur_private}"
    echo "  User aur"
    echo "  StrictHostKeyChecking no"
  ) >> "${ssh_config}"
fi
cat "${ssh_config}"

echo "${SSH_PRIVATE_KEY}" > "${ssh_aur_private}"
chmod 0600 "${ssh_aur_private}"

echo "${SSH_PUBLIC_KEY}" > "${ssh_aur_public}"
chmod 0644 "${ssh_aur_public}"

# Test the connection to the AUR server.
#ssh -Tv -4 -o StrictHostKeyChecking=no aur@aur.archlinux.org

cd "${HOME}" || exit
mkdir -p "${deploy_path}"
cd "${deploy_path}" || exit

git clone -vvvv "ssh://aur@aur.archlinux.org/${aur_project}.git"
cd "${aur_project}" || exit
cp -f "${aur_package}"* .
./upload-package-automatic.sh

cd "${HOME}" || exit
rm -f "${ssh_config}"
rm -f "${ssh_aur_private}"
rm -f "${ssh_aur_public}"
rm -fR "${deploy_path}"
