# Archlinux installation process
# Zhixi, 2021.10.7
# Maybe out of date, please refer to the latest official guide

## backup your files using rsync 

rysnc -avH -delete /home/* /data

## backup your installed packages

pacman -Qqen > pkg.txt
pacman -Qqem > aur_pkg.txt

# download iso file

curl -C - -o archlinux.iso http://mirrors.uestc.cn/archlinux/iso/latest/archlinux-2021.10.01-x86_64.iso

## use dd or rufus, make a installation media

dd bs=4M if=archlinux.iso of=/dev/sdd status=progress oflag=sync

## reboot

# detect if you can use UEFI
ls /sys/firmware/efi/efivars

# disable reflector and change mirrors to your favourite
systemctl disable reflector.service --now

mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Server = http://mirrors.uestc.cn/archlinux/\$repo/os/\$arch~" > /etc/pacman.d/mirrorlist

# convert MBR to GPT

# partition
cgdisk

mkfs.fat -F32 /dev/sda1
mkswap /dev/sda3
mkfs.btrfs -f /dev/sda2

# efi, Btrfs and swap

mount /dev/sda2 /mnt -o subvol=@
mkdir /mnt/boot
mkdir /mnt/home
mkdir /mnt/var
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt/home -o subvol=@home
mount /dev/sda2 /mnt/var -o subvol=@var
swapon /dev/sda3
lsblk

## base packages

pacstrap /mnt base base-devel linux-zen linux-zen-headers linux-firmware vim btrfs-progs dhcpcd amd-ucode

## optional

pacstrap /mnt iwd netctl

## arch-chroot 

arch-chroot /mnt

# install packages, remember iwl or networkmanager if needed

pacman -S grub efibootmgr

grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
reboot

## Desktop Enviroment

pacman -S plasma-meta

## set locale

vim /etc/locale.gen # uncomment en_US.UTF--8 ans zh_CN.UTF-8
locale-gen
echo 'LANG=en_US.UTF-8'  > /etc/locale.conf
# set fcitx enviroment

echo -e 'GTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx\nSDL_IM_MODULE=fcitx\n' >> /etc/enviroment

yay -S neofetch

# enjoy it
neofetch

## Tools for coding

pacman -S openssh socat 
pacman -S  go go-tools goland goland-jre delve

### 
### Personal Setting
### 
echo 'export QT_AUTO_SCREEN_SCALE_FACTOR=1' >> ~/.xprofile

## configure zsh
yay -S zsh autojump zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
chsh -s /bin/zsh
zsh

p10k configue

time zsh -ic exit

## Applications
# wps-office
yay -S wps-office ttf-wps-fonts wps-office-mui-zh-cn

# LaTeX

pacman -S texlive-core texlive-langchinese  texlive-fontsextra
pacman -S texlive-latexextra texlive-science texlive-bibtexextra

pacman -S zotero


## ttf

yay -S ttf-times-new-roman adobe-source-code-pro-fonts nerd-fonts-meslo-lg


## systemd service
systemctl enable sshd --now
systemctl enable ssh-agent --now --user

# disable baloo
balooctl disable