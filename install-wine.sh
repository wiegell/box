# # Download wine i386, extract it, and install it

# wget https://dl.winehq.org/wine-builds/debian/dists/bookworm/main/binary-i386/wine-stable-i386_9.0.0.0/home/bjoernbookworm-1_i386.deb
# wget https://dl.winehq.org/wine-builds/debian/dists/bookworm/main/binary-i386/wine-stable_9.0.0.0/home/bjoernbookworm-1_i386.deb
# wget https://dl.winehq.org/wine-builds/debian/dists/bookworm/main/binary-i386/winehq-stable_9.0.0.0/home/bjoernbookworm-1_i386.deb
# sudo dpkg --add-architecture i386
# dpkg -i ./wine-stable-i386_9.0.0.0~bookworm-1_i386.deb
# dpkg -i ./wine-stable_9.0.0.0~bookworm-1_i386.deb
# dpkg -i ./winehq-stable_9.0.0.0~bookworm-1_i386.deb
# rm ./wine-stable-i386_9.0.0.0~bookworm-1_i386.deb
# rm ./wine-stable_9.0.0.0~bookworm-1_i386.deb
# rm ./winehq-stable_9.0.0.0~bookworm-1_i386.deb

# Download bash x86
wget https://github.com/ptitSeb/box86/raw/refs/heads/master/tests/bash
chmod +x bash

# # ln -s /home/bjoern/wine/bin/wineboot /usr/local/bin/wineboot
# # ln -s /home/bjoern/wine/bin/winecfg /usr/local/bin/winecfg
# # echo 'box86 /opt/wine-stable/bin/wineserver "$@"' | tee -a /usr/local/bin/wineserver >/dev/null
# # # ln -s /home/bjoern/wine/bin/wineserver /usr/local/bin/wineserver
# # echo 'box86 /opt/wine-stable/bin/wine "$@"' | tee -a /usr/local/bin/wine >/dev/null
# # echo 'box86 /opt/wine-stable/bin/wine-preloader "$@"' | tee -a /usr/local/bin/wine-preloader >/dev/null
# # echo 'box86 /opt/wine-stable/bin/wineboot "$@"' | tee -a /usr/local/bin/wineboot >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winebuild "$@"' | tee -a /usr/local/bin/winebuild >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winecfg "$@"' | tee -a /usr/local/bin/winecfg >/dev/null
# # echo 'box86 /opt/wine-stable/bin/wineconsole "$@"' | tee -a /usr/local/bin/wineconsole >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winecpp "$@"' | tee -a /usr/local/bin/winecpp >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winedbg "$@"' | tee -a /usr/local/bin/winedbg >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winedump "$@"' | tee -a /usr/local/bin/winedump >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winefile "$@"' | tee -a /usr/local/bin/winefile >/dev/null
# # echo 'box86 /opt/wine-stable/bin/wineg++ "$@"' | tee -a /usr/local/bin/wineg++ >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winegcc "$@"' | tee -a /usr/local/bin/winegcc >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winemaker "$@"' | tee -a /usr/local/bin/winemaker >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winemine "$@"' | tee -a /usr/local/bin/winemine >/dev/null
# # echo 'box86 /opt/wine-stable/bin/winepath "$@"' | tee -a /usr/local/bin/winepath >/dev/null

# mkdir /usr/wine
# mkdir /usr/wine/bin
# ln -s /opt/wine-stable/bin/wineserver /usr/wine/bin/wineserver
# ln -s /opt/wine-stable/bin/wine /usr/wine/bin/wine
# ln -s /opt/wine-stable/bin/wine-preloader /usr/wine/bin/wine-preloader
# ln -s /opt/wine-stable/bin/wineboot /usr/wine/bin/wineboot
# ln -s /opt/wine-stable/bin/winebuild /usr/wine/bin/winebuild
# ln -s /opt/wine-stable/bin/winecfg /usr/wine/bin/winecfg
# ln -s /opt/wine-stable/bin/wineconsole /usr/wine/bin/wineconsole
# ln -s /opt/wine-stable/bin/winecpp /usr/wine/bin/winecpp
# ln -s /opt/wine-stable/bin/winedbg /usr/wine/bin/winedbg
# ln -s /opt/wine-stable/bin/winedump /usr/wine/bin/winedump
# ln -s /opt/wine-stable/bin/winefile /usr/wine/bin/winefile
# ln -s /opt/wine-stable/bin/wineg++ /usr/wine/bin/wineg++
# ln -s /opt/wine-stable/bin/winegcc /usr/wine/bin/winegcc
# ln -s /opt/wine-stable/bin/winemaker /usr/wine/bin/winemaker
# ln -s /opt/wine-stable/bin/winemine /usr/wine/bin/winemine
# ln -s /opt/wine-stable/bin/winepath /usr/wine/bin/winepath

# # chmod +x /usr/local/bin/wine /usr/local/bin/wine-preloader /usr/local/bin/wineboot /usr/local/bin/winebuild /usr/local/bin/winecfg /usr/local/bin/wineconsole /usr/local/bin/winecpp /usr/local/bin/winedbg /usr/local/bin/winedump /usr/local/bin/winefile /usr/local/bin/wineg++ /usr/local/bin/winegcc /usr/local/bin/winemaker /usr/local/bin/winemine /usr/local/bin/winepath


### User-defined Wine version variables ################
# - Replace the variables below with your system's info.
# - Note that we need the i386 version for Box86 even though we're installing it on our ARM processor.
# - Wine download links from WineHQ: https://dl.winehq.org/wine-builds/

wbranch="stable" #example: devel, staging, or stable (wine-staging 4.5+ requires libfaudio0:i386 - see below)
wversion="9.0.0.0" #example: 7.1
wid="debian" #example: debian, ubuntu
wdist="bookworm" #example (for debian): bullseye, buster, jessie, wheezy, etc
wtag="-1" #example: -1 (some wine .deb files have -1 tag on the end and some don't)

########################################################

# Clean up any old wine instances
wineserver -k # stop any old wine installations from running
# rm -rf ~/.cache/wine # remove old wine-mono/wine-gecko install files
# rm -rf ~/.local/share/applications/wine # remove old program shortcuts

# Backup any old wine installations
# sudo mv ~/wine ~/wine-old
# sudo mv ~/.wine ~/.wine-old
# sudo mv /usr/local/bin/wine /usr/local/bin/wine-old
# sudo mv /usr/local/bin/wineboot /usr/local/bin/wineboot-old
# sudo mv /usr/local/bin/winecfg /usr/local/bin/winecfg-old
# sudo mv /usr/local/bin/wineserver /usr/local/bin/wineserver-old

# Download, extract wine, and install wine
cd /home/bjoern/Downloads
wget https://dl.winehq.org/wine-builds/${wid}/dists/${wdist}/main/binary-i386/wine-${wbranch}-i386_${wversion}~${wdist}${wtag}_i386.deb # download
wget https://dl.winehq.org/wine-builds/${wid}/dists/${wdist}/main/binary-i386/wine-${wbranch}_${wversion}~${wdist}${wtag}_i386.deb # (required for wine_i386 if no wine64 / CONFLICTS WITH wine64 support files)
dpkg-deb -x wine-${wbranch}-i386_${wversion}~${wdist}${wtag}_i386.deb wine-installer # extract
dpkg-deb -x wine-${wbranch}_${wversion}~${wdist}${wtag}_i386.deb wine-installer
mv wine-installer/opt/wine* /home/bjoern/wine # install
rm wine*.deb # clean up
rm -rf wine-installer # clean up

# Install shortcuts (make 32bit launcher & symlinks. Credits: grayduck, Botspot)
# echo '#!/bin/bash\nsetarch linux32 -L '"/home/bjoern/wine/bin/wine "'"$@"' | sudo tee -a /usr/local/bin/wine >/dev/null # Create a script to launch wine programs as 32bit only
 ln -s /home/bjoern/wine/bin/wine /usr/local/bin/wine # You could aslo just make a symlink, but box86 only works for 32bit apps at the moment
 ln -s /home/bjoern/wine/bin/wineboot /usr/local/bin/wineboot
 ln -s /home/bjoern/wine/bin/winecfg /usr/local/bin/winecfg
 ln -s /home/bjoern/wine/bin/wineserver /usr/local/bin/wineserver
 chmod +x /usr/local/bin/wine /usr/local/bin/wineboot /usr/local/bin/winecfg /usr/local/bin/wineserver