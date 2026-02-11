### 1. Partitioning the disk:
> fdisk /dev/nvme0n1

#### Create patitions like:

> nvme0n1p1 - 300M - EFI partition  (type: 1)

> nvme0n1p2 - 600M - boot partition  (type: default)

> nvme0n1p3 - rest_space - lvm partition (type: 44)

### 2. Formating the disk:

> mkfs.fat -F32 /dev/nvme0n1p1

> mkfs.ext4 /dev/nvme0n1p2

#### Step to encrypt and create lvm in partition 3:

- Encrypt the partition:
    > cryptsetup luksFormat /dev/nvme0n1p3

    Confirming this by typing `YES` followed by giving and confirming the password.

- Open the partition to work with:
    > cryptsetup open --type luks /dev/nvme0n1p3 lvm

    `lvm` is just a arbitary name 

- Create a physical volume:
    > pvcreate /dev/mapper/lvm

    To see a physical volume(s): `pvdisplay`

- Create a volume group named arch from the physical volume:
    > vgcreate arch /dev/mapper/lvm
    
    To see a volume group: `vgdisplay`  or  `vgs`

- Create two logical volumes from the volume group arch for root and home partition. I named them root and home:
    > lvcreate -L 30GB arch -n root

    > lvcreate -L 700GB arch -n home

    To see available logical volumes: `lvdisplay`  or  `lvs`

- Now format the logical volumes(root and home) to ext4:
    > mkfs.ext4 /dev/arch/root

    > mkfs.ext4 /dev/arch/home

### 3. Mount the partitions:
- Mount the root partition:
    > mount /dev/arch/root /mnt

- Mount boot partition:
    > mount --mkdir /dev/nvme0n1p2 /mnt/boot

- Mount EFI partition:
    > mount --mkdir /dev/nvme0n1p1 /mnt/boot/EFI

- Mount home partition:
    > mount --mkdir /dev/arch/home /mnt/home

### 4.  Installing essential packages:
> pacstrap -i /mnt base linux linux-firmware intel-ucode lvm2 dosfstools neovim man-db man-pages texinfo

### 5. Configure the system:
* Generate an fstab file:
    > genfstab -U /mnt >> /mnt/etc/fstab

* Change root into the new system: 
    > arch-chroot /mnt

* Set a root password:
    > passwd

* Add a user with his password:
    > useradd -mG wheel arka
    > passwd arka

* Configure the `/etc/pacman.conf` file:
    1. Uncomment `Color` option
    2. Change `ParallelDownloads` parameter to `10`
    3. Add `ILoveCandy` parameter to change the animation of progress bar.

* Install some required packages:
    > pacman -S base-devel grub efibootmgr networkmanager intel-media-driver

* Set the time zone:
    > ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

    Generate /etc/adjtime:
    > hwclock --systohc

* Localization:
    - Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8`
    - Generate locale by: `locale-gen`
    - Set the LANG variable:
        > echo "LANG=en_US.UTF-8" > /etc/locale.conf

* Set the hostname:
    > echo "pollux" > /etc/hostname

* Edit initramfs by open `/etc/mkinitcpio.conf` and go to `HOOKS`. Update the HOOKS as:
    
    > HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems fsck)
    
    Then run:
    > mkinitcpio -p linux

### 6. Install grub as boot loader:
* Edit `/etc/default/grub` by going to the line `GRUB_CMDLINE_LINUX_DEFAULT` and between `loglevel=3` and `quite` add `cryptdevice=/dev/nvme0n1p3:arch`

* Install grub:
    > grub-install --target=x86_64-efi --bootloader-id=archlinux --recheck

* Generate a config file for GRUB:
    > grub-mkconfig -o /boot/grub/grub.cfg

### 7. Wrapping up:
* Enable NetworkManager:
    > systemctl enable NetworkManager

* Edit sudoers file with `EDITOR=nvim visudo` and uncomment `%wheel ALL=(ALL:ALL) NOPASSWD: ALL`

* Exit from chroot environment by:
    > exit

* Unmount all partitions:
    > umount -R /mnt

* Reboot the system:
    > reboot
