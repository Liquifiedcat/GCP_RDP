#! /bin/bash
printf "Installing RDP, please have patience... " >&2
{
sudo useradd -m ANI
sudo adduser ANI sudo
echo 'ANI:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser ANI chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AfgeXvvarOEEna9lBOgA3dNwQV9Xd9aoPC4zAwxJB-oaMAZ0mlEs8z7QU8LT34uajCO-bA" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)" CRP
su - ANI -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Complete " >&2
else
    printf "\n\nError Occured " >&2
fi
