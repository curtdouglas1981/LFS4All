Linux From Scratch 4 All

Installation Instructions:

The Linux From Scratch Website https://www.linuxfromscratch.org/lfs/

Download arch iso form https://archlinux.org/download/

boot into live environment

partition disk
Further reading on partitioning can be found at https://wiki.archlinux.org/title/partitioning

mount the intended / partition to /mnt

example:
mount /dev/<xxx> /mnt

to find the value for <xxx> use the following command to view the block devices on your system.

lsblk

Run the following command, you can change vim to your tty text editor of choice:

pacstrap /mnt pacman vim bash git

Change to the mnt directory and use git to acquire the scripts to install LFS4All:

cd /mnt
git clone https://github.com/curtdouglas1981/LFS4All.git

Move the scripts tarball to the parent directory and the delete the git repository from the disk.

cd LFS4All
cp scripts.tar.gz ../
cd ../
rm LFS4All

Extract the tarball.

tar -xvf scripts.tar.gz

Change root to the /mnt with this command:

arch-chroot /mnt

to speed up the downloads you can uncomment this line in the /etc/pacman.conf file
#ParallelDownloads = 5

it should now look like this
ParallelDownloads = 5

run the install_packages.sh command

./install_packages.sh

acquire yout kernel:
build it yourself or use pacman to download an available one

pacman -S linux-<kernel type>

example:
pacman -S linux-zen
of
pacman -S linux
for the generic kernel

you should also install the package linux-firmware

pacman -S linux-firmware

run scripts to setup system:

./systemd_conf.sh
./host_conf.sh
./kernel_load_order.sh
./locale_conf.sh
./network_conf.sh
./no_screen_clear.sh
./os_name_conf.sh
./shadow_conf.sh

edit the locale.gen file, removing the comment on the locale line of choice

example remove the # at the beginning of the line:

#en_US.UTF-8 UTF-8

change to

en_US.UTF-8 UTF-8

now run the locale gen command:

locale-gen

now setup the grub bootloader or any other of your choice

mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

run this command to change the grub boot menu option name:

sed -i 's/Arch Linux/LFS4All/g' /boot/grub/grub.cfg

return to the live environment with the exit command

exit

now run the command

genfstab -U /mnt >> /mnt/etc/fstab

DONE
remove the live entvironment media and reboot the system

The login will be:
username: root
password: is the password you chose earlier

got to the root directory and run the commdn:

cd /
./timedate_conf.sh

also run this command and follow the directions if you wish to change the way the system views the time

timedatectl

to remove the installation files run the command:
if you have any .sh files that you do not want removed in the root directory then manually remove the installation files.

WARNING: this command will remove all .sh files in the root directory

./clean_install.sh