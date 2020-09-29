#!/bin/bash -exv

aur_project="battery-discharging-beep-git"

ssh_path="${HOME}/.ssh/"
ssh_config="${HOME}/.ssh/config"
ssh_aur="${HOME}/.ssh/aur"
deploy_path="${HOME}/AUR/"
aur_package="${{ github.workspace }}/arch-aur/"
exit 1
rm -f "${ssh_config}"
rm -f "${ssh_aur}"
rm -fR "${deploy_path}"

mkdir -p "${ssh_path}"

if [ ! -f "${ssh_config}" ]; then
  echo "Created the ssh config file."
  touch "${ssh_config}"
fi

if ! grep -i "Host aur.archlinux.org" &> /dev/null < "${ssh_config}"; then
  echo "Added host to the ssh config file."
  echo -e "Host aur.archlinux.org\n  IdentityFile ${ssh_aur}\n  User aur\n" >> "${ssh_config}"
fi

echo "Added the private key into the AUR file."
echo "${{ secrets.SSH_PRIVATE_KEY }}" > "${ssh_aur}"

echo "SSH Config:"
cat "${ssh_config}"
cat "${ssh_aur}"
echo "ssh_key: ${{ secrets.SSH_PRIVATE_KEY }}"

cd "${HOME}" || exit
mkdir -p "${deploy_path}"
cd "${deploy_path}" || exit
git clone "ssh://aur@aur.archlinux.org/${aur_project}.git"
cd "${aur_project}" || exit
pwd
cp -f "${aur_package}"* .
./upload-package-automatic.sh

cd "${HOME}" || exit
rm -f "${ssh_config}"
rm -f "${ssh_aur}"
rm -fR "${deploy_path}"
ls -lha "${ssh_path}"
ls "${HOME}"
