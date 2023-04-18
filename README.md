# Setting my arch system

if installing on a VM, attach the iso
https://archlinux.org/download/
enable EFI and boot. Jump to installation section.

if installing on physical hardware

create a parition in HDD to install the system

burn the ISO into a flash drive:

```bash
pv arch.iso | sudo dd of=/dev/sdx obs=64K oflag=direct   // the flash drive should NOT be mounted
```
then reboot and go to the UEFI settings to change the order of the boot and boot in the flash drive

install arch in the system (see Installation section)

change the boot order again to boot on the first system

install ob-prober to detect the new installed system and config GRUB:

```bash
grub-mkconfig -o /boot/grub/grub.cfg   // /dev/sdax should be mounted
```
after that you should be able to boot from GRUB.

# Installing the system

```bash
loadkeys br-abnt //load keyboard layout

setfont ter-132n //bigger console font

timedatectl set-ntp true //sync system time

fdisk /dev/sda //partition the disk: efi + swap + filesystem

//make filesystem for each partition

mkfs.fat -F32 /dev/sda1 //efi partition

mkswap /dev/sda2 //swap

swapon /dev/sda2

mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt

# Generating GPG Keys

pacman-key --init
pacman-key --populate

pacstrap -K /mnt base linux linux-firmware //script to install the OS

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

pacman -S vim

ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime 

hwclock --systohc
```
//setting the locale

//edit /etc/locale.gen and uncomment pt_BR.UTF-8 UTF_8

locale-gen

//edit the /etc/locale.conf
LANG=en_US.UTF-8

//set host = hostname in /etc/hostname

//edit /etc/hosts and add the following lines

127.0.0.1   localhost
::1         localhost
127.0.1.1   hostname.localdomain  hostname

passwd  //set root password

//adding user

useradd -m paulo

passwd paulo

usermod -aG wheel,storage,video,audio,optical paulo

pacman -S sudo

EDITOR=vim visudo //edit the sudo file to enable wheel group to use sudo (dont forget to keep the "%")

pacman -S grub 

pacman -S efibootmgr dosfstools os-prober mtools

mkdir /boot/EFI

mount /dev/sda1 /boot/EFI

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --rechek --removable

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager terminus-font

systemctl enable NetworkManager

//edit the /etc/vconsole.conf file and add the following line
FONT=ter-132n
KEYMAP=/usr/share/kbd/keymaps/i386/qwerty/br-abnt.map.gz

exit

umount -l /mnt

shutdown now

if installed on a VM, desatach de iso image

# List of programs
mlocate //for using the locate command(sudo updatedb before calling locate)

- git
- htop
- neogit cvim
- zsh
- zathura
- zathura-pdf-poppler
- neofetch
- xclip //enabling clipboard (to do: check documentation)
- rsync //for cp with --exclude option
- lf //file manager
- ttf-jetbrains-mono //the ttf-jetbrains-mono-nerd seems to not work properly on kitty
//according to the home page, fonts patched with nerd is a no no
- openssh
- pv

# Installing yay (AUR Helper)

git clone https://aur.archlinux.org/yay-git.git
sudo pacman -S base-devel
cd yay-git
makepkg -si

//installing neovim plugin manager
yay -S vim-plug

# Installing the graphical enviroment

sudo pacman -S xf86-video-fbdev //video drive if VM
//check the wiki case installing a physical machines
sudo pacman -S xf86-video-intel //case intel
sudo pacman -S xorg xorg-xinit nitrogen picom firefox

//setting wm and terminal
mkdir -p .local/bin .local/src

cd $HOME/.local/src
git clone https://github.com/paulohdosanjos/dwm-ph.git
cd dwm-ph
sudo pacman -S ttf-font-awesome
cd

git clone https://github.com/paulohdosanjos/dwmblocks-ph.git


```bash
sudo chsh -s /bin/zsh paulo //changing the default shell
zsh
```

# Installing kitty

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    dest=$HOME/.local/bin \
    launch=n
ln -sf ~/.local/bin/kitty.app/bin/kitty ~/.local/bin/kitty.app/bin/kitten ~/.local/bin/

## Uninstalling kitty
//if want to uninstall kitty, run:
rm -rf $HOME/.local/bin/kitty.app

cd $HOME/.ocal/src/dwm-ph
sudo make install
cd ..
cd dwmblocks-ph
sudo make install
cd

//setting git enviroment .dotfiles
//setting git
git config --global user.email "paulo13579691@gmail.com"
git config --global user.name "Paulo Henrique"


# Managing dotfiles
Reference: https://github.com/Siiilwyn/my-dotfiles/tree/master/.my-dotfiles

## Replication

```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/paulohdosanjos/.dotfiles.git tmp
rsync --recursive --verbose --exclude '.git' tmp/ $HOME/
rm --recursive tmp
```

## Configuration

zsh
```bash
gitconfig config status.showUntrackedFiles no
gitconfig remote set-url origin git@github.com:paulohdosanjos/.dotfiles.git
```

//importing wallpapers
git clone https://github.com/paulohdosanjos/wall.git

//after that, set the wallpaper on nitrogen


cd $HOME/.local/src/dwm-ph
git remote set-url origin git@github.com:paulohdosanjos/dwm-ph.git

cd ../dwmblocks-ph
git remote set-url origin git@github.com:paulohdosanjos/dwmblocks.git


//sync in firefox account


//setting ssh
ssh-keygen //generate ssh keys
//add key.pub to github 

# Configuring TouchPad

sudo pacman -S xf86-input-synaptics
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.cond
//add the following lines
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
        Option "VertScrollDelta" "-111"
        Option "HorizScrollDelta" "-111"
EndSection

# Useful pages
https://datatracker.ietf.org/doc/html/rfc1178
https://wiki.archlinux.org/title/System_time#Time_zone
https://wiki.archlinux.org/title/Pacman/Package_signing#Resetting_all_the_keys
https://wiki.archlinux.org/title/Touchpad_Synaptics


# TO DO LIST 
transformar arch-install em markdown. Fazer READ.me
se cadastrar na rede linux
dual boot arch with ubuntu on the notebook

## Study to do list
learn and use orgmode
read Pro Git book
learn how to use Telescope and NerdTree
learn to apply patches with git and apply switchtotag patch to dwm
configure neovim (add lsp, snippers, preview, etc)
