#!/bin/bash -e

aur_project="battery-discharging-beep-git"
temporal_password="a"

ssh_path="/root/.ssh/"
ssh_config="/root/.ssh/config"
ssh_aur_private="/root/.ssh/aur"
ssh_aur_public="/root/.ssh/aur.pub"
user="immortal"
user_home="/home/${user}/"
deploy_path="${user_home}AUR/"
aur_package="${GITHUB_WORKSPACE}/arch-aur/"

echo "HOME: ${HOME}"

useradd -m "${user}"
echo -e "${temporal_password}\n${temporal_password}" | passwd "${user}"

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

#chown -R "${user}":"${user}" "${ssh_path}"

# Test the connection to the AUR server.
#ssh -Tv -4 -o StrictHostKeyChecking=no aur@aur.archlinux.org

cd "${user_home}" || exit
mkdir -p "${deploy_path}"
chown -R "${user}":"${user}" "${deploy_path}"
ls -lha .

cd "${deploy_path}" || exit
ping -4 -c 3 www.google.com
exit 0
git clone -vvvv "ssh://aur@aur.archlinux.org/${aur_project}.git"
ls -lha .

cd "${aur_project}" || exit
cp -f "${aur_package}"* .
echo "${temporal_password}" | su - "${user}" -c "makepkg -f"
rm -fR battery-discharging-beep* pkg src .SRCINFO
makepkg --printsrcinfo > .SRCINFO
git diff --exit-code
git add .
git status
#git commit -m "Automatic deployment coming from the official repository in GitHub using CI (Continuous Integration)."
#git push

cd "${user_home}" || exit
rm -f "${ssh_config}"
rm -f "${ssh_aur_private}"
rm -f "${ssh_aur_public}"
rm -fR "${deploy_path}"
