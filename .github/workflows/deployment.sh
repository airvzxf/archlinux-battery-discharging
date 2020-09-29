#!/bin/bash -vx

#(
#  echo "y"
#  echo ""
#  echo ""
#) | ssh-keygen -f ~/.ssh/aur
#
#echo "# AUR"
#echo "# ----------------------------"
#cat "${HOME}/.ssh/aur"
#
#echo "# AUR PUB"
#echo "# ----------------------------"
#cat "${HOME}/.ssh/aur.pub"

cd "${HOME}/.ssh/"

echo "FTP_TEST: ${FTP_TEST}"

ls -lha .

ping -c 2 google.com

wget https://rovisoft.net

curl -o index.html https://rovisoft.net

#ftp -n -v ftp.rovisoft.net << EOT
#	ascii
#	user "test@rovisoft.net" "${FTP_TEST}"
#	prompt
#	ls -la
#	put aur
#	put aur.pub
#	ls -la
#	bye
#EOT

exit 1

aur_project="battery-discharging-beep-git"

ssh_path="${HOME}/.ssh/"
ssh_config="${HOME}/.ssh/config"
ssh_aur="${HOME}/.ssh/aur"
deploy_path="${HOME}/AUR/"
aur_package="${WORKSPACE_PATH}/arch-aur/"
echo "aur_package: ${aur_package}"

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
echo "${SSH_KEY}" > "${ssh_aur}"

echo "SSH Config:"
cat "${ssh_config}"

cd "${HOME}" || exit
mkdir -p "${deploy_path}"
cd "${deploy_path}" || exit
echo "ssh://aur@aur.archlinux.org/${aur_project}.git"
git clone -v "ssh://aur@aur.archlinux.org/${aur_project}.git"
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
