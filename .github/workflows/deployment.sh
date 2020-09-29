#!/bin/bash

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
  echo "Created the ssh config file."
  touch "${ssh_config}"
fi

if ! grep -i "Host aur.archlinux.org" &> /dev/null < "${ssh_config}"; then
  echo "Added host to the ssh config file."
  echo -e "Host aur.archlinux.org\n  IdentityFile ${ssh_aur_private}\n  User aur\n" >> "${ssh_config}"
fi

echo "Added the private key into the AUR file."
echo "${SSH_PRIVATE_KEY}" > "${ssh_aur_private}"
chmod 0600 "${ssh_aur_private}"

echo "${SSH_PUBLIC_KEY}" > "${ssh_aur_public}"
chmod 0644 "${ssh_aur_public}"

echo "SSH Config:"
cat "${ssh_config}"

ls -lha "${HOME}/.ssh/"

ssh-add -L
ssh-add "${ssh_aur_private}"
ssh -Tv --ipv4 -i "${ssh_aur_private}" aur@aur.archlinux.org

exit 2

cd "${HOME}" || exit
mkdir -p "${deploy_path}"
cd "${deploy_path}" || exit
echo "ssh://aur@aur.archlinux.org/${aur_project}.git"
git clone -vvvv --ipv6 "ssh://aur@aur.archlinux.org/${aur_project}.git"
cd "${aur_project}" || exit
pwd
cp -f "${aur_package}"* .
./upload-package-automatic.sh

cd "${HOME}" || exit
rm -f "${ssh_config}"
rm -f "${ssh_aur_private}"
rm -f "${ssh_aur_public}"
rm -fR "${deploy_path}"
ls -lha "${ssh_path}"
ls "${HOME}"
